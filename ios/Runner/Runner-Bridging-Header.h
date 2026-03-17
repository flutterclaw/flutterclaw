#import "GeneratedPluginRegistrant.h"

// WAMR — WebAssembly Micro Runtime C API.
// Available once ios/WAMR/wamr.xcframework is built (scripts/build-wamr-ios.sh).
// CocoaPods exposes the xcframework headers via HEADER_SEARCH_PATHS pointing to
// ${PODS_XCFRAMEWORKS_BUILD_DIR}/WAMR/Headers, so the import uses the file name directly.
#if __has_include("wasm_export.h")
#import "wasm_export.h"
#endif
