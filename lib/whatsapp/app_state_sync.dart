import 'dart:async';
import 'dart:convert';

import 'package:logging/logging.dart';

import 'app_state_processor.dart';
import 'auth/auth_state.dart';
import 'binary/generic_utils.dart';
import 'binary/jid_utils.dart';
import 'binary/types.dart';
import 'messages/message_send.dart' as msg_send;
import 'proto/wa_proto.pb.dart';
import 'socket/wa_socket.dart';
import 'utils/event_emitter.dart';

const allWAPatchNames = <String>[
  'critical_block',
  'critical_unblock_low',
  'regular_high',
  'regular_low',
  'regular',
];

class AppStateSyncManager {
  final WAAuthState authState;
  final WASocket socket;
  final WAEventEmitter ev;
  final Logger logger;
  late final AppStateProcessor _processor;

  Future<void> _syncQueue = Future.value();

  AppStateSyncManager({
    required this.authState,
    required this.socket,
    required this.ev,
    required this.logger,
  }) {
    _processor = AppStateProcessor(
      store: authState.keys,
      logger: logger,
    );
  }

  Future<bool> triggerInitialSync({required String reason}) {
    return triggerCollectionsSync(
      collections: allWAPatchNames,
      reason: reason,
      isInitialSync: true,
    );
  }

  Future<bool> triggerCollectionsSync({
    required Iterable<String> collections,
    required String reason,
    bool isInitialSync = false,
  }) {
    final requested = collections
        .map((name) => name.trim())
        .where((name) => name.isNotEmpty)
        .toSet()
        .toList(growable: false);
    if (requested.isEmpty) {
      return Future.value(true);
    }

    final completer = Completer<bool>();
    _syncQueue = _syncQueue.catchError((_) {}).then((_) async {
      try {
        final result = await _runSync(
          collections: requested,
          reason: reason,
          isInitialSync: isInitialSync,
        );
        if (!completer.isCompleted) {
          completer.complete(result);
        }
      } catch (e, st) {
        logger.warning(
          'App state sync crashed reason=$reason '
          'collections=${requested.join(',')} error=$e\n$st',
        );
        if (!completer.isCompleted) {
          completer.complete(false);
        }
      }
    });
    return completer.future;
  }

  Future<void> handleDirtyNode(BinaryNode dirtyNode) async {
    final type = dirtyNode.attrs['type']?.toString();
    if (type != 'account_sync') {
      return;
    }

    final timestamp = int.tryParse(dirtyNode.attrs['timestamp']?.toString() ?? '');
    final previous = authState.creds.lastAccountSyncTimestamp;
    if (previous != null) {
      await cleanDirtyBits('account_sync', fromTimestamp: previous);
    }
    if (timestamp != null && timestamp > 0) {
      authState.creds.lastAccountSyncTimestamp = timestamp;
      await authState.saveCreds();
      ev.emit('creds.update', {
        'lastAccountSyncTimestamp': timestamp,
      });
      logger.info(
        'Updated lastAccountSyncTimestamp previous=${previous ?? 0} current=$timestamp',
      );
    }
  }

  Future<void> cleanDirtyBits(String type, {int? fromTimestamp}) async {
    logger.info(
      'Cleaning dirty bits type=$type timestamp=${fromTimestamp?.toString() ?? '-'}',
    );
    await socket.sendNode(
      BinaryNode(
        tag: 'iq',
        attrs: {
          'to': '@s.whatsapp.net',
          'type': 'set',
          'xmlns': 'urn:xmpp:whatsapp:dirty',
          'id': 'clean-${DateTime.now().millisecondsSinceEpoch}',
        },
        content: [
          BinaryNode(
            tag: 'clean',
            attrs: {
              'type': type,
              if (fromTimestamp != null) 'timestamp': fromTimestamp.toString(),
            },
          ),
        ],
      ),
    );
  }

  Future<bool> _runSync({
    required Iterable<String> collections,
    required String reason,
    required bool isInitialSync,
  }) async {
    final keyId = authState.creds.myAppStateKeyId;
    if (keyId == null || keyId.isEmpty) {
      logger.info(
        'Skipping app state sync reason=$reason because myAppStateKeyId is missing',
      );
      return false;
    }

    logger.info(
      'Starting app state sync reason=$reason '
      'myAppStateKeyId=$keyId initial=$isInitialSync '
      'collections=${collections.join(',')}',
    );

    var hadFailure = false;
    var syncedCollections = 0;
    await authState.keys.transaction(() async {
      final pending = <String>{...collections};
      final attempts = <String, int>{};

      while (pending.isNotEmpty) {
        final collections = <BinaryNode>[];
        for (final name in pending) {
          final record = await authState.keys.loadAppStateSyncVersion(name);
          final version = record?.version ?? 0;
          collections.add(
            BinaryNode(
              tag: 'collection',
              attrs: {
                'name': name,
                'version': version.toString(),
                'return_snapshot': (version == 0).toString(),
              },
            ),
          );
        }

        final response = await socket.query(
          BinaryNode(
            tag: 'iq',
            attrs: {
              'to': '@s.whatsapp.net',
              'xmlns': 'w:sync:app:state',
              'type': 'set',
            },
            content: [
              BinaryNode(tag: 'sync', attrs: const {}, content: collections),
            ],
          ),
          timeout: const Duration(seconds: 60),
        );

        final syncNode = getBinaryNodeChild(response, 'sync') ?? response;
        final collectionNodes = getBinaryNodeChildren(syncNode, 'collection');
        if (collectionNodes.isEmpty) {
          logger.warning(
            'App state sync response missing collection nodes attrs=${response.attrs}',
          );
          break;
        }

        for (final collectionNode in collectionNodes) {
          final name = collectionNode.attrs['name']?.toString() ?? '';
          if (name.isEmpty) {
            continue;
          }

          bool hasMore = false;
          try {
            final parsed = await _processor.parseCollection(collectionNode);
            final result = await _processor.processCollection(parsed);
            await _applyMutations(parsed.name, result.mutations);

            final latestVersion = result.state.version;
            hasMore = parsed.hasMorePatches;
            logger.info(
              'App state collection synced '
              'name=$name patches=${parsed.patches.length} '
              'hasMore=$hasMore latestVersion=$latestVersion '
              'mutations=${result.mutations.length}',
            );
            syncedCollections += 1;
          } on AppStateMissingKeysException catch (e) {
            hadFailure = true;
            await _requestMissingKeys(
              e.keyIds,
              collection: name,
              reason: reason,
            );
            logger.warning(
              'Failed to process app state collection name=$name '
              'error=$e reason=missing_keys',
            );
          } catch (e) {
            hadFailure = true;
            logger.warning(
              'Failed to process app state collection name=$name error=$e',
            );
          }

          if (hasMore) {
            final attempt = (attempts[name] ?? 0) + 1;
            attempts[name] = attempt;
            if (attempt >= 3) {
              logger.warning(
                'App state collection still has_more_patches after $attempt attempts name=$name',
              );
              pending.remove(name);
            }
          } else {
            pending.remove(name);
          }
        }
      }
    }, 'app-state-sync');

    if (!isInitialSync) {
      if (hadFailure) {
        logger.warning(
          'App state resync incomplete reason=$reason '
          'hadFailure=$hadFailure syncedCollections=$syncedCollections',
        );
        return false;
      }
      logger.info(
        'App state resync complete reason=$reason syncedCollections=$syncedCollections',
      );
      return syncedCollections > 0;
    }

    if (hadFailure || syncedCollections == 0) {
      logger.warning(
        'App state sync incomplete reason=$reason '
        'hadFailure=$hadFailure syncedCollections=$syncedCollections',
      );
      return false;
    }

    authState.creds.accountSyncCounter =
        (authState.creds.accountSyncCounter) + 1;
    await authState.saveCreds();
    ev.emit('creds.update', {
      'accountSyncCounter': authState.creds.accountSyncCounter,
    });
    logger.info(
      'App state sync complete reason=$reason accountSyncCounter=${authState.creds.accountSyncCounter}',
    );
    return true;
  }

  Future<void> _requestMissingKeys(
    Set<String> keyIds, {
    required String collection,
    required String reason,
  }) async {
    final me = authState.creds.me;
    if (me == null || me.id.isEmpty || keyIds.isEmpty) {
      logger.warning(
        'Skipping missing app state key request '
        'collection=$collection reason=$reason '
        'hasMe=${me != null} count=${keyIds.length}',
      );
      return;
    }

    final requestIds = <Message_AppStateSyncKeyId>[];
    for (final keyId in keyIds) {
      try {
        requestIds.add(
          Message_AppStateSyncKeyId(keyId: base64Decode(keyId)),
        );
      } catch (_) {
        logger.warning(
          'Skipping invalid app state key id collection=$collection keyId=$keyId',
        );
      }
    }
    if (requestIds.isEmpty) {
      return;
    }

    final request = Message(
      protocolMessage: Message_ProtocolMessage(
        type: Message_ProtocolMessage_Type.APP_STATE_SYNC_KEY_REQUEST,
        appStateSyncKeyRequest: Message_AppStateSyncKeyRequest(
          keyIds: requestIds,
        ),
      ),
    );

    await msg_send.sendProtoMessage(
      socket: socket,
      store: authState.keys,
      jid: jidNormalizedUser(me.id),
      proto: request,
      additionalAttributes: const {
        'category': 'peer',
        'push_priority': 'high_force',
      },
      additionalNodes: const [
        BinaryNode(
          tag: 'meta',
          attrs: {'appdata': 'default'},
        ),
      ],
    );
    logger.info(
      'Requested missing app state sync keys '
      'collection=$collection reason=$reason '
      'count=${requestIds.length}',
    );
  }

  Future<void> _applyMutations(
    String name,
    List<AppStateMutation> mutations,
  ) async {
    if (mutations.isEmpty) {
      return;
    }

    var me = authState.creds.me;
    final nextSettings = <String, dynamic>{...authState.creds.accountSettings};
    var credsChanged = false;

    for (final mutation in mutations) {
      ev.emit('app-state.mutation', mutation);
      if (mutation.operation != SyncdMutation_SyncdOperation.SET) {
        continue;
      }

      final action = mutation.action;
      if (action.hasPushNameSetting()) {
        final nextName = action.pushNameSetting.name;
        if (me != null && nextName.isNotEmpty && me.name != nextName) {
          me = WAMe(id: me.id, name: nextName, lid: me.lid);
          credsChanged = true;
          logger.info('Applied app state push name update name=$nextName');
        }
      }

      if (action.hasUnarchiveChatsSetting()) {
        final nextValue = action.unarchiveChatsSetting.unarchiveChats;
        if (nextSettings['unarchiveChats'] != nextValue) {
          nextSettings['unarchiveChats'] = nextValue;
          credsChanged = true;
          logger.info(
            'Applied app state unarchiveChats update value=$nextValue collection=$name',
          );
        }
      }
    }

    if (!credsChanged) {
      return;
    }

    authState.creds
      ..me = me
      ..accountSettings = nextSettings;
    await authState.saveCreds();
    ev.emit('creds.update', {
      'me': me?.toJson(),
      'accountSettings': nextSettings,
    });
  }
}
