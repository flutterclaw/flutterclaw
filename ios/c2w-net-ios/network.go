// Package c2wnet provides a gomobile-compatible bridge that runs a container2wasm
// module using wazero (pure-Go WASM runtime) with full TCP/IP networking via
// gvisor-tap-vsock.
//
// Architecture:
//
//	Alpine guest (inside TinyEMU WASM module)
//	  -> Linux virtio-net driver
//	       -> QEMU socket forwarding protocol (4-byte length prefix + Ethernet frame)
//	            -> WASI pre-opened TCP socket (wazero sock.WithTCPListener)
//	                 -> gvisor-tap-vsock virtual network (this package)
//	                      -> NAT -> real internet
//
// Virtual subnet: 192.168.127.0/24
//   - Gateway / DNS: 192.168.127.1
//   - Guest VM:      192.168.127.3
//
// Swift integration:
//
//	StartVM() creates internal pipes and starts the wazero VM + network stack.
//	Swift reads/writes the exposed pipe fds (StdinWriteFD, StdoutReadFD, StderrReadFD)
//	using POSIX read()/write() — identical to the existing WAMR pipe protocol.
//	StopVM() tears down everything.
package c2wnet

import (
	"context"
	crand "crypto/rand"
	"fmt"
	"net"
	"os"
	"sync"
	"syscall"
	"time"

	gvntypes "github.com/containers/gvisor-tap-vsock/pkg/types"
	gvnvirtualnetwork "github.com/containers/gvisor-tap-vsock/pkg/virtualnetwork"
	"github.com/tetratelabs/wazero"
	"github.com/tetratelabs/wazero/experimental/sock"
	"github.com/tetratelabs/wazero/imports/wasi_snapshot_preview1"
)

const (
	GatewayIP = "192.168.127.1"
	VMIP      = "192.168.127.3"
	VMMAC     = "02:00:00:00:00:01"
)

var (
	mu sync.Mutex

	// VM state
	vmRunning bool
	vmCancel  context.CancelFunc
	vmRuntime wazero.Runtime
	vmCtx     context.Context

	// Wazero-facing pipe ends (Go manages these via os.File).
	// Closed when the VM exits or StopVM() is called.
	wazeroStdinRead   *os.File
	wazeroStdoutWrite *os.File
	wazeroStderrWrite *os.File

	// Swift-facing pipe ends (raw fd numbers — Swift manages these).
	// Go never wraps these in os.File and never closes them.
	swiftStdinWriteFD  int32 = -1
	swiftStdoutReadFD  int32 = -1
	swiftStderrReadFD  int32 = -1
)

// StartVM loads and starts a container2wasm module with full networking.
//
// The VM runs in a background goroutine. After StartVM returns, call
// StdinWriteFD/StdoutReadFD/StderrReadFD to get pipe fd numbers for I/O.
// The stdout read fd is set non-blocking for polling.
//
// Parameters:
//   - wasmPath:  absolute path to the .wasm file on disk
//   - rootDir:   host directory mounted as persistent /root/ (virtio-9p)
//   - sharedDir: host directory for file sharing with the VM
func StartVM(wasmPath string, rootDir string, sharedDir string) error {
	mu.Lock()
	defer mu.Unlock()

	if vmRunning {
		return fmt.Errorf("c2wnet: VM already running")
	}

	// Read the wasm binary.
	wasmBytes, err := os.ReadFile(wasmPath)
	if err != nil {
		return fmt.Errorf("c2wnet: read wasm: %w", err)
	}

	// Create pipes using raw syscalls so Go's runtime doesn't interfere
	// with the Swift-facing fds (no os.File wrapping for Swift's ends).
	var stdinFDs, stdoutFDs, stderrFDs [2]int
	if err := syscall.Pipe(stdinFDs[:]); err != nil {
		return fmt.Errorf("c2wnet: stdin pipe: %w", err)
	}
	if err := syscall.Pipe(stdoutFDs[:]); err != nil {
		syscall.Close(stdinFDs[0])
		syscall.Close(stdinFDs[1])
		return fmt.Errorf("c2wnet: stdout pipe: %w", err)
	}
	if err := syscall.Pipe(stderrFDs[:]); err != nil {
		syscall.Close(stdinFDs[0])
		syscall.Close(stdinFDs[1])
		syscall.Close(stdoutFDs[0])
		syscall.Close(stdoutFDs[1])
		return fmt.Errorf("c2wnet: stderr pipe: %w", err)
	}

	// Set stdout read-end non-blocking for Swift's polling reads.
	_ = syscall.SetNonblock(stdoutFDs[0], true)

	// Store Swift-facing raw fd numbers (Swift owns these).
	// Pipe layout: [0]=read, [1]=write.
	// Swift writes to stdin[1], reads from stdout[0] and stderr[0].
	swiftStdinWriteFD = int32(stdinFDs[1])
	swiftStdoutReadFD = int32(stdoutFDs[0])
	swiftStderrReadFD = int32(stderrFDs[0])

	// Wrap wazero-facing ends in os.File (Go owns these).
	wazeroStdinRead = os.NewFile(uintptr(stdinFDs[0]), "wasm-stdin")
	wazeroStdoutWrite = os.NewFile(uintptr(stdoutFDs[1]), "wasm-stdout")
	wazeroStderrWrite = os.NewFile(uintptr(stderrFDs[1]), "wasm-stderr")

	// Find an available port for the WASI TCP listener.
	tmpLn, err := net.Listen("tcp", "127.0.0.1:0")
	if err != nil {
		closeWazeroFiles()
		return fmt.Errorf("c2wnet: find port: %w", err)
	}
	wasiPort := tmpLn.Addr().(*net.TCPAddr).Port
	tmpLn.Close()
	wasiAddr := fmt.Sprintf("127.0.0.1:%d", wasiPort)

	// Set up gvisor-tap-vsock virtual network.
	vn, err := gvnvirtualnetwork.New(&gvntypes.Configuration{
		Debug:             false,
		MTU:               1500,
		Subnet:            "192.168.127.0/24",
		GatewayIP:         GatewayIP,
		GatewayMacAddress: "5a:94:ef:e4:0c:dd",
		DHCPStaticLeases:  map[string]string{VMIP: VMMAC},
		NAT:               map[string]string{"192.168.127.254": "127.0.0.1"},
		GatewayVirtualIPs: []string{"192.168.127.254"},
		Protocol:          gvntypes.QemuProtocol,
	})
	if err != nil {
		closeWazeroFiles()
		return fmt.Errorf("c2wnet: virtual network: %w", err)
	}

	// Create wazero context with TCP listener for networking.
	ctx, cancel := context.WithCancel(context.Background())
	vmCancel = cancel
	vmCtx = ctx

	sockCfg := sock.NewConfig().WithTCPListener("127.0.0.1", wasiPort)
	runtimeCtx := sock.WithConfig(ctx, sockCfg)

	// Create wazero runtime — interpreter mode required for iOS App Store
	// (no JIT/PROT_EXEC allowed without special entitlements).
	r := wazero.NewRuntimeWithConfig(runtimeCtx, wazero.NewRuntimeConfigInterpreter())
	vmRuntime = r

	wasi_snapshot_preview1.MustInstantiate(runtimeCtx, r)

	compiled, err := r.CompileModule(runtimeCtx, wasmBytes)
	if err != nil {
		r.Close(runtimeCtx)
		cancel()
		closeWazeroFiles()
		return fmt.Errorf("c2wnet: compile: %w", err)
	}

	// Filesystem config: mount host directories at their absolute paths
	// so TinyEMU's virtio-9p sees them correctly.
	fsConfig := wazero.NewFSConfig().
		WithDirMount(rootDir, rootDir).
		WithDirMount(sharedDir, sharedDir)

	// Module config.
	conf := wazero.NewModuleConfig().
		WithSysWalltime().
		WithSysNanotime().
		WithSysNanosleep().
		WithRandSource(crand.Reader).
		WithStdin(wazeroStdinRead).
		WithStdout(wazeroStdoutWrite).
		WithStderr(wazeroStderrWrite).
		WithFSConfig(fsConfig).
		WithArgs("arg0", "/bin/sh").
		WithEnv("TERM", "xterm-256color").
		WithEnv("HOME", "/root").
		WithEnv("PATH", "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin")

	vmRunning = true

	// Network bridge goroutine — connects to the WASI TCP listener and
	// pumps Ethernet frames through gvisor-tap-vsock.
	go func() {
		var conn net.Conn
		var dialErr error
		for i := 0; i < 120; i++ {
			select {
			case <-ctx.Done():
				return
			default:
			}
			time.Sleep(1 * time.Second)
			conn, dialErr = net.Dial("tcp", wasiAddr)
			if dialErr == nil {
				break
			}
		}
		if conn == nil {
			fmt.Fprintf(os.Stderr, "c2wnet: failed to connect to WASI listener at %s: %v\n", wasiAddr, dialErr)
			return
		}
		if err := vn.AcceptQemu(ctx, conn); err != nil {
			fmt.Fprintf(os.Stderr, "c2wnet: AcceptQemu finished: %v\n", err)
		}
	}()

	// VM goroutine — runs the wasm module. Blocks until exit or cancel.
	go func() {
		_, modErr := r.InstantiateModule(runtimeCtx, compiled, conf)
		if modErr != nil {
			fmt.Fprintf(os.Stderr, "c2wnet: VM exited: %v\n", modErr)
		}
		// Close wazero-facing write-ends so Swift's read() gets EOF.
		mu.Lock()
		closeWazeroFilesLocked()
		vmRunning = false
		mu.Unlock()
	}()

	return nil
}

// StdinWriteFD returns the fd for writing to the VM's stdin.
// Returns -1 if the VM is not running.
func StdinWriteFD() int32 {
	mu.Lock()
	defer mu.Unlock()
	if !vmRunning {
		return -1
	}
	return swiftStdinWriteFD
}

// StdoutReadFD returns the fd for reading the VM's stdout (non-blocking).
// Returns -1 if the VM is not running.
func StdoutReadFD() int32 {
	mu.Lock()
	defer mu.Unlock()
	if !vmRunning {
		return -1
	}
	return swiftStdoutReadFD
}

// StderrReadFD returns the fd for reading the VM's stderr.
// Returns -1 if the VM is not running.
func StderrReadFD() int32 {
	mu.Lock()
	defer mu.Unlock()
	if !vmRunning {
		return -1
	}
	return swiftStderrReadFD
}

// IsVMRunning returns true if the VM is currently running.
func IsVMRunning() bool {
	mu.Lock()
	defer mu.Unlock()
	return vmRunning
}

// StopVM cancels the VM and releases all Go-side resources.
// After calling StopVM, Swift should close its own pipe fds.
func StopVM() {
	mu.Lock()
	defer mu.Unlock()

	if vmCancel != nil {
		vmCancel()
		vmCancel = nil
	}
	if vmRuntime != nil {
		vmRuntime.Close(vmCtx)
		vmRuntime = nil
	}
	closeWazeroFilesLocked()
	vmRunning = false
}

// closeWazeroFiles closes the wazero-facing pipe ends (under lock).
func closeWazeroFiles() {
	mu.Lock()
	defer mu.Unlock()
	closeWazeroFilesLocked()
}

func closeWazeroFilesLocked() {
	for _, f := range []*os.File{wazeroStdinRead, wazeroStdoutWrite, wazeroStderrWrite} {
		if f != nil {
			f.Close()
		}
	}
	wazeroStdinRead = nil
	wazeroStdoutWrite = nil
	wazeroStderrWrite = nil
}
