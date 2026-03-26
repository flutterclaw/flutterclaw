import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/model_discovery_service.dart';

class AuthPage extends StatefulWidget {
  final String providerId;
  final String? initialApiKey;
  final String? initialModelId;
  final String? initialApiBase;
  final ValueChanged<AuthResult> onChanged;
  /// Called with `true` when the key validates successfully, `false` on failure.
  final ValueChanged<bool>? onValidated;

  const AuthPage({
    super.key,
    required this.providerId,
    this.initialApiKey,
    this.initialModelId,
    this.initialApiBase,
    required this.onChanged,
    this.onValidated,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class AuthResult {
  final String apiKey;
  final String modelId;
  final String modelDisplayName;
  final String? apiBase;
  final bool isFree;
  final String? awsSecretKey;
  final String? awsRegion;
  final String? awsAuthMode;

  const AuthResult({
    required this.apiKey,
    required this.modelId,
    required this.modelDisplayName,
    this.apiBase,
    this.isFree = false,
    this.awsSecretKey,
    this.awsRegion,
    this.awsAuthMode,
  });
}

class _AuthPageState extends State<AuthPage> {
  late final TextEditingController _apiKeyController;
  late final TextEditingController _apiBaseController;
  late final TextEditingController _customModelController;
  late final TextEditingController _awsSecretKeyController;
  late final TextEditingController _awsRegionController;
  String _awsAuthMode = 'bearer';
  String? _selectedModelId;
  bool _useCustomModel = false;
  bool _isValidating = false;
  _ValidationResult? _validationResult;
  Timer? _debounce;
  List<DiscoveredModel> _discoveredModels = [];
  bool _isDiscovering = false;

  bool get _isBedrock => widget.providerId == 'bedrock';

  @override
  void initState() {
    super.initState();
    _apiKeyController = TextEditingController(text: widget.initialApiKey ?? '');
    _customModelController = TextEditingController();
    _awsSecretKeyController = TextEditingController();
    _awsRegionController = TextEditingController(text: 'us-east-1');
    final provider = ModelCatalog.getProvider(widget.providerId);
    _apiBaseController = TextEditingController(
      text: widget.initialApiBase ?? provider?.apiBase ?? '',
    );

    final models = ModelCatalog.availableModelsForProvider(widget.providerId);
    if (widget.initialModelId != null) {
      _selectedModelId = widget.initialModelId;
    } else if (models.isNotEmpty) {
      final freeModel = models.where((m) => m.isFree).firstOrNull;
      _selectedModelId = freeModel?.id ?? models.first.id;
    }

    _apiKeyController.addListener(_onApiKeyChanged);
  }

  void _onApiKeyChanged() {
    _emitChange();
    // Clear previous result and auto-validate after 800ms of no typing.
    if (_validationResult != null) setState(() => _validationResult = null);
    _debounce?.cancel();
    final key = _apiKeyController.text.trim();
    if (key.isNotEmpty) {
      _debounce = Timer(const Duration(milliseconds: 800), _validate);
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _apiKeyController.removeListener(_onApiKeyChanged);
    _apiKeyController.dispose();
    _apiBaseController.dispose();
    _customModelController.dispose();
    _awsSecretKeyController.dispose();
    _awsRegionController.dispose();
    super.dispose();
  }

  void _emitChange() {
    final effectiveModelId = _useCustomModel
        ? (_customModelController.text.trim().isNotEmpty ? _customModelController.text.trim() : null)
        : _selectedModelId;
    if (_apiKeyController.text.isEmpty || effectiveModelId == null) return;
    final models = ModelCatalog.modelsForProvider(widget.providerId);
    final selectedModel = models.where((m) => m.id == effectiveModelId).firstOrNull;

    String? apiBase;
    if (_isBedrock) {
      final region = _awsRegionController.text.trim().isNotEmpty
          ? _awsRegionController.text.trim()
          : 'us-east-1';
      apiBase = 'https://bedrock-runtime.$region.amazonaws.com';
    } else if (_apiBaseController.text.trim().isNotEmpty) {
      apiBase = _apiBaseController.text.trim();
    }

    widget.onChanged(AuthResult(
      apiKey: _apiKeyController.text.trim(),
      modelId: effectiveModelId,
      modelDisplayName: selectedModel?.displayName ?? effectiveModelId,
      apiBase: apiBase,
      isFree: selectedModel?.isFree ?? false,
      awsSecretKey: _isBedrock && _awsAuthMode == 'sigv4'
          ? _awsSecretKeyController.text.trim()
          : null,
      awsRegion: _isBedrock ? (_awsRegionController.text.trim().isNotEmpty
          ? _awsRegionController.text.trim()
          : 'us-east-1') : null,
      awsAuthMode: _isBedrock ? _awsAuthMode : null,
    ));
  }

  Future<void> _validate() async {
    if (_apiKeyController.text.trim().isEmpty) return;

    setState(() {
      _isValidating = true;
      _validationResult = null;
    });

    try {
      // Bedrock: validate by calling ListFoundationModels via the appropriate auth
      if (_isBedrock) {
        await _validateBedrock();
        return;
      }

      final provider = ModelCatalog.getProvider(widget.providerId);
      final apiBase = _apiBaseController.text.trim().isNotEmpty
          ? _apiBaseController.text.trim()
          : provider?.apiBase ?? 'https://api.openai.com/v1';

      final base = apiBase.endsWith('/') ? apiBase : '$apiBase/';
      final apiKey = _apiKeyController.text.trim();
      final dio = Dio();
      final headers = {
        'Authorization': 'Bearer $apiKey',
        'HTTP-Referer': 'https://flutterclaw.ai',
        'X-OpenRouter-Title': 'FlutterClaw',
      };
      final timeout = const Duration(seconds: 10);

      // OpenRouter has a dedicated auth check endpoint;
      // other providers authenticate via GET /models.
      final isOpenRouter = widget.providerId == 'openrouter' ||
          apiBase.contains('openrouter.ai');
      final checkUrl = isOpenRouter ? '${base}auth/key' : '${base}models';

      final response = await dio.get(
        checkUrl,
        options: Options(
          headers: headers,
          receiveTimeout: timeout,
          sendTimeout: timeout,
          validateStatus: (s) => true,
        ),
      );

      if (!mounted) return;

      final status = response.statusCode ?? 0;

      _ValidationResult result;
      if (isOpenRouter) {
        if (status == 200 && response.data is Map<String, dynamic>) {
          final data = (response.data as Map<String, dynamic>)['data'];
          result = data != null
              ? _ValidationResult.success
              : _ValidationResult.failed('Invalid API key');
        } else {
          result = _ValidationResult.failed('Invalid API key');
        }
      } else if (status >= 200 && status < 300) {
        result = _ValidationResult.success;
      } else if (status == 401 || status == 403) {
        result = _ValidationResult.failed('Invalid API key');
      } else {
        String msg = 'HTTP $status';
        if (response.data is Map<String, dynamic>) {
          final error =
              (response.data as Map<String, dynamic>)['error'] as Map?;
          if (error != null && error['message'] != null) {
            msg = '${error['message']}';
          }
        }
        result = _ValidationResult.failed(msg);
      }
      setState(() => _validationResult = result);
      widget.onValidated?.call(result.isSuccess);
    } on DioException catch (e) {
      if (!mounted) return;
      final msg = e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout
          ? 'Request timed out'
          : e.message ?? 'Connection error';
      setState(() => _validationResult = _ValidationResult.failed(msg));
      widget.onValidated?.call(false);
    } catch (e) {
      if (!mounted) return;
      setState(() => _validationResult = _ValidationResult.failed('$e'));
      widget.onValidated?.call(false);
    } finally {
      if (mounted) setState(() => _isValidating = false);
    }
  }

  Future<void> _validateBedrock() async {
    final region = _awsRegionController.text.trim().isNotEmpty
        ? _awsRegionController.text.trim()
        : 'us-east-1';
    final apiKey = _apiKeyController.text.trim();

    try {
      final dio = Dio();
      final timeout = const Duration(seconds: 10);

      if (_awsAuthMode == 'bearer') {
        // Bearer token: simple GET to bedrock endpoint
        final url = 'https://bedrock.$region.amazonaws.com/foundation-models';
        final response = await dio.get(
          url,
          options: Options(
            headers: {'Authorization': 'Bearer $apiKey'},
            receiveTimeout: timeout,
            sendTimeout: timeout,
            validateStatus: (s) => true,
          ),
        );
        if (!mounted) return;
        final status = response.statusCode ?? 0;
        _ValidationResult result;
        if (status >= 200 && status < 300) {
          result = _ValidationResult.success;
        } else if (status == 401 || status == 403) {
          result = _ValidationResult.failed('Invalid token');
        } else {
          result = _ValidationResult.failed('HTTP $status');
        }
        setState(() => _validationResult = result);
        widget.onValidated?.call(result.isSuccess);
      } else {
        // SigV4: we can't easily sign requests from the onboarding page,
        // so do a basic format check and trust the user.
        final secretKey = _awsSecretKeyController.text.trim();
        if (apiKey.isEmpty || secretKey.isEmpty) {
          setState(() => _validationResult =
              _ValidationResult.failed('Access Key ID and Secret Key are required'));
          widget.onValidated?.call(false);
          return;
        }
        // AWS Access Key IDs start with AKIA/ASIA and are 20 chars
        if (!RegExp(r'^[A-Z0-9]{16,128}$').hasMatch(apiKey)) {
          setState(() => _validationResult =
              _ValidationResult.failed('Access Key ID format looks invalid'));
          widget.onValidated?.call(false);
          return;
        }
        // Passes basic checks — accept it
        setState(() => _validationResult = _ValidationResult.success);
        widget.onValidated?.call(true);
      }
    } on DioException catch (e) {
      if (!mounted) return;
      final msg = e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout
          ? 'Request timed out'
          : e.message ?? 'Connection error';
      setState(() => _validationResult = _ValidationResult.failed(msg));
      widget.onValidated?.call(false);
    } catch (e) {
      if (!mounted) return;
      setState(() => _validationResult = _ValidationResult.failed('$e'));
      widget.onValidated?.call(false);
    } finally {
      if (mounted) setState(() => _isValidating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final provider = ModelCatalog.getProvider(widget.providerId);
    final models = ModelCatalog.availableModelsForProvider(widget.providerId);
    final showBaseUrl = widget.providerId == 'ollama' ||
        widget.providerId == 'custom';

    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      children: [
        Text(
          context.l10n.connectToProvider(provider?.displayName ?? widget.providerId),
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          _isBedrock
              ? 'Configure your AWS Bedrock credentials.'
              : context.l10n.enterApiKeyDesc,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 20),

        // Registration CTA
        if (provider != null && provider.signupUrl.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: colors.primaryContainer.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.open_in_new, size: 20, color: colors.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isBedrock
                            ? 'Need AWS access?'
                            : context.l10n.dontHaveApiKey,
                        style: theme.textTheme.labelLarge,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _isBedrock
                            ? 'Open the AWS Bedrock console to get started.'
                            : context.l10n.createAccountCopyKey,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton.tonal(
                  onPressed: () => _openSignup(provider.signupUrl),
                  child: Text(context.l10n.signUp),
                ),
              ],
            ),
          ),

        const SizedBox(height: 20),

        // Bedrock: auth mode selector
        if (_isBedrock) ...[
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'bearer', label: Text('Bearer Token')),
              ButtonSegment(value: 'sigv4', label: Text('Access Keys')),
            ],
            selected: {_awsAuthMode},
            onSelectionChanged: (v) {
              setState(() {
                _awsAuthMode = v.first;
                _apiKeyController.clear();
                _awsSecretKeyController.clear();
                _validationResult = null;
              });
              widget.onValidated?.call(false);
              _emitChange();
            },
          ),
          const SizedBox(height: 16),
        ],

        // API key / Bearer Token / Access Key ID input
        TextField(
          controller: _apiKeyController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: _isBedrock
                ? (_awsAuthMode == 'bearer'
                    ? 'Bearer Token'
                    : 'AWS Access Key ID')
                : context.l10n.apiKey,
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.key),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.paste),
                  tooltip: context.l10n.pasteFromClipboard,
                  onPressed: () async {
                    final data = await Clipboard.getData(Clipboard.kTextPlain);
                    if (data?.text != null && data!.text!.isNotEmpty) {
                      _apiKeyController.text = data.text!;
                      _emitChange();
                    }
                  },
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Bedrock SigV4: AWS Secret Access Key
        if (_isBedrock && _awsAuthMode == 'sigv4') ...[
          TextField(
            controller: _awsSecretKeyController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'AWS Secret Access Key',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: const Icon(Icons.paste),
                tooltip: context.l10n.pasteFromClipboard,
                onPressed: () async {
                  final data = await Clipboard.getData(Clipboard.kTextPlain);
                  if (data?.text != null && data!.text!.isNotEmpty) {
                    _awsSecretKeyController.text = data.text!;
                    _emitChange();
                  }
                },
              ),
            ),
            onChanged: (_) => _emitChange(),
          ),
          const SizedBox(height: 16),
        ],

        // Bedrock: AWS Region
        if (_isBedrock) ...[
          TextField(
            controller: _awsRegionController,
            decoration: const InputDecoration(
              labelText: 'AWS Region',
              hintText: 'us-east-1',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.public),
            ),
            onChanged: (_) => _emitChange(),
          ),
          const SizedBox(height: 16),
        ],

        // Custom base URL (non-Bedrock only)
        if (showBaseUrl) ...[
          TextField(
            controller: _apiBaseController,
            decoration: InputDecoration(
              labelText: context.l10n.apiBaseUrl,
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.link),
              hintText: 'http://localhost:11434/v1',
            ),
            onChanged: (_) => _emitChange(),
          ),
          const SizedBox(height: 16),
        ],

        // Model selection
        if (models.isNotEmpty) ...[
          Text(context.l10n.selectModel, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          ...models.map((m) => _ModelTile(
                model: m,
                isSelected: !_useCustomModel && _selectedModelId == m.id,
                onTap: () {
                  setState(() {
                    _useCustomModel = false;
                    _selectedModelId = m.id;
                    _customModelController.clear();
                  });
                  _emitChange();
                },
              )),
          const SizedBox(height: 8),
          TextButton.icon(
            icon: Icon(
              _useCustomModel ? Icons.close : Icons.edit_outlined,
              size: 16,
            ),
            label: Text(
              _useCustomModel
                  ? context.l10n.selectModel
                  : 'Enter a custom model ID',
            ),
            onPressed: () {
              setState(() {
                _useCustomModel = !_useCustomModel;
                if (!_useCustomModel) {
                  _customModelController.clear();
                  final free = models.where((m) => m.isFree).firstOrNull;
                  _selectedModelId = free?.id ?? models.first.id;
                }
              });
              _emitChange();
            },
          ),
          if (_useCustomModel) ...[
            const SizedBox(height: 8),
            TextField(
              controller: _customModelController,
              decoration: InputDecoration(
                labelText: context.l10n.modelId,
                border: const OutlineInputBorder(),
                hintText: 'e.g. google/gemini-3-flash-preview (OpenRouter upstream id)',
              ),
              onChanged: (_) => _emitChange(),
            ),
          ],
        ] else ...[
          TextField(
            decoration: InputDecoration(
              labelText: context.l10n.modelId,
              border: const OutlineInputBorder(),
              hintText: 'e.g. gpt-4o',
            ),
            onChanged: (val) {
              _selectedModelId = val;
              _emitChange();
            },
          ),
        ],

        // Discover models button — shown for Ollama/custom or when no
        // static models exist for the provider.
        if (models.isEmpty || widget.providerId == 'ollama' || widget.providerId == 'custom') ...[
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _isDiscovering ? null : _discoverModels,
            icon: _isDiscovering
                ? const SizedBox(
                    width: 14, height: 14,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.search, size: 16),
            label: Text(_isDiscovering ? 'Discovering...' : 'Discover available models'),
          ),
          if (_discoveredModels.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text('${_discoveredModels.length} models found',
                style: theme.textTheme.labelSmall
                    ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            const SizedBox(height: 4),
            ...(_discoveredModels.take(20).map((m) => _ModelTile(
                  model: m.toCatalogModel(),
                  isSelected: !_useCustomModel && _selectedModelId == m.id,
                  onTap: () {
                    setState(() {
                      _useCustomModel = false;
                      _selectedModelId = m.id;
                      _customModelController.clear();
                    });
                    _emitChange();
                  },
                ))),
            if (_discoveredModels.length > 20)
              TextButton(
                onPressed: () {
                  setState(() => _useCustomModel = true);
                },
                child: Text('+ ${_discoveredModels.length - 20} more — enter ID manually'),
              ),
          ],
        ],

        const SizedBox(height: 24),

        // Validate button
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _isValidating ? null : _validate,
                icon: _isValidating
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.verified_outlined),
                label: Text(_isValidating ? context.l10n.validating : context.l10n.validateKey),
              ),
            ),
            if (_validationResult != null) ...[
              const SizedBox(width: 12),
              _validationResult!.isSuccess
                  ? const Icon(Icons.check_circle, color: Colors.green, size: 28)
                  : Flexible(
                      child: Text(
                        _validationResult!.errorMessage!,
                        style: const TextStyle(color: Colors.red, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
            ],
          ],
        ),
      ],
    );
  }

  Future<void> _discoverModels() async {
    if (_isDiscovering) return;
    setState(() {
      _isDiscovering = true;
      _discoveredModels = [];
    });
    try {
      final provider = ModelCatalog.getProvider(widget.providerId);
      final apiBase = _apiBaseController.text.trim().isNotEmpty
          ? _apiBaseController.text.trim()
          : provider?.apiBase;
      final svc = ModelDiscoveryService();
      final found = await svc.discoverModels(
        providerId: widget.providerId,
        apiKey: _apiKeyController.text.trim(),
        apiBase: apiBase,
      );
      if (!mounted) return;
      setState(() => _discoveredModels = found);
      // Auto-select the first discovered model if nothing is selected yet.
      if (found.isNotEmpty && _selectedModelId == null) {
        setState(() => _selectedModelId = found.first.id);
        _emitChange();
      }
    } catch (_) {
      // Ignore — discovery is best-effort
    } finally {
      if (mounted) setState(() => _isDiscovering = false);
    }
  }

  Future<void> _openSignup(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _ValidationResult {
  final bool isSuccess;
  final String? errorMessage;

  const _ValidationResult._({required this.isSuccess, this.errorMessage});

  static const success = _ValidationResult._(isSuccess: true);

  factory _ValidationResult.failed(String msg) =>
      _ValidationResult._(isSuccess: false, errorMessage: msg);
}

class _ModelTile extends StatelessWidget {
  final CatalogModel model;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModelTile({
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Material(
        color: isSelected
            ? colors.primaryContainer
            : colors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(color: colors.primary, width: 1.5)
                  : null,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.displayName,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (model.isFree) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'FREE',
                                style: TextStyle(
                                  color: Colors.green.shade800,
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (model.description != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          model.description!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                      const SizedBox(height: 4),
                      _ModelCapabilityIcons(model: model),
                    ],
                  ),
                ),
                Text(
                  ModelCatalog.formatContext(model.contextWindow),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  Icon(Icons.check_circle, color: colors.primary, size: 20),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ModelCapabilityIcons extends StatelessWidget {
  final CatalogModel model;

  const _ModelCapabilityIcons({required this.model});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(Icons.text_fields, size: 13, color: colors.onSurfaceVariant),
        if (model.supportsVision) ...[
          const SizedBox(width: 5),
          Icon(Icons.image_outlined, size: 13, color: Colors.blue.shade400),
        ],
        if (model.supportsAudio) ...[
          const SizedBox(width: 5),
          Icon(Icons.mic_outlined, size: 13, color: Colors.orange.shade400),
        ],
      ],
    );
  }
}
