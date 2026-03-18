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
import 'package:flutterclaw/ui/screens/onboarding/channels_page.dart';
import 'package:flutterclaw/ui/screens/onboarding/completion_page.dart';
import 'package:flutterclaw/ui/screens/onboarding/gateway_page.dart';
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
  GatewayPageResult _gatewayResult = const GatewayPageResult(
    host: '127.0.0.1',
    port: 18789,
    autoStart: true,
  );
  ChannelsPageResult _channelsResult = const ChannelsPageResult();

  // Android gets an extra Accessibility Service page between Channels and Completion.
  int get _pageCount => Platform.isAndroid ? 7 : 6;

  bool get _canAdvance {
    switch (_currentPage) {
      case 1:
        return _selectedProviderId != null;
      case 2:
        return _authResult != null && _authResult!.apiKey.isNotEmpty;
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
      final modelEntry = ModelEntry(
        modelName: _authResult!.modelDisplayName,
        model: _authResult!.modelId,
        apiBase: _authResult!.apiBase ?? provider?.apiBase,
        provider: _selectedProviderId!,
        isFree: _authResult!.isFree,
      );

      var telegramConfig = configManager.config.channels.telegram;
      var discordConfig = configManager.config.channels.discord;
      var whatsappConfig = configManager.config.channels.whatsapp;

      if (_channelsResult.telegramEnabled &&
          _channelsResult.telegramToken != null) {
        telegramConfig = TelegramConfig(
          enabled: true,
          token: _channelsResult.telegramToken,
        );
      }

      if (_channelsResult.discordEnabled &&
          _channelsResult.discordToken != null) {
        discordConfig = DiscordConfig(
          enabled: true,
          token: _channelsResult.discordToken,
        );
      }

      if (_channelsResult.whatsappEnabled) {
        whatsappConfig = WhatsAppConfig(
          enabled: true,
          authDir: whatsappConfig.authDir,
          allowFrom: whatsappConfig.allowFrom,
          dmPolicy: whatsappConfig.dmPolicy,
          selfChatMode: _channelsResult.whatsappSelfChatMode,
        );
      }

      // Update any existing agent profiles to use the new model.
      // Without this, profiles created during app startup (migration) would
      // retain the default 'gpt-4o' model name and cause a "not configured" error.
      final updatedProfiles = configManager.config.agentProfiles
          .map((a) => a.copyWith(modelName: modelEntry.modelName))
          .toList();

      final newConfig = configManager.config.copyWith(
        modelList: [modelEntry],
        providerCredentials: {_selectedProviderId!: credential},
        agents: AgentsConfig(
          defaults: AgentsDefaults(modelName: modelEntry.modelName),
        ),
        agentProfiles: updatedProfiles,
        gateway: GatewayConfig(
          host: _gatewayResult.host,
          port: _gatewayResult.port,
          autoStart: _gatewayResult.autoStart,
        ),
        channels: ChannelsConfig(
          telegram: telegramConfig,
          discord: discordConfig,
          whatsapp: whatsappConfig,
        ),
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

      // Start gateway
      if (_gatewayResult.autoStart) {
        if (Platform.isAndroid) {
          await ref
              .read(notificationServiceProvider)
              .ensureAndroidNotificationPermission();
        }
        await BackgroundService.startService();
        ref.read(gatewayStateProvider.notifier).setRunning(true);
        await LiveActivityService.startActivity(
          host: _gatewayResult.host,
          port: _gatewayResult.port,
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
                    )
                  else
                    const Center(child: Text('Select a provider first')),

                  // 3: Gateway
                  GatewayPage(
                    initialHost: _gatewayResult.host,
                    initialPort: _gatewayResult.port,
                    initialAutoStart: _gatewayResult.autoStart,
                    onChanged: (result) {
                      _gatewayResult = result;
                    },
                  ),

                  // 4: Channels
                  ChannelsPage(
                    onChanged: (result) {
                      _channelsResult = result;
                    },
                  ),

                  // 5 (Android only): Accessibility Service permission
                  if (Platform.isAndroid)
                    AccessibilityPage(
                      service: ref.read(uiAutomationServiceProvider),
                      onContinue: _nextPage,
                      onSkip: _nextPage,
                    ),

                  // 5 (iOS) / 6 (Android): Completion
                  CompletionPage(
                    summary: CompletionSummary(
                      providerName: providerName,
                      modelName: _authResult?.modelDisplayName ?? '',
                      isFreeModel: _authResult?.isFree ?? false,
                      gatewayHost: _gatewayResult.host,
                      gatewayPort: _gatewayResult.port,
                      telegramEnabled: _channelsResult.telegramEnabled,
                      discordEnabled: _channelsResult.discordEnabled,
                      whatsappEnabled: _channelsResult.whatsappEnabled,
                    ),
                    onStart: _completeOnboarding,
                    isStarting: _isStarting,
                  ),
                ],
              ),
            ),

            // Bottom navigation (not on welcome, provider, completion, or
            // the accessibility page which has its own inline buttons).
            if (_currentPage > 1 &&
                _currentPage < _pageCount - 1 &&
                !(Platform.isAndroid && _currentPage == 5))
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Row(
                  children: [
                    if (_currentPage == 4)
                      TextButton(
                        onPressed: _nextPage,
                        child: const Text('Skip'),
                      ),
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
