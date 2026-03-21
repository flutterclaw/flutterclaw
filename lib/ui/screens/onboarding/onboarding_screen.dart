import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/data/models/config.dart';
import 'package:flutterclaw/data/models/model_catalog.dart';
import 'package:flutterclaw/services/background_service.dart';
import 'package:flutterclaw/services/live_activity_service.dart';
import 'package:flutterclaw/services/secure_key_store.dart';
import 'package:flutterclaw/ui/screens/home_screen.dart';
import 'package:flutterclaw/ui/screens/onboarding/accessibility_page.dart';
import 'package:flutterclaw/ui/screens/onboarding/auth_page.dart';
import 'package:flutterclaw/ui/screens/onboarding/completion_page.dart';
import 'package:flutterclaw/ui/screens/onboarding/provider_page.dart';
import 'package:flutterclaw/ui/screens/onboarding/welcome_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  bool _isStarting = false;

  // Collected state
  String? _selectedProviderId;
  AuthResult? _authResult;
  bool _keyValidated = false; // true once API key passes live validation

  // Gateway and channels use defaults; users configure them later in Settings.
  // Pages: 0=Welcome, 1=Provider, 2=Auth, 3=Accessibility(Android only), 3/4=Completion
  int get _pageCount => Platform.isAndroid ? 5 : 4;

  bool get _canAdvance {
    switch (_currentPage) {
      case 1:
        return _selectedProviderId != null;
      case 2:
        return _authResult != null &&
            _authResult!.apiKey.isNotEmpty &&
            _keyValidated;
      default:
        return true;
    }
  }

  void _nextPage() {
    if (_currentPage < _pageCount - 1 && _canAdvance) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _completeOnboarding() async {
    if (_isStarting) return;
    setState(() => _isStarting = true);

    try {
      final configManager = ref.read(configManagerProvider);
      final provider = ModelCatalog.getProvider(_selectedProviderId!);

      // Store API key securely (legacy store kept for compatibility)
      await SecureKeyStore.saveApiKey(
        _selectedProviderId!,
        _authResult!.apiKey,
      );

      // Save credential at provider level
      final credential = ProviderCredential(
        apiKey: _authResult!.apiKey,
        apiBase: _authResult!.apiBase ?? provider?.apiBase,
      );

      // Model entry no longer needs apiKey — resolved from providerCredentials
      CatalogModel? catalogModel;
      for (final m in ModelCatalog.models) {
        if (m.id == _authResult!.modelId) {
          catalogModel = m;
          break;
        }
      }
      final modelEntry = ModelEntry(
        modelName: _authResult!.modelDisplayName,
        model: _authResult!.modelId,
        apiBase: _authResult!.apiBase ?? provider?.apiBase,
        provider: _selectedProviderId!,
        isFree: _authResult!.isFree,
        input: catalogModel?.input,
      );

      // Update any existing agent profiles to use the new model.
      // Without this, profiles created during app startup (migration) would
      // retain the default 'gpt-4o' model name and cause a "not configured" error.
      final updatedProfiles = configManager.config.agentProfiles
          .map((a) => a.copyWith(modelName: modelEntry.modelName))
          .toList();

      // Gateway uses defaults (host:port:autoStart=true); user can adjust in Settings.
      // Channels keep existing config — user configures them from the Channels screen.
      final newConfig = configManager.config.copyWith(
        modelList: [modelEntry],
        providerCredentials: {_selectedProviderId!: credential},
        agents: AgentsConfig(
          defaults: AgentsDefaults(modelName: modelEntry.modelName),
        ),
        agentProfiles: updatedProfiles,
        onboardingCompleted: true,
      );

      configManager.update(newConfig);
      await configManager.save();

      // Reload config from disk to trigger migration and create agent workspace
      await configManager.load();

      // Invalidate dependent providers to force them to rebuild with the new configuration
      // NOTE: DO NOT invalidate configManagerProvider - it would create a new empty instance
      // Instead, only invalidate providers that depend on it
      ref.invalidate(providerRouterProvider);
      ref.invalidate(agentLoopProvider);
      ref.invalidate(toolRegistryProvider);
      ref.invalidate(agentProfilesProvider);
      ref.invalidate(activeAgentProvider);
      ref.invalidate(activeWorkspacePathProvider);
      ref.invalidate(sessionManagerProvider);

      // Force rebuild of critical providers before navigating
      // This ensures ChatScreen sees the updated configuration
      ref.read(providerRouterProvider);
      ref.read(agentLoopProvider);

      // Start channel adapters (Telegram, Discord) now that config is saved
      await ref.read(channelStartupProvider.future);

      // Start gateway with default config (autoStart=true)
      final gwConfig = configManager.config.gateway;
      if (gwConfig.autoStart) {
        if (Platform.isAndroid) {
          await ref
              .read(notificationServiceProvider)
              .ensureAndroidNotificationPermission();
        }
        await BackgroundService.startService();
        ref.read(gatewayStateProvider.notifier).setRunning(true);
        await LiveActivityService.startActivity(
          host: gwConfig.host,
          port: gwConfig.port,
          model: modelEntry.modelName,
        );
      }

      if (!mounted) return;

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isStarting = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final providerName = _selectedProviderId != null
        ? ModelCatalog.getProvider(_selectedProviderId!)?.displayName ??
              _selectedProviderId!
        : '';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with back button and progress
            if (_currentPage > 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 16, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: _prevPage,
                    ),
                    const Spacer(),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _pageCount,
                      effect: WormEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: colors.primary,
                        dotColor: colors.surfaceContainerHighest,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  // 0: Welcome
                  WelcomePage(onGetStarted: _nextPage),

                  // 1: Provider selection
                  ProviderPage(
                    selectedProviderId: _selectedProviderId,
                    onProviderSelected: (id) {
                      setState(() {
                        _selectedProviderId = id;
                        _authResult = null;
                        _keyValidated = false;
                      });
                      Future.delayed(const Duration(milliseconds: 250), () {
                        if (mounted) _nextPage();
                      });
                    },
                  ),

                  // 2: Auth + model
                  if (_selectedProviderId != null)
                    AuthPage(
                      key: ValueKey(_selectedProviderId),
                      providerId: _selectedProviderId!,
                      initialApiKey: _authResult?.apiKey,
                      initialModelId: _authResult?.modelId,
                      initialApiBase: _authResult?.apiBase,
                      onChanged: (result) {
                        setState(() => _authResult = result);
                      },
                      onValidated: (ok) {
                        setState(() => _keyValidated = ok);
                      },
                    )
                  else
                    const Center(child: Text('Select a provider first')),

                  // 3 (Android only): Accessibility Service + Overlay permissions
                  if (Platform.isAndroid)
                    AccessibilityPage(
                      service: ref.read(uiAutomationServiceProvider),
                      overlayService: ref.read(overlayServiceProvider),
                      onContinue: _nextPage,
                      onSkip: _nextPage,
                    ),

                  // 3 (iOS) / 4 (Android): Completion
                  CompletionPage(
                    summary: CompletionSummary(
                      providerName: providerName,
                      modelName: _authResult?.modelDisplayName ?? '',
                      isFreeModel: _authResult?.isFree ?? false,
                      gatewayHost: '127.0.0.1',
                      gatewayPort: 18789,
                      telegramEnabled: false,
                      discordEnabled: false,
                      whatsappEnabled: false,
                    ),
                    onStart: _completeOnboarding,
                    isStarting: _isStarting,
                  ),
                ],
              ),
            ),

            // Bottom navigation: show Continue on page 2 (Auth) only.
            // Welcome and Provider auto-advance; Accessibility has inline buttons;
            // Completion has its own Start button.
            if (_currentPage == 2)
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Row(
                  children: [
                    const Spacer(),
                    FilledButton(
                      onPressed: _canAdvance ? _nextPage : null,
                      child: const Text('Continue'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
