#!/usr/bin/env bash
# Build WAMR (WebAssembly Micro Runtime) as an xcframework for iOS.
#
# Produces: ios/WAMR/wamr.xcframework
#
# Configuration:
#   - Interpreter mode only (no JIT — required for App Store)
#   - Fast interpreter enabled (best interpreter performance)
#   - WASI libc enabled (required for container2wasm)
#   - Slices: arm64-apple-ios (device) + x86_64-apple-ios-simulator (sim)
#
# Prerequisites:
#   - Xcode + Command Line Tools
#   - CMake >= 3.14  (brew install cmake)
#
# Usage:
#   cd <repo-root>
#   scripts/build-wamr-ios.sh
#   # Then run: cd ios && pod install

set -euo pipefail

WAMR_VERSION="WAMR-2.1.0"
WAMR_REPO="https://github.com/bytecodealliance/wasm-micro-runtime"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
WAMR_SRC="${SCRIPT_DIR}/wamr-src"
OUT_DIR="${REPO_ROOT}/ios/WAMR"

WAMR_CMAKE_FLAGS=(
    -DWAMR_BUILD_INTERP=1
    -DWAMR_BUILD_FAST_INTERP=1
    -DWAMR_BUILD_AOT=0
    -DWAMR_BUILD_JIT=0
    -DWAMR_BUILD_LIBC_WASI=1
    -DWAMR_BUILD_LIBC_BUILTIN=1
    -DWAMR_BUILD_APP_FRAMEWORK=0
    -DWAMR_BUILD_MINI_LOADER=0
    -DWAMR_BUILD_MULTI_MODULE=0
    -DWAMR_BUILD_THREAD_MGR=0
    -DWAMR_BUILD_LIB_WASI_THREADS=0
    -DWAMR_BUILD_LIBC_WASI_SOCKET=1
)

echo "==> Checking prerequisites..."
command -v cmake >/dev/null 2>&1 || { echo "cmake not found. Install with: brew install cmake"; exit 1; }
command -v xcodebuild >/dev/null 2>&1 || { echo "xcodebuild not found. Install Xcode."; exit 1; }

# Clone / update WAMR source.
if [ ! -d "${WAMR_SRC}/.git" ]; then
    echo "==> Cloning WAMR ${WAMR_VERSION}..."
    git clone --depth 1 --branch "${WAMR_VERSION}" "${WAMR_REPO}" "${WAMR_SRC}"
else
    echo "==> WAMR source already present at ${WAMR_SRC}"
fi

# Patch WAMR's iOS CMakeLists:
#   1. Remove -mfloat-abi=hard (invalid for arm64/x86_64 — ARM32 only).
#   2. Change SHARED → STATIC so xcodebuild -create-xcframework can use it.
WAMR_IOS_CMAKE="${WAMR_SRC}/product-mini/platforms/ios/CMakeLists.txt"
cp "${WAMR_IOS_CMAKE}" "${WAMR_IOS_CMAKE}.orig"

sed -i.bak \
    -e 's/set (CMAKE_C_FLAGS "\${CMAKE_C_FLAGS} -mfloat-abi=hard")/# -mfloat-abi=hard removed (arm64\/x86_64 incompatible)/' \
    -e 's/add_library (iwasm SHARED/add_library (iwasm STATIC/' \
    "${WAMR_IOS_CMAKE}"

echo "==> Patched CMakeLists: removed -mfloat-abi=hard, changed SHARED→STATIC"

build_slice() {
    local ARCH="$1"       # cmake WAMR target: AARCH64 or X86_64
    local OSX_ARCH="$2"   # apple arch: arm64 or x86_64
    local SYSROOT="$3"    # iphoneos or iphonesimulator
    local BUILD_DIR="${WAMR_SRC}/build-${SYSROOT}-${ARCH}"

    echo "==> Building WAMR for ${OSX_ARCH} (${SYSROOT})..."
    mkdir -p "${BUILD_DIR}"
    cmake -S "${WAMR_SRC}/product-mini/platforms/ios" \
          -B "${BUILD_DIR}" \
          -DWAMR_BUILD_TARGET="${ARCH}" \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_SYSTEM_NAME=iOS \
          -DCMAKE_OSX_ARCHITECTURES="${OSX_ARCH}" \
          -DCMAKE_OSX_SYSROOT="${SYSROOT}" \
          -DCMAKE_OSX_DEPLOYMENT_TARGET=14.0 \
          "${WAMR_CMAKE_FLAGS[@]}"
    cmake --build "${BUILD_DIR}" --config Release -- -j"$(sysctl -n hw.logicalcpu)"
}

build_slice "AARCH64" "arm64"   "iphoneos"
build_slice "AARCH64" "arm64"   "iphonesimulator"   # arm64 sim (Apple Silicon Macs)
build_slice "X86_64"  "x86_64"  "iphonesimulator"   # x86_64 sim (Intel Macs)

DEVICE_LIB="${WAMR_SRC}/build-iphoneos-AARCH64/libiwasm.a"
SIM_ARM64="${WAMR_SRC}/build-iphonesimulator-AARCH64/libiwasm.a"
SIM_X86="${WAMR_SRC}/build-iphonesimulator-X86_64/libiwasm.a"

[ -f "${DEVICE_LIB}" ] || { echo "ERROR: device arm64 library not found"; exit 1; }
[ -f "${SIM_ARM64}"  ] || { echo "ERROR: simulator arm64 library not found"; exit 1; }
[ -f "${SIM_X86}"    ] || { echo "ERROR: simulator x86_64 library not found"; exit 1; }

# Create fat simulator library (arm64 + x86_64).
# Both slices must be named libiwasm.a so the linker finds -liwasm.
SIM_STAGE="${WAMR_SRC}/stage-simulator"
DEV_STAGE="${WAMR_SRC}/stage-device"
mkdir -p "${SIM_STAGE}" "${DEV_STAGE}"
lipo -create "${SIM_ARM64}" "${SIM_X86}" -output "${SIM_STAGE}/libiwasm.a"
cp "${DEVICE_LIB}" "${DEV_STAGE}/libiwasm.a"
echo "==> Simulator fat: $(lipo -info "${SIM_STAGE}/libiwasm.a")"

INCLUDE_DIR="${WAMR_SRC}/core/iwasm/include"

echo "==> Packing xcframework..."
rm -rf "${OUT_DIR}/wamr.xcframework"
mkdir -p "${OUT_DIR}"

xcodebuild -create-xcframework \
    -library "${DEV_STAGE}/libiwasm.a" \
    -headers "${INCLUDE_DIR}" \
    -library "${SIM_STAGE}/libiwasm.a" \
    -headers "${INCLUDE_DIR}" \
    -output "${OUT_DIR}/wamr.xcframework"

echo ""
echo "Done. xcframework at: ${OUT_DIR}/wamr.xcframework"
echo ""
echo "Next steps:"
echo "  1. cd ios && pod install"
echo "  2. Open ios/Runner.xcworkspace in Xcode and build."
