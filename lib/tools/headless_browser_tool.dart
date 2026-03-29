/// Headless browser tool for FlutterClaw — full automation suite.
///
/// Provides persistent browser sessions with cookie management, localStorage,
/// screenshots, form interaction, tab management, stealth/anti-detection,
/// network interception, CAPTCHA detection, and browser profile save/load.
library;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pointycastle/export.dart' as pc;

import '../data/models/config.dart';
import '../services/ssrf_guard.dart';
import 'registry.dart';

// ---------------------------------------------------------------------------
// Browser tab container
// ---------------------------------------------------------------------------

class _BrowserTab {
  final String id;
  HeadlessInAppWebView? headless;
  InAppWebViewController? controller;
  Completer<void>? pageLoadCompleter;
  String? currentUrl;
  String? lastError;

  _BrowserTab(this.id);
}

// ---------------------------------------------------------------------------
// Profile encryption helper (AES-256-CBC via pointycastle)
// ---------------------------------------------------------------------------

class _ProfileCrypto {
  static const _storage = FlutterSecureStorage();
  static const _keyName = 'flutterclaw_browser_profile_key_v1';

  static Future<Uint8List> _getOrCreateKey() async {
    final hex = await _storage.read(key: _keyName);
    if (hex != null && hex.length == 64) {
      return Uint8List.fromList(
        List.generate(32, (i) => int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16)),
      );
    }
    final rng = Random.secure();
    final key = Uint8List.fromList(List.generate(32, (_) => rng.nextInt(256)));
    final newHex = key.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    await _storage.write(key: _keyName, value: newHex);
    return key;
  }

  static Uint8List _randomIv() {
    final rng = Random.secure();
    return Uint8List.fromList(List.generate(16, (_) => rng.nextInt(256)));
  }

  static Uint8List _pkcs7Pad(Uint8List data) {
    final padLen = 16 - (data.length % 16);
    final padded = Uint8List(data.length + padLen);
    padded.setRange(0, data.length, data);
    for (var i = data.length; i < padded.length; i++) {
      padded[i] = padLen;
    }
    return padded;
  }

  static Uint8List _pkcs7Unpad(Uint8List data) {
    if (data.isEmpty) return data;
    final padLen = data.last;
    if (padLen < 1 || padLen > 16) return data;
    return data.sublist(0, data.length - padLen);
  }

  static Future<String> encrypt(String plaintext) async {
    final key = await _getOrCreateKey();
    final iv = _randomIv();
    final padded = _pkcs7Pad(Uint8List.fromList(utf8.encode(plaintext)));

    final cipher = pc.CBCBlockCipher(pc.AESEngine());
    cipher.init(true, pc.ParametersWithIV(pc.KeyParameter(key), iv));

    final encrypted = Uint8List(padded.length);
    for (var offset = 0; offset < padded.length; offset += 16) {
      cipher.processBlock(padded, offset, encrypted, offset);
    }

    final combined = Uint8List(16 + encrypted.length);
    combined.setRange(0, 16, iv);
    combined.setRange(16, combined.length, encrypted);
    return base64.encode(combined);
  }

  static Future<String> decrypt(String ciphertext) async {
    final key = await _getOrCreateKey();
    final combined = base64.decode(ciphertext);
    if (combined.length < 17) throw const FormatException('Invalid ciphertext');
    final iv = Uint8List.fromList(combined.sublist(0, 16));
    final encrypted = Uint8List.fromList(combined.sublist(16));

    final cipher = pc.CBCBlockCipher(pc.AESEngine());
    cipher.init(false, pc.ParametersWithIV(pc.KeyParameter(key), iv));

    final decrypted = Uint8List(encrypted.length);
    for (var offset = 0; offset < encrypted.length; offset += 16) {
      cipher.processBlock(encrypted, offset, decrypted, offset);
    }

    return utf8.decode(_pkcs7Unpad(decrypted));
  }
}

// ---------------------------------------------------------------------------
// Default anti-detection user script
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

// ---------------------------------------------------------------------------
// CAPTCHA detection script
// ---------------------------------------------------------------------------
// NOTE: Keep patterns specific to avoid false positives on login pages that
// may contain hidden invisible CAPTCHA elements (e.g. reCAPTCHA v3).
// We only flag interactive/visible CAPTCHA challenges, not invisible ones.

const _kCaptchaDetectScript = '''
(function() {
  var title = (document.title || '').toLowerCase();
  // Only match known specific CAPTCHA selectors — avoid generic class/id patterns
  // that cause false positives on login pages with invisible reCAPTCHA v3.
  var checks = [
    !!document.querySelector('iframe[src*="recaptcha"][src*="challenge"]'),
    !!document.querySelector('.g-recaptcha:not([style*="display:none"]):not([style*="display: none"])'),
    !!document.querySelector('iframe[src*="hcaptcha"][src*="challenge"]'),
    !!document.querySelector('.h-captcha:not([style*="display:none"])'),
    !!document.querySelector('#cf-challenge-running'),
    !!document.querySelector('.cf-turnstile'),
    title === 'challenge' || title === 'just a moment...' || title.startsWith('attention required'),
  ];
  var types = ['reCAPTCHA challenge','reCAPTCHA','hCaptcha challenge','hCaptcha','Cloudflare','Cloudflare Turnstile','Cloudflare challenge'];
  for (var i = 0; i < checks.length; i++) {
    if (checks[i]) return types[i];
  }
  return null;
})();
''';

// ---------------------------------------------------------------------------
// User-agent presets
// ---------------------------------------------------------------------------

const _kUserAgents = {
  'chrome_desktop':
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36',
  'chrome_mobile':
      'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Mobile Safari/537.36',
  'safari_desktop':
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 14_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15',
  'safari_mobile':
      'Mozilla/5.0 (iPhone; CPU iPhone OS 17_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Mobile/15E148 Safari/604.1',
};

// ---------------------------------------------------------------------------
// HeadlessBrowserTool
// ---------------------------------------------------------------------------

class HeadlessBrowserTool extends Tool {
  // --- Config & callbacks ---
  final BrowserConfig _config;
  final Future<void> Function(String url, String message)? _onRequestUserAction;

  // --- Tab state ---
  final Map<String, _BrowserTab> _tabs = {};
  String _activeTabId = 'default';
  int _tabCounter = 0;

  // --- Persistent browser settings (survive recreate) ---
  final List<UserScript> _persistentUserScripts = [];
  String _userAgent = _kUserAgents['safari_mobile']!;
  Size _viewportSize = const Size(390, 844);
  final Set<String> _blockedResourceTypes = {};

  // --- Per-session state ---
  final Set<String> _visitedDomains = {};
  final Map<String, Map<String, String>> _pendingLocalStorage = {};
  String? _activeIframeSelector;

  // --- Network log ---
  final List<Map<String, dynamic>> _networkLog = [];
  bool _interceptingRequests = false;
  String? _interceptUrlPattern;

  HeadlessBrowserTool({
    BrowserConfig config = const BrowserConfig(),
    Future<void> Function(String url, String message)? onRequestUserAction,
  })  : _config = config,
        _onRequestUserAction = onRequestUserAction;

  // --- Convenience getters for active tab ---
  _BrowserTab? get _activeTab => _tabs[_activeTabId];
  InAppWebViewController? get _controller => _activeTab?.controller;

  @override
  String get name => 'web_browse';

  @override
  String get description =>
      'Full-featured headless browser with persistent sessions. '
      'Actions: navigate, js, click, type, get_content, get_html, scroll, back, forward, close, '
      'get_cookies, set_cookie, delete_cookies, get_storage, set_storage, save_profile, load_profile, '
      'screenshot, screenshot_element, get_page_info, '
      'wait_for, hover, keyboard, select_option, fill_form, upload_file, query_elements, '
      'switch_iframe, new_tab, switch_tab, close_tab, set_viewport, '
      'inject_script, set_user_agent, set_geolocation, '
      'intercept_requests, block_resources, request_user_action. '
      'Cookies and localStorage persist across sessions. '
      'Automatically detects CAPTCHAs and prompts user when needed.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'action': {
            'type': 'string',
            'enum': [
              'navigate', 'js', 'click', 'type', 'get_content', 'get_html',
              'scroll', 'back', 'forward', 'close',
              'get_cookies', 'set_cookie', 'delete_cookies',
              'get_storage', 'set_storage', 'save_profile', 'load_profile',
              'screenshot', 'screenshot_element', 'get_page_info',
              'wait_for', 'hover', 'keyboard', 'select_option', 'fill_form',
              'upload_file', 'query_elements',
              'switch_iframe', 'new_tab', 'switch_tab', 'close_tab', 'set_viewport',
              'inject_script', 'set_user_agent', 'set_geolocation',
              'intercept_requests', 'block_resources', 'request_user_action',
            ],
            'description': 'Browser action to perform.',
          },
          // Navigation
          'url': {'type': 'string', 'description': 'URL to navigate to.'},
          'wait_ms': {'type': 'integer', 'description': 'Extra ms to wait after page load (default: 2000).'},
          // JS / interaction
          'script': {'type': 'string', 'description': 'JavaScript code to execute.'},
          'selector': {'type': 'string', 'description': 'CSS selector for target element.'},
          'text': {'type': 'string', 'description': 'Text to type into element.'},
          // Scroll
          'direction': {'type': 'string', 'enum': ['down', 'up'], 'description': 'Scroll direction.'},
          'amount': {'type': 'integer', 'description': 'Scroll amount in pixels (default: 500).'},
          'max_chars': {'type': 'integer', 'description': 'Max chars to return (default: 50000).'},
          // Cookies
          'name': {'type': 'string', 'description': 'Cookie name.'},
          'value': {'type': 'string', 'description': 'Cookie value.'},
          'domain': {'type': 'string', 'description': 'Cookie domain.'},
          'path': {'type': 'string', 'description': 'Cookie path (default: /).'},
          'expires_days': {'type': 'integer', 'description': 'Cookie expiry days from now (default: 365).'},
          'is_secure': {'type': 'boolean', 'description': 'Secure cookie flag.'},
          'is_http_only': {'type': 'boolean', 'description': 'HttpOnly cookie flag.'},
          // Storage
          'storage_type': {'type': 'string', 'enum': ['local', 'session'], 'description': 'Web storage type (default: local).'},
          'key': {'type': 'string', 'description': 'Storage key.'},
          // Profile
          'profile_name': {'type': 'string', 'description': 'Browser profile name (alphanumeric + hyphens, max 50 chars).'},
          // Screenshot
          'full_page': {'type': 'boolean', 'description': 'Capture full page height (default: false).'},
          'quality': {'type': 'integer', 'description': 'JPEG quality 1-100 (default: 80).'},
          // wait_for
          'timeout_ms': {'type': 'integer', 'description': 'Wait timeout ms (default: 10000).'},
          'visible': {'type': 'boolean', 'description': 'Wait for element to be visible (default: false).'},
          // keyboard
          'keyboard_key': {'type': 'string', 'description': 'Key name: Enter, Tab, Escape, ArrowDown, ArrowUp, Space, Backspace, etc.'},
          'modifiers': {'type': 'array', 'items': {'type': 'string'}, 'description': 'Modifier keys: ctrl, shift, alt, meta.'},
          // select_option
          'option_value': {'type': 'string', 'description': 'Select option by value attribute.'},
          'option_label': {'type': 'string', 'description': 'Select option by visible text.'},
          // fill_form
          'fields': {'type': 'object', 'description': 'Map of {selector: value} for fill_form.', 'additionalProperties': {'type': 'string'}},
          // upload_file
          'file_path': {'type': 'string', 'description': 'Absolute path to file to upload.'},
          // query_elements
          'attributes': {'type': 'array', 'items': {'type': 'string'}, 'description': 'Extra attributes to extract per element.'},
          'max_results': {'type': 'integer', 'description': 'Max elements to return (default: 50).'},
          // Tabs
          'tab_id': {'type': 'string', 'description': 'Tab ID for switch_tab/close_tab.'},
          // Viewport
          'width': {'type': 'integer', 'description': 'Viewport width in pixels.'},
          'height': {'type': 'integer', 'description': 'Viewport height in pixels.'},
          // inject_script
          'on_load': {'type': 'boolean', 'description': 'If true, script runs before every page load.'},
          // set_user_agent
          'user_agent': {'type': 'string', 'description': 'Custom user-agent string.'},
          'preset': {'type': 'string', 'enum': ['chrome_desktop', 'chrome_mobile', 'safari_desktop', 'safari_mobile'], 'description': 'User-agent preset.'},
          // set_geolocation
          'latitude': {'type': 'number', 'description': 'Geolocation latitude.'},
          'longitude': {'type': 'number', 'description': 'Geolocation longitude.'},
          'accuracy': {'type': 'number', 'description': 'Geolocation accuracy in meters (default: 50).'},
          // intercept_requests
          'enabled': {'type': 'boolean', 'description': 'Enable/disable request interception.'},
          'url_pattern': {'type': 'string', 'description': 'Regex pattern to filter captured URLs.'},
          // block_resources
          'types': {'type': 'array', 'items': {'type': 'string'}, 'description': 'Resource types to block: image, font, stylesheet, media, script.'},
          // request_user_action
          'message': {'type': 'string', 'description': 'Instructions shown to user in the browser overlay.'},
        },
        'required': ['action'],
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    final action = args['action'] as String?;
    if (action == null) return ToolResult.error('action is required');

    try {
      return switch (action) {
        // Original
        'navigate'            => await _navigate(args),
        'js'                  => await _executeJs(args),
        'click'               => await _click(args),
        'type'                => await _typeText(args),
        'get_content'         => await _getContent(args),
        'get_html'            => await _getHtml(args),
        'scroll'              => await _scroll(args),
        'back'                => await _goBack(),
        'forward'             => await _goForward(),
        'close'               => await _close(),
        // Group A — cookies & storage
        'get_cookies'         => await _getCookies(args),
        'set_cookie'          => await _setCookie(args),
        'delete_cookies'      => await _deleteCookies(args),
        'get_storage'         => await _getStorage(args),
        'set_storage'         => await _setStorage(args),
        'save_profile'        => await _saveProfile(args),
        'load_profile'        => await _loadProfile(args),
        // Group B — visual
        'screenshot'          => await _screenshot(args),
        'screenshot_element'  => await _screenshotElement(args),
        'get_page_info'       => await _getPageInfo(),
        // Group C — interaction
        'wait_for'            => await _waitFor(args),
        'hover'               => await _hover(args),
        'keyboard'            => await _keyboard(args),
        'select_option'       => await _selectOption(args),
        'fill_form'           => await _fillForm(args),
        'upload_file'         => await _uploadFile(args),
        'query_elements'      => await _queryElements(args),
        // Group D — navigation
        'switch_iframe'       => await _switchIframe(args),
        'new_tab'             => await _newTab(args),
        'switch_tab'          => await _switchTab(args),
        'close_tab'           => await _closeTab(args),
        'set_viewport'        => await _setViewport(args),
        // Group E — stealth
        'inject_script'       => await _injectScript(args),
        'set_user_agent'      => await _setUserAgent(args),
        'set_geolocation'     => await _setGeolocation(args),
        // Group F — network
        'intercept_requests'  => await _handleInterceptRequests(args),
        'block_resources'     => await _blockResources(args),
        // Group G — CAPTCHA
        'request_user_action' => await _requestUserAction(args),
        _                     => ToolResult.error('Unknown action: $action'),
      };
    } catch (e, st) {
      return ToolResult.error('Browser error [$action]: $e\n$st');
    }
  }

  // =========================================================================
  // ORIGINAL ACTIONS
  // =========================================================================

  Future<ToolResult> _navigate(Map<String, dynamic> args) async {
    final urlStr = args['url'] as String?;
    if (urlStr == null || urlStr.isEmpty) {
      return ToolResult.error('url is required for navigate action');
    }
    final waitMs = args['wait_ms'] as int? ?? 2000;

    final ssrfError = validateFetchUrl(urlStr);
    if (ssrfError != null) return ToolResult.error(ssrfError);

    await _ensureBrowser();
    final tab = _activeTab!;

    tab.pageLoadCompleter = Completer<void>();
    tab.lastError = null;

    await tab.controller!.loadUrl(
      urlRequest: URLRequest(url: WebUri(urlStr)),
    );

    await tab.pageLoadCompleter!.future
        .timeout(const Duration(seconds: 30), onTimeout: () {});

    if (waitMs > 0) {
      await Future<void>.delayed(Duration(milliseconds: waitMs));
    }

    final finalUrl = (await tab.controller!.getUrl())?.toString() ?? urlStr;
    tab.currentUrl = finalUrl;

    // Track visited domain for save_profile
    try {
      final host = Uri.parse(finalUrl).host;
      if (host.isNotEmpty) _visitedDomains.add(host);
    } catch (_) {}

    // Inject pending localStorage for this domain
    await _injectPendingLocalStorage(finalUrl);

    final title = await tab.controller!.getTitle() ?? '';

    final result = StringBuffer();
    result.writeln('Navigated to: $finalUrl');
    if (title.isNotEmpty) result.writeln('Title: $title');
    if (tab.lastError != null) result.writeln('Page error: ${tab.lastError}');

    // CAPTCHA detection
    final captchaType = await _detectCaptcha();
    if (captchaType != null) {
      result.writeln('');
      result.writeln('⚠️ CAPTCHA DETECTED ($captchaType). Use action "request_user_action" to let the user solve it manually.');
    }

    return ToolResult.success(result.toString().trim());
  }

  Future<ToolResult> _executeJs(Map<String, dynamic> args) async {
    final script = args['script'] as String?;
    if (script == null || script.isEmpty) {
      return ToolResult.error('script is required for js action');
    }
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final wrappedScript = _activeIframeSelector != null
        ? "(function(){var f=document.querySelector('${_activeIframeSelector!.replaceAll("'", "\\'")}');if(!f||!f.contentWindow)return 'ERROR: iframe not found';try{return f.contentWindow.eval($script)}catch(e){return 'ERROR: '+e}})()"
        : script;

    final result = await _controller!.evaluateJavascript(source: wrappedScript);
    return ToolResult.success(result?.toString() ?? 'null');
  }

  Future<ToolResult> _click(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    if (selector == null || selector.isEmpty) {
      return ToolResult.error('selector is required for click action');
    }
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final escaped = selector.replaceAll("'", "\\'");
    final result = await _controller!.evaluateJavascript(source: '''
      (function() {
        var el = document.querySelector('$escaped');
        if (!el) return 'ERROR: Element not found: $escaped';
        el.click();
        return 'Clicked: ' + (el.tagName || '') + ' ' + (el.textContent || '').substring(0, 100).trim();
      })();
    ''');

    final output = result?.toString() ?? 'null';
    if (output.startsWith('ERROR:')) return ToolResult.error(output);
    return ToolResult.success(output);
  }

  Future<ToolResult> _typeText(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    final text = args['text'] as String?;
    if (selector == null || selector.isEmpty) {
      return ToolResult.error('selector is required for type action');
    }
    if (text == null) return ToolResult.error('text is required for type action');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final escapedSelector = selector.replaceAll("'", "\\'");
    final escapedText = text.replaceAll('\\', '\\\\').replaceAll("'", "\\'").replaceAll('\n', '\\n');
    final result = await _controller!.evaluateJavascript(source: '''
      (function() {
        var el = document.querySelector('$escapedSelector');
        if (!el) return 'ERROR: Element not found: $escapedSelector';
        el.focus();
        var nativeInputValueSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value');
        if (nativeInputValueSetter) {
          nativeInputValueSetter.set.call(el, '$escapedText');
        } else {
          el.value = '$escapedText';
        }
        el.dispatchEvent(new Event('input', {bubbles: true}));
        el.dispatchEvent(new Event('change', {bubbles: true}));
        return 'Typed ' + ${text.length} + ' chars into: ' + (el.tagName || '');
      })();
    ''');

    final output = result?.toString() ?? 'null';
    if (output.startsWith('ERROR:')) return ToolResult.error(output);
    return ToolResult.success(output);
  }

  Future<ToolResult> _getContent(Map<String, dynamic> args) async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    final maxChars = args['max_chars'] as int? ?? 50000;

    final result = await _controller!.evaluateJavascript(source: r'''
      (function() {
        function nodeToMd(node) {
          if (node.nodeType === 3) return node.textContent;
          if (node.nodeType !== 1) return '';
          var tag = node.tagName.toLowerCase();
          if (['script','style','noscript','svg','path'].includes(tag)) return '';
          if (tag === 'br') return '\n';
          var children = Array.from(node.childNodes).map(nodeToMd).join('');
          switch(tag) {
            case 'h1': return '\n# ' + children.trim() + '\n';
            case 'h2': return '\n## ' + children.trim() + '\n';
            case 'h3': return '\n### ' + children.trim() + '\n';
            case 'h4': return '\n#### ' + children.trim() + '\n';
            case 'h5': return '\n##### ' + children.trim() + '\n';
            case 'h6': return '\n###### ' + children.trim() + '\n';
            case 'p': return '\n' + children.trim() + '\n';
            case 'li': return '- ' + children.trim() + '\n';
            case 'a': var href = node.getAttribute('href') || ''; var t = children.trim(); return href ? '[' + t + '](' + href + ')' : t;
            case 'img': var alt = node.getAttribute('alt') || ''; var src = node.getAttribute('src') || ''; return alt ? '![' + alt + '](' + src + ')' : '';
            case 'code': return '`' + children + '`';
            case 'pre': return '\n```\n' + children.trim() + '\n```\n';
            case 'blockquote': return '\n> ' + children.trim() + '\n';
            case 'strong': case 'b': return '**' + children.trim() + '**';
            case 'em': case 'i': return '*' + children.trim() + '*';
            case 'div': case 'section': case 'article': case 'main': return '\n' + children;
            default: return children;
          }
        }
        var body = document.body || document.documentElement;
        if (!body) return '';
        return nodeToMd(body).replace(/\n{3,}/g, '\n\n').trim();
      })();
    ''');

    var content = result?.toString() ?? '';
    if (content.length > maxChars) {
      content = '${content.substring(0, maxChars)}\n\n[... truncated]';
    }

    final url = (await _controller!.getUrl())?.toString() ?? '';
    final title = await _controller!.getTitle() ?? '';
    final buf = StringBuffer();
    if (url.isNotEmpty) buf.writeln('URL: $url');
    if (title.isNotEmpty) buf.writeln('Title: $title');
    buf.writeln('---');
    buf.write(content);
    return ToolResult.success(buf.toString());
  }

  Future<ToolResult> _getHtml(Map<String, dynamic> args) async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    final maxChars = args['max_chars'] as int? ?? 50000;
    final result = await _controller!.evaluateJavascript(
      source: 'document.documentElement.outerHTML;',
    );
    var html = result?.toString() ?? '';
    if (html.length > maxChars) html = '${html.substring(0, maxChars)}\n[... truncated]';
    return ToolResult.success(html);
  }

  Future<ToolResult> _scroll(Map<String, dynamic> args) async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    final direction = args['direction'] as String? ?? 'down';
    final amount = args['amount'] as int? ?? 500;
    final pixels = direction == 'up' ? -amount : amount;
    await _controller!.evaluateJavascript(source: 'window.scrollBy(0, $pixels);');
    final pos = await _controller!.evaluateJavascript(
      source: 'Math.round(window.scrollY) + "/" + Math.round(document.body.scrollHeight)',
    );
    return ToolResult.success('Scrolled ${direction == "up" ? "up" : "down"} ${amount}px. Position: $pos');
  }

  Future<ToolResult> _goBack() async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    if (await _controller!.canGoBack()) {
      await _controller!.goBack();
      await Future<void>.delayed(const Duration(seconds: 1));
      _activeTab!.currentUrl = (await _controller!.getUrl())?.toString();
      return ToolResult.success('Navigated back to: ${_activeTab!.currentUrl}');
    }
    return ToolResult.error('Cannot go back — no history.');
  }

  Future<ToolResult> _goForward() async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    if (await _controller!.canGoForward()) {
      await _controller!.goForward();
      await Future<void>.delayed(const Duration(seconds: 1));
      _activeTab!.currentUrl = (await _controller!.getUrl())?.toString();
      return ToolResult.success('Navigated forward to: ${_activeTab!.currentUrl}');
    }
    return ToolResult.error('Cannot go forward — no forward history.');
  }

  Future<ToolResult> _close() async {
    final tab = _activeTab;
    if (tab?.headless != null) {
      await tab!.headless!.dispose();
      tab.headless = null;
      tab.controller = null;
      tab.currentUrl = null;
      tab.lastError = null;
      return ToolResult.success('Browser session closed.');
    }
    return ToolResult.success('No browser session to close.');
  }

  // =========================================================================
  // GROUP A — COOKIES & STORAGE
  // =========================================================================

  Future<ToolResult> _getCookies(Map<String, dynamic> args) async {
    final urlStr = args['url'] as String?;
    if (urlStr == null || urlStr.isEmpty) {
      return ToolResult.error('url is required for get_cookies');
    }

    final cookieManager = CookieManager.instance();
    final cookies = await cookieManager.getCookies(url: WebUri(urlStr));

    if (cookies.isEmpty) return ToolResult.success('No cookies found for $urlStr');

    final lines = cookies.map((c) {
      final exp = c.expiresDate != null
          ? ' expires=${DateTime.fromMillisecondsSinceEpoch(c.expiresDate!).toIso8601String()}'
          : '';
      final flags = [
        if (c.isSecure == true) 'secure',
        if (c.isHttpOnly == true) 'httpOnly',
      ].join(', ');
      return '${c.name}=${c.value}; domain=${c.domain ?? ''}; path=${c.path ?? '/'}$exp${flags.isNotEmpty ? '; [$flags]' : ''}';
    }).toList();

    return ToolResult.success('Cookies for $urlStr (${cookies.length}):\n${lines.join('\n')}');
  }

  Future<ToolResult> _setCookie(Map<String, dynamic> args) async {
    final urlStr = args['url'] as String?;
    final cookieName = args['name'] as String?;
    final cookieValue = args['value'] as String?;
    if (urlStr == null) return ToolResult.error('url is required for set_cookie');
    if (cookieName == null) return ToolResult.error('name is required for set_cookie');
    if (cookieValue == null) return ToolResult.error('value is required for set_cookie');

    final ssrfError = validateFetchUrl(urlStr);
    if (ssrfError != null) return ToolResult.error(ssrfError);

    final expiresDays = args['expires_days'] as int? ?? 365;
    final expiresDate = DateTime.now().add(Duration(days: expiresDays)).millisecondsSinceEpoch;

    final cookieManager = CookieManager.instance();
    await cookieManager.setCookie(
      url: WebUri(urlStr),
      name: cookieName,
      value: cookieValue,
      domain: args['domain'] as String?,
      path: args['path'] as String? ?? '/',
      expiresDate: expiresDate,
      isSecure: args['is_secure'] as bool? ?? false,
      isHttpOnly: args['is_http_only'] as bool? ?? false,
    );

    return ToolResult.success('Cookie set: $cookieName for $urlStr');
  }

  Future<ToolResult> _deleteCookies(Map<String, dynamic> args) async {
    final urlStr = args['url'] as String?;
    if (urlStr == null) return ToolResult.error('url is required for delete_cookies');

    final cookieManager = CookieManager.instance();
    final cookieName = args['name'] as String?;

    if (cookieName != null) {
      await cookieManager.deleteCookie(url: WebUri(urlStr), name: cookieName);
      return ToolResult.success('Cookie "$cookieName" deleted for $urlStr');
    } else {
      await cookieManager.deleteCookies(url: WebUri(urlStr));
      return ToolResult.success('All cookies deleted for $urlStr');
    }
  }

  Future<ToolResult> _getStorage(Map<String, dynamic> args) async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    final storageType = args['storage_type'] as String? ?? 'local';
    final storage = storageType == 'session' ? 'sessionStorage' : 'localStorage';

    final result = await _controller!.evaluateJavascript(source: '''
      (function() {
        try {
          var obj = {};
          for (var i = 0; i < $storage.length; i++) {
            var k = $storage.key(i);
            obj[k] = $storage.getItem(k);
          }
          return JSON.stringify(obj);
        } catch(e) { return 'ERROR: ' + e; }
      })()
    ''');

    final output = result?.toString() ?? 'null';
    if (output.startsWith('ERROR:')) return ToolResult.error(output);
    return ToolResult.success('$storage contents: $output');
  }

  Future<ToolResult> _setStorage(Map<String, dynamic> args) async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    final storageKey = args['key'] as String?;
    final storageValue = args['value'] as String?;
    if (storageKey == null) return ToolResult.error('key is required for set_storage');
    if (storageValue == null) return ToolResult.error('value is required for set_storage');

    final storageType = args['storage_type'] as String? ?? 'local';
    final storage = storageType == 'session' ? 'sessionStorage' : 'localStorage';
    final escapedKey = storageKey.replaceAll("'", "\\'");
    final escapedValue = storageValue.replaceAll("'", "\\'");

    await _controller!.evaluateJavascript(
      source: "$storage.setItem('$escapedKey', '$escapedValue');",
    );

    return ToolResult.success('Set $storage["$storageKey"]');
  }

  Future<ToolResult> _saveProfile(Map<String, dynamic> args) async {
    final profileName = args['profile_name'] as String?;
    if (profileName == null || profileName.isEmpty) {
      return ToolResult.error('profile_name is required');
    }
    if (!RegExp(r'^[a-zA-Z0-9_-]{1,50}$').hasMatch(profileName)) {
      return ToolResult.error('profile_name must be alphanumeric with hyphens/underscores, max 50 chars');
    }

    // Collect cookies for all visited domains
    final cookieManager = CookieManager.instance();
    final domainData = <String, Map<String, dynamic>>{};

    for (final domain in _visitedDomains) {
      final url = 'https://$domain';
      final cookies = await cookieManager.getCookies(url: WebUri(url));
      if (cookies.isEmpty) continue;

      domainData[domain] = {
        'cookies': cookies.map((c) => {
          'name': c.name,
          'value': c.value,
          'domain': c.domain ?? '',
          'path': c.path ?? '/',
          if (c.expiresDate != null) 'expires': c.expiresDate,
          'secure': c.isSecure ?? false,
          'httpOnly': c.isHttpOnly ?? false,
        }).toList(),
        'localStorage': <String, String>{},
      };
    }

    // Collect localStorage for current page if browser is open
    if (_controller != null) {
      final storageResult = await _controller!.evaluateJavascript(source: '''
        (function() {
          var obj = {};
          for (var i = 0; i < localStorage.length; i++) {
            var k = localStorage.key(i);
            obj[k] = localStorage.getItem(k);
          }
          return JSON.stringify(obj);
        })()
      ''');
      if (storageResult != null && storageResult.toString() != 'null') {
        try {
          final currentUrl = _activeTab?.currentUrl ?? '';
          final host = Uri.parse(currentUrl).host;
          if (host.isNotEmpty) {
            final storage = jsonDecode(storageResult.toString()) as Map<String, dynamic>;
            if (domainData.containsKey(host)) {
              domainData[host]!['localStorage'] = storage.cast<String, String>();
            }
          }
        } catch (_) {}
      }
    }

    final profile = {
      'version': 1,
      'created': DateTime.now().toIso8601String(),
      'domains': domainData,
    };

    final profileJson = jsonEncode(profile);
    final maxBytes = _config.maxProfileSizeMb * 1024 * 1024;
    if (profileJson.length > maxBytes) {
      return ToolResult.error('Profile too large (${profileJson.length} bytes, max ${_config.maxProfileSizeMb}MB)');
    }

    final encrypted = await _ProfileCrypto.encrypt(profileJson);
    final dir = await _profilesDir();
    final file = File('${dir.path}/$profileName.enc');
    await file.writeAsString(encrypted);

    return ToolResult.success(
      'Profile "$profileName" saved. '
      'Domains: ${domainData.keys.join(', ')}. '
      'File: ${file.path}',
    );
  }

  Future<ToolResult> _loadProfile(Map<String, dynamic> args) async {
    final profileName = args['profile_name'] as String?;
    if (profileName == null || profileName.isEmpty) {
      // List available profiles if no name given
      final dir = await _profilesDir();
      final files = dir.listSync().whereType<File>().where((f) => f.path.endsWith('.enc')).toList();
      if (files.isEmpty) return ToolResult.success('No saved profiles found.');
      final names = files.map((f) => f.path.split('/').last.replaceAll('.enc', '')).join(', ');
      return ToolResult.success('Available profiles: $names');
    }
    if (!RegExp(r'^[a-zA-Z0-9_-]{1,50}$').hasMatch(profileName)) {
      return ToolResult.error('Invalid profile_name');
    }

    final dir = await _profilesDir();
    final file = File('${dir.path}/$profileName.enc');
    if (!file.existsSync()) {
      return ToolResult.error('Profile "$profileName" not found.');
    }

    final encrypted = await file.readAsString();
    final json = await _ProfileCrypto.decrypt(encrypted);
    final profile = jsonDecode(json) as Map<String, dynamic>;
    final domains = profile['domains'] as Map<String, dynamic>? ?? {};

    final cookieManager = CookieManager.instance();
    int cookiesRestored = 0;

    for (final entry in domains.entries) {
      final domain = entry.key;
      final data = entry.value as Map<String, dynamic>;
      final cookies = (data['cookies'] as List<dynamic>?) ?? [];
      final localStorage = (data['localStorage'] as Map<String, dynamic>?)?.cast<String, String>() ?? {};

      // Restore cookies
      for (final c in cookies) {
        final cookieMap = c as Map<String, dynamic>;
        try {
          await cookieManager.setCookie(
            url: WebUri('https://$domain'),
            name: cookieMap['name'] as String,
            value: cookieMap['value'] as String,
            domain: cookieMap['domain'] as String?,
            path: cookieMap['path'] as String? ?? '/',
            expiresDate: cookieMap['expires'] as int?,
            isSecure: cookieMap['secure'] as bool? ?? false,
            isHttpOnly: cookieMap['httpOnly'] as bool? ?? false,
          );
          cookiesRestored++;
        } catch (_) {}
      }

      // Queue localStorage for injection when we visit the domain
      if (localStorage.isNotEmpty) {
        _pendingLocalStorage[domain] = localStorage;
      }
    }

    return ToolResult.success(
      'Profile "$profileName" loaded. '
      'Cookies restored: $cookiesRestored. '
      'localStorage queued for ${_pendingLocalStorage.length} domain(s) — will be injected on next visit.',
    );
  }

  // =========================================================================
  // GROUP B — VISUAL
  // =========================================================================

  Future<ToolResult> _screenshot(Map<String, dynamic> args) async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
    final quality = (args['quality'] as int? ?? 80).clamp(1, 100);
    final fullPage = args['full_page'] as bool? ?? false;

    if (fullPage) {
      // Expand viewport temporarily to full page height
      await _controller!.evaluateJavascript(
        source: 'document.body.style.overflow = "visible";',
      );
    }

    final screenshot = await _controller!.takeScreenshot(
      screenshotConfiguration: ScreenshotConfiguration(
        compressFormat: CompressFormat.JPEG,
        quality: quality,
      ),
    );

    if (screenshot == null) return ToolResult.error('Screenshot failed — no data returned');

    final base64Data = base64.encode(screenshot);
    final url = (await _controller!.getUrl())?.toString() ?? '';
    final title = await _controller!.getTitle() ?? '';

    return ToolResult(
      content: 'Screenshot captured: ${screenshot.length} bytes, JPEG quality $quality. URL: $url. Title: $title.\nImage data: data:image/jpeg;base64,$base64Data',
      details: {
        'screenshot': {
          'mimeType': 'image/jpeg',
          'data': base64Data,
          'url': url,
          'title': title,
        },
      },
    );
  }

  Future<ToolResult> _screenshotElement(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    if (selector == null) return ToolResult.error('selector is required');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    // Scroll element into view and get bounding rect
    final escaped = selector.replaceAll("'", "\\'");
    final rectJson = await _controller!.evaluateJavascript(source: '''
      (function() {
        var el = document.querySelector('$escaped');
        if (!el) return null;
        el.scrollIntoView({block: 'center'});
        var r = el.getBoundingClientRect();
        return JSON.stringify({x: Math.round(r.left), y: Math.round(r.top), w: Math.round(r.width), h: Math.round(r.height)});
      })()
    ''');

    if (rectJson == null || rectJson.toString() == 'null') {
      return ToolResult.error('Element not found: $selector');
    }

    // Take full screenshot and note element bounds
    final quality = (args['quality'] as int? ?? 80).clamp(1, 100);
    final screenshot = await _controller!.takeScreenshot(
      screenshotConfiguration: ScreenshotConfiguration(
        compressFormat: CompressFormat.JPEG,
        quality: quality,
      ),
    );
    if (screenshot == null) return ToolResult.error('Screenshot failed');

    final base64Data = base64.encode(screenshot);
    return ToolResult(
      content: 'Element screenshot captured for "$selector". Element bounds: $rectJson. Image data: data:image/jpeg;base64,$base64Data',
      details: {
        'screenshot': {
          'mimeType': 'image/jpeg',
          'data': base64Data,
          'selector': selector,
          'bounds': rectJson.toString(),
        },
      },
    );
  }

  Future<ToolResult> _getPageInfo() async {
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final infoJson = await _controller!.evaluateJavascript(source: '''
      (function() {
        var forms = Array.from(document.querySelectorAll('form')).map(function(f) {
          return {id: f.id, action: f.action, method: f.method,
            fields: Array.from(f.elements).map(function(e) {
              return {name: e.name || e.id, type: e.type, tag: e.tagName.toLowerCase()};
            })};
        });
        var iframes = Array.from(document.querySelectorAll('iframe')).map(function(f) {
          return {id: f.id, name: f.name, src: f.src};
        });
        return JSON.stringify({
          url: window.location.href,
          title: document.title,
          cookieCount: document.cookie.split(';').filter(function(c){return c.trim()}).length,
          forms: forms,
          iframes: iframes,
          viewportWidth: window.innerWidth,
          viewportHeight: window.innerHeight,
          scrollHeight: document.body ? document.body.scrollHeight : 0,
          scrollY: Math.round(window.scrollY),
          links: document.querySelectorAll('a[href]').length,
          images: document.querySelectorAll('img').length,
        });
      })()
    ''');

    return ToolResult.success('Page info: $infoJson');
  }

  // =========================================================================
  // GROUP C — ADVANCED INTERACTION
  // =========================================================================

  Future<ToolResult> _waitFor(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    if (selector == null) return ToolResult.error('selector is required for wait_for');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final timeoutMs = args['timeout_ms'] as int? ?? 10000;
    final checkVisible = args['visible'] as bool? ?? false;
    final escaped = selector.replaceAll("'", "\\'");
    final visibleCheck = checkVisible
        ? "var r = el.getBoundingClientRect(); el.offsetParent !== null && r.width > 0 && r.height > 0"
        : "true";

    final deadline = DateTime.now().add(Duration(milliseconds: timeoutMs));

    while (DateTime.now().isBefore(deadline)) {
      final found = await _controller!.evaluateJavascript(source: '''
        (function() {
          var el = document.querySelector('$escaped');
          if (!el) return false;
          return ($visibleCheck);
        })()
      ''');
      if (found?.toString() == 'true') {
        return ToolResult.success('Element found: $selector');
      }
      await Future<void>.delayed(const Duration(milliseconds: 200));
    }

    return ToolResult.error('Timeout: element "$selector" not found within ${timeoutMs}ms');
  }

  Future<ToolResult> _hover(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    if (selector == null) return ToolResult.error('selector is required for hover');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final escaped = selector.replaceAll("'", "\\'");
    final result = await _controller!.evaluateJavascript(source: '''
      (function() {
        var el = document.querySelector('$escaped');
        if (!el) return 'ERROR: Element not found: $escaped';
        el.dispatchEvent(new MouseEvent('mouseover', {bubbles: true, cancelable: true}));
        el.dispatchEvent(new MouseEvent('mouseenter', {bubbles: false, cancelable: false}));
        el.dispatchEvent(new MouseEvent('mousemove', {bubbles: true, cancelable: true}));
        return 'Hovered: ' + (el.tagName || '') + ' ' + (el.textContent || '').substring(0, 80).trim();
      })()
    ''');
    final output = result?.toString() ?? 'null';
    if (output.startsWith('ERROR:')) return ToolResult.error(output);
    return ToolResult.success(output);
  }

  Future<ToolResult> _keyboard(Map<String, dynamic> args) async {
    final key = args['keyboard_key'] as String?;
    if (key == null) return ToolResult.error('keyboard_key is required for keyboard action');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final modifiers = (args['modifiers'] as List<dynamic>?)?.cast<String>() ?? [];
    final ctrlKey = modifiers.contains('ctrl');
    final shiftKey = modifiers.contains('shift');
    final altKey = modifiers.contains('alt');
    final metaKey = modifiers.contains('meta');

    // Key to keyCode mapping
    final keyCodes = {
      'Enter': 13, 'Tab': 9, 'Escape': 27, 'Space': 32, 'Backspace': 8, 'Delete': 46,
      'ArrowLeft': 37, 'ArrowUp': 38, 'ArrowRight': 39, 'ArrowDown': 40,
      'Home': 36, 'End': 35, 'PageUp': 33, 'PageDown': 34,
      'F1': 112, 'F2': 113, 'F3': 114, 'F4': 115, 'F5': 116,
    };
    final keyCode = keyCodes[key] ?? key.codeUnitAt(0);

    await _controller!.evaluateJavascript(source: '''
      (function() {
        var opts = {key: '$key', code: 'Key${key.length == 1 ? key.toUpperCase() : key}', keyCode: $keyCode, which: $keyCode, bubbles: true, cancelable: true, ctrlKey: $ctrlKey, shiftKey: $shiftKey, altKey: $altKey, metaKey: $metaKey};
        var target = document.activeElement || document.body;
        target.dispatchEvent(new KeyboardEvent('keydown', opts));
        target.dispatchEvent(new KeyboardEvent('keypress', opts));
        target.dispatchEvent(new KeyboardEvent('keyup', opts));
      })()
    ''');

    return ToolResult.success('Key dispatched: $key${modifiers.isNotEmpty ? " (${modifiers.join('+')})": ""}');
  }

  Future<ToolResult> _selectOption(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    if (selector == null) return ToolResult.error('selector is required for select_option');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final optionValue = args['option_value'] as String?;
    final optionLabel = args['option_label'] as String?;
    if (optionValue == null && optionLabel == null) {
      return ToolResult.error('option_value or option_label required');
    }

    final escaped = selector.replaceAll("'", "\\'");
    final matchExpr = optionValue != null
        ? "el.value = '${optionValue.replaceAll("'", "\\'")}'"
        : '''
            Array.from(el.options).forEach(function(o) {
              if (o.text.trim() === '${optionLabel!.replaceAll("'", "\\'")}') { el.value = o.value; }
            })''';

    final result = await _controller!.evaluateJavascript(source: '''
      (function() {
        var el = document.querySelector('$escaped');
        if (!el || el.tagName.toLowerCase() !== 'select') return 'ERROR: select element not found: $escaped';
        $matchExpr;
        el.dispatchEvent(new Event('change', {bubbles: true}));
        return 'Selected option, current value: ' + el.value;
      })()
    ''');
    final output = result?.toString() ?? 'null';
    if (output.startsWith('ERROR:')) return ToolResult.error(output);
    return ToolResult.success(output);
  }

  Future<ToolResult> _fillForm(Map<String, dynamic> args) async {
    final fields = args['fields'] as Map<String, dynamic>?;
    if (fields == null || fields.isEmpty) return ToolResult.error('fields map required for fill_form');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final results = <String>[];
    for (final entry in fields.entries) {
      final sel = entry.key.replaceAll("'", "\\'");
      final val = entry.value.toString().replaceAll('\\', '\\\\').replaceAll("'", "\\'");
      final r = await _controller!.evaluateJavascript(source: '''
        (function() {
          var el = document.querySelector('$sel');
          if (!el) return 'NOT FOUND: $sel';
          el.focus();
          var niv = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value');
          if (niv) { niv.set.call(el, '$val'); } else { el.value = '$val'; }
          el.dispatchEvent(new Event('input', {bubbles: true}));
          el.dispatchEvent(new Event('change', {bubbles: true}));
          return 'OK: $sel';
        })()
      ''');
      results.add(r?.toString() ?? 'null');
    }

    return ToolResult.success('fill_form results:\n${results.join('\n')}');
  }

  Future<ToolResult> _uploadFile(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    final filePath = args['file_path'] as String?;
    if (selector == null) return ToolResult.error('selector is required for upload_file');
    if (filePath == null) return ToolResult.error('file_path is required for upload_file');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final file = File(filePath);
    if (!file.existsSync()) return ToolResult.error('File not found: $filePath');

    final bytes = await file.readAsBytes();
    if (bytes.length > 10 * 1024 * 1024) {
      return ToolResult.error('File too large (max 10MB for upload)');
    }

    final base64Data = base64.encode(bytes);
    final mimeType = _guessMimeType(filePath);
    final fileName = filePath.split(Platform.pathSeparator).last;
    final escaped = selector.replaceAll("'", "\\'");

    final result = await _controller!.evaluateJavascript(source: '''
      (function() {
        var el = document.querySelector('$escaped');
        if (!el || el.tagName.toLowerCase() !== 'input' || el.type !== 'file') return 'ERROR: file input not found: $escaped';
        var b64 = '$base64Data';
        var bytes = Uint8Array.from(atob(b64), function(c) { return c.charCodeAt(0); });
        var blob = new Blob([bytes], {type: '$mimeType'});
        var file = new File([blob], '$fileName', {type: '$mimeType'});
        var dt = new DataTransfer();
        dt.items.add(file);
        el.files = dt.files;
        el.dispatchEvent(new Event('change', {bubbles: true}));
        return 'File set on input: $fileName ($mimeType, ' + bytes.length + ' bytes)';
      })()
    ''');

    final output = result?.toString() ?? 'null';
    if (output.startsWith('ERROR:')) return ToolResult.error(output);
    return ToolResult.success(output);
  }

  Future<ToolResult> _queryElements(Map<String, dynamic> args) async {
    final selector = args['selector'] as String?;
    if (selector == null) return ToolResult.error('selector is required for query_elements');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final extraAttrs = (args['attributes'] as List<dynamic>?)?.cast<String>() ?? [];
    final maxResults = args['max_results'] as int? ?? 50;
    final escaped = selector.replaceAll("'", "\\'");
    final attrsJson = jsonEncode(extraAttrs);

    final result = await _controller!.evaluateJavascript(source: '''
      (function() {
        var els = Array.from(document.querySelectorAll('$escaped')).slice(0, $maxResults);
        var extraAttrs = $attrsJson;
        return JSON.stringify(els.map(function(el, i) {
          var r = el.getBoundingClientRect();
          var obj = {
            index: i,
            tag: el.tagName.toLowerCase(),
            text: (el.innerText || el.textContent || '').substring(0, 200).trim(),
            href: el.href || el.getAttribute('href') || null,
            src: el.src || el.getAttribute('src') || null,
            classList: Array.from(el.classList).join(' '),
            id: el.id || null,
            rect: {x: Math.round(r.left), y: Math.round(r.top), w: Math.round(r.width), h: Math.round(r.height)},
          };
          extraAttrs.forEach(function(a) { obj[a] = el.getAttribute(a); });
          return obj;
        }));
      })()
    ''');

    if (result == null || result.toString() == 'null') {
      return ToolResult.success('No elements found for: $selector');
    }

    return ToolResult.success('Elements matching "$selector": ${result.toString()}');
  }

  // =========================================================================
  // GROUP D — NAVIGATION & CONTEXT
  // =========================================================================

  Future<ToolResult> _switchIframe(Map<String, dynamic> args) async {
    final sel = args['selector'] as String?;
    if (sel == null) {
      _activeIframeSelector = null;
      return ToolResult.success('Switched back to main frame.');
    }
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final escaped = sel.replaceAll("'", "\\'");
    final found = await _controller!.evaluateJavascript(source: '''
      (function() {
        var el = document.querySelector('$escaped');
        return el && el.tagName === 'IFRAME' ? 'found' : 'notfound';
      })()
    ''');

    if (found?.toString() != 'found') {
      return ToolResult.error('iframe not found: $sel');
    }

    _activeIframeSelector = sel;
    return ToolResult.success('Switched to iframe context: $sel. Subsequent js/click/type actions will run inside this iframe.');
  }

  Future<ToolResult> _newTab(Map<String, dynamic> args) async {
    final maxTabs = _config.maxTabs;
    if (_tabs.length >= maxTabs) {
      return ToolResult.error('Max tabs ($maxTabs) reached. Close a tab first.');
    }

    _tabCounter++;
    final tabId = 'tab_$_tabCounter';
    final tab = _BrowserTab(tabId);
    _tabs[tabId] = tab;
    _activeTabId = tabId;

    final urlStr = args['url'] as String?;
    if (urlStr != null && urlStr.isNotEmpty) {
      return _navigate(args);
    }

    await _ensureBrowser();
    return ToolResult.success('New tab opened: $tabId. Tab is now active.');
  }

  Future<ToolResult> _switchTab(Map<String, dynamic> args) async {
    final tabId = args['tab_id'] as String?;
    if (tabId == null) return ToolResult.error('tab_id is required for switch_tab');
    if (!_tabs.containsKey(tabId)) {
      final available = _tabs.keys.join(', ');
      return ToolResult.error('Tab "$tabId" not found. Available: $available');
    }
    _activeTabId = tabId;
    final url = _activeTab?.currentUrl ?? '(no page loaded)';
    return ToolResult.success('Switched to tab: $tabId. Current URL: $url');
  }

  Future<ToolResult> _closeTab(Map<String, dynamic> args) async {
    final tabId = args['tab_id'] as String?;
    if (tabId == null) return ToolResult.error('tab_id is required for close_tab');
    if (tabId == 'default') return ToolResult.error('Cannot close the default tab.');

    final tab = _tabs[tabId];
    if (tab == null) return ToolResult.error('Tab "$tabId" not found.');

    await tab.headless?.dispose();
    _tabs.remove(tabId);

    if (_activeTabId == tabId) {
      _activeTabId = _tabs.keys.firstOrNull ?? 'default';
    }

    return ToolResult.success('Tab "$tabId" closed. Active tab: $_activeTabId');
  }

  Future<ToolResult> _setViewport(Map<String, dynamic> args) async {
    final width = args['width'] as int?;
    final height = args['height'] as int?;
    if (width == null || height == null) {
      return ToolResult.error('width and height required for set_viewport');
    }

    _viewportSize = Size(width.toDouble(), height.toDouble());

    final tab = _activeTab;
    if (tab?.headless != null) {
      await tab!.headless!.setSize(Size(width.toDouble(), height.toDouble()));
    }

    return ToolResult.success('Viewport set to ${width}x$height. Will apply on next browser session if not currently active.');
  }

  // =========================================================================
  // GROUP E — STEALTH & ANTI-DETECTION
  // =========================================================================

  Future<ToolResult> _injectScript(Map<String, dynamic> args) async {
    final script = args['script'] as String?;
    if (script == null) return ToolResult.error('script is required for inject_script');
    final onLoad = args['on_load'] as bool? ?? false;

    if (onLoad) {
      // Register as persistent user script (fires before every page load)
      final userScript = UserScript(
        source: script,
        injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
      );
      _persistentUserScripts.add(userScript);

      // Also add to current session if browser is open
      if (_controller != null) {
        await _controller!.addUserScript(userScript: userScript);
      }

      return ToolResult.success('Script registered for on_load injection (${_persistentUserScripts.length} scripts active).');
    } else {
      // One-time execution
      if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');
      final result = await _controller!.evaluateJavascript(source: script);
      return ToolResult.success('Script executed. Result: ${result?.toString() ?? "null"}');
    }
  }

  Future<ToolResult> _setUserAgent(Map<String, dynamic> args) async {
    final preset = args['preset'] as String?;
    final customUa = args['user_agent'] as String?;

    if (preset != null) {
      _userAgent = _kUserAgents[preset] ?? _userAgent;
    } else if (customUa != null) {
      _userAgent = customUa;
    } else {
      return ToolResult.error('user_agent or preset required for set_user_agent');
    }

    // Recreate the browser with new user agent, preserving current URL
    final currentUrl = _activeTab?.currentUrl;
    await _close();
    await _ensureBrowser();

    if (currentUrl != null) {
      await _navigate({'url': currentUrl, 'wait_ms': 1000});
    }

    return ToolResult.success('User-agent set to: $_userAgent');
  }

  Future<ToolResult> _setGeolocation(Map<String, dynamic> args) async {
    final lat = args['latitude'] as num?;
    final lng = args['longitude'] as num?;
    if (lat == null || lng == null) return ToolResult.error('latitude and longitude required');
    if (_controller == null) return ToolResult.error('No browser session. Use navigate first.');

    final accuracy = args['accuracy'] as num? ?? 50;

    await _controller!.evaluateJavascript(source: '''
      (function() {
        var pos = {coords: {latitude: $lat, longitude: $lng, accuracy: $accuracy, altitude: null, altitudeAccuracy: null, heading: null, speed: null}, timestamp: Date.now()};
        navigator.geolocation.getCurrentPosition = function(s) { s(pos); };
        navigator.geolocation.watchPosition = function(s) { s(pos); return 0; };
      })()
    ''');

    return ToolResult.success('Geolocation spoofed: lat=$lat, lng=$lng, accuracy=$accuracy');
  }

  // =========================================================================
  // GROUP F — NETWORK
  // =========================================================================

  Future<ToolResult> _handleInterceptRequests(Map<String, dynamic> args) async {
    final enabled = args['enabled'] as bool?;
    if (enabled == null) return ToolResult.error('enabled is required for intercept_requests');

    if (!enabled) {
      // Return captured log and clear
      _interceptingRequests = false;
      if (_networkLog.isEmpty) {
        return ToolResult.success('Network log is empty.');
      }
      final log = jsonEncode(_networkLog);
      final count = _networkLog.length;
      _networkLog.clear();
      return ToolResult.success('Network log ($count entries):\n$log');
    }

    _interceptingRequests = true;
    _interceptUrlPattern = args['url_pattern'] as String?;
    _networkLog.clear();

    return ToolResult.success(
      'Request interception enabled${_interceptUrlPattern != null ? " (pattern: $_interceptUrlPattern)" : ""}. '
      'Navigate to pages then call intercept_requests with enabled=false to retrieve the log.',
    );
  }

  Future<ToolResult> _blockResources(Map<String, dynamic> args) async {
    final types = (args['types'] as List<dynamic>?)?.cast<String>() ?? [];
    if (types.isEmpty) {
      _blockedResourceTypes.clear();
      return ToolResult.success('Resource blocking disabled — all types allowed.');
    }

    _blockedResourceTypes
      ..clear()
      ..addAll(types);

    // Recreate browser to apply content blockers
    final currentUrl = _activeTab?.currentUrl;
    await _close();
    await _ensureBrowser();

    if (currentUrl != null) {
      await _navigate({'url': currentUrl, 'wait_ms': 1000});
    }

    return ToolResult.success('Blocking resource types: ${types.join(", ")}');
  }

  // =========================================================================
  // GROUP G — CAPTCHA / USER ACTION
  // =========================================================================

  Future<ToolResult> _requestUserAction(Map<String, dynamic> args) async {
    final message = args['message'] as String? ?? 'Complete the action in the browser, then tap Done.';

    // Use local variable for null promotion (Dart doesn't promote non-local fields)
    final overlayCallback = _onRequestUserAction;
    if (overlayCallback == null) {
      return ToolResult.error(
        'Browser overlay not available in this context. '
        'You can try solving the CAPTCHA manually by navigating to: ${_activeTab?.currentUrl ?? "current page"}',
      );
    }

    final currentUrl = _activeTab?.currentUrl;
    if (currentUrl == null) {
      return ToolResult.error('No active page. Navigate first.');
    }

    // Show visible browser overlay — waits until user dismisses it
    await overlayCallback(currentUrl, message);

    // Reload headless page to pick up session changes (CAPTCHA solved, login completed, etc.)
    if (_controller != null) {
      final tab = _activeTab!;
      tab.pageLoadCompleter = Completer<void>();
      await _controller!.reload();
      await tab.pageLoadCompleter!.future
          .timeout(const Duration(seconds: 30), onTimeout: () {});
      await Future<void>.delayed(const Duration(milliseconds: 1500));
    }

    final finalUrl = _controller != null
        ? (await _controller!.getUrl())?.toString() ?? currentUrl
        : currentUrl;

    // Take screenshot to show current state
    final screenshotResult = await _screenshot({'quality': 70});

    return ToolResult.success(
      'User action completed. Page reloaded. Current URL: $finalUrl\n\n'
      '${screenshotResult.content}',
      details: screenshotResult.details,
    );
  }

  // =========================================================================
  // BROWSER LIFECYCLE
  // =========================================================================

  Future<void> _ensureBrowser() async {
    // Initialize default tab if needed
    if (!_tabs.containsKey(_activeTabId)) {
      _tabs[_activeTabId] = _BrowserTab(_activeTabId);
    }

    final tab = _activeTab!;
    if (tab.headless != null && tab.controller != null) return;

    // Dispose stale instance
    if (tab.headless != null) {
      await tab.headless!.dispose();
      tab.headless = null;
      tab.controller = null;
    }

    final controllerCompleter = Completer<void>();

    // Build user scripts: default anti-detection + persistent scripts
    final userScripts = <UserScript>[];
    if (_config.antiDetectionEnabled) {
      userScripts.add(UserScript(
        source: _kAntiDetectionScript,
        injectionTime: UserScriptInjectionTime.AT_DOCUMENT_START,
      ));
    }
    userScripts.addAll(_persistentUserScripts);

    // Build content blockers for blocked resource types
    final contentBlockers = _blockedResourceTypes.map((type) {
      final resourceType = switch (type) {
        'image'      => ContentBlockerTriggerResourceType.IMAGE,
        'stylesheet' => ContentBlockerTriggerResourceType.STYLE_SHEET,
        'font'       => ContentBlockerTriggerResourceType.FONT,
        'script'     => ContentBlockerTriggerResourceType.SCRIPT,
        'media'      => ContentBlockerTriggerResourceType.MEDIA,
        _            => ContentBlockerTriggerResourceType.IMAGE,
      };
      return ContentBlocker(
        trigger: ContentBlockerTrigger(
          urlFilter: '.*',
          resourceType: [resourceType],
        ),
        action: ContentBlockerAction(type: ContentBlockerActionType.BLOCK),
      );
    }).toList();

    tab.headless = HeadlessInAppWebView(
      initialSize: _viewportSize,
      initialUserScripts: UnmodifiableListView(userScripts),
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true,
        domStorageEnabled: true,
        databaseEnabled: true,
        userAgent: _userAgent,
        mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
        mediaPlaybackRequiresUserGesture: true,
        useOnLoadResource: true,
        contentBlockers: contentBlockers,
        allowFileAccessFromFileURLs: false,
        allowUniversalAccessFromFileURLs: false,
      ),
      onWebViewCreated: (controller) {
        tab.controller = controller;
        if (!controllerCompleter.isCompleted) controllerCompleter.complete();
      },
      onLoadStop: (controller, url) {
        if (tab.pageLoadCompleter != null && !tab.pageLoadCompleter!.isCompleted) {
          tab.pageLoadCompleter!.complete();
        }
      },
      onReceivedError: (controller, request, error) {
        tab.lastError = '${error.type}: ${error.description}';
        if (tab.pageLoadCompleter != null && !tab.pageLoadCompleter!.isCompleted) {
          tab.pageLoadCompleter!.complete();
        }
      },
      onLoadResource: !_interceptingRequests
          ? null
          : (controller, loadedResource) {
              final url = loadedResource.url?.toString() ?? '';
              if (_interceptUrlPattern != null) {
                try {
                  if (!RegExp(_interceptUrlPattern!).hasMatch(url)) return;
                } catch (_) {}
              }
              _networkLog.add({
                'url': url,
                'initiatorType': loadedResource.initiatorType,
                'duration': loadedResource.duration,
              });
              if (_networkLog.length > _config.networkLogMaxEntries) {
                _networkLog.removeAt(0);
              }
            },
      onConsoleMessage: (controller, message) {
        // Suppress console output
      },
    );

    await tab.headless!.run();
    await controllerCompleter.future.timeout(
      const Duration(seconds: 10),
      onTimeout: () {},
    );
  }

  Future<String?> _detectCaptcha() async {
    if (_controller == null) return null;
    try {
      final result = await _controller!.evaluateJavascript(source: _kCaptchaDetectScript);
      final type = result?.toString();
      if (type == null || type == 'null') return null;
      return type;
    } catch (_) {
      return null;
    }
  }

  Future<void> _injectPendingLocalStorage(String url) async {
    if (_pendingLocalStorage.isEmpty || _controller == null) return;
    try {
      final host = Uri.parse(url).host;
      final domainKey = _pendingLocalStorage.keys.firstWhere(
        (k) => host.contains(k) || k.contains(host),
        orElse: () => '',
      );
      if (domainKey.isEmpty) return;

      final items = _pendingLocalStorage[domainKey]!;
      for (final entry in items.entries) {
        final k = entry.key.replaceAll("'", "\\'");
        final v = entry.value.replaceAll("'", "\\'");
        await _controller!.evaluateJavascript(
          source: "localStorage.setItem('$k', '$v');",
        );
      }
      _pendingLocalStorage.remove(domainKey);
    } catch (_) {}
  }

  Future<Directory> _profilesDir() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dir = Directory('${appDir.path}/flutterclaw/browser_profiles');
    if (!dir.existsSync()) dir.createSync(recursive: true);
    return dir;
  }

  String _guessMimeType(String path) {
    final ext = path.split('.').last.toLowerCase();
    return switch (ext) {
      'jpg' || 'jpeg' => 'image/jpeg',
      'png'           => 'image/png',
      'gif'           => 'image/gif',
      'webp'          => 'image/webp',
      'pdf'           => 'application/pdf',
      'txt'           => 'text/plain',
      'csv'           => 'text/csv',
      'json'          => 'application/json',
      'zip'           => 'application/zip',
      _               => 'application/octet-stream',
    };
  }

  /// Dispose all browser sessions.
  Future<void> dispose() async {
    for (final tab in _tabs.values) {
      await tab.headless?.dispose();
    }
    _tabs.clear();
  }
}
