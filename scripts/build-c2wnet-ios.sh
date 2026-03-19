#!/usr/bin/env bash
# Build C2WNet.xcframework — wazero WASM runtime + gvisor-tap-vsock network
# stack for the iOS sandbox (replaces WAMR with full networking support).
#
# Produces: ios/C2WNet/C2WNet.xcframework
#
# What's inside:
#   - wazero (pure-Go WASM runtime, interpreter mode, Apache 2.0)
#   - gvisor-tap-vsock (user-space TCP/IP stack, Apache 2.0)
#   - Pipe-based I/O bridge for Swift integration
#
# Prerequisites:
#   - Go >= 1.24  (brew install go)
#   - gomobile    (go install golang.org/x/mobile/cmd/gomobile@latest)
#   - gobind      (go install golang.org/x/mobile/cmd/gobind@latest)
#
# Usage:
#   cd <repo-root>
#   scripts/build-c2wnet-ios.sh
#   # Then run: cd ios && pod install

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
GO_PKG="${REPO_ROOT}/ios/c2w-net-ios"
OUT_DIR="${REPO_ROOT}/ios/C2WNet"

# Ensure gomobile + gobind are in PATH.
export PATH="${PATH}:${HOME}/go/bin"

echo "==> Checking prerequisites..."
command -v go >/dev/null 2>&1 || { echo "go not found. Install with: brew install go"; exit 1; }
command -v gomobile >/dev/null 2>&1 || { echo "gomobile not found. Run: go install golang.org/x/mobile/cmd/gomobile@latest"; exit 1; }
command -v gobind >/dev/null 2>&1 || { echo "gobind not found. Run: go install golang.org/x/mobile/cmd/gobind@latest"; exit 1; }

echo "==> Initializing gomobile..."
gomobile init

echo "==> Building C2WNet.xcframework..."
cd "${GO_PKG}"

# Clean previous build.
rm -rf "${OUT_DIR}/C2WNet.xcframework"
mkdir -p "${OUT_DIR}"

gomobile bind \
    -target ios,iossimulator \
    -o "${OUT_DIR}/C2WNet.xcframework" \
    .

echo ""
echo "Done. xcframework at: ${OUT_DIR}/C2WNet.xcframework"
echo "Size: $(du -sh "${OUT_DIR}/C2WNet.xcframework" | cut -f1)"
echo ""
echo "Next steps:"
echo "  1. cd ios && pod install"
echo "  2. Open ios/Runner.xcworkspace in Xcode and build."
