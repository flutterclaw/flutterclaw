# iOS Sandbox — Build Scripts

Produces the `alpine-ios-sandbox.initialized.wasm` artefact used by
`WasmSandboxHandler.swift` to run a full Alpine Linux 3.21 workspace on iOS
via TinyEMU (RISC-V64) + WAMR.

## Architecture

```
iOS app
  └─ WAMR interpreter (Apache 2.0)        — Wasm runtime, JIT-free, App Store safe
       └─ TinyEMU-c2w (MIT)               — RISC-V64 CPU emulator compiled to Wasm
            └─ Linux 6.1 kernel (custom)  — CONFIG_RISCV_SBI_V01=y (container2wasm)
                 └─ Alpine 3.21 rootfs    — pre-installed: python3, pip, git, curl...
```

Alpine's own kernel (6.12) is incompatible with TinyEMU (requires SBI v0.2+).
container2wasm supplies a custom Linux 6.1 kernel; the Alpine 3.21 *userspace*
(packages, apk database, /usr, /bin, /etc) is used unchanged.

## Runtime limitations on iOS

| Feature | Status |
|---------|--------|
| `apk add <pkg>` (online) | **Not available** — no network in VM |
| Pre-installed packages | python3, pip, git, curl, wget, jq, bash, file |
| Persistent /root/ | Yes — disk image in app Documents/ |
| File sharing with host | Yes — via WAMR `--dir` + virtio-9p |
| Internet from VM | No — WAMR networking WIP (PR #64 stalled) |
| Architecture | riscv64 (emulated on ARM64 hardware) |
| Performance | ~10–100× slower than Android (native ARM64) |

## Prerequisites

- Docker with buildx + riscv64 QEMU emulation
- [container2wasm](https://github.com/ktock/container2wasm) (`c2w`)
- [wizer](https://github.com/bytecodealliance/wizer)

### Install on macOS

```sh
# Docker Desktop already includes buildx.
# Enable riscv64 emulation:
docker run --privileged --rm tonistiigi/binfmt --install riscv64

# container2wasm
brew install ktock/tap/container2wasm

# wizer
cargo install wizer --all-features
```

## Build

```sh
cd scripts/ios-sandbox
./build.sh
```

Output in `scripts/ios-sandbox/out/`:
- `alpine-ios-sandbox.wasm` — raw (pre-wizer)
- `alpine-ios-sandbox.initialized.wasm` — **kernel pre-booted**, ready to ship

## Distribution

Upload `alpine-ios-sandbox.initialized.wasm` to a CDN or attach to a GitHub
release. Update `WasmSandboxHandler.WASM_DOWNLOAD_URL` with the URL.

The file is downloaded on-demand by `sandbox_setup` on the user's device; it
is **not** bundled in the IPA.

## Updating packages

Edit `Dockerfile`, add packages in the `apk add` block, then re-run `build.sh`
and publish a new version. Update `WasmSandboxHandler.WASM_VERSION` so devices
re-download the updated image.
