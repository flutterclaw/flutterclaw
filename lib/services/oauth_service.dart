/// OAuth 2.0 service for FlutterClaw.
///
/// Implements Authorization Code flow with PKCE support.
/// Tokens are stored securely via [SecureKeyStore].
/// Uses flutter_inappwebview for the authorization redirect capture.
library;

import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'package:flutterclaw/app.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'secure_key_store.dart';

final _log = Logger('flutterclaw.oauth');

// ---------------------------------------------------------------------------
// Persisted OAuth connection
// ---------------------------------------------------------------------------

/// A configured OAuth provider (e.g. Google, Microsoft, Salesforce).
class OAuthConnection {
  final String id;
  final String label;
  final String authorizeUrl;
  final String tokenUrl;
  final String clientId;
  final String? clientSecret;
  final String redirectUri;
  final String scopes;

  const OAuthConnection({
    required this.id,
    required this.label,
    required this.authorizeUrl,
    required this.tokenUrl,
    required this.clientId,
    this.clientSecret,
    this.redirectUri = 'flutterclaw://oauth/callback',
    this.scopes = '',
  });

  factory OAuthConnection.fromJson(Map<String, dynamic> json) =>
      OAuthConnection(
        id: json['id'] as String,
        label: json['label'] as String? ?? '',
        authorizeUrl: json['authorize_url'] as String,
        tokenUrl: json['token_url'] as String,
        clientId: json['client_id'] as String,
        clientSecret: json['client_secret'] as String?,
        redirectUri:
            json['redirect_uri'] as String? ?? 'flutterclaw://oauth/callback',
        scopes: json['scopes'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'authorize_url': authorizeUrl,
        'token_url': tokenUrl,
        'client_id': clientId,
        if (clientSecret != null) 'client_secret': clientSecret,
        'redirect_uri': redirectUri,
        'scopes': scopes,
      };
}

// ---------------------------------------------------------------------------
// Token storage
// ---------------------------------------------------------------------------

class _TokenStore {
  static String _key(String connId) => 'oauth_token_$connId';

  static Future<Map<String, dynamic>?> load(String connId) async {
    final raw = await SecureKeyStore.getSecret(_key(connId));
    if (raw == null || raw.isEmpty) return null;
    try {
      return jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  static Future<void> save(String connId, Map<String, dynamic> token) =>
      SecureKeyStore.saveSecret(_key(connId), jsonEncode(token));

  static Future<void> delete(String connId) =>
      SecureKeyStore.deleteSecret(_key(connId));
}

// ---------------------------------------------------------------------------
// OAuth Service
// ---------------------------------------------------------------------------

class OAuthService {
  /// Start the Authorization Code flow with PKCE.
  ///
  /// Opens an in-app browser for the user to authenticate.
  /// Returns the token response map on success.
  Future<Map<String, dynamic>> authorize(OAuthConnection conn) async {
    final nav = FlutterClawApp.navigatorKey.currentState;
    if (nav == null) {
      throw Exception('No active navigator — cannot open OAuth browser.');
    }

    // Generate PKCE code verifier + challenge.
    final verifier = _generateCodeVerifier();
    final challenge = _generateCodeChallenge(verifier);

    final state = _randomString(32);

    final authUri = Uri.parse(conn.authorizeUrl).replace(
      queryParameters: {
        'response_type': 'code',
        'client_id': conn.clientId,
        'redirect_uri': conn.redirectUri,
        'scope': conn.scopes,
        'state': state,
        'code_challenge': challenge,
        'code_challenge_method': 'S256',
      },
    );

    // Push in-app browser and wait for redirect.
    final code = await nav.push<String>(
      MaterialPageRoute(
        builder: (_) => _OAuthBrowserScreen(
          url: authUri.toString(),
          redirectUri: conn.redirectUri,
          expectedState: state,
        ),
        fullscreenDialog: true,
      ),
    );

    if (code == null || code.isEmpty) {
      throw Exception('OAuth authorization cancelled or failed.');
    }

    // Exchange code for token.
    final tokenResp = await _exchangeCode(conn, code, verifier);
    await _TokenStore.save(conn.id, tokenResp);
    _log.info('OAuth token obtained for "${conn.label}"');
    return tokenResp;
  }

  /// Get the stored access token, refreshing if expired.
  Future<String?> getAccessToken(OAuthConnection conn) async {
    final token = await _TokenStore.load(conn.id);
    if (token == null) return null;

    final expiresAt = token['expires_at'] as int?;
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    // If expired and we have a refresh token, refresh.
    if (expiresAt != null && now >= expiresAt - 60) {
      final refreshToken = token['refresh_token'] as String?;
      if (refreshToken != null) {
        try {
          final refreshed = await _refreshToken(conn, refreshToken);
          await _TokenStore.save(conn.id, refreshed);
          return refreshed['access_token'] as String?;
        } catch (e) {
          _log.warning('Token refresh failed for "${conn.label}": $e');
          return null;
        }
      }
      return null; // Expired, no refresh token.
    }

    return token['access_token'] as String?;
  }

  /// Get full stored token data (for inspection).
  Future<Map<String, dynamic>?> getTokenData(String connId) =>
      _TokenStore.load(connId);

  /// Delete stored tokens for a connection.
  Future<void> revokeToken(String connId) => _TokenStore.delete(connId);

  // -------------------------------------------------------------------------
  // Private helpers
  // -------------------------------------------------------------------------

  Future<Map<String, dynamic>> _exchangeCode(
    OAuthConnection conn,
    String code,
    String codeVerifier,
  ) async {
    final body = <String, String>{
      'grant_type': 'authorization_code',
      'code': code,
      'redirect_uri': conn.redirectUri,
      'client_id': conn.clientId,
      'code_verifier': codeVerifier,
    };
    if (conn.clientSecret != null) {
      body['client_secret'] = conn.clientSecret!;
    }

    final resp = await http.post(
      Uri.parse(conn.tokenUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );

    if (resp.statusCode != 200) {
      throw Exception('Token exchange failed (${resp.statusCode}): ${resp.body}');
    }

    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    // Normalize expires_at.
    if (data.containsKey('expires_in') && !data.containsKey('expires_at')) {
      final expiresIn = data['expires_in'] as int;
      data['expires_at'] =
          DateTime.now().millisecondsSinceEpoch ~/ 1000 + expiresIn;
    }
    return data;
  }

  Future<Map<String, dynamic>> _refreshToken(
    OAuthConnection conn,
    String refreshToken,
  ) async {
    final body = <String, String>{
      'grant_type': 'refresh_token',
      'refresh_token': refreshToken,
      'client_id': conn.clientId,
    };
    if (conn.clientSecret != null) {
      body['client_secret'] = conn.clientSecret!;
    }

    final resp = await http.post(
      Uri.parse(conn.tokenUrl),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
    );

    if (resp.statusCode != 200) {
      throw Exception('Token refresh failed (${resp.statusCode}): ${resp.body}');
    }

    final data = jsonDecode(resp.body) as Map<String, dynamic>;
    // Preserve the refresh token if not returned.
    if (!data.containsKey('refresh_token')) {
      data['refresh_token'] = refreshToken;
    }
    if (data.containsKey('expires_in') && !data.containsKey('expires_at')) {
      final expiresIn = data['expires_in'] as int;
      data['expires_at'] =
          DateTime.now().millisecondsSinceEpoch ~/ 1000 + expiresIn;
    }
    return data;
  }

  String _generateCodeVerifier() => _randomString(64);

  String _generateCodeChallenge(String verifier) {
    final bytes = utf8.encode(verifier);
    final digest = sha256.convert(bytes);
    return base64UrlEncode(digest.bytes).replaceAll('=', '');
  }

  static final _rng = Random.secure();
  static const _chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

  String _randomString(int length) =>
      List.generate(length, (_) => _chars[_rng.nextInt(_chars.length)]).join();
}

// ---------------------------------------------------------------------------
// In-app OAuth browser screen
// ---------------------------------------------------------------------------

class _OAuthBrowserScreen extends StatefulWidget {
  final String url;
  final String redirectUri;
  final String expectedState;

  const _OAuthBrowserScreen({
    required this.url,
    required this.redirectUri,
    required this.expectedState,
  });

  @override
  State<_OAuthBrowserScreen> createState() => _OAuthBrowserScreenState();
}

class _OAuthBrowserScreenState extends State<_OAuthBrowserScreen> {
  bool _completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.oauthSignInTitle),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(null),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        initialSettings: InAppWebViewSettings(
          useShouldOverrideUrlLoading: true,
          javaScriptEnabled: true,
        ),
        shouldOverrideUrlLoading: (controller, action) async {
          final url = action.request.url?.toString() ?? '';
          if (url.startsWith(widget.redirectUri) && !_completed) {
            _completed = true;
            final uri = Uri.parse(url);
            final code = uri.queryParameters['code'];
            final state = uri.queryParameters['state'];
            final error = uri.queryParameters['error'];

            if (error != null) {
              if (mounted) Navigator.of(context).pop(null);
              return NavigationActionPolicy.CANCEL;
            }

            if (state != widget.expectedState) {
              if (mounted) Navigator.of(context).pop(null);
              return NavigationActionPolicy.CANCEL;
            }

            if (mounted) Navigator.of(context).pop(code);
            return NavigationActionPolicy.CANCEL;
          }
          return NavigationActionPolicy.ALLOW;
        },
      ),
    );
  }
}
