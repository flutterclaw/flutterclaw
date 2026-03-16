#!/usr/bin/env bash
#
# Build PRoot static binaries for Android (all 3 ABIs) using the Android NDK.
#
# Cross-compiles Termux's PRoot fork using its own GNUmakefile (in-tree build
# per ABI via symlink copies), producing libproot.so for each ABI in
# android/app/src/main/jniLibs/.
#
# Prerequisites:
#   - Android NDK (r26+ recommended) — set ANDROID_NDK_HOME or NDK_HOME
#   - git, make, curl
#
# Usage:
#   ./scripts/build-proot.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BUILD_DIR="$PROJECT_ROOT/.proot-build"
JNILIBS_DIR="$PROJECT_ROOT/android/app/src/main/jniLibs"
PROOT_REPO="https://github.com/termux/proot"
PROOT_BRANCH="master"
API_LEVEL=26
TALLOC_VERSION="2.4.2"

# Detect NDK
NDK_HOME="${ANDROID_NDK_HOME:-${NDK_HOME:-}}"
if [ -z "$NDK_HOME" ]; then
    if [ -d "$HOME/Library/Android/sdk/ndk" ]; then
        NDK_HOME=$(ls -d "$HOME/Library/Android/sdk/ndk/"* 2>/dev/null | sort -V | tail -1)
    elif [ -d "$HOME/Android/Sdk/ndk" ]; then
        NDK_HOME=$(ls -d "$HOME/Android/Sdk/ndk/"* 2>/dev/null | sort -V | tail -1)
    fi
fi
if [ -z "$NDK_HOME" ] || [ ! -d "$NDK_HOME" ]; then
    echo "ERROR: Android NDK not found. Set ANDROID_NDK_HOME or NDK_HOME."
    exit 1
fi
echo "Using NDK: $NDK_HOME"

HOST_TAG="darwin-x86_64"
if [ "$(uname -s)" = "Linux" ]; then HOST_TAG="linux-x86_64"; fi
TOOLCHAIN="$NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG"
if [ ! -d "$TOOLCHAIN" ]; then
    echo "ERROR: NDK toolchain not found at $TOOLCHAIN"
    exit 1
fi

get_target() {
    case "$1" in
        arm64-v8a)   echo "aarch64-linux-android" ;;
        armeabi-v7a) echo "armv7a-linux-androideabi" ;;
        x86_64)      echo "x86_64-linux-android" ;;
    esac
}

# Clone PRoot source
mkdir -p "$BUILD_DIR"
if [ ! -d "$BUILD_DIR/proot" ]; then
    echo "Cloning Termux PRoot..."
    git clone --depth=1 --branch "$PROOT_BRANCH" "$PROOT_REPO" "$BUILD_DIR/proot"
fi

# Download talloc
TALLOC_SRC="$BUILD_DIR/talloc-src"
if [ ! -d "$TALLOC_SRC" ]; then
    echo "Downloading talloc $TALLOC_VERSION..."
    curl -L "https://www.samba.org/ftp/talloc/talloc-${TALLOC_VERSION}.tar.gz" | tar xz -C "$BUILD_DIR"
    mv "$BUILD_DIR/talloc-${TALLOC_VERSION}" "$TALLOC_SRC"
fi

# Create minimal replace.h + config.h stubs for talloc cross-compilation
create_talloc_stubs() {
    local stub_dir="$1"
    mkdir -p "$stub_dir"
    cat > "$stub_dir/config.h" << 'STUB'
#define HAVE_CONSTRUCTOR_ATTRIBUTE 1
#define HAVE_DESTRUCTOR_ATTRIBUTE 1
#define HAVE_VA_COPY 1
#define HAVE_UNISTD_H 1
#define HAVE_STRING_H 1
#define HAVE_STRINGS_H 1
#define HAVE_STDINT_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_STDBOOL_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_ERRNO_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STDIO_H 1
#define HAVE_STRERROR 1
#define HAVE_MMAP 1
#define _GNU_SOURCE 1
#define __STDC_WANT_LIB_EXT1__ 1
STUB
    cat > "$stub_dir/replace.h" << 'STUB'
#ifndef _REPLACE_H_STUB
#define _REPLACE_H_STUB
#include "config.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <strings.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#ifndef MIN
#define MIN(a,b) ((a)<(b)?(a):(b))
#endif
#ifndef discard_const_p
#define discard_const_p(type, ptr) ((type *)(ptr))
#endif
#endif
STUB
}

PROOT_SRC_ORIG="$BUILD_DIR/proot/src"

for ABI in arm64-v8a armeabi-v7a x86_64; do
    echo ""
    echo "========================================="
    echo "Building PRoot for $ABI"
    echo "========================================="

    TARGET="$(get_target "$ABI")"
    CC="$TOOLCHAIN/bin/${TARGET}${API_LEVEL}-clang"
    STRIP="$TOOLCHAIN/bin/llvm-strip"
    AR="$TOOLCHAIN/bin/llvm-ar"
    OBJCOPY="$TOOLCHAIN/bin/llvm-objcopy"
    OBJDUMP="$TOOLCHAIN/bin/llvm-objdump"

    if [ ! -f "$CC" ]; then
        echo "  ERROR: Compiler not found: $CC"
        continue
    fi

    ABI_BUILD_DIR="$BUILD_DIR/$ABI"
    ABI_PREFIX="$ABI_BUILD_DIR/prefix"
    mkdir -p "$ABI_BUILD_DIR" "$ABI_PREFIX/lib" "$ABI_PREFIX/include"

    # ── Build talloc (static) ─────────────────────────────────────────────
    if [ ! -f "$ABI_PREFIX/lib/libtalloc.a" ]; then
        echo "  Building talloc..."
        STUB_DIR="$ABI_BUILD_DIR/talloc-stubs"
        create_talloc_stubs "$STUB_DIR"

        "$CC" -c -O2 \
            -I"$STUB_DIR" \
            -I"$TALLOC_SRC" \
            -D__STDC_WANT_LIB_EXT1__=1 \
            -DHAVE_VA_COPY=1 \
            -DTALLOC_BUILD_VERSION_MAJOR=2 \
            -DTALLOC_BUILD_VERSION_MINOR=4 \
            -DTALLOC_BUILD_VERSION_RELEASE=2 \
            "$TALLOC_SRC/talloc.c" \
            -o "$ABI_BUILD_DIR/talloc.o"

        "$AR" rcs "$ABI_PREFIX/lib/libtalloc.a" "$ABI_BUILD_DIR/talloc.o"
        cp "$TALLOC_SRC/talloc.h" "$ABI_PREFIX/include/"
        echo "  talloc: OK"
    fi

    # ── Build PRoot (in-tree copy) ────────────────────────────────────────
    # PRoot's Makefile expects in-tree builds, so we copy the src/ dir for
    # each ABI and build inside it.
    echo "  Compiling PRoot..."
    PROOT_SRC="$ABI_BUILD_DIR/proot-src"
    rm -rf "$PROOT_SRC"
    cp -R "$PROOT_SRC_ORIG" "$PROOT_SRC"

    cd "$PROOT_SRC"

    # Patch missing #include <string.h> in ashmem_memfd.c (newer clang treats
    # implicit function declarations as errors)
    if ! grep -q '#include <string.h>' extension/ashmem_memfd/ashmem_memfd.c 2>/dev/null; then
        sed -i.bak '1i\
#include <string.h>' extension/ashmem_memfd/ashmem_memfd.c
    fi

    # ── Build the PRoot loader ────────────────────────────────────────
    # The loader is a tiny static binary that PRoot injects into traced
    # processes. Without it, PRoot cannot execute anything.
    echo "  Building PRoot loader..."
    mkdir -p loader

    # Determine architecture-specific loader address from arch.h
    case "$ABI" in
        arm64-v8a)   LOADER_ADDRESS="0x2000000000" ;;
        armeabi-v7a) LOADER_ADDRESS="0x20000000" ;;
        x86_64)      LOADER_ADDRESS="0x600000000000" ;;
    esac

    LOADER_CFLAGS="-fPIC -ffreestanding"
    LOADER_LDFLAGS="-static -nostdlib -Wl,--build-id=none,-Ttext=${LOADER_ADDRESS},--rosegment,-z,noexecstack"

    "$CC" -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I. \
        -Wall -O2 $LOADER_CFLAGS \
        -c loader/loader.c -o loader/loader.o

    "$CC" -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I. \
        -Wall -O2 $LOADER_CFLAGS \
        -c loader/assembly.S -o loader/assembly.o

    "$CC" -o loader/loader loader/loader.o loader/assembly.o $LOADER_LDFLAGS
    "$STRIP" loader/loader 2>/dev/null || true
    echo "  Loader: OK ($(ls -lh loader/loader | awk '{print $5}'))"

    # For arm64 and x86_64, the Makefile expects a 32-bit loader too.
    # Alpine is pure native, so we create a dummy to satisfy the prerequisite.
    touch loader/loader-m32

    # For arm64: HAS_POKEDATA_WORKAROUND requires loader-info.c
    if [ "$ABI" = "arm64-v8a" ]; then
        READELF="$TOOLCHAIN/bin/llvm-readelf"
        if [ -f "$READELF" ]; then
            "$READELF" -s loader/loader | awk -f loader/loader-info.awk > loader/loader-info.c
            echo "  loader-info.c: generated"
        else
            # Fallback: create a stub (pokedata workaround offset = 0)
            echo '#include <unistd.h>' > loader/loader-info.c
            echo 'const ssize_t offset_to_pokedata_workaround=0;' >> loader/loader-info.c
            echo "  loader-info.c: stub (llvm-readelf not found)"
        fi
    fi

    # ── Build PRoot ──────────────────────────────────────────────────
    # Note: CFLAGS is intentionally not overridden on the command line so
    # that the Makefile can append PROOT_UNBUNDLE_LOADER defines to it.
    # We pass extra flags via CPPFLAGS instead.
    CFLAGS="-Wall -O2" \
    make -j4 \
        CC="$CC" \
        LD="$CC" \
        STRIP="$STRIP" \
        OBJCOPY="$OBJCOPY" \
        OBJDUMP="$OBJDUMP" \
        CPPFLAGS="-D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -I. -I$ABI_PREFIX/include" \
        LDFLAGS="-L$ABI_PREFIX/lib -ltalloc -static" \
        PROOT_UNBUNDLE_LOADER="$PROOT_SRC/loader/loader" \
        proot 2>&1 | tail -30 || {
            echo "  ERROR: make failed for $ABI"
            cd "$PROJECT_ROOT"
            continue
        }

    if [ -f "$PROOT_SRC/proot" ]; then
        mkdir -p "$JNILIBS_DIR/$ABI"
        cp "$PROOT_SRC/proot" "$JNILIBS_DIR/$ABI/libproot.so"
        "$STRIP" "$JNILIBS_DIR/$ABI/libproot.so" 2>/dev/null || true

        # Ship the loader alongside proot (Android extracts both from jniLibs)
        cp loader/loader "$JNILIBS_DIR/$ABI/libproot-loader.so"

        PROOT_SIZE=$(ls -lh "$JNILIBS_DIR/$ABI/libproot.so" | awk '{print $5}')
        LOADER_SIZE=$(ls -lh "$JNILIBS_DIR/$ABI/libproot-loader.so" | awk '{print $5}')
        echo "  SUCCESS: libproot.so ($PROOT_SIZE), libproot-loader.so ($LOADER_SIZE)"
    else
        echo "  ERROR: proot binary not produced for $ABI"
    fi

    cd "$PROJECT_ROOT"
done

echo ""
echo "========================================="
echo "Build complete."
echo "========================================="
ls -lh "$JNILIBS_DIR"/*/libproot.so 2>/dev/null || echo "No binaries found."
echo ""
echo "Next steps:"
echo "  1. Verify: file $JNILIBS_DIR/arm64-v8a/libproot.so"
echo "  2. Fill SHA-256 checksums in SandboxHandler.kt"
echo "  3. Build: flutter build apk"
