import 'dart:ui';

/// Detects the user's region and determines which providers are restricted.
///
/// Used to comply with Chinese DST (Deep Synthesis Technology) regulations,
/// which require MIIT permits for generative AI services. Providers without
/// Chinese operating licenses are hidden from the UI when running in China.
class RegionService {
  static const _restrictedProviders = {
    'openai',
    'anthropic',
    'google',
    'xai',
    'bedrock',
  };

  /// Returns true if the device region is set to China mainland.
  static bool get isChina =>
      PlatformDispatcher.instance.locale.countryCode == 'CN';

  /// Returns true if the given provider ID is restricted in the current region.
  static bool isProviderRestricted(String providerId) =>
      isChina && _restrictedProviders.contains(providerId);
}
