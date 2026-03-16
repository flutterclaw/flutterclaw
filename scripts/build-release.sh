#!/usr/bin/env bash
#
# Build FlutterClaw release artifacts for Android and iOS.
#
# Usage:
#   ./scripts/build-release.sh              # Build both platforms
#   ./scripts/build-release.sh android      # Android only (APK + AAB)
#   ./scripts/build-release.sh ios          # iOS only (IPA)
#   ./scripts/build-release.sh --bump       # Bump build number before building
#
# Prerequisites:
#   - Flutter SDK in PATH
#   - For Android: PRoot binaries in jniLibs/ (run ./scripts/build-proot.sh first)
#   - For Android release signing: android/key.properties with keystore config
#   - For iOS: valid provisioning profile and signing identity in Xcode
#
# Environment variables:
#   FLUTTER_BUILD_NAME   Override version name (e.g. "1.2.0")
#   FLUTTER_BUILD_NUMBER Override build number (e.g. "5")

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$PROJECT_ROOT/build/release"

# Colors (if terminal supports them)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()   { echo -e "${GREEN}[BUILD]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

# ── Parse arguments ───────────────────────────────────────────────────────────

BUILD_ANDROID=false
BUILD_IOS=false
BUMP_VERSION=false

for arg in "$@"; do
    case "$arg" in
        android) BUILD_ANDROID=true ;;
        ios)     BUILD_IOS=true ;;
        --bump)  BUMP_VERSION=true ;;
        --help|-h)
            echo "Usage: $0 [android|ios] [--bump]"
            echo "  No args: build both platforms"
            echo "  --bump:  increment build number in pubspec.yaml before building"
            exit 0
            ;;
        *) error "Unknown argument: $arg"; exit 1 ;;
    esac
done

# Default: build both if neither specified
if ! $BUILD_ANDROID && ! $BUILD_IOS; then
    BUILD_ANDROID=true
    BUILD_IOS=true
fi

cd "$PROJECT_ROOT"

# ── Version management ────────────────────────────────────────────────────────

CURRENT_VERSION=$(grep '^version:' pubspec.yaml | sed 's/version: //')
VERSION_NAME=$(echo "$CURRENT_VERSION" | cut -d'+' -f1)
BUILD_NUMBER=$(echo "$CURRENT_VERSION" | cut -d'+' -f2)

if $BUMP_VERSION; then
    BUILD_NUMBER=$((BUILD_NUMBER + 1))
    NEW_VERSION="${VERSION_NAME}+${BUILD_NUMBER}"
    sed -i '' "s/^version: .*/version: ${NEW_VERSION}/" pubspec.yaml
    log "Bumped version: $CURRENT_VERSION -> $NEW_VERSION"
    CURRENT_VERSION="$NEW_VERSION"
fi

# Allow env overrides
VERSION_NAME="${FLUTTER_BUILD_NAME:-$VERSION_NAME}"
BUILD_NUMBER="${FLUTTER_BUILD_NUMBER:-$BUILD_NUMBER}"

log "Version: $VERSION_NAME ($BUILD_NUMBER)"

# ── Pre-flight checks ────────────────────────────────────────────────────────

log "Running pre-flight checks..."

if ! command -v flutter &>/dev/null; then
    error "Flutter SDK not found in PATH"
    exit 1
fi

# Check PRoot binaries for Android
if $BUILD_ANDROID; then
    JNILIBS="$PROJECT_ROOT/android/app/src/main/jniLibs"
    if [ ! -f "$JNILIBS/arm64-v8a/libproot.so" ]; then
        warn "PRoot binaries not found in jniLibs/. Run ./scripts/build-proot.sh first."
        warn "Building without sandbox shell support."
    fi
fi

# Run flutter analyze
log "Running flutter analyze..."
if ! flutter analyze --no-pub 2>&1 | grep -q "No issues found"; then
    ISSUES=$(flutter analyze --no-pub 2>&1 | tail -1)
    warn "Flutter analyze: $ISSUES"
    # Don't fail on warnings/info, only on errors
    if flutter analyze --no-pub 2>&1 | grep -q " error "; then
        error "Flutter analyze found errors. Fix them before building."
        exit 1
    fi
fi

# Get dependencies
log "Getting dependencies..."
flutter pub get --no-example

# ── Build Android ─────────────────────────────────────────────────────────────

if $BUILD_ANDROID; then
    log "Building Android APK (release)..."
    mkdir -p "$OUTPUT_DIR/android"

    flutter build apk \
        --release \
        --build-name="$VERSION_NAME" \
        --build-number="$BUILD_NUMBER"

    APK_PATH="$PROJECT_ROOT/build/app/outputs/flutter-apk/app-release.apk"
    if [ -f "$APK_PATH" ]; then
        cp "$APK_PATH" "$OUTPUT_DIR/android/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.apk"
        APK_SIZE=$(ls -lh "$OUTPUT_DIR/android/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.apk" | awk '{print $5}')
        log "APK: $OUTPUT_DIR/android/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.apk ($APK_SIZE)"
    else
        error "APK not found at expected path"
    fi

    log "Building Android App Bundle (release)..."
    flutter build appbundle \
        --release \
        --build-name="$VERSION_NAME" \
        --build-number="$BUILD_NUMBER"

    AAB_PATH="$PROJECT_ROOT/build/app/outputs/bundle/release/app-release.aab"
    if [ -f "$AAB_PATH" ]; then
        cp "$AAB_PATH" "$OUTPUT_DIR/android/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.aab"
        AAB_SIZE=$(ls -lh "$OUTPUT_DIR/android/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.aab" | awk '{print $5}')
        log "AAB: $OUTPUT_DIR/android/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.aab ($AAB_SIZE)"
    else
        error "AAB not found at expected path"
    fi
fi

# ── Build iOS ─────────────────────────────────────────────────────────────────

if $BUILD_IOS; then
    if [ "$(uname -s)" != "Darwin" ]; then
        warn "iOS builds require macOS. Skipping."
    else
        log "Building iOS (release)..."
        mkdir -p "$OUTPUT_DIR/ios"

        flutter build ipa \
            --release \
            --build-name="$VERSION_NAME" \
            --build-number="$BUILD_NUMBER" \
            --export-method=ad-hoc \
            2>&1 || {
                # If ad-hoc fails (no provisioning profile), try without export
                warn "IPA export failed. Building xcarchive only..."
                flutter build ios \
                    --release \
                    --build-name="$VERSION_NAME" \
                    --build-number="$BUILD_NUMBER" \
                    --no-codesign
            }

        # Copy IPA if produced
        IPA_PATH=$(find "$PROJECT_ROOT/build/ios/ipa" -name "*.ipa" 2>/dev/null | head -1)
        if [ -n "$IPA_PATH" ] && [ -f "$IPA_PATH" ]; then
            cp "$IPA_PATH" "$OUTPUT_DIR/ios/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.ipa"
            IPA_SIZE=$(ls -lh "$OUTPUT_DIR/ios/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.ipa" | awk '{print $5}')
            log "IPA: $OUTPUT_DIR/ios/flutterclaw-${VERSION_NAME}-${BUILD_NUMBER}.ipa ($IPA_SIZE)"
        else
            warn "No IPA produced. Use Xcode to archive and export manually."
            log "Xcode project: ios/Runner.xcworkspace"
        fi
    fi
fi

# ── Summary ───────────────────────────────────────────────────────────────────

echo ""
log "========================================="
log "Release build complete: v${VERSION_NAME} (${BUILD_NUMBER})"
log "========================================="
echo ""

if [ -d "$OUTPUT_DIR" ]; then
    log "Artifacts:"
    find "$OUTPUT_DIR" -type f -name "flutterclaw-*" | while read -r f; do
        SIZE=$(ls -lh "$f" | awk '{print $5}')
        echo "  $f ($SIZE)"
    done
fi

echo ""
log "Next steps:"
if $BUILD_ANDROID; then
    echo "  Android: upload .aab to Google Play Console, or distribute .apk directly"
fi
if $BUILD_IOS; then
    echo "  iOS: upload .ipa via Transporter or Xcode Organizer"
fi
if $BUMP_VERSION; then
    echo "  Commit: git add pubspec.yaml && git commit -m 'Bump version to $CURRENT_VERSION'"
fi
