/// Visible browser overlay for user-assisted actions (CAPTCHA, 2FA, login).
///
/// Shows a full-screen WebView at the current browser URL, sharing the same
/// platform cookie store as the headless browser. The user interacts with the
/// page directly (solving CAPTCHAs, completing 2FA, etc.) then taps Done.
library;

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';

/// Full-screen visible browser for user interaction.
///
/// Presented modally over the app. The WebView uses the same platform cookie
/// store as HeadlessBrowserTool — so any session changes (CAPTCHA solved,
/// login completed) are immediately available to the headless browser after
/// the user dismisses this overlay.
class BrowserOverlay extends StatefulWidget {
  final String url;
  final String message;
  final String? userAgent;

  const BrowserOverlay({
    super.key,
    required this.url,
    required this.message,
    this.userAgent,
  });

  @override
  State<BrowserOverlay> createState() => _BrowserOverlayState();
}

class _BrowserOverlayState extends State<BrowserOverlay> {
  InAppWebViewController? _controller;
  String _displayUrl = '';
  bool _loading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _displayUrl = widget.url;
  }

  void _reload() {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });
    _controller?.loadUrl(
      urlRequest: URLRequest(url: WebUri(widget.url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            if (_controller != null && await _controller!.canGoBack()) {
              await _controller!.goBack();
            } else {
              if (context.mounted) Navigator.of(context).pop();
            }
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.message,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              _displayUrl,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          if (_errorMessage != null)
            IconButton(
              onPressed: _reload,
              icon: const Icon(Icons.refresh),
            ),
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.check_circle_outline),
            label: Text(context.l10n.browserOverlayDone),
          ),
        ],
        bottom: _loading
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(),
              )
            : null,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true,
          domStorageEnabled: true,
          databaseEnabled: true,
          mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
          mediaPlaybackRequiresUserGesture: true,
          userAgent: widget.userAgent,
        ),
        initialUserScripts: UnmodifiableListView([
          UserScript(
            source: _kAntiDetectionScript,
            injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
          ),
        ]),
        onWebViewCreated: (controller) => _controller = controller,
        onLoadStart: (controller, url) {
          setState(() {
            _loading = true;
            _errorMessage = null;
            _displayUrl = url?.toString() ?? _displayUrl;
          });
        },
        onLoadStop: (controller, url) {
          setState(() {
            _loading = false;
            _displayUrl = url?.toString() ?? _displayUrl;
          });
        },
        onReceivedError: (controller, request, error) {
          // Only show error for the main frame navigation, not sub-resources
          if (request.url.toString() == _displayUrl ||
              request.url.toString() == widget.url) {
            setState(() {
              _loading = false;
              _errorMessage = error.description;
            });
          } else {
            setState(() => _loading = false);
          }
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Anti-detection script (shared with HeadlessBrowserTool)
// ---------------------------------------------------------------------------

const _kAntiDetectionScript = '''
(function() {
  try {
    Object.defineProperty(navigator, 'webdriver', {get: () => false});
    Object.defineProperty(navigator, 'plugins', {get: () => [1,2,3,4,5]});
    Object.defineProperty(navigator, 'languages', {get: () => ['en-US','en']});
    window.chrome = {runtime: {}, loadTimes: function(){}, csi: function(){}, app: {}};
    const orig = window.navigator.permissions && window.navigator.permissions.query;
    if (orig) {
      window.navigator.permissions.query = (p) =>
        p.name === 'notifications'
          ? Promise.resolve({state: Notification.permission})
          : orig.call(window.navigator.permissions, p);
    }
  } catch(e) {}
})();
''';
