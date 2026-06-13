import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Optional SVG under [assets/channels/] per integration; falls back to [IconData].
String? channelLogoAsset(String channelType) {
  return switch (channelType) {
    'telegram' => 'assets/channels/telegram.svg',
    'discord' => 'assets/channels/discord.svg',
    'slack' => 'assets/channels/slack.svg',
    'signal' => 'assets/channels/signal.svg',
    'whatsapp' => 'assets/channels/whatsapp.svg',
    _ => null,
  };
}

IconData channelFallbackIcon(String channelType) {
  return switch (channelType) {
    'telegram' => Icons.telegram,
    'discord' => Icons.discord,
    'slack' => Icons.grid_view,
    'signal' => Icons.lock,
    'whatsapp' => Icons.chat_bubble,
    'webchat' => Icons.chat_rounded,
    'system' => Icons.settings,
    'heartbeat' => Icons.favorite,
    'cron' => Icons.schedule,
    'subagent' => Icons.account_tree,
    _ => Icons.message,
  };
}

/// Brand mark for a gateway channel type (`telegram`, `discord`, `webchat`, …).
class ChannelBrandIcon extends StatelessWidget {
  const ChannelBrandIcon({
    super.key,
    required this.channelType,
    required this.size,
    this.iconColor,
    this.semanticLabel,
  });

  final String channelType;
  final double size;
  final Color? iconColor;

  /// Accessibility label read by screen readers. Defaults to the channel type name.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? Theme.of(context).colorScheme.onSurface;
    final asset = channelLogoAsset(channelType);
    final fallback = channelFallbackIcon(channelType);
    final label = semanticLabel ?? channelType;

    if (asset == null || asset.isEmpty) {
      return Semantics(
        label: label,
        child: Icon(fallback, size: size, color: color),
      );
    }
    final pad = size * 0.14;
    return Semantics(
      label: label,
      child: SizedBox(
        width: size,
        height: size,
        child: Padding(
          padding: EdgeInsets.all(pad),
          child: SvgPicture.asset(
            asset,
            fit: BoxFit.contain,
            alignment: Alignment.center,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            errorBuilder: (context, error, stackTrace) =>
                Icon(fallback, size: size, color: color),
          ),
        ),
      ),
    );
  }
}
