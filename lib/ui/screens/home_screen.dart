import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/services/background_service.dart';
import 'package:flutterclaw/services/ios_gateway_service.dart';
import 'package:flutterclaw/services/analytics_service.dart';
import 'package:flutterclaw/ui/screens/chat_screen.dart';
import 'package:flutterclaw/ui/screens/channels_screen.dart';
import 'package:flutterclaw/ui/screens/unified_agents_screen.dart';
import 'package:flutterclaw/ui/screens/settings_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with WidgetsBindingObserver {
  int _currentIndex = 0;
  StreamSubscription<String>? _notifTapSub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeAutoStartGateway();
      _subscribeToNotificationTaps();
      _refreshHealth();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _notifTapSub?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshHealth();
    }
  }

  void _refreshHealth() {
    final router = ref.read(channelRouterProvider);
    final connected = <String, bool>{};
    for (final type in [
      'telegram',
      'discord',
      'slack',
      'signal',
      'whatsapp',
    ]) {
      final adapter = router.adapterFor(type);
      connected[type] = adapter?.isConnected ?? false;
    }
    ref.read(healthCheckResultsProvider.notifier).refresh(
          channelConnected: connected,
        );
  }

  /// When the user taps a push notification, switch to the Chat tab and load
  /// the session whose key is stored in the notification payload.
  void _subscribeToNotificationTaps() {
    final notifService = ref.read(notificationServiceProvider);
    _notifTapSub = notifService.tapPayloadStream.listen((sessionKey) {
      if (!mounted) return;
      setState(() => _currentIndex = 0); // switch to Chat tab
      ref.read(chatProvider.notifier).switchToSession(sessionKey);
    });
  }

  Future<void> _maybeAutoStartGateway() async {
    final config = ref.read(configManagerProvider).config;
    if (!config.gateway.autoStart) return;
    if (ref.read(gatewayStateProvider).isRunning) return;

    final gatewayNotifier = ref.read(gatewayStateProvider.notifier);
    gatewayNotifier.setState('starting');

    if (Platform.isIOS) {
      final success = await IosGatewayService.start(
        configManager: ref.read(configManagerProvider),
        providerRouter: ref.read(providerRouterProvider),
        sessionManager: ref.read(sessionManagerProvider),
        toolRegistry: ref.read(toolRegistryProvider),
        skillsService: ref.read(skillsServiceProvider),
      );
      if (mounted) {
        gatewayNotifier.setRunning(success);
        gatewayNotifier.setModel(
          config.activeAgent?.modelName ?? config.agents.defaults.modelName,
        );
        if (!success && IosGatewayService.lastError != null) {
          gatewayNotifier.setError(IosGatewayService.lastError!);
        }
      }
    } else {
      if (Platform.isAndroid) {
        await ref.read(notificationServiceProvider).ensureAndroidNotificationPermission();
      }
      await BackgroundService.startService();
      if (mounted) {
        gatewayNotifier.setRunning(true);
        gatewayNotifier.setModel(
          config.activeAgent?.modelName ?? config.agents.defaults.modelName,
        );
      }
    }
  }

  static const _screens = <Widget>[
    ChatScreen(),
    ChannelsScreen(),
    UnifiedAgentsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final analytics = ref.read(analyticsServiceProvider);

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) {
          setState(() => _currentIndex = i);
          analytics.logTap(
            name: switch (i) {
              0 => 'bottom_nav_chat',
              1 => 'bottom_nav_channels',
              2 => 'bottom_nav_agents',
              3 => 'bottom_nav_settings',
              _ => 'bottom_nav_unknown',
            },
          );
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.chat_outlined),
            selectedIcon: const Icon(Icons.chat),
            label: context.l10n.chat,
          ),
          NavigationDestination(
            icon: const Icon(Icons.hub_outlined),
            selectedIcon: const Icon(Icons.hub),
            label: context.l10n.channels,
          ),
          NavigationDestination(
            icon: const Icon(Icons.group_outlined),
            selectedIcon: const Icon(Icons.group),
            label: context.l10n.agents,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: context.l10n.settings,
          ),
        ],
      ),
    );
  }
}
