/// Button that activates Gemini Live real-time voice mode.
///
/// Only shown when the active model supports the Live API ([activeModelSupportsLiveProvider]).
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterclaw/core/app_providers.dart';

/// A glowing microphone button that launches Live voice mode.
///
/// The button pulses with a subtle ring animation when the session is
/// connecting or active.
class LiveVoiceButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const LiveVoiceButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(liveSessionProvider);
    final theme = Theme.of(context);
    final isActive = sessionState.status == LiveSessionStatus.ready ||
        sessionState.status == LiveSessionStatus.connecting;

    return IconButton.filled(
      onPressed: () {
        HapticFeedback.mediumImpact();
        onPressed();
      },
      style: isActive
          ? IconButton.styleFrom(
              backgroundColor: theme.colorScheme.tertiary,
              foregroundColor: theme.colorScheme.onTertiary,
            )
          : IconButton.styleFrom(
              backgroundColor: theme.colorScheme.primaryContainer,
              foregroundColor: theme.colorScheme.onPrimaryContainer,
            ),
      icon: Icon(isActive ? Icons.cell_tower : Icons.spatial_audio),
      tooltip: isActive ? 'End live conversation' : 'Live voice conversation',
    );
  }
}
