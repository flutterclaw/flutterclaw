import 'package:flutter/material.dart';
import 'package:flutterclaw/whatsapp/types.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WhatsAppPairingStatusCard extends StatelessWidget {
  const WhatsAppPairingStatusCard({
    super.key,
    required this.status,
    this.qrCode,
    this.isRestartPending = false,
    this.idleDescription = 'Tap connect to link your WhatsApp account.',
    this.connectedDescription = 'WhatsApp is active and receiving messages.',
    this.connectingDescription = 'Waiting for WhatsApp to complete the link...',
    this.instructions =
        'Open WhatsApp -> Settings -> Linked Devices -> Link a Device',
    this.footer,
  });

  final WAConnectionStatus status;
  final String? qrCode;
  final bool isRestartPending;
  final String idleDescription;
  final String connectedDescription;
  final String connectingDescription;
  final String instructions;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final isConnected = status == WAConnectionStatus.connected;
    final isConnecting =
        status == WAConnectionStatus.connecting || isRestartPending;
    final effectiveSubtitle = isConnected
        ? connectedDescription
        : isConnecting
        ? connectingDescription
        : qrCode != null
        ? 'Scan the QR code below with WhatsApp.'
        : idleDescription;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: isConnected
              ? Colors.green.withValues(alpha: 0.15)
              : isConnecting
              ? Colors.orange.withValues(alpha: 0.15)
              : colors.surfaceContainerHighest,
          margin: EdgeInsets.zero,
          child: ListTile(
            leading: Icon(
              isConnected
                  ? Icons.check_circle
                  : isConnecting
                  ? Icons.hourglass_top
                  : Icons.radio_button_unchecked,
              color: isConnected
                  ? Colors.green
                  : isConnecting
                  ? Colors.orange
                  : colors.onSurfaceVariant,
            ),
            title: Text(
              isConnected
                  ? 'Connected'
                  : isConnecting
                  ? 'Connecting...'
                  : 'Not connected',
              style: theme.textTheme.titleSmall,
            ),
            subtitle: Text(effectiveSubtitle),
          ),
        ),
        if (qrCode != null && !isConnected) ...[
          const SizedBox(height: 12),
          Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: QrImageView(
                  data: qrCode!,
                  version: QrVersions.auto,
                  size: 220,
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            instructions,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colors.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
        if (footer != null) ...[const SizedBox(height: 12), footer!],
      ],
    );
  }
}
