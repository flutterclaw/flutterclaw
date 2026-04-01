import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/generated/app_localizations.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'package:flutterclaw/core/app_providers.dart';
import 'package:flutterclaw/ui/screens/home_screen.dart';
import 'package:flutterclaw/ui/screens/onboarding/onboarding_screen.dart';
import 'package:flutterclaw/ui/theme/semantic_colors.dart';

ThemeData _buildTheme(Brightness brightness) {
  return ThemeData(
    colorSchemeSeed: const Color(0xFF6750A4),
    useMaterial3: true,
    brightness: brightness,
    extensions: [
      brightness == Brightness.dark ? SemanticColors.dark : SemanticColors.light,
    ],
  );
}

class FlutterClawApp extends StatelessWidget {
  const FlutterClawApp({super.key});

  /// Global navigator key used by HeadlessBrowserTool to show overlays.
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final analytics = FirebaseAnalytics.instance;

    return ProviderScope(
      child: MaterialApp(
        navigatorKey: FlutterClawApp.navigatorKey,
        title: 'FlutterClaw',
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(Brightness.light),
        darkTheme: _buildTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
          Locale('pt'), // Portuguese
          Locale('fr'), // French
          Locale('de'), // German
          Locale('it'), // Italian
          Locale('zh'), // Chinese
          Locale('ja'), // Japanese
          Locale('ko'), // Korean
          Locale('ru'), // Russian
          Locale('ar'), // Arabic
          Locale('hi'), // Hindi
          Locale('tr'), // Turkish
          Locale('nl'), // Dutch
          Locale('pl'), // Polish
          Locale('th'), // Thai
          Locale('vi'), // Vietnamese
          Locale('id'), // Indonesian
          Locale('uk'), // Ukrainian
          Locale('cs'), // Czech
        ],
        home: const _AppRoot(),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
      ),
    );
  }
}

class _AppRoot extends ConsumerWidget {
  const _AppRoot();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initAsync = ref.watch(appInitializedProvider);

    return initAsync.when(
      data: (_) {
        final needsOnboarding = ref.watch(onboardingRequiredProvider);
        return needsOnboarding
            ? const OnboardingScreen()
            : const HomeScreen();
      },
      loading: () => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(context.l10n.appTitle),
            ],
          ),
        ),
      ),
      error: (e, _) => Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: Text(
              context.l10n.appInitializationError('$e'),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
