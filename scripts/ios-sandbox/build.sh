#!/usr/bin/env bash
# Build the iOS sandbox Wasm artefact.
#
# Prerequisites:
#   - Docker (with buildx, riscv64 emulation via qemu-user-static)
#   - container2wasm (c2w): https://github.com/ktock/container2wasm
#   - wizer: https://github.com/bytecodealliance/wizer
#
# Install c2w (macOS):
#   brew install ktock/tap/container2wasm   (or download from GitHub releases)
#
# Install wizer:
#   cargo install wizer --all-features
#
# Output:
#   alpine-ios-sandbox.wasm           (raw, before wizer)
#   alpine-ios-sandbox.initialized.wasm  (wizer pre-initialised — kernel pre-booted)
#
# The .initialized.wasm is the file shipped in FlutterClaw releases.
# Host it on a CDN or attach to a GitHub release; it is downloaded on-demand
# by WasmSandboxHandler on first sandbox_setup call.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT_DIR="${SCRIPT_DIR}/out"
DOCKERFILE="${SCRIPT_DIR}/Dockerfile"
IMAGE_TAG="flutterclaw-ios-sandbox:build"
RAW_WASM="${OUT_DIR}/alpine-ios-sandbox.wasm"
INIT_WASM="${OUT_DIR}/alpine-ios-sandbox.initialized.wasm"

mkdir -p "${OUT_DIR}"

echo "==> Building Docker image (riscv64/alpine:3.21 + packages)..."
docker buildx build \
    --platform linux/riscv64 \
    --tag "${IMAGE_TAG}" \
    --load \
    -f "${DOCKERFILE}" \
    "${SCRIPT_DIR}"

echo "==> Converting container to Wasm via container2wasm (TinyEMU riscv64 backend)..."
c2w \
    --target-arch riscv64 \
    "${IMAGE_TAG}" \
    "${RAW_WASM}"

echo "==> Pre-booting kernel with wizer..."
wizer \
    --allow-wasi \
    --wasm-bulk-memory true \
    -o "${INIT_WASM}" \
    "${RAW_WASM}"

RAW_SIZE=$(du -sh "${RAW_WASM}" | cut -f1)
INIT_SIZE=$(du -sh "${INIT_WASM}" | cut -f1)

echo ""
echo "Done."
echo "  Raw Wasm:         ${RAW_WASM}  (${RAW_SIZE})"
echo "  Initialized Wasm: ${INIT_WASM}  (${INIT_SIZE})"
echo ""
echo "Upload ${INIT_WASM} to your CDN and update WASM_DOWNLOAD_URL in WasmSandboxHandler.swift."
