/// QR/Barcode scanner tool for FlutterClaw agents.
///
/// Opens a live camera scanner or analyzes an existing image to detect
/// QR codes and barcodes. Returns the decoded data.
library;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:flutterclaw/app.dart';
import 'package:flutterclaw/l10n/l10n_extension.dart';
import 'registry.dart';

/// Scan QR codes and barcodes using the device camera.
class QrScanTool extends Tool {
  @override
  String get name => 'scan_qr';

  @override
  String get description =>
      'Scan a QR code or barcode using the device camera. '
      'Opens a live camera scanner that auto-detects codes. '
      'Returns the decoded value, format, and type.\n\n'
      'Supports: QR, EAN-8, EAN-13, UPC-A, UPC-E, Code-39, Code-93, '
      'Code-128, ITF, Codabar, Data Matrix, Aztec, PDF417.';

  @override
  Map<String, dynamic> get parameters => {
        'type': 'object',
        'properties': {
          'source': {
            'type': 'string',
            'enum': ['camera', 'gallery'],
            'description':
                'Scan source. "camera" opens live scanner (default). '
                '"gallery" picks an existing image to analyze.',
          },
        },
      };

  @override
  Future<ToolResult> execute(Map<String, dynamic> args) async {
    final source = (args['source'] as String?) ?? 'camera';

    try {
      if (source == 'gallery') {
        return _scanFromImage();
      }
      return _scanLive();
    } catch (e) {
      return ToolResult.error('QR scan failed: $e');
    }
  }

  Future<ToolResult> _scanLive() async {
    final nav = FlutterClawApp.navigatorKey.currentState;
    if (nav == null) {
      return ToolResult.error('No active navigator — cannot open scanner.');
    }

    final result = await nav.push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (_) => const _QrScannerScreen(),
        fullscreenDialog: true,
      ),
    );

    if (result == null) {
      return ToolResult.error('Scan cancelled by user.');
    }
    return ToolResult.success(jsonEncode(result));
  }

  Future<ToolResult> _scanFromImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file == null) {
      return ToolResult.error('No image selected.');
    }

    final controller = MobileScannerController();
    try {
      final capture = await controller.analyzeImage(file.path);
      if (capture == null || capture.barcodes.isEmpty) {
        return ToolResult.error('No QR/barcode found in the selected image.');
      }
      final results = capture.barcodes.map(_barcodeToMap).toList();
      return ToolResult.success(jsonEncode(results));
    } finally {
      controller.dispose();
    }
  }

  static Map<String, dynamic> _barcodeToMap(Barcode b) => {
        'value': b.rawValue ?? b.displayValue ?? '',
        'display_value': b.displayValue ?? '',
        'format': b.format.name,
        'type': b.type.name,
        if (b.url != null) 'url': b.url!.url,
        if (b.email != null)
          'email': {
            'address': b.email!.address,
            'subject': b.email!.subject,
            'body': b.email!.body,
          },
        if (b.phone != null) 'phone': b.phone!.number,
        if (b.sms != null)
          'sms': {
            'phone': b.sms!.phoneNumber,
            'message': b.sms!.message,
          },
        if (b.wifi != null)
          'wifi': {
            'ssid': b.wifi!.ssid,
            'password': b.wifi!.password,
            'encryption': b.wifi!.encryptionType.name,
          },
        if (b.contactInfo != null)
          'contact': {
            'name': b.contactInfo!.title,
            'organization': b.contactInfo!.organization,
          },
      };
}

// ---------------------------------------------------------------------------
// Live scanner screen (pushed as a fullscreen dialog)
// ---------------------------------------------------------------------------

class _QrScannerScreen extends StatefulWidget {
  const _QrScannerScreen();

  @override
  State<_QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<_QrScannerScreen> {
  bool _detected = false;

  void _onDetect(BarcodeCapture capture) {
    if (_detected) return;
    final barcode = capture.barcodes.firstOrNull;
    if (barcode == null) return;

    _detected = true;
    final result = QrScanTool._barcodeToMap(barcode);
    Navigator.of(context).pop(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(context.l10n.scanQrBarcodeTitle),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: MobileScanner(onDetect: _onDetect),
    );
  }
}
