import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart' as crypto;
import 'package:fixnum/fixnum.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'binary/generic_utils.dart';
import 'binary/types.dart';
import 'media/media_types.dart';
import 'noise/noise_crypto.dart';
import 'proto/wa_proto.pb.dart';
import 'signal/signal_store.dart';

class AppStateExpandedKeys {
  final Uint8List indexKey;
  final Uint8List valueEncryptionKey;
  final Uint8List valueMacKey;
  final Uint8List snapshotMacKey;
  final Uint8List patchMacKey;

  const AppStateExpandedKeys({
    required this.indexKey,
    required this.valueEncryptionKey,
    required this.valueMacKey,
    required this.snapshotMacKey,
    required this.patchMacKey,
  });
}

class AppStateMutation {
  final SyncActionValue action;
  final List<String> index;
  final int version;
  final SyncdMutation_SyncdOperation operation;
  final int patchVersion;
  final Uint8List keyId;
  final Uint8List indexMac;
  final Uint8List valueMac;

  const AppStateMutation({
    required this.action,
    required this.index,
    required this.version,
    required this.operation,
    required this.patchVersion,
    required this.keyId,
    required this.indexMac,
    required this.valueMac,
  });
}

class AppStatePatchList {
  final String name;
  final bool hasMorePatches;
  final List<SyncdPatch> patches;
  final SyncdSnapshot? snapshot;

  const AppStatePatchList({
    required this.name,
    required this.hasMorePatches,
    required this.patches,
    this.snapshot,
  });
}

class AppStateProcessResult {
  final AppStateSyncVersionRecord state;
  final List<AppStateMutation> mutations;

  const AppStateProcessResult({
    required this.state,
    required this.mutations,
  });
}

class AppStateMissingKeysException implements Exception {
  final Set<String> keyIds;

  const AppStateMissingKeysException(this.keyIds);

  @override
  String toString() => 'Missing app state keys: ${keyIds.join(', ')}';
}

class AppStateProcessor {
  final SignalProtocolStore store;
  final Logger logger;
  final Future<Uint8List> Function(ExternalBlobReference ref)? downloadExternal;

  const AppStateProcessor({
    required this.store,
    required this.logger,
    this.downloadExternal,
  });

  Future<AppStatePatchList> parseCollection(BinaryNode collectionNode) async {
    final name = collectionNode.attrs['name']?.toString() ?? '';
    final collectionVersion =
        int.tryParse(collectionNode.attrs['version']?.toString() ?? '') ?? 0;
    final hasMorePatches =
        collectionNode.attrs['has_more_patches']?.toLowerCase() == 'true';

    SyncdSnapshot? snapshot;
    final snapshotNode = getBinaryNodeChild(collectionNode, 'snapshot');
    final snapshotBytes = snapshotNode?.contentBytes;
    if (snapshotBytes != null && snapshotBytes.isNotEmpty) {
      snapshot = await _decodeSnapshotNode(snapshotBytes);
    }

    final patchesParent = getBinaryNodeChild(collectionNode, 'patches');
    final patchNodes = getBinaryNodeChildren(
      patchesParent ?? collectionNode,
      'patch',
    );
    final patches = <SyncdPatch>[];
    for (final patchNode in patchNodes) {
      final bytes = patchNode.contentBytes;
      if (bytes == null || bytes.isEmpty) {
        continue;
      }

      final patch = SyncdPatch.fromBuffer(bytes);
      if (!patch.hasVersion()) {
        patch.version = SyncdVersion(version: Int64(collectionVersion + 1));
      }

      if (patch.hasExternalMutations()) {
        final downloader = downloadExternal ?? _downloadExternalBlob;
        final blob = await downloader(patch.externalMutations);
        final decoded = SyncdMutations.fromBuffer(blob);
        patch.mutations.addAll(decoded.mutations);
      }

      patches.add(patch);
    }

    return AppStatePatchList(
      name: name,
      hasMorePatches: hasMorePatches,
      patches: patches,
      snapshot: snapshot,
    );
  }

  Future<AppStateProcessResult> processCollection(
    AppStatePatchList list, {
    bool validateMacs = true,
  }) async {
    var currentState =
        await store.loadAppStateSyncVersion(list.name) ??
        AppStateSyncVersionRecord.empty();
    final mutations = <AppStateMutation>[];

    if (list.snapshot != null) {
      final snapshotResult = await _decodeSnapshot(
        name: list.name,
        snapshot: list.snapshot!,
        validateMacs: validateMacs,
      );
      currentState = snapshotResult.state;
      mutations.addAll(snapshotResult.mutations);
    }

    for (final patch in list.patches) {
      final patchResult = await _decodePatch(
        name: list.name,
        patch: patch,
        currentState: currentState,
        validateMacs: validateMacs,
      );
      currentState = patchResult.state;
      mutations.addAll(patchResult.mutations);
    }

    await store.storeAppStateSyncVersion(list.name, currentState);
    return AppStateProcessResult(state: currentState, mutations: mutations);
  }

  Future<SyncdSnapshot?> _decodeSnapshotNode(Uint8List bytes) async {
    try {
      final snapshot = SyncdSnapshot.fromBuffer(bytes);
      if (snapshot.hasVersion() ||
          snapshot.records.isNotEmpty ||
          snapshot.hasKeyId() ||
          snapshot.mac.isNotEmpty) {
        return snapshot;
      }
    } catch (_) {
    }
    final downloader = downloadExternal ?? _downloadExternalBlob;
    final ref = ExternalBlobReference.fromBuffer(bytes);
    final blob = await downloader(ref);
    return SyncdSnapshot.fromBuffer(blob);
  }

  Future<AppStateProcessResult> _decodeSnapshot({
    required String name,
    required SyncdSnapshot snapshot,
    required bool validateMacs,
  }) async {
    var state = AppStateSyncVersionRecord.empty().copyWith(
      version: snapshot.hasVersion() ? snapshot.version.version.toInt() : 0,
    );

    final hash = Uint8List.fromList(state.hash);
    final indexValueMap = <String, String>{};
    for (final record in snapshot.records) {
      final indexMac = _requireBytes(
        record.hasIndex() ? record.index.blob : null,
        'snapshot index',
      );
      final valueMac = _extractValueMac(record.value.blob);
      await _applyHashMutation(
        hash: hash,
        indexValueMap: indexValueMap,
        operation: SyncdMutation_SyncdOperation.SET,
        indexMac: indexMac,
        valueMac: valueMac,
      );
    }

    state = state.copyWith(hash: hash, indexValueMap: indexValueMap);
    if (validateMacs) {
      final key = await _loadExpandedKeys(
        _requireBytes(
          snapshot.hasKeyId() ? snapshot.keyId.id : null,
          'snapshot key id',
        ),
      );
      final expected = await _generateSnapshotMac(
        hash: state.hash,
        version: state.version,
        name: name,
        key: key.snapshotMacKey,
      );
      if (!_bytesEqual(expected, snapshot.mac)) {
        throw StateError(
          'Failed to verify app state snapshot MAC for $name v${state.version}',
        );
      }
    }

    final mutations = <AppStateMutation>[];
    for (final record in snapshot.records) {
      final mutation = SyncdMutation(
        operation: SyncdMutation_SyncdOperation.SET,
        record: record,
      );
      mutations.add(
        await _decodeMutation(
          mutation: mutation,
          patchVersion: state.version,
          validateMacs: validateMacs,
        ),
      );
    }

    return AppStateProcessResult(state: state, mutations: mutations);
  }

  Future<AppStateProcessResult> _decodePatch({
    required String name,
    required SyncdPatch patch,
    required AppStateSyncVersionRecord currentState,
    required bool validateMacs,
  }) async {
    final version = patch.hasVersion() ? patch.version.version.toInt() : 0;
    final hash = Uint8List.fromList(currentState.hash);
    final indexValueMap = <String, String>{...currentState.indexValueMap};
    final patchValueMacs = <Uint8List>[];

    for (final mutation in patch.mutations) {
      final operation = mutation.hasOperation()
          ? mutation.operation
          : SyncdMutation_SyncdOperation.SET;
      final record = mutation.record;
      final indexMac = _requireBytes(
        record.hasIndex() ? record.index.blob : null,
        'patch index',
      );
      final valueMac = _extractValueMac(record.value.blob);
      patchValueMacs.add(valueMac);
      await _applyHashMutation(
        hash: hash,
        indexValueMap: indexValueMap,
        operation: operation,
        indexMac: indexMac,
        valueMac: valueMac,
      );
    }

    final nextState = currentState.copyWith(
      version: version,
      hash: hash,
      indexValueMap: indexValueMap,
    );

    if (validateMacs) {
      final key = await _loadExpandedKeys(
        _requireBytes(
          patch.hasKeyId() ? patch.keyId.id : null,
          'patch key id',
        ),
      );
      final expectedSnapshotMac = await _generateSnapshotMac(
        hash: nextState.hash,
        version: nextState.version,
        name: name,
        key: key.snapshotMacKey,
      );
      if (!_bytesEqual(expectedSnapshotMac, patch.snapshotMac)) {
        throw StateError(
          'Failed to verify app state snapshot MAC for $name v${nextState.version}',
        );
      }

      final expectedPatchMac = await _generatePatchMac(
        snapshotMac: Uint8List.fromList(patch.snapshotMac),
        valueMacs: patchValueMacs,
        version: nextState.version,
        name: name,
        key: key.patchMacKey,
      );
      if (!_bytesEqual(expectedPatchMac, patch.patchMac)) {
        throw StateError(
          'Failed to verify app state patch MAC for $name v${nextState.version}',
        );
      }
    }

    final mutations = <AppStateMutation>[];
    for (final mutation in patch.mutations) {
      mutations.add(
        await _decodeMutation(
          mutation: mutation,
          patchVersion: nextState.version,
          validateMacs: validateMacs,
        ),
      );
    }

    return AppStateProcessResult(state: nextState, mutations: mutations);
  }

  Future<AppStateMutation> _decodeMutation({
    required SyncdMutation mutation,
    required int patchVersion,
    required bool validateMacs,
  }) async {
    final record = mutation.record;
    final operation = mutation.hasOperation()
        ? mutation.operation
        : SyncdMutation_SyncdOperation.SET;
    final keyId = _requireBytes(
      record.hasKeyId() ? record.keyId.id : null,
      'mutation key id',
    );
    final key = await _loadExpandedKeys(keyId);
    final valueBlob = _requireBytes(
      record.hasValue() ? record.value.blob : null,
      'mutation value',
    );
    if (valueBlob.length < 32) {
      throw StateError('Mutation value blob too short for MAC');
    }

    final encrypted = valueBlob.sublist(0, valueBlob.length - 32);
    final valueMac = valueBlob.sublist(valueBlob.length - 32);
    if (validateMacs) {
      final expectedValueMac = await _generateContentMac(
        operation: operation,
        data: encrypted,
        keyId: keyId,
        key: key.valueMacKey,
      );
      if (!_bytesEqual(expectedValueMac, valueMac)) {
        throw StateError('Failed to verify app state mutation content MAC');
      }
    }

    if (encrypted.length < 16) {
      throw StateError('Mutation ciphertext too short for IV');
    }
    final iv = encrypted.sublist(0, 16);
    final ciphertext = encrypted.sublist(16);
    final plaintext = aesDecryptCBC(
      ciphertext,
      key.valueEncryptionKey,
      iv,
    );
    final syncAction = SyncActionData.fromBuffer(plaintext);
    final indexMac = _requireBytes(
      record.hasIndex() ? record.index.blob : null,
      'mutation index',
    );
    if (validateMacs) {
      final expectedIndexMac = await hmacSha256(
        Uint8List.fromList(syncAction.index),
        key.indexKey,
      );
      if (!_bytesEqual(expectedIndexMac, indexMac)) {
        throw StateError('Failed to verify app state mutation index MAC');
      }
    }

    final decodedIndex = jsonDecode(utf8.decode(syncAction.index));
    final index = decodedIndex is List
        ? decodedIndex.map((entry) => entry.toString()).toList()
        : <String>[decodedIndex.toString()];

    return AppStateMutation(
      action: syncAction.value,
      index: index,
      version: syncAction.version,
      operation: operation,
      patchVersion: patchVersion,
      keyId: keyId,
      indexMac: indexMac,
      valueMac: valueMac,
    );
  }

  Future<AppStateExpandedKeys> _loadExpandedKeys(
    Uint8List rawKeyId,
  ) async {
    final keyId = base64Encode(rawKeyId);
    final keyData = await store.loadAppStateSyncKey(keyId);
    if (keyData == null || !keyData.hasKeyData()) {
      throw AppStateMissingKeysException({keyId});
    }

    final expanded = await hkdfExpand(
      Uint8List.fromList(keyData.keyData),
      160,
      salt: Uint8List(0),
      info: Uint8List.fromList('WhatsApp Mutation Keys'.codeUnits),
    );
    return AppStateExpandedKeys(
      indexKey: expanded.sublist(0, 32),
      valueEncryptionKey: expanded.sublist(32, 64),
      valueMacKey: expanded.sublist(64, 96),
      snapshotMacKey: expanded.sublist(96, 128),
      patchMacKey: expanded.sublist(128, 160),
    );
  }

  Future<void> _applyHashMutation({
    required Uint8List hash,
    required Map<String, String> indexValueMap,
    required SyncdMutation_SyncdOperation operation,
    required Uint8List indexMac,
    required Uint8List valueMac,
  }) async {
    final indexKey = base64Encode(indexMac);
    final previous = indexValueMap[indexKey];
    final subtract = <Uint8List>[];
    final add = <Uint8List>[];

    if (previous != null && previous.isNotEmpty) {
      subtract.add(base64Decode(previous));
    }

    if (operation == SyncdMutation_SyncdOperation.REMOVE) {
      indexValueMap.remove(indexKey);
    } else {
      add.add(valueMac);
      indexValueMap[indexKey] = base64Encode(valueMac);
    }

    await _subtractThenAddInPlace(hash, subtract: subtract, add: add);
  }

  Future<void> _subtractThenAddInPlace(
    Uint8List base, {
    required List<Uint8List> subtract,
    required List<Uint8List> add,
  }) async {
    for (final item in subtract) {
      await _pointwiseHashOp(
        base,
        item,
        subtract: true,
      );
    }
    for (final item in add) {
      await _pointwiseHashOp(
        base,
        item,
        subtract: false,
      );
    }
  }

  Future<void> _pointwiseHashOp(
    Uint8List base,
    Uint8List item, {
    required bool subtract,
  }) async {
    final digest = await hkdfExpand(
      item,
      128,
      salt: Uint8List(0),
      info: Uint8List.fromList('WhatsApp Patch Integrity'.codeUnits),
    );
    for (var i = 0; i < base.length; i += 2) {
      final x = base[i] | (base[i + 1] << 8);
      final y = digest[i] | (digest[i + 1] << 8);
      final result = subtract ? ((x - y) & 0xFFFF) : ((x + y) & 0xFFFF);
      base[i] = result & 0xFF;
      base[i + 1] = (result >> 8) & 0xFF;
    }
  }

  Future<Uint8List> _generateSnapshotMac({
    required Uint8List hash,
    required int version,
    required String name,
    required Uint8List key,
  }) async {
    final total = BytesBuilder(copy: false)
      ..add(hash)
      ..add(_toUint64Bytes(version))
      ..add(utf8.encode(name));
    return hmacSha256(total.takeBytes(), key);
  }

  Future<Uint8List> _generatePatchMac({
    required Uint8List snapshotMac,
    required List<Uint8List> valueMacs,
    required int version,
    required String name,
    required Uint8List key,
  }) async {
    final total = BytesBuilder(copy: false)
      ..add(snapshotMac);
    for (final mac in valueMacs) {
      total.add(mac);
    }
    total
      ..add(_toUint64Bytes(version))
      ..add(utf8.encode(name));
    return hmacSha256(total.takeBytes(), key);
  }

  Future<Uint8List> _generateContentMac({
    required SyncdMutation_SyncdOperation operation,
    required Uint8List data,
    required Uint8List keyId,
    required Uint8List key,
  }) async {
    final keyDataLength = _toUint64Bytes(keyId.length + 1);
    final payload = BytesBuilder(copy: false)
      ..add([operation == SyncdMutation_SyncdOperation.SET ? 0x01 : 0x02])
      ..add(keyId)
      ..add(data)
      ..add(keyDataLength);
    final mac = await _hmacSha512(payload.takeBytes(), key);
    return mac.sublist(0, 32);
  }

  Future<Uint8List> _downloadExternalBlob(
    ExternalBlobReference ref,
  ) async {
    final directPath = ref.directPath;
    if (directPath.isEmpty) {
      throw StateError('External app state blob is missing directPath');
    }

    final url = directPath.startsWith('http')
        ? directPath
        : 'https://mmg.whatsapp.net$directPath';
    final response = await http.get(
      Uri.parse(url),
      headers: {'Origin': 'https://web.whatsapp.com'},
    );
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw StateError(
        'Failed to download external app state blob: HTTP ${response.statusCode}',
      );
    }

    return _decryptExternalBlob(
      blob: Uint8List.fromList(response.bodyBytes),
      mediaKey: Uint8List.fromList(ref.mediaKey),
    );
  }

  Future<Uint8List> _decryptExternalBlob({
    required Uint8List blob,
    required Uint8List mediaKey,
  }) async {
    final info =
        mediaKeyInfo['md-app-state'] ?? 'WhatsApp App State Keys';
    final expanded = await hkdfExpand(
      mediaKey,
      80,
      salt: Uint8List(32),
      info: Uint8List.fromList(info.codeUnits),
    );
    final iv = expanded.sublist(0, 16);
    final aesKey = expanded.sublist(16, 48);
    final macKey = expanded.sublist(48, 80);
    if (blob.length < 10) {
      throw StateError('External app state blob too short');
    }

    final encrypted = blob.sublist(0, blob.length - 10);
    final receivedMac = blob.sublist(blob.length - 10);
    final macInput = Uint8List(iv.length + encrypted.length)
      ..setAll(0, iv)
      ..setAll(iv.length, encrypted);
    final expectedMac = (await hmacSha256(macInput, macKey)).sublist(0, 10);
    if (!_bytesEqual(expectedMac, receivedMac)) {
      throw StateError('External app state blob MAC verification failed');
    }

    return aesDecryptCBC(encrypted, aesKey, iv);
  }

  Uint8List _extractValueMac(List<int> blob) {
    if (blob.length < 32) {
      throw StateError('App state mutation blob too short for value MAC');
    }
    return Uint8List.fromList(blob.sublist(blob.length - 32));
  }

  Uint8List _requireBytes(List<int>? bytes, String label) {
    if (bytes == null || bytes.isEmpty) {
      throw StateError('Missing $label bytes');
    }
    return Uint8List.fromList(bytes);
  }

  Uint8List _toUint64Bytes(int value) {
    final out = Uint8List(8);
    final byteData = ByteData.sublistView(out);
    byteData.setUint64(0, value, Endian.big);
    return out;
  }

  Future<Uint8List> _hmacSha512(Uint8List data, Uint8List key) async {
    final algorithm = crypto.Hmac.sha512();
    final mac = await algorithm.calculateMac(
      data,
      secretKey: crypto.SecretKey(key),
    );
    return Uint8List.fromList(mac.bytes);
  }

  bool _bytesEqual(List<int> a, List<int> b) {
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }
}
