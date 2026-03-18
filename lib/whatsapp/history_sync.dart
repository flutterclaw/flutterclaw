import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'binary/jid_utils.dart';
import 'noise/noise_crypto.dart';
import 'proto/wa_proto.pb.dart';

class HistorySyncProcessData {
  final List<Map<String, dynamic>> chats;
  final List<Map<String, dynamic>> contacts;
  final List<Map<String, dynamic>> messages;
  final List<Map<String, String>> lidPnMappings;
  final int? syncType;
  final int? progress;

  const HistorySyncProcessData({
    required this.chats,
    required this.contacts,
    required this.messages,
    required this.lidPnMappings,
    this.syncType,
    this.progress,
  });
}

Future<HistorySyncProcessData> downloadAndProcessHistorySyncNotification(
  Message_HistorySyncNotification msg, {
  Logger? logger,
}) async {
  final sync = msg.initialHistBootstrapInlinePayload.isNotEmpty
      ? _decodeInlineHistory(
          Uint8List.fromList(msg.initialHistBootstrapInlinePayload),
        )
      : await _downloadHistory(msg);
  return processHistorySync(sync, logger: logger);
}

HistorySyncProcessData processHistorySync(
  HistorySync sync, {
  Logger? logger,
}) {
  final chats = <Map<String, dynamic>>[];
  final contacts = <Map<String, dynamic>>[];
  final messages = <Map<String, dynamic>>[];
  final lidPnMappings = <Map<String, String>>[];

  logger?.fine(
    'Processing history sync type=${sync.syncType.name} progress=${sync.progress}',
  );

  for (final mapping in sync.phoneNumberToLidMappings) {
    if (mapping.lidJid.isNotEmpty && mapping.pnJid.isNotEmpty) {
      lidPnMappings.add({'lid': mapping.lidJid, 'pn': mapping.pnJid});
    }
  }

  switch (sync.syncType) {
    case HistorySync_HistorySyncType.INITIAL_BOOTSTRAP:
    case HistorySync_HistorySyncType.RECENT:
    case HistorySync_HistorySyncType.FULL:
    case HistorySync_HistorySyncType.ON_DEMAND:
      for (final chat in sync.conversations) {
        final chatId = chat.id;
        if (chatId.isEmpty) {
          continue;
        }
        final chatMessages = <Map<String, dynamic>>[];

        contacts.add({
          'id': chatId,
          'name': chat.displayName.isNotEmpty
              ? chat.displayName
              : (chat.name.isNotEmpty
                    ? chat.name
                    : (chat.username.isNotEmpty ? chat.username : null)),
          'lid': chat.lidJid.isNotEmpty
              ? chat.lidJid
              : (chat.accountLid.isNotEmpty ? chat.accountLid : null),
          'phoneNumber': chat.pnJid.isNotEmpty ? chat.pnJid : null,
        });

        if ((isLidUser(chatId) || isHostedLidUser(chatId)) &&
            chat.pnJid.isNotEmpty) {
          lidPnMappings.add({'lid': chatId, 'pn': chat.pnJid});
        } else if ((isPnUser(chatId) || isHostedPnUser(chatId)) &&
            chat.lidJid.isNotEmpty) {
          lidPnMappings.add({'lid': chat.lidJid, 'pn': chatId});
        } else if ((isLidUser(chatId) || isHostedLidUser(chatId)) &&
            chat.pnJid.isEmpty) {
          final pnFromReceipt = _extractPnFromMessages(chat.messages);
          if (pnFromReceipt != null) {
            lidPnMappings.add({'lid': chatId, 'pn': pnFromReceipt});
          }
        }

        for (final historyMsg in chat.messages) {
          if (!historyMsg.hasMessage()) {
            continue;
          }
          final json = historyMsg.message.toProto3Json() as Map<String, dynamic>;
          messages.add(json);
          chatMessages.add(json);
        }

        chats.add({
          'id': chatId,
          'name': chat.name.isNotEmpty ? chat.name : null,
          'displayName': chat.displayName.isNotEmpty ? chat.displayName : null,
          'archived': chat.archived,
          'readOnly': chat.readOnly,
          'unreadCount': chat.unreadCount,
          'conversationTimestamp': chat.conversationTimestamp.toInt(),
          'lastMsgTimestamp': chat.lastMsgTimestamp.toInt(),
          'messages': chatMessages.isNotEmpty
              ? [chatMessages.last]
              : const <Map<String, dynamic>>[],
        });
      }
      break;
    case HistorySync_HistorySyncType.PUSH_NAME:
      for (final pushname in sync.pushnames) {
        contacts.add({
          'id': pushname.id,
          'notify': pushname.pushname,
        });
      }
      break;
    default:
      break;
  }

  return HistorySyncProcessData(
    chats: chats,
    contacts: contacts,
    messages: messages,
    lidPnMappings: lidPnMappings,
    syncType: sync.syncType.value,
    progress: sync.hasProgress() ? sync.progress : null,
  );
}

HistorySync _decodeInlineHistory(Uint8List compressed) {
  final inflated = ZLibDecoder().convert(compressed);
  return HistorySync.fromBuffer(inflated);
}

Future<HistorySync> _downloadHistory(
  Message_HistorySyncNotification msg,
) async {
  final directPath = msg.directPath;
  if (directPath.isEmpty || msg.mediaKey.isEmpty) {
    throw StateError('History sync notification missing directPath/mediaKey');
  }

  final path = directPath.startsWith('/') ? directPath : '/$directPath';
  final url = Uri.parse('https://mmg.whatsapp.net$path');
  final response = await http.get(
    url,
    headers: const {'Origin': 'https://web.whatsapp.com'},
  );
  if (response.statusCode < 200 || response.statusCode >= 300) {
    throw StateError(
      'History sync download failed: HTTP ${response.statusCode}',
    );
  }

  final decrypted = await _decryptHistoryBlob(
    blob: Uint8List.fromList(response.bodyBytes),
    mediaKey: Uint8List.fromList(msg.mediaKey),
  );
  final inflated = ZLibDecoder().convert(decrypted);
  return HistorySync.fromBuffer(inflated);
}

Future<Uint8List> _decryptHistoryBlob({
  required Uint8List blob,
  required Uint8List mediaKey,
}) async {
  final expanded = await hkdfExpand(
    mediaKey,
    80,
    salt: Uint8List(32),
    info: Uint8List.fromList('WhatsApp History Keys'.codeUnits),
  );
  final iv = expanded.sublist(0, 16);
  final aesKey = expanded.sublist(16, 48);
  final macKey = expanded.sublist(48, 80);

  if (blob.length < 10) {
    throw StateError('History sync blob too short');
  }

  final encrypted = blob.sublist(0, blob.length - 10);
  final receivedMac = blob.sublist(blob.length - 10);
  final macInput = Uint8List(iv.length + encrypted.length)
    ..setAll(0, iv)
    ..setAll(iv.length, encrypted);
  final expectedMac = (await hmacSha256(macInput, macKey)).sublist(0, 10);
  for (var i = 0; i < 10; i++) {
    if (receivedMac[i] != expectedMac[i]) {
      throw StateError('History sync MAC verification failed');
    }
  }

  return aesDecryptCBC(encrypted, aesKey, iv);
}

String? _extractPnFromMessages(List<HistorySyncMsg> messages) {
  for (final item in messages) {
    if (!item.hasMessage()) {
      continue;
    }
    final message = item.message;
    if (!message.hasKey() || !message.key.fromMe || message.userReceipt.isEmpty) {
      continue;
    }
    final userJid = message.userReceipt.first.userJid;
    if (userJid.isNotEmpty &&
        (isPnUser(userJid) || isHostedPnUser(userJid))) {
      return userJid;
    }
  }
  return null;
}
