///
//  Generated code. Do not modify.
//  source: wa_proto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use aDVEncryptionTypeDescriptor instead')
const ADVEncryptionType$json = const {
  '1': 'ADVEncryptionType',
  '2': const [
    const {'1': 'E2EE', '2': 0},
    const {'1': 'HOSTED', '2': 1},
  ],
};

/// Descriptor for `ADVEncryptionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List aDVEncryptionTypeDescriptor = $convert.base64Decode('ChFBRFZFbmNyeXB0aW9uVHlwZRIICgRFMkVFEAASCgoGSE9TVEVEEAE=');
@$core.Deprecated('Use aIRichResponseMessageTypeDescriptor instead')
const AIRichResponseMessageType$json = const {
  '1': 'AIRichResponseMessageType',
  '2': const [
    const {'1': 'AI_RICH_RESPONSE_TYPE_UNKNOWN', '2': 0},
    const {'1': 'AI_RICH_RESPONSE_TYPE_STANDARD', '2': 1},
  ],
};

/// Descriptor for `AIRichResponseMessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List aIRichResponseMessageTypeDescriptor = $convert.base64Decode('ChlBSVJpY2hSZXNwb25zZU1lc3NhZ2VUeXBlEiEKHUFJX1JJQ0hfUkVTUE9OU0VfVFlQRV9VTktOT1dOEAASIgoeQUlfUklDSF9SRVNQT05TRV9UWVBFX1NUQU5EQVJEEAE=');
@$core.Deprecated('Use aIRichResponseSubMessageTypeDescriptor instead')
const AIRichResponseSubMessageType$json = const {
  '1': 'AIRichResponseSubMessageType',
  '2': const [
    const {'1': 'AI_RICH_RESPONSE_UNKNOWN', '2': 0},
    const {'1': 'AI_RICH_RESPONSE_GRID_IMAGE', '2': 1},
    const {'1': 'AI_RICH_RESPONSE_TEXT', '2': 2},
    const {'1': 'AI_RICH_RESPONSE_INLINE_IMAGE', '2': 3},
    const {'1': 'AI_RICH_RESPONSE_TABLE', '2': 4},
    const {'1': 'AI_RICH_RESPONSE_CODE', '2': 5},
    const {'1': 'AI_RICH_RESPONSE_DYNAMIC', '2': 6},
    const {'1': 'AI_RICH_RESPONSE_MAP', '2': 7},
    const {'1': 'AI_RICH_RESPONSE_LATEX', '2': 8},
    const {'1': 'AI_RICH_RESPONSE_CONTENT_ITEMS', '2': 9},
  ],
};

/// Descriptor for `AIRichResponseSubMessageType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List aIRichResponseSubMessageTypeDescriptor = $convert.base64Decode('ChxBSVJpY2hSZXNwb25zZVN1Yk1lc3NhZ2VUeXBlEhwKGEFJX1JJQ0hfUkVTUE9OU0VfVU5LTk9XThAAEh8KG0FJX1JJQ0hfUkVTUE9OU0VfR1JJRF9JTUFHRRABEhkKFUFJX1JJQ0hfUkVTUE9OU0VfVEVYVBACEiEKHUFJX1JJQ0hfUkVTUE9OU0VfSU5MSU5FX0lNQUdFEAMSGgoWQUlfUklDSF9SRVNQT05TRV9UQUJMRRAEEhkKFUFJX1JJQ0hfUkVTUE9OU0VfQ09ERRAFEhwKGEFJX1JJQ0hfUkVTUE9OU0VfRFlOQU1JQxAGEhgKFEFJX1JJQ0hfUkVTUE9OU0VfTUFQEAcSGgoWQUlfUklDSF9SRVNQT05TRV9MQVRFWBAIEiIKHkFJX1JJQ0hfUkVTUE9OU0VfQ09OVEVOVF9JVEVNUxAJ');
@$core.Deprecated('Use botMetricsEntryPointDescriptor instead')
const BotMetricsEntryPoint$json = const {
  '1': 'BotMetricsEntryPoint',
  '2': const [
    const {'1': 'UNDEFINED_ENTRY_POINT', '2': 0},
    const {'1': 'FAVICON', '2': 1},
    const {'1': 'CHATLIST', '2': 2},
    const {'1': 'AISEARCH_NULL_STATE_PAPER_PLANE', '2': 3},
    const {'1': 'AISEARCH_NULL_STATE_SUGGESTION', '2': 4},
    const {'1': 'AISEARCH_TYPE_AHEAD_SUGGESTION', '2': 5},
    const {'1': 'AISEARCH_TYPE_AHEAD_PAPER_PLANE', '2': 6},
    const {'1': 'AISEARCH_TYPE_AHEAD_RESULT_CHATLIST', '2': 7},
    const {'1': 'AISEARCH_TYPE_AHEAD_RESULT_MESSAGES', '2': 8},
    const {'1': 'AIVOICE_SEARCH_BAR', '2': 9},
    const {'1': 'AIVOICE_FAVICON', '2': 10},
    const {'1': 'AISTUDIO', '2': 11},
    const {'1': 'DEEPLINK', '2': 12},
    const {'1': 'NOTIFICATION', '2': 13},
    const {'1': 'PROFILE_MESSAGE_BUTTON', '2': 14},
    const {'1': 'FORWARD', '2': 15},
    const {'1': 'APP_SHORTCUT', '2': 16},
    const {'1': 'FF_FAMILY', '2': 17},
    const {'1': 'AI_TAB', '2': 18},
    const {'1': 'AI_HOME', '2': 19},
    const {'1': 'AI_DEEPLINK_IMMERSIVE', '2': 20},
    const {'1': 'AI_DEEPLINK', '2': 21},
    const {'1': 'META_AI_CHAT_SHORTCUT_AI_STUDIO', '2': 22},
    const {'1': 'UGC_CHAT_SHORTCUT_AI_STUDIO', '2': 23},
    const {'1': 'NEW_CHAT_AI_STUDIO', '2': 24},
    const {'1': 'AIVOICE_FAVICON_CALL_HISTORY', '2': 25},
    const {'1': 'ASK_META_AI_CONTEXT_MENU', '2': 26},
    const {'1': 'ASK_META_AI_CONTEXT_MENU_1ON1', '2': 27},
    const {'1': 'ASK_META_AI_CONTEXT_MENU_GROUP', '2': 28},
    const {'1': 'INVOKE_META_AI_1ON1', '2': 29},
    const {'1': 'INVOKE_META_AI_GROUP', '2': 30},
    const {'1': 'META_AI_FORWARD', '2': 31},
    const {'1': 'NEW_CHAT_AI_CONTACT', '2': 32},
    const {'1': 'MESSAGE_QUICK_ACTION_1_ON_1_CHAT', '2': 33},
    const {'1': 'MESSAGE_QUICK_ACTION_GROUP_CHAT', '2': 34},
    const {'1': 'ATTACHMENT_TRAY_1_ON_1_CHAT', '2': 35},
    const {'1': 'ATTACHMENT_TRAY_GROUP_CHAT', '2': 36},
    const {'1': 'ASK_META_AI_MEDIA_VIEWER_1ON1', '2': 37},
    const {'1': 'ASK_META_AI_MEDIA_VIEWER_GROUP', '2': 38},
  ],
};

/// Descriptor for `BotMetricsEntryPoint`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List botMetricsEntryPointDescriptor = $convert.base64Decode('ChRCb3RNZXRyaWNzRW50cnlQb2ludBIZChVVTkRFRklORURfRU5UUllfUE9JTlQQABILCgdGQVZJQ09OEAESDAoIQ0hBVExJU1QQAhIjCh9BSVNFQVJDSF9OVUxMX1NUQVRFX1BBUEVSX1BMQU5FEAMSIgoeQUlTRUFSQ0hfTlVMTF9TVEFURV9TVUdHRVNUSU9OEAQSIgoeQUlTRUFSQ0hfVFlQRV9BSEVBRF9TVUdHRVNUSU9OEAUSIwofQUlTRUFSQ0hfVFlQRV9BSEVBRF9QQVBFUl9QTEFORRAGEicKI0FJU0VBUkNIX1RZUEVfQUhFQURfUkVTVUxUX0NIQVRMSVNUEAcSJwojQUlTRUFSQ0hfVFlQRV9BSEVBRF9SRVNVTFRfTUVTU0FHRVMQCBIWChJBSVZPSUNFX1NFQVJDSF9CQVIQCRITCg9BSVZPSUNFX0ZBVklDT04QChIMCghBSVNUVURJTxALEgwKCERFRVBMSU5LEAwSEAoMTk9USUZJQ0FUSU9OEA0SGgoWUFJPRklMRV9NRVNTQUdFX0JVVFRPThAOEgsKB0ZPUldBUkQQDxIQCgxBUFBfU0hPUlRDVVQQEBINCglGRl9GQU1JTFkQERIKCgZBSV9UQUIQEhILCgdBSV9IT01FEBMSGQoVQUlfREVFUExJTktfSU1NRVJTSVZFEBQSDwoLQUlfREVFUExJTksQFRIjCh9NRVRBX0FJX0NIQVRfU0hPUlRDVVRfQUlfU1RVRElPEBYSHwobVUdDX0NIQVRfU0hPUlRDVVRfQUlfU1RVRElPEBcSFgoSTkVXX0NIQVRfQUlfU1RVRElPEBgSIAocQUlWT0lDRV9GQVZJQ09OX0NBTExfSElTVE9SWRAZEhwKGEFTS19NRVRBX0FJX0NPTlRFWFRfTUVOVRAaEiEKHUFTS19NRVRBX0FJX0NPTlRFWFRfTUVOVV8xT04xEBsSIgoeQVNLX01FVEFfQUlfQ09OVEVYVF9NRU5VX0dST1VQEBwSFwoTSU5WT0tFX01FVEFfQUlfMU9OMRAdEhgKFElOVk9LRV9NRVRBX0FJX0dST1VQEB4SEwoPTUVUQV9BSV9GT1JXQVJEEB8SFwoTTkVXX0NIQVRfQUlfQ09OVEFDVBAgEiQKIE1FU1NBR0VfUVVJQ0tfQUNUSU9OXzFfT05fMV9DSEFUECESIwofTUVTU0FHRV9RVUlDS19BQ1RJT05fR1JPVVBfQ0hBVBAiEh8KG0FUVEFDSE1FTlRfVFJBWV8xX09OXzFfQ0hBVBAjEh4KGkFUVEFDSE1FTlRfVFJBWV9HUk9VUF9DSEFUECQSIQodQVNLX01FVEFfQUlfTUVESUFfVklFV0VSXzFPTjEQJRIiCh5BU0tfTUVUQV9BSV9NRURJQV9WSUVXRVJfR1JPVVAQJg==');
@$core.Deprecated('Use botMetricsThreadEntryPointDescriptor instead')
const BotMetricsThreadEntryPoint$json = const {
  '1': 'BotMetricsThreadEntryPoint',
  '2': const [
    const {'1': 'UNKNOWN_BOTMETRICSTHREADENTRYPOINT_ZERO', '2': 0},
    const {'1': 'AI_TAB_THREAD', '2': 1},
    const {'1': 'AI_HOME_THREAD', '2': 2},
    const {'1': 'AI_DEEPLINK_IMMERSIVE_THREAD', '2': 3},
    const {'1': 'AI_DEEPLINK_THREAD', '2': 4},
    const {'1': 'ASK_META_AI_CONTEXT_MENU_THREAD', '2': 5},
  ],
};

/// Descriptor for `BotMetricsThreadEntryPoint`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List botMetricsThreadEntryPointDescriptor = $convert.base64Decode('ChpCb3RNZXRyaWNzVGhyZWFkRW50cnlQb2ludBIrCidVTktOT1dOX0JPVE1FVFJJQ1NUSFJFQURFTlRSWVBPSU5UX1pFUk8QABIRCg1BSV9UQUJfVEhSRUFEEAESEgoOQUlfSE9NRV9USFJFQUQQAhIgChxBSV9ERUVQTElOS19JTU1FUlNJVkVfVEhSRUFEEAMSFgoSQUlfREVFUExJTktfVEhSRUFEEAQSIwofQVNLX01FVEFfQUlfQ09OVEVYVF9NRU5VX1RIUkVBRBAF');
@$core.Deprecated('Use botSessionSourceDescriptor instead')
const BotSessionSource$json = const {
  '1': 'BotSessionSource',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'NULL_STATE', '2': 1},
    const {'1': 'TYPEAHEAD', '2': 2},
    const {'1': 'USER_INPUT', '2': 3},
    const {'1': 'EMU_FLASH', '2': 4},
    const {'1': 'EMU_FLASH_FOLLOWUP', '2': 5},
    const {'1': 'VOICE', '2': 6},
  ],
};

/// Descriptor for `BotSessionSource`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List botSessionSourceDescriptor = $convert.base64Decode('ChBCb3RTZXNzaW9uU291cmNlEggKBE5PTkUQABIOCgpOVUxMX1NUQVRFEAESDQoJVFlQRUFIRUFEEAISDgoKVVNFUl9JTlBVVBADEg0KCUVNVV9GTEFTSBAEEhYKEkVNVV9GTEFTSF9GT0xMT1dVUBAFEgkKBVZPSUNFEAY=');
@$core.Deprecated('Use collectionNameDescriptor instead')
const CollectionName$json = const {
  '1': 'CollectionName',
  '2': const [
    const {'1': 'COLLECTION_NAME_UNKNOWN', '2': 0},
    const {'1': 'REGULAR', '2': 1},
    const {'1': 'REGULAR_LOW', '2': 2},
    const {'1': 'REGULAR_HIGH', '2': 3},
    const {'1': 'CRITICAL_BLOCK', '2': 4},
    const {'1': 'CRITICAL_UNBLOCK_LOW', '2': 5},
  ],
};

/// Descriptor for `CollectionName`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List collectionNameDescriptor = $convert.base64Decode('Cg5Db2xsZWN0aW9uTmFtZRIbChdDT0xMRUNUSU9OX05BTUVfVU5LTk9XThAAEgsKB1JFR1VMQVIQARIPCgtSRUdVTEFSX0xPVxACEhAKDFJFR1VMQVJfSElHSBADEhIKDkNSSVRJQ0FMX0JMT0NLEAQSGAoUQ1JJVElDQUxfVU5CTE9DS19MT1cQBQ==');
@$core.Deprecated('Use keepTypeDescriptor instead')
const KeepType$json = const {
  '1': 'KeepType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'KEEP_FOR_ALL', '2': 1},
    const {'1': 'UNDO_KEEP_FOR_ALL', '2': 2},
  ],
};

/// Descriptor for `KeepType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List keepTypeDescriptor = $convert.base64Decode('CghLZWVwVHlwZRILCgdVTktOT1dOEAASEAoMS0VFUF9GT1JfQUxMEAESFQoRVU5ET19LRUVQX0ZPUl9BTEwQAg==');
@$core.Deprecated('Use mediaVisibilityDescriptor instead')
const MediaVisibility$json = const {
  '1': 'MediaVisibility',
  '2': const [
    const {'1': 'DEFAULT', '2': 0},
    const {'1': 'OFF', '2': 1},
    const {'1': 'ON', '2': 2},
  ],
};

/// Descriptor for `MediaVisibility`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mediaVisibilityDescriptor = $convert.base64Decode('Cg9NZWRpYVZpc2liaWxpdHkSCwoHREVGQVVMVBAAEgcKA09GRhABEgYKAk9OEAI=');
@$core.Deprecated('Use mutationPropsDescriptor instead')
const MutationProps$json = const {
  '1': 'MutationProps',
  '2': const [
    const {'1': 'UNKNOWN_MUTATIONPROPS_ZERO', '2': 0},
    const {'1': 'STAR_ACTION', '2': 2},
    const {'1': 'CONTACT_ACTION', '2': 3},
    const {'1': 'MUTE_ACTION', '2': 4},
    const {'1': 'PIN_ACTION', '2': 5},
    const {'1': 'SECURITY_NOTIFICATION_SETTING', '2': 6},
    const {'1': 'PUSH_NAME_SETTING', '2': 7},
    const {'1': 'QUICK_REPLY_ACTION', '2': 8},
    const {'1': 'RECENT_EMOJI_WEIGHTS_ACTION', '2': 11},
    const {'1': 'LABEL_MESSAGE_ACTION', '2': 13},
    const {'1': 'LABEL_EDIT_ACTION', '2': 14},
    const {'1': 'LABEL_ASSOCIATION_ACTION', '2': 15},
    const {'1': 'LOCALE_SETTING', '2': 16},
    const {'1': 'ARCHIVE_CHAT_ACTION', '2': 17},
    const {'1': 'DELETE_MESSAGE_FOR_ME_ACTION', '2': 18},
    const {'1': 'KEY_EXPIRATION', '2': 19},
    const {'1': 'MARK_CHAT_AS_READ_ACTION', '2': 20},
    const {'1': 'CLEAR_CHAT_ACTION', '2': 21},
    const {'1': 'DELETE_CHAT_ACTION', '2': 22},
    const {'1': 'UNARCHIVE_CHATS_SETTING', '2': 23},
    const {'1': 'PRIMARY_FEATURE', '2': 24},
    const {'1': 'ANDROID_UNSUPPORTED_ACTIONS', '2': 26},
    const {'1': 'AGENT_ACTION', '2': 27},
    const {'1': 'SUBSCRIPTION_ACTION', '2': 28},
    const {'1': 'USER_STATUS_MUTE_ACTION', '2': 29},
    const {'1': 'TIME_FORMAT_ACTION', '2': 30},
    const {'1': 'NUX_ACTION', '2': 31},
    const {'1': 'PRIMARY_VERSION_ACTION', '2': 32},
    const {'1': 'STICKER_ACTION', '2': 33},
    const {'1': 'REMOVE_RECENT_STICKER_ACTION', '2': 34},
    const {'1': 'CHAT_ASSIGNMENT', '2': 35},
    const {'1': 'CHAT_ASSIGNMENT_OPENED_STATUS', '2': 36},
    const {'1': 'PN_FOR_LID_CHAT_ACTION', '2': 37},
    const {'1': 'MARKETING_MESSAGE_ACTION', '2': 38},
    const {'1': 'MARKETING_MESSAGE_BROADCAST_ACTION', '2': 39},
    const {'1': 'EXTERNAL_WEB_BETA_ACTION', '2': 40},
    const {'1': 'PRIVACY_SETTING_RELAY_ALL_CALLS', '2': 41},
    const {'1': 'CALL_LOG_ACTION', '2': 42},
    const {'1': 'UGC_BOT', '2': 43},
    const {'1': 'STATUS_PRIVACY', '2': 44},
    const {'1': 'BOT_WELCOME_REQUEST_ACTION', '2': 45},
    const {'1': 'DELETE_INDIVIDUAL_CALL_LOG', '2': 46},
    const {'1': 'LABEL_REORDERING_ACTION', '2': 47},
    const {'1': 'PAYMENT_INFO_ACTION', '2': 48},
    const {'1': 'CUSTOM_PAYMENT_METHODS_ACTION', '2': 49},
    const {'1': 'LOCK_CHAT_ACTION', '2': 50},
    const {'1': 'CHAT_LOCK_SETTINGS', '2': 51},
    const {'1': 'WAMO_USER_IDENTIFIER_ACTION', '2': 52},
    const {'1': 'PRIVACY_SETTING_DISABLE_LINK_PREVIEWS_ACTION', '2': 53},
    const {'1': 'DEVICE_CAPABILITIES', '2': 54},
    const {'1': 'NOTE_EDIT_ACTION', '2': 55},
    const {'1': 'FAVORITES_ACTION', '2': 56},
    const {'1': 'MERCHANT_PAYMENT_PARTNER_ACTION', '2': 57},
    const {'1': 'WAFFLE_ACCOUNT_LINK_STATE_ACTION', '2': 58},
    const {'1': 'USERNAME_CHAT_START_MODE', '2': 59},
    const {'1': 'NOTIFICATION_ACTIVITY_SETTING_ACTION', '2': 60},
    const {'1': 'LID_CONTACT_ACTION', '2': 61},
    const {'1': 'CTWA_PER_CUSTOMER_DATA_SHARING_ACTION', '2': 62},
    const {'1': 'PAYMENT_TOS_ACTION', '2': 63},
    const {'1': 'PRIVACY_SETTING_CHANNELS_PERSONALISED_RECOMMENDATION_ACTION', '2': 64},
    const {'1': 'BUSINESS_BROADCAST_ASSOCIATION_ACTION', '2': 65},
    const {'1': 'DETECTED_OUTCOMES_STATUS_ACTION', '2': 66},
    const {'1': 'MAIBA_AI_FEATURES_CONTROL_ACTION', '2': 68},
    const {'1': 'BUSINESS_BROADCAST_LIST_ACTION', '2': 69},
    const {'1': 'MUSIC_USER_ID_ACTION', '2': 70},
    const {'1': 'STATUS_POST_OPT_IN_NOTIFICATION_PREFERENCES_ACTION', '2': 71},
    const {'1': 'AVATAR_UPDATED_ACTION', '2': 72},
    const {'1': 'GALAXY_FLOW_ACTION', '2': 73},
    const {'1': 'PRIVATE_PROCESSING_SETTING_ACTION', '2': 74},
    const {'1': 'NEWSLETTER_SAVED_INTERESTS_ACTION', '2': 75},
    const {'1': 'AI_THREAD_RENAME_ACTION', '2': 76},
    const {'1': 'INTERACTIVE_MESSAGE_ACTION', '2': 77},
    const {'1': 'SHARE_OWN_PN', '2': 10001},
    const {'1': 'BUSINESS_BROADCAST_ACTION', '2': 10002},
  ],
};

/// Descriptor for `MutationProps`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mutationPropsDescriptor = $convert.base64Decode('Cg1NdXRhdGlvblByb3BzEh4KGlVOS05PV05fTVVUQVRJT05QUk9QU19aRVJPEAASDwoLU1RBUl9BQ1RJT04QAhISCg5DT05UQUNUX0FDVElPThADEg8KC01VVEVfQUNUSU9OEAQSDgoKUElOX0FDVElPThAFEiEKHVNFQ1VSSVRZX05PVElGSUNBVElPTl9TRVRUSU5HEAYSFQoRUFVTSF9OQU1FX1NFVFRJTkcQBxIWChJRVUlDS19SRVBMWV9BQ1RJT04QCBIfChtSRUNFTlRfRU1PSklfV0VJR0hUU19BQ1RJT04QCxIYChRMQUJFTF9NRVNTQUdFX0FDVElPThANEhUKEUxBQkVMX0VESVRfQUNUSU9OEA4SHAoYTEFCRUxfQVNTT0NJQVRJT05fQUNUSU9OEA8SEgoOTE9DQUxFX1NFVFRJTkcQEBIXChNBUkNISVZFX0NIQVRfQUNUSU9OEBESIAocREVMRVRFX01FU1NBR0VfRk9SX01FX0FDVElPThASEhIKDktFWV9FWFBJUkFUSU9OEBMSHAoYTUFSS19DSEFUX0FTX1JFQURfQUNUSU9OEBQSFQoRQ0xFQVJfQ0hBVF9BQ1RJT04QFRIWChJERUxFVEVfQ0hBVF9BQ1RJT04QFhIbChdVTkFSQ0hJVkVfQ0hBVFNfU0VUVElORxAXEhMKD1BSSU1BUllfRkVBVFVSRRAYEh8KG0FORFJPSURfVU5TVVBQT1JURURfQUNUSU9OUxAaEhAKDEFHRU5UX0FDVElPThAbEhcKE1NVQlNDUklQVElPTl9BQ1RJT04QHBIbChdVU0VSX1NUQVRVU19NVVRFX0FDVElPThAdEhYKElRJTUVfRk9STUFUX0FDVElPThAeEg4KCk5VWF9BQ1RJT04QHxIaChZQUklNQVJZX1ZFUlNJT05fQUNUSU9OECASEgoOU1RJQ0tFUl9BQ1RJT04QIRIgChxSRU1PVkVfUkVDRU5UX1NUSUNLRVJfQUNUSU9OECISEwoPQ0hBVF9BU1NJR05NRU5UECMSIQodQ0hBVF9BU1NJR05NRU5UX09QRU5FRF9TVEFUVVMQJBIaChZQTl9GT1JfTElEX0NIQVRfQUNUSU9OECUSHAoYTUFSS0VUSU5HX01FU1NBR0VfQUNUSU9OECYSJgoiTUFSS0VUSU5HX01FU1NBR0VfQlJPQURDQVNUX0FDVElPThAnEhwKGEVYVEVSTkFMX1dFQl9CRVRBX0FDVElPThAoEiMKH1BSSVZBQ1lfU0VUVElOR19SRUxBWV9BTExfQ0FMTFMQKRITCg9DQUxMX0xPR19BQ1RJT04QKhILCgdVR0NfQk9UECsSEgoOU1RBVFVTX1BSSVZBQ1kQLBIeChpCT1RfV0VMQ09NRV9SRVFVRVNUX0FDVElPThAtEh4KGkRFTEVURV9JTkRJVklEVUFMX0NBTExfTE9HEC4SGwoXTEFCRUxfUkVPUkRFUklOR19BQ1RJT04QLxIXChNQQVlNRU5UX0lORk9fQUNUSU9OEDASIQodQ1VTVE9NX1BBWU1FTlRfTUVUSE9EU19BQ1RJT04QMRIUChBMT0NLX0NIQVRfQUNUSU9OEDISFgoSQ0hBVF9MT0NLX1NFVFRJTkdTEDMSHwobV0FNT19VU0VSX0lERU5USUZJRVJfQUNUSU9OEDQSMAosUFJJVkFDWV9TRVRUSU5HX0RJU0FCTEVfTElOS19QUkVWSUVXU19BQ1RJT04QNRIXChNERVZJQ0VfQ0FQQUJJTElUSUVTEDYSFAoQTk9URV9FRElUX0FDVElPThA3EhQKEEZBVk9SSVRFU19BQ1RJT04QOBIjCh9NRVJDSEFOVF9QQVlNRU5UX1BBUlRORVJfQUNUSU9OEDkSJAogV0FGRkxFX0FDQ09VTlRfTElOS19TVEFURV9BQ1RJT04QOhIcChhVU0VSTkFNRV9DSEFUX1NUQVJUX01PREUQOxIoCiROT1RJRklDQVRJT05fQUNUSVZJVFlfU0VUVElOR19BQ1RJT04QPBIWChJMSURfQ09OVEFDVF9BQ1RJT04QPRIpCiVDVFdBX1BFUl9DVVNUT01FUl9EQVRBX1NIQVJJTkdfQUNUSU9OED4SFgoSUEFZTUVOVF9UT1NfQUNUSU9OED8SPwo7UFJJVkFDWV9TRVRUSU5HX0NIQU5ORUxTX1BFUlNPTkFMSVNFRF9SRUNPTU1FTkRBVElPTl9BQ1RJT04QQBIpCiVCVVNJTkVTU19CUk9BRENBU1RfQVNTT0NJQVRJT05fQUNUSU9OEEESIwofREVURUNURURfT1VUQ09NRVNfU1RBVFVTX0FDVElPThBCEiQKIE1BSUJBX0FJX0ZFQVRVUkVTX0NPTlRST0xfQUNUSU9OEEQSIgoeQlVTSU5FU1NfQlJPQURDQVNUX0xJU1RfQUNUSU9OEEUSGAoUTVVTSUNfVVNFUl9JRF9BQ1RJT04QRhI2CjJTVEFUVVNfUE9TVF9PUFRfSU5fTk9USUZJQ0FUSU9OX1BSRUZFUkVOQ0VTX0FDVElPThBHEhkKFUFWQVRBUl9VUERBVEVEX0FDVElPThBIEhYKEkdBTEFYWV9GTE9XX0FDVElPThBJEiUKIVBSSVZBVEVfUFJPQ0VTU0lOR19TRVRUSU5HX0FDVElPThBKEiUKIU5FV1NMRVRURVJfU0FWRURfSU5URVJFU1RTX0FDVElPThBLEhsKF0FJX1RIUkVBRF9SRU5BTUVfQUNUSU9OEEwSHgoaSU5URVJBQ1RJVkVfTUVTU0FHRV9BQ1RJT04QTRIRCgxTSEFSRV9PV05fUE4QkU4SHgoZQlVTSU5FU1NfQlJPQURDQVNUX0FDVElPThCSTg==');
@$core.Deprecated('Use privacySystemMessageDescriptor instead')
const PrivacySystemMessage$json = const {
  '1': 'PrivacySystemMessage',
  '2': const [
    const {'1': 'UNKNOWN_PRIVACYSYSTEMMESSAGE_ZERO', '2': 0},
    const {'1': 'E2EE_MSG', '2': 1},
    const {'1': 'NE2EE_SELF', '2': 2},
    const {'1': 'NE2EE_OTHER', '2': 3},
  ],
};

/// Descriptor for `PrivacySystemMessage`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List privacySystemMessageDescriptor = $convert.base64Decode('ChRQcml2YWN5U3lzdGVtTWVzc2FnZRIlCiFVTktOT1dOX1BSSVZBQ1lTWVNURU1NRVNTQUdFX1pFUk8QABIMCghFMkVFX01TRxABEg4KCk5FMkVFX1NFTEYQAhIPCgtORTJFRV9PVEhFUhAD');
@$core.Deprecated('Use sessionTransparencyTypeDescriptor instead')
const SessionTransparencyType$json = const {
  '1': 'SessionTransparencyType',
  '2': const [
    const {'1': 'UNKNOWN_TYPE', '2': 0},
    const {'1': 'NY_AI_SAFETY_DISCLAIMER', '2': 1},
  ],
};

/// Descriptor for `SessionTransparencyType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sessionTransparencyTypeDescriptor = $convert.base64Decode('ChdTZXNzaW9uVHJhbnNwYXJlbmN5VHlwZRIQCgxVTktOT1dOX1RZUEUQABIbChdOWV9BSV9TQUZFVFlfRElTQ0xBSU1FUhAB');
@$core.Deprecated('Use webLinkRenderConfigDescriptor instead')
const WebLinkRenderConfig$json = const {
  '1': 'WebLinkRenderConfig',
  '2': const [
    const {'1': 'WEBVIEW', '2': 0},
    const {'1': 'SYSTEM', '2': 1},
  ],
};

/// Descriptor for `WebLinkRenderConfig`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List webLinkRenderConfigDescriptor = $convert.base64Decode('ChNXZWJMaW5rUmVuZGVyQ29uZmlnEgsKB1dFQlZJRVcQABIKCgZTWVNURU0QAQ==');
@$core.Deprecated('Use aDVDeviceIdentityDescriptor instead')
const ADVDeviceIdentity$json = const {
  '1': 'ADVDeviceIdentity',
  '2': const [
    const {'1': 'rawId', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'rawId', '17': true},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'timestamp', '17': true},
    const {'1': 'keyIndex', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'keyIndex', '17': true},
    const {'1': 'accountType', '3': 4, '4': 1, '5': 14, '6': '.proto.ADVEncryptionType', '9': 3, '10': 'accountType', '17': true},
    const {'1': 'deviceType', '3': 5, '4': 1, '5': 14, '6': '.proto.ADVEncryptionType', '9': 4, '10': 'deviceType', '17': true},
  ],
  '8': const [
    const {'1': '_rawId'},
    const {'1': '_timestamp'},
    const {'1': '_keyIndex'},
    const {'1': '_accountType'},
    const {'1': '_deviceType'},
  ],
};

/// Descriptor for `ADVDeviceIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aDVDeviceIdentityDescriptor = $convert.base64Decode('ChFBRFZEZXZpY2VJZGVudGl0eRIZCgVyYXdJZBgBIAEoDUgAUgVyYXdJZIgBARIhCgl0aW1lc3RhbXAYAiABKARIAVIJdGltZXN0YW1wiAEBEh8KCGtleUluZGV4GAMgASgNSAJSCGtleUluZGV4iAEBEj8KC2FjY291bnRUeXBlGAQgASgOMhgucHJvdG8uQURWRW5jcnlwdGlvblR5cGVIA1ILYWNjb3VudFR5cGWIAQESPQoKZGV2aWNlVHlwZRgFIAEoDjIYLnByb3RvLkFEVkVuY3J5cHRpb25UeXBlSARSCmRldmljZVR5cGWIAQFCCAoGX3Jhd0lkQgwKCl90aW1lc3RhbXBCCwoJX2tleUluZGV4Qg4KDF9hY2NvdW50VHlwZUINCgtfZGV2aWNlVHlwZQ==');
@$core.Deprecated('Use aDVKeyIndexListDescriptor instead')
const ADVKeyIndexList$json = const {
  '1': 'ADVKeyIndexList',
  '2': const [
    const {'1': 'rawId', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'rawId', '17': true},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'timestamp', '17': true},
    const {'1': 'currentIndex', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'currentIndex', '17': true},
    const {
      '1': 'validIndexes',
      '3': 4,
      '4': 3,
      '5': 13,
      '8': const {'2': true},
      '10': 'validIndexes',
    },
    const {'1': 'accountType', '3': 5, '4': 1, '5': 14, '6': '.proto.ADVEncryptionType', '9': 3, '10': 'accountType', '17': true},
  ],
  '8': const [
    const {'1': '_rawId'},
    const {'1': '_timestamp'},
    const {'1': '_currentIndex'},
    const {'1': '_accountType'},
  ],
};

/// Descriptor for `ADVKeyIndexList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aDVKeyIndexListDescriptor = $convert.base64Decode('Cg9BRFZLZXlJbmRleExpc3QSGQoFcmF3SWQYASABKA1IAFIFcmF3SWSIAQESIQoJdGltZXN0YW1wGAIgASgESAFSCXRpbWVzdGFtcIgBARInCgxjdXJyZW50SW5kZXgYAyABKA1IAlIMY3VycmVudEluZGV4iAEBEiYKDHZhbGlkSW5kZXhlcxgEIAMoDUICEAFSDHZhbGlkSW5kZXhlcxI/CgthY2NvdW50VHlwZRgFIAEoDjIYLnByb3RvLkFEVkVuY3J5cHRpb25UeXBlSANSC2FjY291bnRUeXBliAEBQggKBl9yYXdJZEIMCgpfdGltZXN0YW1wQg8KDV9jdXJyZW50SW5kZXhCDgoMX2FjY291bnRUeXBl');
@$core.Deprecated('Use aDVSignedDeviceIdentityDescriptor instead')
const ADVSignedDeviceIdentity$json = const {
  '1': 'ADVSignedDeviceIdentity',
  '2': const [
    const {'1': 'details', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'details', '17': true},
    const {'1': 'accountSignatureKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'accountSignatureKey', '17': true},
    const {'1': 'accountSignature', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'accountSignature', '17': true},
    const {'1': 'deviceSignature', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'deviceSignature', '17': true},
  ],
  '8': const [
    const {'1': '_details'},
    const {'1': '_accountSignatureKey'},
    const {'1': '_accountSignature'},
    const {'1': '_deviceSignature'},
  ],
};

/// Descriptor for `ADVSignedDeviceIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aDVSignedDeviceIdentityDescriptor = $convert.base64Decode('ChdBRFZTaWduZWREZXZpY2VJZGVudGl0eRIdCgdkZXRhaWxzGAEgASgMSABSB2RldGFpbHOIAQESNQoTYWNjb3VudFNpZ25hdHVyZUtleRgCIAEoDEgBUhNhY2NvdW50U2lnbmF0dXJlS2V5iAEBEi8KEGFjY291bnRTaWduYXR1cmUYAyABKAxIAlIQYWNjb3VudFNpZ25hdHVyZYgBARItCg9kZXZpY2VTaWduYXR1cmUYBCABKAxIA1IPZGV2aWNlU2lnbmF0dXJliAEBQgoKCF9kZXRhaWxzQhYKFF9hY2NvdW50U2lnbmF0dXJlS2V5QhMKEV9hY2NvdW50U2lnbmF0dXJlQhIKEF9kZXZpY2VTaWduYXR1cmU=');
@$core.Deprecated('Use aDVSignedDeviceIdentityHMACDescriptor instead')
const ADVSignedDeviceIdentityHMAC$json = const {
  '1': 'ADVSignedDeviceIdentityHMAC',
  '2': const [
    const {'1': 'details', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'details', '17': true},
    const {'1': 'hmac', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'hmac', '17': true},
    const {'1': 'accountType', '3': 3, '4': 1, '5': 14, '6': '.proto.ADVEncryptionType', '9': 2, '10': 'accountType', '17': true},
  ],
  '8': const [
    const {'1': '_details'},
    const {'1': '_hmac'},
    const {'1': '_accountType'},
  ],
};

/// Descriptor for `ADVSignedDeviceIdentityHMAC`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aDVSignedDeviceIdentityHMACDescriptor = $convert.base64Decode('ChtBRFZTaWduZWREZXZpY2VJZGVudGl0eUhNQUMSHQoHZGV0YWlscxgBIAEoDEgAUgdkZXRhaWxziAEBEhcKBGhtYWMYAiABKAxIAVIEaG1hY4gBARI/CgthY2NvdW50VHlwZRgDIAEoDjIYLnByb3RvLkFEVkVuY3J5cHRpb25UeXBlSAJSC2FjY291bnRUeXBliAEBQgoKCF9kZXRhaWxzQgcKBV9obWFjQg4KDF9hY2NvdW50VHlwZQ==');
@$core.Deprecated('Use aDVSignedKeyIndexListDescriptor instead')
const ADVSignedKeyIndexList$json = const {
  '1': 'ADVSignedKeyIndexList',
  '2': const [
    const {'1': 'details', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'details', '17': true},
    const {'1': 'accountSignature', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'accountSignature', '17': true},
    const {'1': 'accountSignatureKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'accountSignatureKey', '17': true},
  ],
  '8': const [
    const {'1': '_details'},
    const {'1': '_accountSignature'},
    const {'1': '_accountSignatureKey'},
  ],
};

/// Descriptor for `ADVSignedKeyIndexList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aDVSignedKeyIndexListDescriptor = $convert.base64Decode('ChVBRFZTaWduZWRLZXlJbmRleExpc3QSHQoHZGV0YWlscxgBIAEoDEgAUgdkZXRhaWxziAEBEi8KEGFjY291bnRTaWduYXR1cmUYAiABKAxIAVIQYWNjb3VudFNpZ25hdHVyZYgBARI1ChNhY2NvdW50U2lnbmF0dXJlS2V5GAMgASgMSAJSE2FjY291bnRTaWduYXR1cmVLZXmIAQFCCgoIX2RldGFpbHNCEwoRX2FjY291bnRTaWduYXR1cmVCFgoUX2FjY291bnRTaWduYXR1cmVLZXk=');
@$core.Deprecated('Use aIHomeStateDescriptor instead')
const AIHomeState$json = const {
  '1': 'AIHomeState',
  '2': const [
    const {'1': 'lastFetchTime', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'lastFetchTime', '17': true},
    const {'1': 'capabilityOptions', '3': 2, '4': 3, '5': 11, '6': '.proto.AIHomeState.AIHomeOption', '10': 'capabilityOptions'},
    const {'1': 'conversationOptions', '3': 3, '4': 3, '5': 11, '6': '.proto.AIHomeState.AIHomeOption', '10': 'conversationOptions'},
  ],
  '3': const [AIHomeState_AIHomeOption$json],
  '8': const [
    const {'1': '_lastFetchTime'},
  ],
};

@$core.Deprecated('Use aIHomeStateDescriptor instead')
const AIHomeState_AIHomeOption$json = const {
  '1': 'AIHomeOption',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.AIHomeState.AIHomeOption.AIHomeActionType', '9': 0, '10': 'type', '17': true},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'title', '17': true},
    const {'1': 'promptText', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'promptText', '17': true},
    const {'1': 'sessionId', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'sessionId', '17': true},
    const {'1': 'imageWdsIdentifier', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'imageWdsIdentifier', '17': true},
    const {'1': 'imageTintColor', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'imageTintColor', '17': true},
    const {'1': 'imageBackgroundColor', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'imageBackgroundColor', '17': true},
  ],
  '4': const [AIHomeState_AIHomeOption_AIHomeActionType$json],
  '8': const [
    const {'1': '_type'},
    const {'1': '_title'},
    const {'1': '_promptText'},
    const {'1': '_sessionId'},
    const {'1': '_imageWdsIdentifier'},
    const {'1': '_imageTintColor'},
    const {'1': '_imageBackgroundColor'},
  ],
};

@$core.Deprecated('Use aIHomeStateDescriptor instead')
const AIHomeState_AIHomeOption_AIHomeActionType$json = const {
  '1': 'AIHomeActionType',
  '2': const [
    const {'1': 'PROMPT', '2': 0},
    const {'1': 'CREATE_IMAGE', '2': 1},
    const {'1': 'ANIMATE_PHOTO', '2': 2},
    const {'1': 'ANALYZE_FILE', '2': 3},
  ],
};

/// Descriptor for `AIHomeState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIHomeStateDescriptor = $convert.base64Decode('CgtBSUhvbWVTdGF0ZRIpCg1sYXN0RmV0Y2hUaW1lGAEgASgDSABSDWxhc3RGZXRjaFRpbWWIAQESTQoRY2FwYWJpbGl0eU9wdGlvbnMYAiADKAsyHy5wcm90by5BSUhvbWVTdGF0ZS5BSUhvbWVPcHRpb25SEWNhcGFiaWxpdHlPcHRpb25zElEKE2NvbnZlcnNhdGlvbk9wdGlvbnMYAyADKAsyHy5wcm90by5BSUhvbWVTdGF0ZS5BSUhvbWVPcHRpb25SE2NvbnZlcnNhdGlvbk9wdGlvbnMaoQQKDEFJSG9tZU9wdGlvbhJJCgR0eXBlGAEgASgOMjAucHJvdG8uQUlIb21lU3RhdGUuQUlIb21lT3B0aW9uLkFJSG9tZUFjdGlvblR5cGVIAFIEdHlwZYgBARIZCgV0aXRsZRgCIAEoCUgBUgV0aXRsZYgBARIjCgpwcm9tcHRUZXh0GAMgASgJSAJSCnByb21wdFRleHSIAQESIQoJc2Vzc2lvbklkGAQgASgJSANSCXNlc3Npb25JZIgBARIzChJpbWFnZVdkc0lkZW50aWZpZXIYBSABKAlIBFISaW1hZ2VXZHNJZGVudGlmaWVyiAEBEisKDmltYWdlVGludENvbG9yGAYgASgJSAVSDmltYWdlVGludENvbG9yiAEBEjcKFGltYWdlQmFja2dyb3VuZENvbG9yGAcgASgJSAZSFGltYWdlQmFja2dyb3VuZENvbG9yiAEBIlUKEEFJSG9tZUFjdGlvblR5cGUSCgoGUFJPTVBUEAASEAoMQ1JFQVRFX0lNQUdFEAESEQoNQU5JTUFURV9QSE9UTxACEhAKDEFOQUxZWkVfRklMRRADQgcKBV90eXBlQggKBl90aXRsZUINCgtfcHJvbXB0VGV4dEIMCgpfc2Vzc2lvbklkQhUKE19pbWFnZVdkc0lkZW50aWZpZXJCEQoPX2ltYWdlVGludENvbG9yQhcKFV9pbWFnZUJhY2tncm91bmRDb2xvckIQCg5fbGFzdEZldGNoVGltZQ==');
@$core.Deprecated('Use aIQueryFanoutDescriptor instead')
const AIQueryFanout$json = const {
  '1': 'AIQueryFanout',
  '2': const [
    const {'1': 'messageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'messageKey', '17': true},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 1, '10': 'message', '17': true},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_messageKey'},
    const {'1': '_message'},
    const {'1': '_timestamp'},
  ],
};

/// Descriptor for `AIQueryFanout`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIQueryFanoutDescriptor = $convert.base64Decode('Cg1BSVF1ZXJ5RmFub3V0EjYKCm1lc3NhZ2VLZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5SABSCm1lc3NhZ2VLZXmIAQESLQoHbWVzc2FnZRgCIAEoCzIOLnByb3RvLk1lc3NhZ2VIAVIHbWVzc2FnZYgBARIhCgl0aW1lc3RhbXAYAyABKANIAlIJdGltZXN0YW1wiAEBQg0KC19tZXNzYWdlS2V5QgoKCF9tZXNzYWdlQgwKCl90aW1lc3RhbXA=');
@$core.Deprecated('Use aIRegenerateMetadataDescriptor instead')
const AIRegenerateMetadata$json = const {
  '1': 'AIRegenerateMetadata',
  '2': const [
    const {'1': 'messageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'messageKey', '17': true},
    const {'1': 'responseTimestampMs', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'responseTimestampMs', '17': true},
  ],
  '8': const [
    const {'1': '_messageKey'},
    const {'1': '_responseTimestampMs'},
  ],
};

/// Descriptor for `AIRegenerateMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRegenerateMetadataDescriptor = $convert.base64Decode('ChRBSVJlZ2VuZXJhdGVNZXRhZGF0YRI2CgptZXNzYWdlS2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUgptZXNzYWdlS2V5iAEBEjUKE3Jlc3BvbnNlVGltZXN0YW1wTXMYAiABKANIAVITcmVzcG9uc2VUaW1lc3RhbXBNc4gBAUINCgtfbWVzc2FnZUtleUIWChRfcmVzcG9uc2VUaW1lc3RhbXBNcw==');
@$core.Deprecated('Use aIRichResponseCodeMetadataDescriptor instead')
const AIRichResponseCodeMetadata$json = const {
  '1': 'AIRichResponseCodeMetadata',
  '2': const [
    const {'1': 'codeLanguage', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'codeLanguage', '17': true},
    const {'1': 'codeBlocks', '3': 2, '4': 3, '5': 11, '6': '.proto.AIRichResponseCodeMetadata.AIRichResponseCodeBlock', '10': 'codeBlocks'},
  ],
  '3': const [AIRichResponseCodeMetadata_AIRichResponseCodeBlock$json],
  '4': const [AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType$json],
  '8': const [
    const {'1': '_codeLanguage'},
  ],
};

@$core.Deprecated('Use aIRichResponseCodeMetadataDescriptor instead')
const AIRichResponseCodeMetadata_AIRichResponseCodeBlock$json = const {
  '1': 'AIRichResponseCodeBlock',
  '2': const [
    const {'1': 'highlightType', '3': 1, '4': 1, '5': 14, '6': '.proto.AIRichResponseCodeMetadata.AIRichResponseCodeHighlightType', '9': 0, '10': 'highlightType', '17': true},
    const {'1': 'codeContent', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'codeContent', '17': true},
  ],
  '8': const [
    const {'1': '_highlightType'},
    const {'1': '_codeContent'},
  ],
};

@$core.Deprecated('Use aIRichResponseCodeMetadataDescriptor instead')
const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType$json = const {
  '1': 'AIRichResponseCodeHighlightType',
  '2': const [
    const {'1': 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_DEFAULT', '2': 0},
    const {'1': 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_KEYWORD', '2': 1},
    const {'1': 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_METHOD', '2': 2},
    const {'1': 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_STRING', '2': 3},
    const {'1': 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_NUMBER', '2': 4},
    const {'1': 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_COMMENT', '2': 5},
  ],
};

/// Descriptor for `AIRichResponseCodeMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseCodeMetadataDescriptor = $convert.base64Decode('ChpBSVJpY2hSZXNwb25zZUNvZGVNZXRhZGF0YRInCgxjb2RlTGFuZ3VhZ2UYASABKAlIAFIMY29kZUxhbmd1YWdliAEBElkKCmNvZGVCbG9ja3MYAiADKAsyOS5wcm90by5BSVJpY2hSZXNwb25zZUNvZGVNZXRhZGF0YS5BSVJpY2hSZXNwb25zZUNvZGVCbG9ja1IKY29kZUJsb2NrcxrQAQoXQUlSaWNoUmVzcG9uc2VDb2RlQmxvY2sSbAoNaGlnaGxpZ2h0VHlwZRgBIAEoDjJBLnByb3RvLkFJUmljaFJlc3BvbnNlQ29kZU1ldGFkYXRhLkFJUmljaFJlc3BvbnNlQ29kZUhpZ2hsaWdodFR5cGVIAFINaGlnaGxpZ2h0VHlwZYgBARIlCgtjb2RlQ29udGVudBgCIAEoCUgBUgtjb2RlQ29udGVudIgBAUIQCg5faGlnaGxpZ2h0VHlwZUIOCgxfY29kZUNvbnRlbnQirAIKH0FJUmljaFJlc3BvbnNlQ29kZUhpZ2hsaWdodFR5cGUSKwonQUlfUklDSF9SRVNQT05TRV9DT0RFX0hJR0hMSUdIVF9ERUZBVUxUEAASKwonQUlfUklDSF9SRVNQT05TRV9DT0RFX0hJR0hMSUdIVF9LRVlXT1JEEAESKgomQUlfUklDSF9SRVNQT05TRV9DT0RFX0hJR0hMSUdIVF9NRVRIT0QQAhIqCiZBSV9SSUNIX1JFU1BPTlNFX0NPREVfSElHSExJR0hUX1NUUklORxADEioKJkFJX1JJQ0hfUkVTUE9OU0VfQ09ERV9ISUdITElHSFRfTlVNQkVSEAQSKwonQUlfUklDSF9SRVNQT05TRV9DT0RFX0hJR0hMSUdIVF9DT01NRU5UEAVCDwoNX2NvZGVMYW5ndWFnZQ==');
@$core.Deprecated('Use aIRichResponseContentItemsMetadataDescriptor instead')
const AIRichResponseContentItemsMetadata$json = const {
  '1': 'AIRichResponseContentItemsMetadata',
  '2': const [
    const {'1': 'itemsMetadata', '3': 1, '4': 3, '5': 11, '6': '.proto.AIRichResponseContentItemsMetadata.AIRichResponseContentItemMetadata', '10': 'itemsMetadata'},
    const {'1': 'contentType', '3': 2, '4': 1, '5': 14, '6': '.proto.AIRichResponseContentItemsMetadata.ContentType', '9': 0, '10': 'contentType', '17': true},
  ],
  '3': const [AIRichResponseContentItemsMetadata_AIRichResponseContentItemMetadata$json, AIRichResponseContentItemsMetadata_AIRichResponseReelItem$json],
  '4': const [AIRichResponseContentItemsMetadata_ContentType$json],
  '8': const [
    const {'1': '_contentType'},
  ],
};

@$core.Deprecated('Use aIRichResponseContentItemsMetadataDescriptor instead')
const AIRichResponseContentItemsMetadata_AIRichResponseContentItemMetadata$json = const {
  '1': 'AIRichResponseContentItemMetadata',
  '2': const [
    const {'1': 'reelItem', '3': 1, '4': 1, '5': 11, '6': '.proto.AIRichResponseContentItemsMetadata.AIRichResponseReelItem', '9': 0, '10': 'reelItem'},
  ],
  '8': const [
    const {'1': 'aIRichResponseContentItem'},
  ],
};

@$core.Deprecated('Use aIRichResponseContentItemsMetadataDescriptor instead')
const AIRichResponseContentItemsMetadata_AIRichResponseReelItem$json = const {
  '1': 'AIRichResponseReelItem',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'profileIconUrl', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'profileIconUrl', '17': true},
    const {'1': 'thumbnailUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'thumbnailUrl', '17': true},
    const {'1': 'videoUrl', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'videoUrl', '17': true},
  ],
  '8': const [
    const {'1': '_title'},
    const {'1': '_profileIconUrl'},
    const {'1': '_thumbnailUrl'},
    const {'1': '_videoUrl'},
  ],
};

@$core.Deprecated('Use aIRichResponseContentItemsMetadataDescriptor instead')
const AIRichResponseContentItemsMetadata_ContentType$json = const {
  '1': 'ContentType',
  '2': const [
    const {'1': 'DEFAULT', '2': 0},
    const {'1': 'CAROUSEL', '2': 1},
  ],
};

/// Descriptor for `AIRichResponseContentItemsMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseContentItemsMetadataDescriptor = $convert.base64Decode('CiJBSVJpY2hSZXNwb25zZUNvbnRlbnRJdGVtc01ldGFkYXRhEnEKDWl0ZW1zTWV0YWRhdGEYASADKAsySy5wcm90by5BSVJpY2hSZXNwb25zZUNvbnRlbnRJdGVtc01ldGFkYXRhLkFJUmljaFJlc3BvbnNlQ29udGVudEl0ZW1NZXRhZGF0YVINaXRlbXNNZXRhZGF0YRJcCgtjb250ZW50VHlwZRgCIAEoDjI1LnByb3RvLkFJUmljaFJlc3BvbnNlQ29udGVudEl0ZW1zTWV0YWRhdGEuQ29udGVudFR5cGVIAFILY29udGVudFR5cGWIAQEaoAEKIUFJUmljaFJlc3BvbnNlQ29udGVudEl0ZW1NZXRhZGF0YRJeCghyZWVsSXRlbRgBIAEoCzJALnByb3RvLkFJUmljaFJlc3BvbnNlQ29udGVudEl0ZW1zTWV0YWRhdGEuQUlSaWNoUmVzcG9uc2VSZWVsSXRlbUgAUghyZWVsSXRlbUIbChlhSVJpY2hSZXNwb25zZUNvbnRlbnRJdGVtGuUBChZBSVJpY2hSZXNwb25zZVJlZWxJdGVtEhkKBXRpdGxlGAEgASgJSABSBXRpdGxliAEBEisKDnByb2ZpbGVJY29uVXJsGAIgASgJSAFSDnByb2ZpbGVJY29uVXJsiAEBEicKDHRodW1ibmFpbFVybBgDIAEoCUgCUgx0aHVtYm5haWxVcmyIAQESHwoIdmlkZW9VcmwYBCABKAlIA1IIdmlkZW9VcmyIAQFCCAoGX3RpdGxlQhEKD19wcm9maWxlSWNvblVybEIPCg1fdGh1bWJuYWlsVXJsQgsKCV92aWRlb1VybCIoCgtDb250ZW50VHlwZRILCgdERUZBVUxUEAASDAoIQ0FST1VTRUwQAUIOCgxfY29udGVudFR5cGU=');
@$core.Deprecated('Use aIRichResponseDynamicMetadataDescriptor instead')
const AIRichResponseDynamicMetadata$json = const {
  '1': 'AIRichResponseDynamicMetadata',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.AIRichResponseDynamicMetadata.AIRichResponseDynamicMetadataType', '9': 0, '10': 'type', '17': true},
    const {'1': 'version', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'version', '17': true},
    const {'1': 'url', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'url', '17': true},
    const {'1': 'loopCount', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'loopCount', '17': true},
  ],
  '4': const [AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType$json],
  '8': const [
    const {'1': '_type'},
    const {'1': '_version'},
    const {'1': '_url'},
    const {'1': '_loopCount'},
  ],
};

@$core.Deprecated('Use aIRichResponseDynamicMetadataDescriptor instead')
const AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType$json = const {
  '1': 'AIRichResponseDynamicMetadataType',
  '2': const [
    const {'1': 'AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_UNKNOWN', '2': 0},
    const {'1': 'AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_IMAGE', '2': 1},
    const {'1': 'AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_GIF', '2': 2},
  ],
};

/// Descriptor for `AIRichResponseDynamicMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseDynamicMetadataDescriptor = $convert.base64Decode('Ch1BSVJpY2hSZXNwb25zZUR5bmFtaWNNZXRhZGF0YRJfCgR0eXBlGAEgASgOMkYucHJvdG8uQUlSaWNoUmVzcG9uc2VEeW5hbWljTWV0YWRhdGEuQUlSaWNoUmVzcG9uc2VEeW5hbWljTWV0YWRhdGFUeXBlSABSBHR5cGWIAQESHQoHdmVyc2lvbhgCIAEoBEgBUgd2ZXJzaW9uiAEBEhUKA3VybBgDIAEoCUgCUgN1cmyIAQESIQoJbG9vcENvdW50GAQgASgNSANSCWxvb3BDb3VudIgBASK5AQohQUlSaWNoUmVzcG9uc2VEeW5hbWljTWV0YWRhdGFUeXBlEjIKLkFJX1JJQ0hfUkVTUE9OU0VfRFlOQU1JQ19NRVRBREFUQV9UWVBFX1VOS05PV04QABIwCixBSV9SSUNIX1JFU1BPTlNFX0RZTkFNSUNfTUVUQURBVEFfVFlQRV9JTUFHRRABEi4KKkFJX1JJQ0hfUkVTUE9OU0VfRFlOQU1JQ19NRVRBREFUQV9UWVBFX0dJRhACQgcKBV90eXBlQgoKCF92ZXJzaW9uQgYKBF91cmxCDAoKX2xvb3BDb3VudA==');
@$core.Deprecated('Use aIRichResponseGridImageMetadataDescriptor instead')
const AIRichResponseGridImageMetadata$json = const {
  '1': 'AIRichResponseGridImageMetadata',
  '2': const [
    const {'1': 'gridImageUrl', '3': 1, '4': 1, '5': 11, '6': '.proto.AIRichResponseImageURL', '9': 0, '10': 'gridImageUrl', '17': true},
    const {'1': 'imageUrls', '3': 2, '4': 3, '5': 11, '6': '.proto.AIRichResponseImageURL', '10': 'imageUrls'},
  ],
  '8': const [
    const {'1': '_gridImageUrl'},
  ],
};

/// Descriptor for `AIRichResponseGridImageMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseGridImageMetadataDescriptor = $convert.base64Decode('Ch9BSVJpY2hSZXNwb25zZUdyaWRJbWFnZU1ldGFkYXRhEkYKDGdyaWRJbWFnZVVybBgBIAEoCzIdLnByb3RvLkFJUmljaFJlc3BvbnNlSW1hZ2VVUkxIAFIMZ3JpZEltYWdlVXJsiAEBEjsKCWltYWdlVXJscxgCIAMoCzIdLnByb3RvLkFJUmljaFJlc3BvbnNlSW1hZ2VVUkxSCWltYWdlVXJsc0IPCg1fZ3JpZEltYWdlVXJs');
@$core.Deprecated('Use aIRichResponseImageURLDescriptor instead')
const AIRichResponseImageURL$json = const {
  '1': 'AIRichResponseImageURL',
  '2': const [
    const {'1': 'imagePreviewUrl', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'imagePreviewUrl', '17': true},
    const {'1': 'imageHighResUrl', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'imageHighResUrl', '17': true},
    const {'1': 'sourceUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'sourceUrl', '17': true},
  ],
  '8': const [
    const {'1': '_imagePreviewUrl'},
    const {'1': '_imageHighResUrl'},
    const {'1': '_sourceUrl'},
  ],
};

/// Descriptor for `AIRichResponseImageURL`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseImageURLDescriptor = $convert.base64Decode('ChZBSVJpY2hSZXNwb25zZUltYWdlVVJMEi0KD2ltYWdlUHJldmlld1VybBgBIAEoCUgAUg9pbWFnZVByZXZpZXdVcmyIAQESLQoPaW1hZ2VIaWdoUmVzVXJsGAIgASgJSAFSD2ltYWdlSGlnaFJlc1VybIgBARIhCglzb3VyY2VVcmwYAyABKAlIAlIJc291cmNlVXJsiAEBQhIKEF9pbWFnZVByZXZpZXdVcmxCEgoQX2ltYWdlSGlnaFJlc1VybEIMCgpfc291cmNlVXJs');
@$core.Deprecated('Use aIRichResponseInlineImageMetadataDescriptor instead')
const AIRichResponseInlineImageMetadata$json = const {
  '1': 'AIRichResponseInlineImageMetadata',
  '2': const [
    const {'1': 'imageUrl', '3': 1, '4': 1, '5': 11, '6': '.proto.AIRichResponseImageURL', '9': 0, '10': 'imageUrl', '17': true},
    const {'1': 'imageText', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'imageText', '17': true},
    const {'1': 'alignment', '3': 3, '4': 1, '5': 14, '6': '.proto.AIRichResponseInlineImageMetadata.AIRichResponseImageAlignment', '9': 2, '10': 'alignment', '17': true},
    const {'1': 'tapLinkUrl', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'tapLinkUrl', '17': true},
  ],
  '4': const [AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment$json],
  '8': const [
    const {'1': '_imageUrl'},
    const {'1': '_imageText'},
    const {'1': '_alignment'},
    const {'1': '_tapLinkUrl'},
  ],
};

@$core.Deprecated('Use aIRichResponseInlineImageMetadataDescriptor instead')
const AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment$json = const {
  '1': 'AIRichResponseImageAlignment',
  '2': const [
    const {'1': 'AI_RICH_RESPONSE_IMAGE_LAYOUT_LEADING_ALIGNED', '2': 0},
    const {'1': 'AI_RICH_RESPONSE_IMAGE_LAYOUT_TRAILING_ALIGNED', '2': 1},
    const {'1': 'AI_RICH_RESPONSE_IMAGE_LAYOUT_CENTER_ALIGNED', '2': 2},
  ],
};

/// Descriptor for `AIRichResponseInlineImageMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseInlineImageMetadataDescriptor = $convert.base64Decode('CiFBSVJpY2hSZXNwb25zZUlubGluZUltYWdlTWV0YWRhdGESPgoIaW1hZ2VVcmwYASABKAsyHS5wcm90by5BSVJpY2hSZXNwb25zZUltYWdlVVJMSABSCGltYWdlVXJsiAEBEiEKCWltYWdlVGV4dBgCIAEoCUgBUglpbWFnZVRleHSIAQESaAoJYWxpZ25tZW50GAMgASgOMkUucHJvdG8uQUlSaWNoUmVzcG9uc2VJbmxpbmVJbWFnZU1ldGFkYXRhLkFJUmljaFJlc3BvbnNlSW1hZ2VBbGlnbm1lbnRIAlIJYWxpZ25tZW50iAEBEiMKCnRhcExpbmtVcmwYBCABKAlIA1IKdGFwTGlua1VybIgBASK3AQocQUlSaWNoUmVzcG9uc2VJbWFnZUFsaWdubWVudBIxCi1BSV9SSUNIX1JFU1BPTlNFX0lNQUdFX0xBWU9VVF9MRUFESU5HX0FMSUdORUQQABIyCi5BSV9SSUNIX1JFU1BPTlNFX0lNQUdFX0xBWU9VVF9UUkFJTElOR19BTElHTkVEEAESMAosQUlfUklDSF9SRVNQT05TRV9JTUFHRV9MQVlPVVRfQ0VOVEVSX0FMSUdORUQQAkILCglfaW1hZ2VVcmxCDAoKX2ltYWdlVGV4dEIMCgpfYWxpZ25tZW50Qg0KC190YXBMaW5rVXJs');
@$core.Deprecated('Use aIRichResponseLatexMetadataDescriptor instead')
const AIRichResponseLatexMetadata$json = const {
  '1': 'AIRichResponseLatexMetadata',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'expressions', '3': 2, '4': 3, '5': 11, '6': '.proto.AIRichResponseLatexMetadata.AIRichResponseLatexExpression', '10': 'expressions'},
  ],
  '3': const [AIRichResponseLatexMetadata_AIRichResponseLatexExpression$json],
  '8': const [
    const {'1': '_text'},
  ],
};

@$core.Deprecated('Use aIRichResponseLatexMetadataDescriptor instead')
const AIRichResponseLatexMetadata_AIRichResponseLatexExpression$json = const {
  '1': 'AIRichResponseLatexExpression',
  '2': const [
    const {'1': 'latexExpression', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'latexExpression', '17': true},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'url', '17': true},
    const {'1': 'width', '3': 3, '4': 1, '5': 1, '9': 2, '10': 'width', '17': true},
    const {'1': 'height', '3': 4, '4': 1, '5': 1, '9': 3, '10': 'height', '17': true},
    const {'1': 'fontHeight', '3': 5, '4': 1, '5': 1, '9': 4, '10': 'fontHeight', '17': true},
    const {'1': 'imageTopPadding', '3': 6, '4': 1, '5': 1, '9': 5, '10': 'imageTopPadding', '17': true},
    const {'1': 'imageLeadingPadding', '3': 7, '4': 1, '5': 1, '9': 6, '10': 'imageLeadingPadding', '17': true},
    const {'1': 'imageBottomPadding', '3': 8, '4': 1, '5': 1, '9': 7, '10': 'imageBottomPadding', '17': true},
    const {'1': 'imageTrailingPadding', '3': 9, '4': 1, '5': 1, '9': 8, '10': 'imageTrailingPadding', '17': true},
  ],
  '8': const [
    const {'1': '_latexExpression'},
    const {'1': '_url'},
    const {'1': '_width'},
    const {'1': '_height'},
    const {'1': '_fontHeight'},
    const {'1': '_imageTopPadding'},
    const {'1': '_imageLeadingPadding'},
    const {'1': '_imageBottomPadding'},
    const {'1': '_imageTrailingPadding'},
  ],
};

/// Descriptor for `AIRichResponseLatexMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseLatexMetadataDescriptor = $convert.base64Decode('ChtBSVJpY2hSZXNwb25zZUxhdGV4TWV0YWRhdGESFwoEdGV4dBgBIAEoCUgAUgR0ZXh0iAEBEmIKC2V4cHJlc3Npb25zGAIgAygLMkAucHJvdG8uQUlSaWNoUmVzcG9uc2VMYXRleE1ldGFkYXRhLkFJUmljaFJlc3BvbnNlTGF0ZXhFeHByZXNzaW9uUgtleHByZXNzaW9ucxqyBAodQUlSaWNoUmVzcG9uc2VMYXRleEV4cHJlc3Npb24SLQoPbGF0ZXhFeHByZXNzaW9uGAEgASgJSABSD2xhdGV4RXhwcmVzc2lvbogBARIVCgN1cmwYAiABKAlIAVIDdXJsiAEBEhkKBXdpZHRoGAMgASgBSAJSBXdpZHRoiAEBEhsKBmhlaWdodBgEIAEoAUgDUgZoZWlnaHSIAQESIwoKZm9udEhlaWdodBgFIAEoAUgEUgpmb250SGVpZ2h0iAEBEi0KD2ltYWdlVG9wUGFkZGluZxgGIAEoAUgFUg9pbWFnZVRvcFBhZGRpbmeIAQESNQoTaW1hZ2VMZWFkaW5nUGFkZGluZxgHIAEoAUgGUhNpbWFnZUxlYWRpbmdQYWRkaW5niAEBEjMKEmltYWdlQm90dG9tUGFkZGluZxgIIAEoAUgHUhJpbWFnZUJvdHRvbVBhZGRpbmeIAQESNwoUaW1hZ2VUcmFpbGluZ1BhZGRpbmcYCSABKAFICFIUaW1hZ2VUcmFpbGluZ1BhZGRpbmeIAQFCEgoQX2xhdGV4RXhwcmVzc2lvbkIGCgRfdXJsQggKBl93aWR0aEIJCgdfaGVpZ2h0Qg0KC19mb250SGVpZ2h0QhIKEF9pbWFnZVRvcFBhZGRpbmdCFgoUX2ltYWdlTGVhZGluZ1BhZGRpbmdCFQoTX2ltYWdlQm90dG9tUGFkZGluZ0IXChVfaW1hZ2VUcmFpbGluZ1BhZGRpbmdCBwoFX3RleHQ=');
@$core.Deprecated('Use aIRichResponseMapMetadataDescriptor instead')
const AIRichResponseMapMetadata$json = const {
  '1': 'AIRichResponseMapMetadata',
  '2': const [
    const {'1': 'centerLatitude', '3': 1, '4': 1, '5': 1, '9': 0, '10': 'centerLatitude', '17': true},
    const {'1': 'centerLongitude', '3': 2, '4': 1, '5': 1, '9': 1, '10': 'centerLongitude', '17': true},
    const {'1': 'latitudeDelta', '3': 3, '4': 1, '5': 1, '9': 2, '10': 'latitudeDelta', '17': true},
    const {'1': 'longitudeDelta', '3': 4, '4': 1, '5': 1, '9': 3, '10': 'longitudeDelta', '17': true},
    const {'1': 'annotations', '3': 5, '4': 3, '5': 11, '6': '.proto.AIRichResponseMapMetadata.AIRichResponseMapAnnotation', '10': 'annotations'},
    const {'1': 'showInfoList', '3': 6, '4': 1, '5': 8, '9': 4, '10': 'showInfoList', '17': true},
  ],
  '3': const [AIRichResponseMapMetadata_AIRichResponseMapAnnotation$json],
  '8': const [
    const {'1': '_centerLatitude'},
    const {'1': '_centerLongitude'},
    const {'1': '_latitudeDelta'},
    const {'1': '_longitudeDelta'},
    const {'1': '_showInfoList'},
  ],
};

@$core.Deprecated('Use aIRichResponseMapMetadataDescriptor instead')
const AIRichResponseMapMetadata_AIRichResponseMapAnnotation$json = const {
  '1': 'AIRichResponseMapAnnotation',
  '2': const [
    const {'1': 'annotationNumber', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'annotationNumber', '17': true},
    const {'1': 'latitude', '3': 2, '4': 1, '5': 1, '9': 1, '10': 'latitude', '17': true},
    const {'1': 'longitude', '3': 3, '4': 1, '5': 1, '9': 2, '10': 'longitude', '17': true},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'title', '17': true},
    const {'1': 'body', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'body', '17': true},
  ],
  '8': const [
    const {'1': '_annotationNumber'},
    const {'1': '_latitude'},
    const {'1': '_longitude'},
    const {'1': '_title'},
    const {'1': '_body'},
  ],
};

/// Descriptor for `AIRichResponseMapMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseMapMetadataDescriptor = $convert.base64Decode('ChlBSVJpY2hSZXNwb25zZU1hcE1ldGFkYXRhEisKDmNlbnRlckxhdGl0dWRlGAEgASgBSABSDmNlbnRlckxhdGl0dWRliAEBEi0KD2NlbnRlckxvbmdpdHVkZRgCIAEoAUgBUg9jZW50ZXJMb25naXR1ZGWIAQESKQoNbGF0aXR1ZGVEZWx0YRgDIAEoAUgCUg1sYXRpdHVkZURlbHRhiAEBEisKDmxvbmdpdHVkZURlbHRhGAQgASgBSANSDmxvbmdpdHVkZURlbHRhiAEBEl4KC2Fubm90YXRpb25zGAUgAygLMjwucHJvdG8uQUlSaWNoUmVzcG9uc2VNYXBNZXRhZGF0YS5BSVJpY2hSZXNwb25zZU1hcEFubm90YXRpb25SC2Fubm90YXRpb25zEicKDHNob3dJbmZvTGlzdBgGIAEoCEgEUgxzaG93SW5mb0xpc3SIAQEaiQIKG0FJUmljaFJlc3BvbnNlTWFwQW5ub3RhdGlvbhIvChBhbm5vdGF0aW9uTnVtYmVyGAEgASgNSABSEGFubm90YXRpb25OdW1iZXKIAQESHwoIbGF0aXR1ZGUYAiABKAFIAVIIbGF0aXR1ZGWIAQESIQoJbG9uZ2l0dWRlGAMgASgBSAJSCWxvbmdpdHVkZYgBARIZCgV0aXRsZRgEIAEoCUgDUgV0aXRsZYgBARIXCgRib2R5GAUgASgJSARSBGJvZHmIAQFCEwoRX2Fubm90YXRpb25OdW1iZXJCCwoJX2xhdGl0dWRlQgwKCl9sb25naXR1ZGVCCAoGX3RpdGxlQgcKBV9ib2R5QhEKD19jZW50ZXJMYXRpdHVkZUISChBfY2VudGVyTG9uZ2l0dWRlQhAKDl9sYXRpdHVkZURlbHRhQhEKD19sb25naXR1ZGVEZWx0YUIPCg1fc2hvd0luZm9MaXN0');
@$core.Deprecated('Use aIRichResponseMessageDescriptor instead')
const AIRichResponseMessage$json = const {
  '1': 'AIRichResponseMessage',
  '2': const [
    const {'1': 'messageType', '3': 1, '4': 1, '5': 14, '6': '.proto.AIRichResponseMessageType', '9': 0, '10': 'messageType', '17': true},
    const {'1': 'submessages', '3': 2, '4': 3, '5': 11, '6': '.proto.AIRichResponseSubMessage', '10': 'submessages'},
    const {'1': 'unifiedResponse', '3': 3, '4': 1, '5': 11, '6': '.proto.AIRichResponseUnifiedResponse', '9': 1, '10': 'unifiedResponse', '17': true},
    const {'1': 'contextInfo', '3': 4, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 2, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_messageType'},
    const {'1': '_unifiedResponse'},
    const {'1': '_contextInfo'},
  ],
};

/// Descriptor for `AIRichResponseMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseMessageDescriptor = $convert.base64Decode('ChVBSVJpY2hSZXNwb25zZU1lc3NhZ2USRwoLbWVzc2FnZVR5cGUYASABKA4yIC5wcm90by5BSVJpY2hSZXNwb25zZU1lc3NhZ2VUeXBlSABSC21lc3NhZ2VUeXBliAEBEkEKC3N1Ym1lc3NhZ2VzGAIgAygLMh8ucHJvdG8uQUlSaWNoUmVzcG9uc2VTdWJNZXNzYWdlUgtzdWJtZXNzYWdlcxJTCg91bmlmaWVkUmVzcG9uc2UYAyABKAsyJC5wcm90by5BSVJpY2hSZXNwb25zZVVuaWZpZWRSZXNwb25zZUgBUg91bmlmaWVkUmVzcG9uc2WIAQESOQoLY29udGV4dEluZm8YBCABKAsyEi5wcm90by5Db250ZXh0SW5mb0gCUgtjb250ZXh0SW5mb4gBAUIOCgxfbWVzc2FnZVR5cGVCEgoQX3VuaWZpZWRSZXNwb25zZUIOCgxfY29udGV4dEluZm8=');
@$core.Deprecated('Use aIRichResponseSubMessageDescriptor instead')
const AIRichResponseSubMessage$json = const {
  '1': 'AIRichResponseSubMessage',
  '2': const [
    const {'1': 'messageType', '3': 1, '4': 1, '5': 14, '6': '.proto.AIRichResponseSubMessageType', '9': 0, '10': 'messageType', '17': true},
    const {'1': 'gridImageMetadata', '3': 2, '4': 1, '5': 11, '6': '.proto.AIRichResponseGridImageMetadata', '9': 1, '10': 'gridImageMetadata', '17': true},
    const {'1': 'messageText', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'messageText', '17': true},
    const {'1': 'imageMetadata', '3': 4, '4': 1, '5': 11, '6': '.proto.AIRichResponseInlineImageMetadata', '9': 3, '10': 'imageMetadata', '17': true},
    const {'1': 'codeMetadata', '3': 5, '4': 1, '5': 11, '6': '.proto.AIRichResponseCodeMetadata', '9': 4, '10': 'codeMetadata', '17': true},
    const {'1': 'tableMetadata', '3': 6, '4': 1, '5': 11, '6': '.proto.AIRichResponseTableMetadata', '9': 5, '10': 'tableMetadata', '17': true},
    const {'1': 'dynamicMetadata', '3': 7, '4': 1, '5': 11, '6': '.proto.AIRichResponseDynamicMetadata', '9': 6, '10': 'dynamicMetadata', '17': true},
    const {'1': 'latexMetadata', '3': 8, '4': 1, '5': 11, '6': '.proto.AIRichResponseLatexMetadata', '9': 7, '10': 'latexMetadata', '17': true},
    const {'1': 'mapMetadata', '3': 9, '4': 1, '5': 11, '6': '.proto.AIRichResponseMapMetadata', '9': 8, '10': 'mapMetadata', '17': true},
    const {'1': 'contentItemsMetadata', '3': 10, '4': 1, '5': 11, '6': '.proto.AIRichResponseContentItemsMetadata', '9': 9, '10': 'contentItemsMetadata', '17': true},
  ],
  '8': const [
    const {'1': '_messageType'},
    const {'1': '_gridImageMetadata'},
    const {'1': '_messageText'},
    const {'1': '_imageMetadata'},
    const {'1': '_codeMetadata'},
    const {'1': '_tableMetadata'},
    const {'1': '_dynamicMetadata'},
    const {'1': '_latexMetadata'},
    const {'1': '_mapMetadata'},
    const {'1': '_contentItemsMetadata'},
  ],
};

/// Descriptor for `AIRichResponseSubMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseSubMessageDescriptor = $convert.base64Decode('ChhBSVJpY2hSZXNwb25zZVN1Yk1lc3NhZ2USSgoLbWVzc2FnZVR5cGUYASABKA4yIy5wcm90by5BSVJpY2hSZXNwb25zZVN1Yk1lc3NhZ2VUeXBlSABSC21lc3NhZ2VUeXBliAEBElkKEWdyaWRJbWFnZU1ldGFkYXRhGAIgASgLMiYucHJvdG8uQUlSaWNoUmVzcG9uc2VHcmlkSW1hZ2VNZXRhZGF0YUgBUhFncmlkSW1hZ2VNZXRhZGF0YYgBARIlCgttZXNzYWdlVGV4dBgDIAEoCUgCUgttZXNzYWdlVGV4dIgBARJTCg1pbWFnZU1ldGFkYXRhGAQgASgLMigucHJvdG8uQUlSaWNoUmVzcG9uc2VJbmxpbmVJbWFnZU1ldGFkYXRhSANSDWltYWdlTWV0YWRhdGGIAQESSgoMY29kZU1ldGFkYXRhGAUgASgLMiEucHJvdG8uQUlSaWNoUmVzcG9uc2VDb2RlTWV0YWRhdGFIBFIMY29kZU1ldGFkYXRhiAEBEk0KDXRhYmxlTWV0YWRhdGEYBiABKAsyIi5wcm90by5BSVJpY2hSZXNwb25zZVRhYmxlTWV0YWRhdGFIBVINdGFibGVNZXRhZGF0YYgBARJTCg9keW5hbWljTWV0YWRhdGEYByABKAsyJC5wcm90by5BSVJpY2hSZXNwb25zZUR5bmFtaWNNZXRhZGF0YUgGUg9keW5hbWljTWV0YWRhdGGIAQESTQoNbGF0ZXhNZXRhZGF0YRgIIAEoCzIiLnByb3RvLkFJUmljaFJlc3BvbnNlTGF0ZXhNZXRhZGF0YUgHUg1sYXRleE1ldGFkYXRhiAEBEkcKC21hcE1ldGFkYXRhGAkgASgLMiAucHJvdG8uQUlSaWNoUmVzcG9uc2VNYXBNZXRhZGF0YUgIUgttYXBNZXRhZGF0YYgBARJiChRjb250ZW50SXRlbXNNZXRhZGF0YRgKIAEoCzIpLnByb3RvLkFJUmljaFJlc3BvbnNlQ29udGVudEl0ZW1zTWV0YWRhdGFICVIUY29udGVudEl0ZW1zTWV0YWRhdGGIAQFCDgoMX21lc3NhZ2VUeXBlQhQKEl9ncmlkSW1hZ2VNZXRhZGF0YUIOCgxfbWVzc2FnZVRleHRCEAoOX2ltYWdlTWV0YWRhdGFCDwoNX2NvZGVNZXRhZGF0YUIQCg5fdGFibGVNZXRhZGF0YUISChBfZHluYW1pY01ldGFkYXRhQhAKDl9sYXRleE1ldGFkYXRhQg4KDF9tYXBNZXRhZGF0YUIXChVfY29udGVudEl0ZW1zTWV0YWRhdGE=');
@$core.Deprecated('Use aIRichResponseTableMetadataDescriptor instead')
const AIRichResponseTableMetadata$json = const {
  '1': 'AIRichResponseTableMetadata',
  '2': const [
    const {'1': 'rows', '3': 1, '4': 3, '5': 11, '6': '.proto.AIRichResponseTableMetadata.AIRichResponseTableRow', '10': 'rows'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
  ],
  '3': const [AIRichResponseTableMetadata_AIRichResponseTableRow$json],
  '8': const [
    const {'1': '_title'},
  ],
};

@$core.Deprecated('Use aIRichResponseTableMetadataDescriptor instead')
const AIRichResponseTableMetadata_AIRichResponseTableRow$json = const {
  '1': 'AIRichResponseTableRow',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 9, '10': 'items'},
    const {'1': 'isHeading', '3': 2, '4': 1, '5': 8, '9': 0, '10': 'isHeading', '17': true},
  ],
  '8': const [
    const {'1': '_isHeading'},
  ],
};

/// Descriptor for `AIRichResponseTableMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseTableMetadataDescriptor = $convert.base64Decode('ChtBSVJpY2hSZXNwb25zZVRhYmxlTWV0YWRhdGESTQoEcm93cxgBIAMoCzI5LnByb3RvLkFJUmljaFJlc3BvbnNlVGFibGVNZXRhZGF0YS5BSVJpY2hSZXNwb25zZVRhYmxlUm93UgRyb3dzEhkKBXRpdGxlGAIgASgJSABSBXRpdGxliAEBGl8KFkFJUmljaFJlc3BvbnNlVGFibGVSb3cSFAoFaXRlbXMYASADKAlSBWl0ZW1zEiEKCWlzSGVhZGluZxgCIAEoCEgAUglpc0hlYWRpbmeIAQFCDAoKX2lzSGVhZGluZ0IICgZfdGl0bGU=');
@$core.Deprecated('Use aIRichResponseUnifiedResponseDescriptor instead')
const AIRichResponseUnifiedResponse$json = const {
  '1': 'AIRichResponseUnifiedResponse',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'data', '17': true},
  ],
  '8': const [
    const {'1': '_data'},
  ],
};

/// Descriptor for `AIRichResponseUnifiedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIRichResponseUnifiedResponseDescriptor = $convert.base64Decode('Ch1BSVJpY2hSZXNwb25zZVVuaWZpZWRSZXNwb25zZRIXCgRkYXRhGAEgASgMSABSBGRhdGGIAQFCBwoFX2RhdGE=');
@$core.Deprecated('Use aIThreadInfoDescriptor instead')
const AIThreadInfo$json = const {
  '1': 'AIThreadInfo',
  '2': const [
    const {'1': 'serverInfo', '3': 1, '4': 1, '5': 11, '6': '.proto.AIThreadInfo.AIThreadServerInfo', '9': 0, '10': 'serverInfo', '17': true},
    const {'1': 'clientInfo', '3': 2, '4': 1, '5': 11, '6': '.proto.AIThreadInfo.AIThreadClientInfo', '9': 1, '10': 'clientInfo', '17': true},
  ],
  '3': const [AIThreadInfo_AIThreadClientInfo$json, AIThreadInfo_AIThreadServerInfo$json],
  '8': const [
    const {'1': '_serverInfo'},
    const {'1': '_clientInfo'},
  ],
};

@$core.Deprecated('Use aIThreadInfoDescriptor instead')
const AIThreadInfo_AIThreadClientInfo$json = const {
  '1': 'AIThreadClientInfo',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.AIThreadInfo.AIThreadClientInfo.AIThreadType', '9': 0, '10': 'type', '17': true},
  ],
  '4': const [AIThreadInfo_AIThreadClientInfo_AIThreadType$json],
  '8': const [
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use aIThreadInfoDescriptor instead')
const AIThreadInfo_AIThreadClientInfo_AIThreadType$json = const {
  '1': 'AIThreadType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'DEFAULT', '2': 1},
    const {'1': 'INCOGNITO', '2': 2},
  ],
};

@$core.Deprecated('Use aIThreadInfoDescriptor instead')
const AIThreadInfo_AIThreadServerInfo$json = const {
  '1': 'AIThreadServerInfo',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
  ],
  '8': const [
    const {'1': '_title'},
  ],
};

/// Descriptor for `AIThreadInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List aIThreadInfoDescriptor = $convert.base64Decode('CgxBSVRocmVhZEluZm8SSwoKc2VydmVySW5mbxgBIAEoCzImLnByb3RvLkFJVGhyZWFkSW5mby5BSVRocmVhZFNlcnZlckluZm9IAFIKc2VydmVySW5mb4gBARJLCgpjbGllbnRJbmZvGAIgASgLMiYucHJvdG8uQUlUaHJlYWRJbmZvLkFJVGhyZWFkQ2xpZW50SW5mb0gBUgpjbGllbnRJbmZviAEBGqQBChJBSVRocmVhZENsaWVudEluZm8STAoEdHlwZRgBIAEoDjIzLnByb3RvLkFJVGhyZWFkSW5mby5BSVRocmVhZENsaWVudEluZm8uQUlUaHJlYWRUeXBlSABSBHR5cGWIAQEiNwoMQUlUaHJlYWRUeXBlEgsKB1VOS05PV04QABILCgdERUZBVUxUEAESDQoJSU5DT0dOSVRPEAJCBwoFX3R5cGUaOQoSQUlUaHJlYWRTZXJ2ZXJJbmZvEhkKBXRpdGxlGAEgASgJSABSBXRpdGxliAEBQggKBl90aXRsZUINCgtfc2VydmVySW5mb0INCgtfY2xpZW50SW5mbw==');
@$core.Deprecated('Use accountDescriptor instead')
const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'lid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'lid', '17': true},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'username', '17': true},
    const {'1': 'countryCode', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'countryCode', '17': true},
    const {'1': 'isUsernameDeleted', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'isUsernameDeleted', '17': true},
  ],
  '8': const [
    const {'1': '_lid'},
    const {'1': '_username'},
    const {'1': '_countryCode'},
    const {'1': '_isUsernameDeleted'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50EhUKA2xpZBgBIAEoCUgAUgNsaWSIAQESHwoIdXNlcm5hbWUYAiABKAlIAVIIdXNlcm5hbWWIAQESJQoLY291bnRyeUNvZGUYAyABKAlIAlILY291bnRyeUNvZGWIAQESMQoRaXNVc2VybmFtZURlbGV0ZWQYBCABKAhIA1IRaXNVc2VybmFtZURlbGV0ZWSIAQFCBgoEX2xpZEILCglfdXNlcm5hbWVCDgoMX2NvdW50cnlDb2RlQhQKEl9pc1VzZXJuYW1lRGVsZXRlZA==');
@$core.Deprecated('Use actionLinkDescriptor instead')
const ActionLink$json = const {
  '1': 'ActionLink',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'buttonTitle', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'buttonTitle', '17': true},
  ],
  '8': const [
    const {'1': '_url'},
    const {'1': '_buttonTitle'},
  ],
};

/// Descriptor for `ActionLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List actionLinkDescriptor = $convert.base64Decode('CgpBY3Rpb25MaW5rEhUKA3VybBgBIAEoCUgAUgN1cmyIAQESJQoLYnV0dG9uVGl0bGUYAiABKAlIAVILYnV0dG9uVGl0bGWIAQFCBgoEX3VybEIOCgxfYnV0dG9uVGl0bGU=');
@$core.Deprecated('Use autoDownloadSettingsDescriptor instead')
const AutoDownloadSettings$json = const {
  '1': 'AutoDownloadSettings',
  '2': const [
    const {'1': 'downloadImages', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'downloadImages', '17': true},
    const {'1': 'downloadAudio', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'downloadAudio', '17': true},
    const {'1': 'downloadVideo', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'downloadVideo', '17': true},
    const {'1': 'downloadDocuments', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'downloadDocuments', '17': true},
  ],
  '8': const [
    const {'1': '_downloadImages'},
    const {'1': '_downloadAudio'},
    const {'1': '_downloadVideo'},
    const {'1': '_downloadDocuments'},
  ],
};

/// Descriptor for `AutoDownloadSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List autoDownloadSettingsDescriptor = $convert.base64Decode('ChRBdXRvRG93bmxvYWRTZXR0aW5ncxIrCg5kb3dubG9hZEltYWdlcxgBIAEoCEgAUg5kb3dubG9hZEltYWdlc4gBARIpCg1kb3dubG9hZEF1ZGlvGAIgASgISAFSDWRvd25sb2FkQXVkaW+IAQESKQoNZG93bmxvYWRWaWRlbxgDIAEoCEgCUg1kb3dubG9hZFZpZGVviAEBEjEKEWRvd25sb2FkRG9jdW1lbnRzGAQgASgISANSEWRvd25sb2FkRG9jdW1lbnRziAEBQhEKD19kb3dubG9hZEltYWdlc0IQCg5fZG93bmxvYWRBdWRpb0IQCg5fZG93bmxvYWRWaWRlb0IUChJfZG93bmxvYWREb2N1bWVudHM=');
@$core.Deprecated('Use avatarUserSettingsDescriptor instead')
const AvatarUserSettings$json = const {
  '1': 'AvatarUserSettings',
  '2': const [
    const {'1': 'fbid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'fbid', '17': true},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'password', '17': true},
  ],
  '8': const [
    const {'1': '_fbid'},
    const {'1': '_password'},
  ],
};

/// Descriptor for `AvatarUserSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List avatarUserSettingsDescriptor = $convert.base64Decode('ChJBdmF0YXJVc2VyU2V0dGluZ3MSFwoEZmJpZBgBIAEoCUgAUgRmYmlkiAEBEh8KCHBhc3N3b3JkGAIgASgJSAFSCHBhc3N3b3JkiAEBQgcKBV9mYmlkQgsKCV9wYXNzd29yZA==');
@$core.Deprecated('Use bizAccountLinkInfoDescriptor instead')
const BizAccountLinkInfo$json = const {
  '1': 'BizAccountLinkInfo',
  '2': const [
    const {'1': 'whatsappBizAcctFbid', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'whatsappBizAcctFbid', '17': true},
    const {'1': 'whatsappAcctNumber', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'whatsappAcctNumber', '17': true},
    const {'1': 'issueTime', '3': 3, '4': 1, '5': 4, '9': 2, '10': 'issueTime', '17': true},
    const {'1': 'hostStorage', '3': 4, '4': 1, '5': 14, '6': '.proto.BizAccountLinkInfo.HostStorageType', '9': 3, '10': 'hostStorage', '17': true},
    const {'1': 'accountType', '3': 5, '4': 1, '5': 14, '6': '.proto.BizAccountLinkInfo.AccountType', '9': 4, '10': 'accountType', '17': true},
  ],
  '4': const [BizAccountLinkInfo_AccountType$json, BizAccountLinkInfo_HostStorageType$json],
  '8': const [
    const {'1': '_whatsappBizAcctFbid'},
    const {'1': '_whatsappAcctNumber'},
    const {'1': '_issueTime'},
    const {'1': '_hostStorage'},
    const {'1': '_accountType'},
  ],
};

@$core.Deprecated('Use bizAccountLinkInfoDescriptor instead')
const BizAccountLinkInfo_AccountType$json = const {
  '1': 'AccountType',
  '2': const [
    const {'1': 'ENTERPRISE', '2': 0},
  ],
};

@$core.Deprecated('Use bizAccountLinkInfoDescriptor instead')
const BizAccountLinkInfo_HostStorageType$json = const {
  '1': 'HostStorageType',
  '2': const [
    const {'1': 'ON_PREMISE', '2': 0},
    const {'1': 'FACEBOOK', '2': 1},
  ],
};

/// Descriptor for `BizAccountLinkInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bizAccountLinkInfoDescriptor = $convert.base64Decode('ChJCaXpBY2NvdW50TGlua0luZm8SNQoTd2hhdHNhcHBCaXpBY2N0RmJpZBgBIAEoBEgAUhN3aGF0c2FwcEJpekFjY3RGYmlkiAEBEjMKEndoYXRzYXBwQWNjdE51bWJlchgCIAEoCUgBUhJ3aGF0c2FwcEFjY3ROdW1iZXKIAQESIQoJaXNzdWVUaW1lGAMgASgESAJSCWlzc3VlVGltZYgBARJQCgtob3N0U3RvcmFnZRgEIAEoDjIpLnByb3RvLkJpekFjY291bnRMaW5rSW5mby5Ib3N0U3RvcmFnZVR5cGVIA1ILaG9zdFN0b3JhZ2WIAQESTAoLYWNjb3VudFR5cGUYBSABKA4yJS5wcm90by5CaXpBY2NvdW50TGlua0luZm8uQWNjb3VudFR5cGVIBFILYWNjb3VudFR5cGWIAQEiHQoLQWNjb3VudFR5cGUSDgoKRU5URVJQUklTRRAAIi8KD0hvc3RTdG9yYWdlVHlwZRIOCgpPTl9QUkVNSVNFEAASDAoIRkFDRUJPT0sQAUIWChRfd2hhdHNhcHBCaXpBY2N0RmJpZEIVChNfd2hhdHNhcHBBY2N0TnVtYmVyQgwKCl9pc3N1ZVRpbWVCDgoMX2hvc3RTdG9yYWdlQg4KDF9hY2NvdW50VHlwZQ==');
@$core.Deprecated('Use bizAccountPayloadDescriptor instead')
const BizAccountPayload$json = const {
  '1': 'BizAccountPayload',
  '2': const [
    const {'1': 'vnameCert', '3': 1, '4': 1, '5': 11, '6': '.proto.VerifiedNameCertificate', '9': 0, '10': 'vnameCert', '17': true},
    const {'1': 'bizAcctLinkInfo', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'bizAcctLinkInfo', '17': true},
  ],
  '8': const [
    const {'1': '_vnameCert'},
    const {'1': '_bizAcctLinkInfo'},
  ],
};

/// Descriptor for `BizAccountPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bizAccountPayloadDescriptor = $convert.base64Decode('ChFCaXpBY2NvdW50UGF5bG9hZBJBCgl2bmFtZUNlcnQYASABKAsyHi5wcm90by5WZXJpZmllZE5hbWVDZXJ0aWZpY2F0ZUgAUgl2bmFtZUNlcnSIAQESLQoPYml6QWNjdExpbmtJbmZvGAIgASgMSAFSD2JpekFjY3RMaW5rSW5mb4gBAUIMCgpfdm5hbWVDZXJ0QhIKEF9iaXpBY2N0TGlua0luZm8=');
@$core.Deprecated('Use bizIdentityInfoDescriptor instead')
const BizIdentityInfo$json = const {
  '1': 'BizIdentityInfo',
  '2': const [
    const {'1': 'vlevel', '3': 1, '4': 1, '5': 14, '6': '.proto.BizIdentityInfo.VerifiedLevelValue', '9': 0, '10': 'vlevel', '17': true},
    const {'1': 'vnameCert', '3': 2, '4': 1, '5': 11, '6': '.proto.VerifiedNameCertificate', '9': 1, '10': 'vnameCert', '17': true},
    const {'1': 'signed', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'signed', '17': true},
    const {'1': 'revoked', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'revoked', '17': true},
    const {'1': 'hostStorage', '3': 5, '4': 1, '5': 14, '6': '.proto.BizIdentityInfo.HostStorageType', '9': 4, '10': 'hostStorage', '17': true},
    const {'1': 'actualActors', '3': 6, '4': 1, '5': 14, '6': '.proto.BizIdentityInfo.ActualActorsType', '9': 5, '10': 'actualActors', '17': true},
    const {'1': 'privacyModeTs', '3': 7, '4': 1, '5': 4, '9': 6, '10': 'privacyModeTs', '17': true},
    const {'1': 'featureControls', '3': 8, '4': 1, '5': 4, '9': 7, '10': 'featureControls', '17': true},
  ],
  '4': const [BizIdentityInfo_ActualActorsType$json, BizIdentityInfo_HostStorageType$json, BizIdentityInfo_VerifiedLevelValue$json],
  '8': const [
    const {'1': '_vlevel'},
    const {'1': '_vnameCert'},
    const {'1': '_signed'},
    const {'1': '_revoked'},
    const {'1': '_hostStorage'},
    const {'1': '_actualActors'},
    const {'1': '_privacyModeTs'},
    const {'1': '_featureControls'},
  ],
};

@$core.Deprecated('Use bizIdentityInfoDescriptor instead')
const BizIdentityInfo_ActualActorsType$json = const {
  '1': 'ActualActorsType',
  '2': const [
    const {'1': 'SELF', '2': 0},
    const {'1': 'BSP', '2': 1},
  ],
};

@$core.Deprecated('Use bizIdentityInfoDescriptor instead')
const BizIdentityInfo_HostStorageType$json = const {
  '1': 'HostStorageType',
  '2': const [
    const {'1': 'ON_PREMISE', '2': 0},
    const {'1': 'FACEBOOK', '2': 1},
  ],
};

@$core.Deprecated('Use bizIdentityInfoDescriptor instead')
const BizIdentityInfo_VerifiedLevelValue$json = const {
  '1': 'VerifiedLevelValue',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'LOW', '2': 1},
    const {'1': 'HIGH', '2': 2},
  ],
};

/// Descriptor for `BizIdentityInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bizIdentityInfoDescriptor = $convert.base64Decode('Cg9CaXpJZGVudGl0eUluZm8SRgoGdmxldmVsGAEgASgOMikucHJvdG8uQml6SWRlbnRpdHlJbmZvLlZlcmlmaWVkTGV2ZWxWYWx1ZUgAUgZ2bGV2ZWyIAQESQQoJdm5hbWVDZXJ0GAIgASgLMh4ucHJvdG8uVmVyaWZpZWROYW1lQ2VydGlmaWNhdGVIAVIJdm5hbWVDZXJ0iAEBEhsKBnNpZ25lZBgDIAEoCEgCUgZzaWduZWSIAQESHQoHcmV2b2tlZBgEIAEoCEgDUgdyZXZva2VkiAEBEk0KC2hvc3RTdG9yYWdlGAUgASgOMiYucHJvdG8uQml6SWRlbnRpdHlJbmZvLkhvc3RTdG9yYWdlVHlwZUgEUgtob3N0U3RvcmFnZYgBARJQCgxhY3R1YWxBY3RvcnMYBiABKA4yJy5wcm90by5CaXpJZGVudGl0eUluZm8uQWN0dWFsQWN0b3JzVHlwZUgFUgxhY3R1YWxBY3RvcnOIAQESKQoNcHJpdmFjeU1vZGVUcxgHIAEoBEgGUg1wcml2YWN5TW9kZVRziAEBEi0KD2ZlYXR1cmVDb250cm9scxgIIAEoBEgHUg9mZWF0dXJlQ29udHJvbHOIAQEiJQoQQWN0dWFsQWN0b3JzVHlwZRIICgRTRUxGEAASBwoDQlNQEAEiLwoPSG9zdFN0b3JhZ2VUeXBlEg4KCk9OX1BSRU1JU0UQABIMCghGQUNFQk9PSxABIjQKElZlcmlmaWVkTGV2ZWxWYWx1ZRILCgdVTktOT1dOEAASBwoDTE9XEAESCAoESElHSBACQgkKB192bGV2ZWxCDAoKX3ZuYW1lQ2VydEIJCgdfc2lnbmVkQgoKCF9yZXZva2VkQg4KDF9ob3N0U3RvcmFnZUIPCg1fYWN0dWFsQWN0b3JzQhAKDl9wcml2YWN5TW9kZVRzQhIKEF9mZWF0dXJlQ29udHJvbHM=');
@$core.Deprecated('Use botAgeCollectionMetadataDescriptor instead')
const BotAgeCollectionMetadata$json = const {
  '1': 'BotAgeCollectionMetadata',
  '2': const [
    const {'1': 'ageCollectionEligible', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'ageCollectionEligible', '17': true},
    const {'1': 'shouldTriggerAgeCollectionOnClient', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'shouldTriggerAgeCollectionOnClient', '17': true},
    const {'1': 'ageCollectionType', '3': 3, '4': 1, '5': 14, '6': '.proto.BotAgeCollectionMetadata.AgeCollectionType', '9': 2, '10': 'ageCollectionType', '17': true},
  ],
  '4': const [BotAgeCollectionMetadata_AgeCollectionType$json],
  '8': const [
    const {'1': '_ageCollectionEligible'},
    const {'1': '_shouldTriggerAgeCollectionOnClient'},
    const {'1': '_ageCollectionType'},
  ],
};

@$core.Deprecated('Use botAgeCollectionMetadataDescriptor instead')
const BotAgeCollectionMetadata_AgeCollectionType$json = const {
  '1': 'AgeCollectionType',
  '2': const [
    const {'1': 'O18_BINARY', '2': 0},
    const {'1': 'WAFFLE', '2': 1},
  ],
};

/// Descriptor for `BotAgeCollectionMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botAgeCollectionMetadataDescriptor = $convert.base64Decode('ChhCb3RBZ2VDb2xsZWN0aW9uTWV0YWRhdGESOQoVYWdlQ29sbGVjdGlvbkVsaWdpYmxlGAEgASgISABSFWFnZUNvbGxlY3Rpb25FbGlnaWJsZYgBARJTCiJzaG91bGRUcmlnZ2VyQWdlQ29sbGVjdGlvbk9uQ2xpZW50GAIgASgISAFSInNob3VsZFRyaWdnZXJBZ2VDb2xsZWN0aW9uT25DbGllbnSIAQESZAoRYWdlQ29sbGVjdGlvblR5cGUYAyABKA4yMS5wcm90by5Cb3RBZ2VDb2xsZWN0aW9uTWV0YWRhdGEuQWdlQ29sbGVjdGlvblR5cGVIAlIRYWdlQ29sbGVjdGlvblR5cGWIAQEiLwoRQWdlQ29sbGVjdGlvblR5cGUSDgoKTzE4X0JJTkFSWRAAEgoKBldBRkZMRRABQhgKFl9hZ2VDb2xsZWN0aW9uRWxpZ2libGVCJQojX3Nob3VsZFRyaWdnZXJBZ2VDb2xsZWN0aW9uT25DbGllbnRCFAoSX2FnZUNvbGxlY3Rpb25UeXBl');
@$core.Deprecated('Use botAvatarMetadataDescriptor instead')
const BotAvatarMetadata$json = const {
  '1': 'BotAvatarMetadata',
  '2': const [
    const {'1': 'sentiment', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'sentiment', '17': true},
    const {'1': 'behaviorGraph', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'behaviorGraph', '17': true},
    const {'1': 'action', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'action', '17': true},
    const {'1': 'intensity', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'intensity', '17': true},
    const {'1': 'wordCount', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'wordCount', '17': true},
  ],
  '8': const [
    const {'1': '_sentiment'},
    const {'1': '_behaviorGraph'},
    const {'1': '_action'},
    const {'1': '_intensity'},
    const {'1': '_wordCount'},
  ],
};

/// Descriptor for `BotAvatarMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botAvatarMetadataDescriptor = $convert.base64Decode('ChFCb3RBdmF0YXJNZXRhZGF0YRIhCglzZW50aW1lbnQYASABKA1IAFIJc2VudGltZW50iAEBEikKDWJlaGF2aW9yR3JhcGgYAiABKAlIAVINYmVoYXZpb3JHcmFwaIgBARIbCgZhY3Rpb24YAyABKA1IAlIGYWN0aW9uiAEBEiEKCWludGVuc2l0eRgEIAEoDUgDUglpbnRlbnNpdHmIAQESIQoJd29yZENvdW50GAUgASgNSARSCXdvcmRDb3VudIgBAUIMCgpfc2VudGltZW50QhAKDl9iZWhhdmlvckdyYXBoQgkKB19hY3Rpb25CDAoKX2ludGVuc2l0eUIMCgpfd29yZENvdW50');
@$core.Deprecated('Use botCapabilityMetadataDescriptor instead')
const BotCapabilityMetadata$json = const {
  '1': 'BotCapabilityMetadata',
  '2': const [
    const {'1': 'capabilities', '3': 1, '4': 3, '5': 14, '6': '.proto.BotCapabilityMetadata.BotCapabilityType', '10': 'capabilities'},
  ],
  '4': const [BotCapabilityMetadata_BotCapabilityType$json],
};

@$core.Deprecated('Use botCapabilityMetadataDescriptor instead')
const BotCapabilityMetadata_BotCapabilityType$json = const {
  '1': 'BotCapabilityType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'PROGRESS_INDICATOR', '2': 1},
    const {'1': 'RICH_RESPONSE_HEADING', '2': 2},
    const {'1': 'RICH_RESPONSE_NESTED_LIST', '2': 3},
    const {'1': 'AI_MEMORY', '2': 4},
    const {'1': 'RICH_RESPONSE_THREAD_SURFING', '2': 5},
    const {'1': 'RICH_RESPONSE_TABLE', '2': 6},
    const {'1': 'RICH_RESPONSE_CODE', '2': 7},
    const {'1': 'RICH_RESPONSE_STRUCTURED_RESPONSE', '2': 8},
    const {'1': 'RICH_RESPONSE_INLINE_IMAGE', '2': 9},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_CONTROL', '2': 10},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_1', '2': 11},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_2', '2': 12},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_3', '2': 13},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_4', '2': 14},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_5', '2': 15},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_6', '2': 16},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_7', '2': 17},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_8', '2': 18},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_9', '2': 19},
    const {'1': 'WA_IG_1P_PLUGIN_RANKING_UPDATE_10', '2': 20},
    const {'1': 'RICH_RESPONSE_SUB_HEADING', '2': 21},
    const {'1': 'RICH_RESPONSE_GRID_IMAGE', '2': 22},
    const {'1': 'AI_STUDIO_UGC_MEMORY', '2': 23},
    const {'1': 'RICH_RESPONSE_LATEX', '2': 24},
    const {'1': 'RICH_RESPONSE_MAPS', '2': 25},
    const {'1': 'RICH_RESPONSE_INLINE_REELS', '2': 26},
    const {'1': 'AGENTIC_PLANNING', '2': 27},
    const {'1': 'ACCOUNT_LINKING', '2': 28},
    const {'1': 'STREAMING_DISAGGREGATION', '2': 29},
    const {'1': 'RICH_RESPONSE_GRID_IMAGE_3P', '2': 30},
    const {'1': 'RICH_RESPONSE_LATEX_INLINE', '2': 31},
    const {'1': 'QUERY_PLAN', '2': 32},
    const {'1': 'PROACTIVE_MESSAGE', '2': 33},
    const {'1': 'RICH_RESPONSE_UNIFIED_RESPONSE', '2': 34},
    const {'1': 'PROMOTION_MESSAGE', '2': 35},
    const {'1': 'SIMPLIFIED_PROFILE_PAGE', '2': 36},
    const {'1': 'RICH_RESPONSE_SOURCES_IN_MESSAGE', '2': 37},
    const {'1': 'RICH_RESPONSE_SIDE_BY_SIDE_SURVEY', '2': 38},
    const {'1': 'RICH_RESPONSE_UNIFIED_TEXT_COMPONENT', '2': 39},
    const {'1': 'AI_SHARED_MEMORY', '2': 40},
    const {'1': 'RICH_RESPONSE_UNIFIED_SOURCES', '2': 41},
    const {'1': 'RICH_RESPONSE_UNIFIED_DOMAIN_CITATIONS', '2': 42},
    const {'1': 'RICH_RESPONSE_UR_INLINE_REELS_ENABLED', '2': 43},
    const {'1': 'RICH_RESPONSE_UR_MEDIA_GRID_ENABLED', '2': 44},
    const {'1': 'RICH_RESPONSE_UR_TIMESTAMP_PLACEHOLDER', '2': 45},
    const {'1': 'RICH_RESPONSE_IN_APP_SURVEY', '2': 46},
    const {'1': 'AI_RESPONSE_MODEL_BRANDING', '2': 47},
    const {'1': 'SESSION_TRANSPARENCY_SYSTEM_MESSAGE', '2': 48},
    const {'1': 'RICH_RESPONSE_UR_REASONING', '2': 49},
  ],
};

/// Descriptor for `BotCapabilityMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botCapabilityMetadataDescriptor = $convert.base64Decode('ChVCb3RDYXBhYmlsaXR5TWV0YWRhdGESUgoMY2FwYWJpbGl0aWVzGAEgAygOMi4ucHJvdG8uQm90Q2FwYWJpbGl0eU1ldGFkYXRhLkJvdENhcGFiaWxpdHlUeXBlUgxjYXBhYmlsaXRpZXMi1AwKEUJvdENhcGFiaWxpdHlUeXBlEgsKB1VOS05PV04QABIWChJQUk9HUkVTU19JTkRJQ0FUT1IQARIZChVSSUNIX1JFU1BPTlNFX0hFQURJTkcQAhIdChlSSUNIX1JFU1BPTlNFX05FU1RFRF9MSVNUEAMSDQoJQUlfTUVNT1JZEAQSIAocUklDSF9SRVNQT05TRV9USFJFQURfU1VSRklORxAFEhcKE1JJQ0hfUkVTUE9OU0VfVEFCTEUQBhIWChJSSUNIX1JFU1BPTlNFX0NPREUQBxIlCiFSSUNIX1JFU1BPTlNFX1NUUlVDVFVSRURfUkVTUE9OU0UQCBIeChpSSUNIX1JFU1BPTlNFX0lOTElORV9JTUFHRRAJEiMKH1dBX0lHXzFQX1BMVUdJTl9SQU5LSU5HX0NPTlRST0wQChIkCiBXQV9JR18xUF9QTFVHSU5fUkFOS0lOR19VUERBVEVfMRALEiQKIFdBX0lHXzFQX1BMVUdJTl9SQU5LSU5HX1VQREFURV8yEAwSJAogV0FfSUdfMVBfUExVR0lOX1JBTktJTkdfVVBEQVRFXzMQDRIkCiBXQV9JR18xUF9QTFVHSU5fUkFOS0lOR19VUERBVEVfNBAOEiQKIFdBX0lHXzFQX1BMVUdJTl9SQU5LSU5HX1VQREFURV81EA8SJAogV0FfSUdfMVBfUExVR0lOX1JBTktJTkdfVVBEQVRFXzYQEBIkCiBXQV9JR18xUF9QTFVHSU5fUkFOS0lOR19VUERBVEVfNxAREiQKIFdBX0lHXzFQX1BMVUdJTl9SQU5LSU5HX1VQREFURV84EBISJAogV0FfSUdfMVBfUExVR0lOX1JBTktJTkdfVVBEQVRFXzkQExIlCiFXQV9JR18xUF9QTFVHSU5fUkFOS0lOR19VUERBVEVfMTAQFBIdChlSSUNIX1JFU1BPTlNFX1NVQl9IRUFESU5HEBUSHAoYUklDSF9SRVNQT05TRV9HUklEX0lNQUdFEBYSGAoUQUlfU1RVRElPX1VHQ19NRU1PUlkQFxIXChNSSUNIX1JFU1BPTlNFX0xBVEVYEBgSFgoSUklDSF9SRVNQT05TRV9NQVBTEBkSHgoaUklDSF9SRVNQT05TRV9JTkxJTkVfUkVFTFMQGhIUChBBR0VOVElDX1BMQU5OSU5HEBsSEwoPQUNDT1VOVF9MSU5LSU5HEBwSHAoYU1RSRUFNSU5HX0RJU0FHR1JFR0FUSU9OEB0SHwobUklDSF9SRVNQT05TRV9HUklEX0lNQUdFXzNQEB4SHgoaUklDSF9SRVNQT05TRV9MQVRFWF9JTkxJTkUQHxIOCgpRVUVSWV9QTEFOECASFQoRUFJPQUNUSVZFX01FU1NBR0UQIRIiCh5SSUNIX1JFU1BPTlNFX1VOSUZJRURfUkVTUE9OU0UQIhIVChFQUk9NT1RJT05fTUVTU0FHRRAjEhsKF1NJTVBMSUZJRURfUFJPRklMRV9QQUdFECQSJAogUklDSF9SRVNQT05TRV9TT1VSQ0VTX0lOX01FU1NBR0UQJRIlCiFSSUNIX1JFU1BPTlNFX1NJREVfQllfU0lERV9TVVJWRVkQJhIoCiRSSUNIX1JFU1BPTlNFX1VOSUZJRURfVEVYVF9DT01QT05FTlQQJxIUChBBSV9TSEFSRURfTUVNT1JZECgSIQodUklDSF9SRVNQT05TRV9VTklGSUVEX1NPVVJDRVMQKRIqCiZSSUNIX1JFU1BPTlNFX1VOSUZJRURfRE9NQUlOX0NJVEFUSU9OUxAqEikKJVJJQ0hfUkVTUE9OU0VfVVJfSU5MSU5FX1JFRUxTX0VOQUJMRUQQKxInCiNSSUNIX1JFU1BPTlNFX1VSX01FRElBX0dSSURfRU5BQkxFRBAsEioKJlJJQ0hfUkVTUE9OU0VfVVJfVElNRVNUQU1QX1BMQUNFSE9MREVSEC0SHwobUklDSF9SRVNQT05TRV9JTl9BUFBfU1VSVkVZEC4SHgoaQUlfUkVTUE9OU0VfTU9ERUxfQlJBTkRJTkcQLxInCiNTRVNTSU9OX1RSQU5TUEFSRU5DWV9TWVNURU1fTUVTU0FHRRAwEh4KGlJJQ0hfUkVTUE9OU0VfVVJfUkVBU09OSU5HEDE=');
@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage$json = const {
  '1': 'BotFeedbackMessage',
  '2': const [
    const {'1': 'messageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'messageKey', '17': true},
    const {'1': 'kind', '3': 2, '4': 1, '5': 14, '6': '.proto.BotFeedbackMessage.BotFeedbackKind', '9': 1, '10': 'kind', '17': true},
    const {'1': 'text', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'text', '17': true},
    const {'1': 'kindNegative', '3': 4, '4': 1, '5': 4, '9': 3, '10': 'kindNegative', '17': true},
    const {'1': 'kindPositive', '3': 5, '4': 1, '5': 4, '9': 4, '10': 'kindPositive', '17': true},
    const {'1': 'kindReport', '3': 6, '4': 1, '5': 14, '6': '.proto.BotFeedbackMessage.ReportKind', '9': 5, '10': 'kindReport', '17': true},
    const {'1': 'sideBySideSurveyMetadata', '3': 7, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata', '9': 6, '10': 'sideBySideSurveyMetadata', '17': true},
  ],
  '3': const [BotFeedbackMessage_SideBySideSurveyMetadata$json],
  '4': const [BotFeedbackMessage_BotFeedbackKind$json, BotFeedbackMessage_BotFeedbackKindMultipleNegative$json, BotFeedbackMessage_BotFeedbackKindMultiplePositive$json, BotFeedbackMessage_ReportKind$json],
  '8': const [
    const {'1': '_messageKey'},
    const {'1': '_kind'},
    const {'1': '_text'},
    const {'1': '_kindNegative'},
    const {'1': '_kindPositive'},
    const {'1': '_kindReport'},
    const {'1': '_sideBySideSurveyMetadata'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata$json = const {
  '1': 'SideBySideSurveyMetadata',
  '2': const [
    const {'1': 'selectedRequestId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'selectedRequestId', '17': true},
    const {'1': 'surveyId', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'surveyId', '17': true},
    const {'1': 'simonSessionFbid', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'simonSessionFbid', '17': true},
    const {'1': 'responseOtid', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'responseOtid', '17': true},
    const {'1': 'responseTimestampMsString', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'responseTimestampMsString', '17': true},
    const {'1': 'isSelectedResponsePrimary', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'isSelectedResponsePrimary', '17': true},
    const {'1': 'messageIdToEdit', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'messageIdToEdit', '17': true},
    const {'1': 'analyticsData', '3': 8, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata.SideBySideSurveyAnalyticsData', '9': 7, '10': 'analyticsData', '17': true},
    const {'1': 'metaAiAnalyticsData', '3': 9, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata.SidebySideSurveyMetaAiAnalyticsData', '9': 8, '10': 'metaAiAnalyticsData', '17': true},
  ],
  '3': const [BotFeedbackMessage_SideBySideSurveyMetadata_SideBySideSurveyAnalyticsData$json, BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData$json],
  '8': const [
    const {'1': '_selectedRequestId'},
    const {'1': '_surveyId'},
    const {'1': '_simonSessionFbid'},
    const {'1': '_responseOtid'},
    const {'1': '_responseTimestampMsString'},
    const {'1': '_isSelectedResponsePrimary'},
    const {'1': '_messageIdToEdit'},
    const {'1': '_analyticsData'},
    const {'1': '_metaAiAnalyticsData'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata_SideBySideSurveyAnalyticsData$json = const {
  '1': 'SideBySideSurveyAnalyticsData',
  '2': const [
    const {'1': 'tessaEvent', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'tessaEvent', '17': true},
    const {'1': 'tessaSessionFbid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'tessaSessionFbid', '17': true},
    const {'1': 'simonSessionFbid', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'simonSessionFbid', '17': true},
  ],
  '8': const [
    const {'1': '_tessaEvent'},
    const {'1': '_tessaSessionFbid'},
    const {'1': '_simonSessionFbid'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData$json = const {
  '1': 'SidebySideSurveyMetaAiAnalyticsData',
  '2': const [
    const {'1': 'surveyId', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'surveyId', '17': true},
    const {'1': 'primaryResponseId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'primaryResponseId', '17': true},
    const {'1': 'testArmName', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'testArmName', '17': true},
    const {'1': 'timestampMsString', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'timestampMsString', '17': true},
    const {'1': 'ctaImpressionEvent', '3': 5, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata.SidebySideSurveyMetaAiAnalyticsData.SideBySideSurveyCTAImpressionEventData', '9': 4, '10': 'ctaImpressionEvent', '17': true},
    const {'1': 'ctaClickEvent', '3': 6, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata.SidebySideSurveyMetaAiAnalyticsData.SideBySideSurveyCTAClickEventData', '9': 5, '10': 'ctaClickEvent', '17': true},
    const {'1': 'cardImpressionEvent', '3': 7, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata.SidebySideSurveyMetaAiAnalyticsData.SideBySideSurveyCardImpressionEventData', '9': 6, '10': 'cardImpressionEvent', '17': true},
    const {'1': 'responseEvent', '3': 8, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata.SidebySideSurveyMetaAiAnalyticsData.SideBySideSurveyResponseEventData', '9': 7, '10': 'responseEvent', '17': true},
    const {'1': 'abandonEvent', '3': 9, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage.SideBySideSurveyMetadata.SidebySideSurveyMetaAiAnalyticsData.SideBySideSurveyAbandonEventData', '9': 8, '10': 'abandonEvent', '17': true},
  ],
  '3': const [BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyAbandonEventData$json, BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyCTAClickEventData$json, BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyCTAImpressionEventData$json, BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyCardImpressionEventData$json, BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyResponseEventData$json],
  '8': const [
    const {'1': '_surveyId'},
    const {'1': '_primaryResponseId'},
    const {'1': '_testArmName'},
    const {'1': '_timestampMsString'},
    const {'1': '_ctaImpressionEvent'},
    const {'1': '_ctaClickEvent'},
    const {'1': '_cardImpressionEvent'},
    const {'1': '_responseEvent'},
    const {'1': '_abandonEvent'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyAbandonEventData$json = const {
  '1': 'SideBySideSurveyAbandonEventData',
  '2': const [
    const {'1': 'abandonDwellTimeMsString', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'abandonDwellTimeMsString', '17': true},
  ],
  '8': const [
    const {'1': '_abandonDwellTimeMsString'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyCTAClickEventData$json = const {
  '1': 'SideBySideSurveyCTAClickEventData',
  '2': const [
    const {'1': 'isSurveyExpired', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isSurveyExpired', '17': true},
    const {'1': 'clickDwellTimeMsString', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'clickDwellTimeMsString', '17': true},
  ],
  '8': const [
    const {'1': '_isSurveyExpired'},
    const {'1': '_clickDwellTimeMsString'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyCTAImpressionEventData$json = const {
  '1': 'SideBySideSurveyCTAImpressionEventData',
  '2': const [
    const {'1': 'isSurveyExpired', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isSurveyExpired', '17': true},
  ],
  '8': const [
    const {'1': '_isSurveyExpired'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyCardImpressionEventData$json = const {
  '1': 'SideBySideSurveyCardImpressionEventData',
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_SideBySideSurveyMetadata_SidebySideSurveyMetaAiAnalyticsData_SideBySideSurveyResponseEventData$json = const {
  '1': 'SideBySideSurveyResponseEventData',
  '2': const [
    const {'1': 'responseDwellTimeMsString', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'responseDwellTimeMsString', '17': true},
    const {'1': 'selectedResponseId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'selectedResponseId', '17': true},
  ],
  '8': const [
    const {'1': '_responseDwellTimeMsString'},
    const {'1': '_selectedResponseId'},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_BotFeedbackKind$json = const {
  '1': 'BotFeedbackKind',
  '2': const [
    const {'1': 'BOT_FEEDBACK_POSITIVE', '2': 0},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_GENERIC', '2': 1},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_HELPFUL', '2': 2},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_INTERESTING', '2': 3},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_ACCURATE', '2': 4},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_SAFE', '2': 5},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_OTHER', '2': 6},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_REFUSED', '2': 7},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_NOT_VISUALLY_APPEALING', '2': 8},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_NOT_RELEVANT_TO_TEXT', '2': 9},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_PERSONALIZED', '2': 10},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_CLARITY', '2': 11},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_DOESNT_LOOK_LIKE_THE_PERSON', '2': 12},
    const {'1': 'BOT_FEEDBACK_NEGATIVE_HALLUCINATION_INTERNAL_ONLY', '2': 13},
    const {'1': 'BOT_FEEDBACK_NEGATIVE', '2': 14},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_BotFeedbackKindMultipleNegative$json = const {
  '1': 'BotFeedbackKindMultipleNegative',
  '2': const [
    const {'1': 'UNKNOWN_BOTFEEDBACKKINDMULTIPLENEGATIVE_ZERO', '2': 0},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_GENERIC', '2': 1},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_HELPFUL', '2': 2},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_INTERESTING', '2': 4},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_ACCURATE', '2': 8},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_SAFE', '2': 16},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_OTHER', '2': 32},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_REFUSED', '2': 64},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_VISUALLY_APPEALING', '2': 128},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_RELEVANT_TO_TEXT', '2': 256},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_BotFeedbackKindMultiplePositive$json = const {
  '1': 'BotFeedbackKindMultiplePositive',
  '2': const [
    const {'1': 'UNKNOWN_BOTFEEDBACKKINDMULTIPLEPOSITIVE_ZERO', '2': 0},
    const {'1': 'BOT_FEEDBACK_MULTIPLE_POSITIVE_GENERIC', '2': 1},
  ],
};

@$core.Deprecated('Use botFeedbackMessageDescriptor instead')
const BotFeedbackMessage_ReportKind$json = const {
  '1': 'ReportKind',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'GENERIC', '2': 1},
  ],
};

/// Descriptor for `BotFeedbackMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botFeedbackMessageDescriptor = $convert.base64Decode('ChJCb3RGZWVkYmFja01lc3NhZ2USNgoKbWVzc2FnZUtleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIKbWVzc2FnZUtleYgBARJCCgRraW5kGAIgASgOMikucHJvdG8uQm90RmVlZGJhY2tNZXNzYWdlLkJvdEZlZWRiYWNrS2luZEgBUgRraW5kiAEBEhcKBHRleHQYAyABKAlIAlIEdGV4dIgBARInCgxraW5kTmVnYXRpdmUYBCABKARIA1IMa2luZE5lZ2F0aXZliAEBEicKDGtpbmRQb3NpdGl2ZRgFIAEoBEgEUgxraW5kUG9zaXRpdmWIAQESSQoKa2luZFJlcG9ydBgGIAEoDjIkLnByb3RvLkJvdEZlZWRiYWNrTWVzc2FnZS5SZXBvcnRLaW5kSAVSCmtpbmRSZXBvcnSIAQEScwoYc2lkZUJ5U2lkZVN1cnZleU1ldGFkYXRhGAcgASgLMjIucHJvdG8uQm90RmVlZGJhY2tNZXNzYWdlLlNpZGVCeVNpZGVTdXJ2ZXlNZXRhZGF0YUgGUhhzaWRlQnlTaWRlU3VydmV5TWV0YWRhdGGIAQEavRcKGFNpZGVCeVNpZGVTdXJ2ZXlNZXRhZGF0YRIxChFzZWxlY3RlZFJlcXVlc3RJZBgBIAEoCUgAUhFzZWxlY3RlZFJlcXVlc3RJZIgBARIfCghzdXJ2ZXlJZBgCIAEoDUgBUghzdXJ2ZXlJZIgBARIvChBzaW1vblNlc3Npb25GYmlkGAMgASgJSAJSEHNpbW9uU2Vzc2lvbkZiaWSIAQESJwoMcmVzcG9uc2VPdGlkGAQgASgJSANSDHJlc3BvbnNlT3RpZIgBARJBChlyZXNwb25zZVRpbWVzdGFtcE1zU3RyaW5nGAUgASgJSARSGXJlc3BvbnNlVGltZXN0YW1wTXNTdHJpbmeIAQESQQoZaXNTZWxlY3RlZFJlc3BvbnNlUHJpbWFyeRgGIAEoCEgFUhlpc1NlbGVjdGVkUmVzcG9uc2VQcmltYXJ5iAEBEi0KD21lc3NhZ2VJZFRvRWRpdBgHIAEoCUgGUg9tZXNzYWdlSWRUb0VkaXSIAQESewoNYW5hbHl0aWNzRGF0YRgIIAEoCzJQLnByb3RvLkJvdEZlZWRiYWNrTWVzc2FnZS5TaWRlQnlTaWRlU3VydmV5TWV0YWRhdGEuU2lkZUJ5U2lkZVN1cnZleUFuYWx5dGljc0RhdGFIB1INYW5hbHl0aWNzRGF0YYgBARKNAQoTbWV0YUFpQW5hbHl0aWNzRGF0YRgJIAEoCzJWLnByb3RvLkJvdEZlZWRiYWNrTWVzc2FnZS5TaWRlQnlTaWRlU3VydmV5TWV0YWRhdGEuU2lkZWJ5U2lkZVN1cnZleU1ldGFBaUFuYWx5dGljc0RhdGFICFITbWV0YUFpQW5hbHl0aWNzRGF0YYgBARrfAQodU2lkZUJ5U2lkZVN1cnZleUFuYWx5dGljc0RhdGESIwoKdGVzc2FFdmVudBgBIAEoCUgAUgp0ZXNzYUV2ZW50iAEBEi8KEHRlc3NhU2Vzc2lvbkZiaWQYAiABKAlIAVIQdGVzc2FTZXNzaW9uRmJpZIgBARIvChBzaW1vblNlc3Npb25GYmlkGAMgASgJSAJSEHNpbW9uU2Vzc2lvbkZiaWSIAQFCDQoLX3Rlc3NhRXZlbnRCEwoRX3Rlc3NhU2Vzc2lvbkZiaWRCEwoRX3NpbW9uU2Vzc2lvbkZiaWQaiw8KI1NpZGVieVNpZGVTdXJ2ZXlNZXRhQWlBbmFseXRpY3NEYXRhEh8KCHN1cnZleUlkGAEgASgNSABSCHN1cnZleUlkiAEBEjEKEXByaW1hcnlSZXNwb25zZUlkGAIgASgJSAFSEXByaW1hcnlSZXNwb25zZUlkiAEBEiUKC3Rlc3RBcm1OYW1lGAMgASgJSAJSC3Rlc3RBcm1OYW1liAEBEjEKEXRpbWVzdGFtcE1zU3RyaW5nGAQgASgJSANSEXRpbWVzdGFtcE1zU3RyaW5niAEBErIBChJjdGFJbXByZXNzaW9uRXZlbnQYBSABKAsyfS5wcm90by5Cb3RGZWVkYmFja01lc3NhZ2UuU2lkZUJ5U2lkZVN1cnZleU1ldGFkYXRhLlNpZGVieVNpZGVTdXJ2ZXlNZXRhQWlBbmFseXRpY3NEYXRhLlNpZGVCeVNpZGVTdXJ2ZXlDVEFJbXByZXNzaW9uRXZlbnREYXRhSARSEmN0YUltcHJlc3Npb25FdmVudIgBARKjAQoNY3RhQ2xpY2tFdmVudBgGIAEoCzJ4LnByb3RvLkJvdEZlZWRiYWNrTWVzc2FnZS5TaWRlQnlTaWRlU3VydmV5TWV0YWRhdGEuU2lkZWJ5U2lkZVN1cnZleU1ldGFBaUFuYWx5dGljc0RhdGEuU2lkZUJ5U2lkZVN1cnZleUNUQUNsaWNrRXZlbnREYXRhSAVSDWN0YUNsaWNrRXZlbnSIAQEStQEKE2NhcmRJbXByZXNzaW9uRXZlbnQYByABKAsyfi5wcm90by5Cb3RGZWVkYmFja01lc3NhZ2UuU2lkZUJ5U2lkZVN1cnZleU1ldGFkYXRhLlNpZGVieVNpZGVTdXJ2ZXlNZXRhQWlBbmFseXRpY3NEYXRhLlNpZGVCeVNpZGVTdXJ2ZXlDYXJkSW1wcmVzc2lvbkV2ZW50RGF0YUgGUhNjYXJkSW1wcmVzc2lvbkV2ZW50iAEBEqMBCg1yZXNwb25zZUV2ZW50GAggASgLMngucHJvdG8uQm90RmVlZGJhY2tNZXNzYWdlLlNpZGVCeVNpZGVTdXJ2ZXlNZXRhZGF0YS5TaWRlYnlTaWRlU3VydmV5TWV0YUFpQW5hbHl0aWNzRGF0YS5TaWRlQnlTaWRlU3VydmV5UmVzcG9uc2VFdmVudERhdGFIB1INcmVzcG9uc2VFdmVudIgBARKgAQoMYWJhbmRvbkV2ZW50GAkgASgLMncucHJvdG8uQm90RmVlZGJhY2tNZXNzYWdlLlNpZGVCeVNpZGVTdXJ2ZXlNZXRhZGF0YS5TaWRlYnlTaWRlU3VydmV5TWV0YUFpQW5hbHl0aWNzRGF0YS5TaWRlQnlTaWRlU3VydmV5QWJhbmRvbkV2ZW50RGF0YUgIUgxhYmFuZG9uRXZlbnSIAQEagAEKIFNpZGVCeVNpZGVTdXJ2ZXlBYmFuZG9uRXZlbnREYXRhEj8KGGFiYW5kb25Ed2VsbFRpbWVNc1N0cmluZxgBIAEoCUgAUhhhYmFuZG9uRHdlbGxUaW1lTXNTdHJpbmeIAQFCGwoZX2FiYW5kb25Ed2VsbFRpbWVNc1N0cmluZxq+AQohU2lkZUJ5U2lkZVN1cnZleUNUQUNsaWNrRXZlbnREYXRhEi0KD2lzU3VydmV5RXhwaXJlZBgBIAEoCEgAUg9pc1N1cnZleUV4cGlyZWSIAQESOwoWY2xpY2tEd2VsbFRpbWVNc1N0cmluZxgCIAEoCUgBUhZjbGlja0R3ZWxsVGltZU1zU3RyaW5niAEBQhIKEF9pc1N1cnZleUV4cGlyZWRCGQoXX2NsaWNrRHdlbGxUaW1lTXNTdHJpbmcaawomU2lkZUJ5U2lkZVN1cnZleUNUQUltcHJlc3Npb25FdmVudERhdGESLQoPaXNTdXJ2ZXlFeHBpcmVkGAEgASgISABSD2lzU3VydmV5RXhwaXJlZIgBAUISChBfaXNTdXJ2ZXlFeHBpcmVkGikKJ1NpZGVCeVNpZGVTdXJ2ZXlDYXJkSW1wcmVzc2lvbkV2ZW50RGF0YRrQAQohU2lkZUJ5U2lkZVN1cnZleVJlc3BvbnNlRXZlbnREYXRhEkEKGXJlc3BvbnNlRHdlbGxUaW1lTXNTdHJpbmcYASABKAlIAFIZcmVzcG9uc2VEd2VsbFRpbWVNc1N0cmluZ4gBARIzChJzZWxlY3RlZFJlc3BvbnNlSWQYAiABKAlIAVISc2VsZWN0ZWRSZXNwb25zZUlkiAEBQhwKGl9yZXNwb25zZUR3ZWxsVGltZU1zU3RyaW5nQhUKE19zZWxlY3RlZFJlc3BvbnNlSWRCCwoJX3N1cnZleUlkQhQKEl9wcmltYXJ5UmVzcG9uc2VJZEIOCgxfdGVzdEFybU5hbWVCFAoSX3RpbWVzdGFtcE1zU3RyaW5nQhUKE19jdGFJbXByZXNzaW9uRXZlbnRCEAoOX2N0YUNsaWNrRXZlbnRCFgoUX2NhcmRJbXByZXNzaW9uRXZlbnRCEAoOX3Jlc3BvbnNlRXZlbnRCDwoNX2FiYW5kb25FdmVudEIUChJfc2VsZWN0ZWRSZXF1ZXN0SWRCCwoJX3N1cnZleUlkQhMKEV9zaW1vblNlc3Npb25GYmlkQg8KDV9yZXNwb25zZU90aWRCHAoaX3Jlc3BvbnNlVGltZXN0YW1wTXNTdHJpbmdCHAoaX2lzU2VsZWN0ZWRSZXNwb25zZVByaW1hcnlCEgoQX21lc3NhZ2VJZFRvRWRpdEIQCg5fYW5hbHl0aWNzRGF0YUIWChRfbWV0YUFpQW5hbHl0aWNzRGF0YSLXBAoPQm90RmVlZGJhY2tLaW5kEhkKFUJPVF9GRUVEQkFDS19QT1NJVElWRRAAEiEKHUJPVF9GRUVEQkFDS19ORUdBVElWRV9HRU5FUklDEAESIQodQk9UX0ZFRURCQUNLX05FR0FUSVZFX0hFTFBGVUwQAhIlCiFCT1RfRkVFREJBQ0tfTkVHQVRJVkVfSU5URVJFU1RJTkcQAxIiCh5CT1RfRkVFREJBQ0tfTkVHQVRJVkVfQUNDVVJBVEUQBBIeChpCT1RfRkVFREJBQ0tfTkVHQVRJVkVfU0FGRRAFEh8KG0JPVF9GRUVEQkFDS19ORUdBVElWRV9PVEhFUhAGEiEKHUJPVF9GRUVEQkFDS19ORUdBVElWRV9SRUZVU0VEEAcSMAosQk9UX0ZFRURCQUNLX05FR0FUSVZFX05PVF9WSVNVQUxMWV9BUFBFQUxJTkcQCBIuCipCT1RfRkVFREJBQ0tfTkVHQVRJVkVfTk9UX1JFTEVWQU5UX1RPX1RFWFQQCRImCiJCT1RfRkVFREJBQ0tfTkVHQVRJVkVfUEVSU09OQUxJWkVEEAoSIQodQk9UX0ZFRURCQUNLX05FR0FUSVZFX0NMQVJJVFkQCxI1CjFCT1RfRkVFREJBQ0tfTkVHQVRJVkVfRE9FU05UX0xPT0tfTElLRV9USEVfUEVSU09OEAwSNQoxQk9UX0ZFRURCQUNLX05FR0FUSVZFX0hBTExVQ0lOQVRJT05fSU5URVJOQUxfT05MWRANEhkKFUJPVF9GRUVEQkFDS19ORUdBVElWRRAOIv0DCh9Cb3RGZWVkYmFja0tpbmRNdWx0aXBsZU5lZ2F0aXZlEjAKLFVOS05PV05fQk9URkVFREJBQ0tLSU5ETVVMVElQTEVORUdBVElWRV9aRVJPEAASKgomQk9UX0ZFRURCQUNLX01VTFRJUExFX05FR0FUSVZFX0dFTkVSSUMQARIqCiZCT1RfRkVFREJBQ0tfTVVMVElQTEVfTkVHQVRJVkVfSEVMUEZVTBACEi4KKkJPVF9GRUVEQkFDS19NVUxUSVBMRV9ORUdBVElWRV9JTlRFUkVTVElORxAEEisKJ0JPVF9GRUVEQkFDS19NVUxUSVBMRV9ORUdBVElWRV9BQ0NVUkFURRAIEicKI0JPVF9GRUVEQkFDS19NVUxUSVBMRV9ORUdBVElWRV9TQUZFEBASKAokQk9UX0ZFRURCQUNLX01VTFRJUExFX05FR0FUSVZFX09USEVSECASKgomQk9UX0ZFRURCQUNLX01VTFRJUExFX05FR0FUSVZFX1JFRlVTRUQQQBI6CjVCT1RfRkVFREJBQ0tfTVVMVElQTEVfTkVHQVRJVkVfTk9UX1ZJU1VBTExZX0FQUEVBTElORxCAARI4CjNCT1RfRkVFREJBQ0tfTVVMVElQTEVfTkVHQVRJVkVfTk9UX1JFTEVWQU5UX1RPX1RFWFQQgAIifwofQm90RmVlZGJhY2tLaW5kTXVsdGlwbGVQb3NpdGl2ZRIwCixVTktOT1dOX0JPVEZFRURCQUNLS0lORE1VTFRJUExFUE9TSVRJVkVfWkVSTxAAEioKJkJPVF9GRUVEQkFDS19NVUxUSVBMRV9QT1NJVElWRV9HRU5FUklDEAEiIwoKUmVwb3J0S2luZBIICgROT05FEAASCwoHR0VORVJJQxABQg0KC19tZXNzYWdlS2V5QgcKBV9raW5kQgcKBV90ZXh0Qg8KDV9raW5kTmVnYXRpdmVCDwoNX2tpbmRQb3NpdGl2ZUINCgtfa2luZFJlcG9ydEIbChlfc2lkZUJ5U2lkZVN1cnZleU1ldGFkYXRh');
@$core.Deprecated('Use botImagineMetadataDescriptor instead')
const BotImagineMetadata$json = const {
  '1': 'BotImagineMetadata',
  '2': const [
    const {'1': 'imagineType', '3': 1, '4': 1, '5': 14, '6': '.proto.BotImagineMetadata.ImagineType', '9': 0, '10': 'imagineType', '17': true},
  ],
  '4': const [BotImagineMetadata_ImagineType$json],
  '8': const [
    const {'1': '_imagineType'},
  ],
};

@$core.Deprecated('Use botImagineMetadataDescriptor instead')
const BotImagineMetadata_ImagineType$json = const {
  '1': 'ImagineType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'IMAGINE', '2': 1},
    const {'1': 'MEMU', '2': 2},
    const {'1': 'FLASH', '2': 3},
    const {'1': 'EDIT', '2': 4},
  ],
};

/// Descriptor for `BotImagineMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botImagineMetadataDescriptor = $convert.base64Decode('ChJCb3RJbWFnaW5lTWV0YWRhdGESTAoLaW1hZ2luZVR5cGUYASABKA4yJS5wcm90by5Cb3RJbWFnaW5lTWV0YWRhdGEuSW1hZ2luZVR5cGVIAFILaW1hZ2luZVR5cGWIAQEiRgoLSW1hZ2luZVR5cGUSCwoHVU5LTk9XThAAEgsKB0lNQUdJTkUQARIICgRNRU1VEAISCQoFRkxBU0gQAxIICgRFRElUEARCDgoMX2ltYWdpbmVUeXBl');
@$core.Deprecated('Use botLinkedAccountDescriptor instead')
const BotLinkedAccount$json = const {
  '1': 'BotLinkedAccount',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.BotLinkedAccount.BotLinkedAccountType', '9': 0, '10': 'type', '17': true},
  ],
  '4': const [BotLinkedAccount_BotLinkedAccountType$json],
  '8': const [
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use botLinkedAccountDescriptor instead')
const BotLinkedAccount_BotLinkedAccountType$json = const {
  '1': 'BotLinkedAccountType',
  '2': const [
    const {'1': 'BOT_LINKED_ACCOUNT_TYPE_1P', '2': 0},
  ],
};

/// Descriptor for `BotLinkedAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botLinkedAccountDescriptor = $convert.base64Decode('ChBCb3RMaW5rZWRBY2NvdW50EkUKBHR5cGUYASABKA4yLC5wcm90by5Cb3RMaW5rZWRBY2NvdW50LkJvdExpbmtlZEFjY291bnRUeXBlSABSBHR5cGWIAQEiNgoUQm90TGlua2VkQWNjb3VudFR5cGUSHgoaQk9UX0xJTktFRF9BQ0NPVU5UX1RZUEVfMVAQAEIHCgVfdHlwZQ==');
@$core.Deprecated('Use botLinkedAccountsMetadataDescriptor instead')
const BotLinkedAccountsMetadata$json = const {
  '1': 'BotLinkedAccountsMetadata',
  '2': const [
    const {'1': 'accounts', '3': 1, '4': 3, '5': 11, '6': '.proto.BotLinkedAccount', '10': 'accounts'},
    const {'1': 'acAuthTokens', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'acAuthTokens', '17': true},
    const {'1': 'acErrorCode', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'acErrorCode', '17': true},
  ],
  '8': const [
    const {'1': '_acAuthTokens'},
    const {'1': '_acErrorCode'},
  ],
};

/// Descriptor for `BotLinkedAccountsMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botLinkedAccountsMetadataDescriptor = $convert.base64Decode('ChlCb3RMaW5rZWRBY2NvdW50c01ldGFkYXRhEjMKCGFjY291bnRzGAEgAygLMhcucHJvdG8uQm90TGlua2VkQWNjb3VudFIIYWNjb3VudHMSJwoMYWNBdXRoVG9rZW5zGAIgASgMSABSDGFjQXV0aFRva2Vuc4gBARIlCgthY0Vycm9yQ29kZRgDIAEoBUgBUgthY0Vycm9yQ29kZYgBAUIPCg1fYWNBdXRoVG9rZW5zQg4KDF9hY0Vycm9yQ29kZQ==');
@$core.Deprecated('Use botMediaMetadataDescriptor instead')
const BotMediaMetadata$json = const {
  '1': 'BotMediaMetadata',
  '2': const [
    const {'1': 'fileSha256', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'fileSha256', '17': true},
    const {'1': 'mediaKey', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'mediaKey', '17': true},
    const {'1': 'fileEncSha256', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'fileEncSha256', '17': true},
    const {'1': 'directPath', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'directPath', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'mimetype', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'mimetype', '17': true},
    const {'1': 'orientationType', '3': 7, '4': 1, '5': 14, '6': '.proto.BotMediaMetadata.OrientationType', '9': 6, '10': 'orientationType', '17': true},
  ],
  '4': const [BotMediaMetadata_OrientationType$json],
  '8': const [
    const {'1': '_fileSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_mimetype'},
    const {'1': '_orientationType'},
  ],
};

@$core.Deprecated('Use botMediaMetadataDescriptor instead')
const BotMediaMetadata_OrientationType$json = const {
  '1': 'OrientationType',
  '2': const [
    const {'1': 'UNKNOWN_ORIENTATIONTYPE_ZERO', '2': 0},
    const {'1': 'CENTER', '2': 1},
    const {'1': 'LEFT', '2': 2},
    const {'1': 'RIGHT', '2': 3},
  ],
};

/// Descriptor for `BotMediaMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMediaMetadataDescriptor = $convert.base64Decode('ChBCb3RNZWRpYU1ldGFkYXRhEiMKCmZpbGVTaGEyNTYYASABKAlIAFIKZmlsZVNoYTI1NogBARIfCghtZWRpYUtleRgCIAEoCUgBUghtZWRpYUtleYgBARIpCg1maWxlRW5jU2hhMjU2GAMgASgJSAJSDWZpbGVFbmNTaGEyNTaIAQESIwoKZGlyZWN0UGF0aBgEIAEoCUgDUgpkaXJlY3RQYXRoiAEBEjEKEW1lZGlhS2V5VGltZXN0YW1wGAUgASgDSARSEW1lZGlhS2V5VGltZXN0YW1wiAEBEh8KCG1pbWV0eXBlGAYgASgJSAVSCG1pbWV0eXBliAEBElYKD29yaWVudGF0aW9uVHlwZRgHIAEoDjInLnByb3RvLkJvdE1lZGlhTWV0YWRhdGEuT3JpZW50YXRpb25UeXBlSAZSD29yaWVudGF0aW9uVHlwZYgBASJUCg9PcmllbnRhdGlvblR5cGUSIAocVU5LTk9XTl9PUklFTlRBVElPTlRZUEVfWkVSTxAAEgoKBkNFTlRFUhABEggKBExFRlQQAhIJCgVSSUdIVBADQg0KC19maWxlU2hhMjU2QgsKCV9tZWRpYUtleUIQCg5fZmlsZUVuY1NoYTI1NkINCgtfZGlyZWN0UGF0aEIUChJfbWVkaWFLZXlUaW1lc3RhbXBCCwoJX21pbWV0eXBlQhIKEF9vcmllbnRhdGlvblR5cGU=');
@$core.Deprecated('Use botMemoryFactDescriptor instead')
const BotMemoryFact$json = const {
  '1': 'BotMemoryFact',
  '2': const [
    const {'1': 'fact', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'fact', '17': true},
    const {'1': 'factId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'factId', '17': true},
  ],
  '8': const [
    const {'1': '_fact'},
    const {'1': '_factId'},
  ],
};

/// Descriptor for `BotMemoryFact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMemoryFactDescriptor = $convert.base64Decode('Cg1Cb3RNZW1vcnlGYWN0EhcKBGZhY3QYASABKAlIAFIEZmFjdIgBARIbCgZmYWN0SWQYAiABKAlIAVIGZmFjdElkiAEBQgcKBV9mYWN0QgkKB19mYWN0SWQ=');
@$core.Deprecated('Use botMemoryMetadataDescriptor instead')
const BotMemoryMetadata$json = const {
  '1': 'BotMemoryMetadata',
  '2': const [
    const {'1': 'addedFacts', '3': 1, '4': 3, '5': 11, '6': '.proto.BotMemoryFact', '10': 'addedFacts'},
    const {'1': 'removedFacts', '3': 2, '4': 3, '5': 11, '6': '.proto.BotMemoryFact', '10': 'removedFacts'},
    const {'1': 'disclaimer', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'disclaimer', '17': true},
  ],
  '8': const [
    const {'1': '_disclaimer'},
  ],
};

/// Descriptor for `BotMemoryMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMemoryMetadataDescriptor = $convert.base64Decode('ChFCb3RNZW1vcnlNZXRhZGF0YRI0CgphZGRlZEZhY3RzGAEgAygLMhQucHJvdG8uQm90TWVtb3J5RmFjdFIKYWRkZWRGYWN0cxI4CgxyZW1vdmVkRmFjdHMYAiADKAsyFC5wcm90by5Cb3RNZW1vcnlGYWN0UgxyZW1vdmVkRmFjdHMSIwoKZGlzY2xhaW1lchgDIAEoCUgAUgpkaXNjbGFpbWVyiAEBQg0KC19kaXNjbGFpbWVy');
@$core.Deprecated('Use botMemuMetadataDescriptor instead')
const BotMemuMetadata$json = const {
  '1': 'BotMemuMetadata',
  '2': const [
    const {'1': 'faceImages', '3': 1, '4': 3, '5': 11, '6': '.proto.BotMediaMetadata', '10': 'faceImages'},
  ],
};

/// Descriptor for `BotMemuMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMemuMetadataDescriptor = $convert.base64Decode('Cg9Cb3RNZW11TWV0YWRhdGESNwoKZmFjZUltYWdlcxgBIAMoCzIXLnByb3RvLkJvdE1lZGlhTWV0YWRhdGFSCmZhY2VJbWFnZXM=');
@$core.Deprecated('Use botMessageOriginDescriptor instead')
const BotMessageOrigin$json = const {
  '1': 'BotMessageOrigin',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.BotMessageOrigin.BotMessageOriginType', '9': 0, '10': 'type', '17': true},
  ],
  '4': const [BotMessageOrigin_BotMessageOriginType$json],
  '8': const [
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use botMessageOriginDescriptor instead')
const BotMessageOrigin_BotMessageOriginType$json = const {
  '1': 'BotMessageOriginType',
  '2': const [
    const {'1': 'BOT_MESSAGE_ORIGIN_TYPE_AI_INITIATED', '2': 0},
  ],
};

/// Descriptor for `BotMessageOrigin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMessageOriginDescriptor = $convert.base64Decode('ChBCb3RNZXNzYWdlT3JpZ2luEkUKBHR5cGUYASABKA4yLC5wcm90by5Cb3RNZXNzYWdlT3JpZ2luLkJvdE1lc3NhZ2VPcmlnaW5UeXBlSABSBHR5cGWIAQEiQAoUQm90TWVzc2FnZU9yaWdpblR5cGUSKAokQk9UX01FU1NBR0VfT1JJR0lOX1RZUEVfQUlfSU5JVElBVEVEEABCBwoFX3R5cGU=');
@$core.Deprecated('Use botMessageOriginMetadataDescriptor instead')
const BotMessageOriginMetadata$json = const {
  '1': 'BotMessageOriginMetadata',
  '2': const [
    const {'1': 'origins', '3': 1, '4': 3, '5': 11, '6': '.proto.BotMessageOrigin', '10': 'origins'},
  ],
};

/// Descriptor for `BotMessageOriginMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMessageOriginMetadataDescriptor = $convert.base64Decode('ChhCb3RNZXNzYWdlT3JpZ2luTWV0YWRhdGESMQoHb3JpZ2lucxgBIAMoCzIXLnByb3RvLkJvdE1lc3NhZ2VPcmlnaW5SB29yaWdpbnM=');
@$core.Deprecated('Use botMessageSharingInfoDescriptor instead')
const BotMessageSharingInfo$json = const {
  '1': 'BotMessageSharingInfo',
  '2': const [
    const {'1': 'botEntryPointOrigin', '3': 1, '4': 1, '5': 14, '6': '.proto.BotMetricsEntryPoint', '9': 0, '10': 'botEntryPointOrigin', '17': true},
    const {'1': 'forwardScore', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'forwardScore', '17': true},
  ],
  '8': const [
    const {'1': '_botEntryPointOrigin'},
    const {'1': '_forwardScore'},
  ],
};

/// Descriptor for `BotMessageSharingInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMessageSharingInfoDescriptor = $convert.base64Decode('ChVCb3RNZXNzYWdlU2hhcmluZ0luZm8SUgoTYm90RW50cnlQb2ludE9yaWdpbhgBIAEoDjIbLnByb3RvLkJvdE1ldHJpY3NFbnRyeVBvaW50SABSE2JvdEVudHJ5UG9pbnRPcmlnaW6IAQESJwoMZm9yd2FyZFNjb3JlGAIgASgNSAFSDGZvcndhcmRTY29yZYgBAUIWChRfYm90RW50cnlQb2ludE9yaWdpbkIPCg1fZm9yd2FyZFNjb3Jl');
@$core.Deprecated('Use botMetadataDescriptor instead')
const BotMetadata$json = const {
  '1': 'BotMetadata',
  '2': const [
    const {'1': 'avatarMetadata', '3': 1, '4': 1, '5': 11, '6': '.proto.BotAvatarMetadata', '9': 0, '10': 'avatarMetadata', '17': true},
    const {'1': 'personaId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'personaId', '17': true},
    const {'1': 'pluginMetadata', '3': 3, '4': 1, '5': 11, '6': '.proto.BotPluginMetadata', '9': 2, '10': 'pluginMetadata', '17': true},
    const {'1': 'suggestedPromptMetadata', '3': 4, '4': 1, '5': 11, '6': '.proto.BotSuggestedPromptMetadata', '9': 3, '10': 'suggestedPromptMetadata', '17': true},
    const {'1': 'invokerJid', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'invokerJid', '17': true},
    const {'1': 'sessionMetadata', '3': 6, '4': 1, '5': 11, '6': '.proto.BotSessionMetadata', '9': 5, '10': 'sessionMetadata', '17': true},
    const {'1': 'memuMetadata', '3': 7, '4': 1, '5': 11, '6': '.proto.BotMemuMetadata', '9': 6, '10': 'memuMetadata', '17': true},
    const {'1': 'timezone', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'timezone', '17': true},
    const {'1': 'reminderMetadata', '3': 9, '4': 1, '5': 11, '6': '.proto.BotReminderMetadata', '9': 8, '10': 'reminderMetadata', '17': true},
    const {'1': 'modelMetadata', '3': 10, '4': 1, '5': 11, '6': '.proto.BotModelMetadata', '9': 9, '10': 'modelMetadata', '17': true},
    const {'1': 'messageDisclaimerText', '3': 11, '4': 1, '5': 9, '9': 10, '10': 'messageDisclaimerText', '17': true},
    const {'1': 'progressIndicatorMetadata', '3': 12, '4': 1, '5': 11, '6': '.proto.BotProgressIndicatorMetadata', '9': 11, '10': 'progressIndicatorMetadata', '17': true},
    const {'1': 'capabilityMetadata', '3': 13, '4': 1, '5': 11, '6': '.proto.BotCapabilityMetadata', '9': 12, '10': 'capabilityMetadata', '17': true},
    const {'1': 'imagineMetadata', '3': 14, '4': 1, '5': 11, '6': '.proto.BotImagineMetadata', '9': 13, '10': 'imagineMetadata', '17': true},
    const {'1': 'memoryMetadata', '3': 15, '4': 1, '5': 11, '6': '.proto.BotMemoryMetadata', '9': 14, '10': 'memoryMetadata', '17': true},
    const {'1': 'renderingMetadata', '3': 16, '4': 1, '5': 11, '6': '.proto.BotRenderingMetadata', '9': 15, '10': 'renderingMetadata', '17': true},
    const {'1': 'botMetricsMetadata', '3': 17, '4': 1, '5': 11, '6': '.proto.BotMetricsMetadata', '9': 16, '10': 'botMetricsMetadata', '17': true},
    const {'1': 'botLinkedAccountsMetadata', '3': 18, '4': 1, '5': 11, '6': '.proto.BotLinkedAccountsMetadata', '9': 17, '10': 'botLinkedAccountsMetadata', '17': true},
    const {'1': 'richResponseSourcesMetadata', '3': 19, '4': 1, '5': 11, '6': '.proto.BotSourcesMetadata', '9': 18, '10': 'richResponseSourcesMetadata', '17': true},
    const {'1': 'aiConversationContext', '3': 20, '4': 1, '5': 12, '9': 19, '10': 'aiConversationContext', '17': true},
    const {'1': 'botPromotionMessageMetadata', '3': 21, '4': 1, '5': 11, '6': '.proto.BotPromotionMessageMetadata', '9': 20, '10': 'botPromotionMessageMetadata', '17': true},
    const {'1': 'botModeSelectionMetadata', '3': 22, '4': 1, '5': 11, '6': '.proto.BotModeSelectionMetadata', '9': 21, '10': 'botModeSelectionMetadata', '17': true},
    const {'1': 'botQuotaMetadata', '3': 23, '4': 1, '5': 11, '6': '.proto.BotQuotaMetadata', '9': 22, '10': 'botQuotaMetadata', '17': true},
    const {'1': 'botAgeCollectionMetadata', '3': 24, '4': 1, '5': 11, '6': '.proto.BotAgeCollectionMetadata', '9': 23, '10': 'botAgeCollectionMetadata', '17': true},
    const {'1': 'conversationStarterPromptId', '3': 25, '4': 1, '5': 9, '9': 24, '10': 'conversationStarterPromptId', '17': true},
    const {'1': 'botResponseId', '3': 26, '4': 1, '5': 9, '9': 25, '10': 'botResponseId', '17': true},
    const {'1': 'verificationMetadata', '3': 27, '4': 1, '5': 11, '6': '.proto.BotSignatureVerificationMetadata', '9': 26, '10': 'verificationMetadata', '17': true},
    const {'1': 'unifiedResponseMutation', '3': 28, '4': 1, '5': 11, '6': '.proto.BotUnifiedResponseMutation', '9': 27, '10': 'unifiedResponseMutation', '17': true},
    const {'1': 'botMessageOriginMetadata', '3': 29, '4': 1, '5': 11, '6': '.proto.BotMessageOriginMetadata', '9': 28, '10': 'botMessageOriginMetadata', '17': true},
    const {'1': 'inThreadSurveyMetadata', '3': 30, '4': 1, '5': 11, '6': '.proto.InThreadSurveyMetadata', '9': 29, '10': 'inThreadSurveyMetadata', '17': true},
    const {'1': 'botThreadInfo', '3': 31, '4': 1, '5': 11, '6': '.proto.AIThreadInfo', '9': 30, '10': 'botThreadInfo', '17': true},
    const {'1': 'regenerateMetadata', '3': 32, '4': 1, '5': 11, '6': '.proto.AIRegenerateMetadata', '9': 31, '10': 'regenerateMetadata', '17': true},
    const {'1': 'sessionTransparencyMetadata', '3': 33, '4': 1, '5': 11, '6': '.proto.SessionTransparencyMetadata', '9': 32, '10': 'sessionTransparencyMetadata', '17': true},
    const {'1': 'internalMetadata', '3': 999, '4': 1, '5': 12, '9': 33, '10': 'internalMetadata', '17': true},
  ],
  '8': const [
    const {'1': '_avatarMetadata'},
    const {'1': '_personaId'},
    const {'1': '_pluginMetadata'},
    const {'1': '_suggestedPromptMetadata'},
    const {'1': '_invokerJid'},
    const {'1': '_sessionMetadata'},
    const {'1': '_memuMetadata'},
    const {'1': '_timezone'},
    const {'1': '_reminderMetadata'},
    const {'1': '_modelMetadata'},
    const {'1': '_messageDisclaimerText'},
    const {'1': '_progressIndicatorMetadata'},
    const {'1': '_capabilityMetadata'},
    const {'1': '_imagineMetadata'},
    const {'1': '_memoryMetadata'},
    const {'1': '_renderingMetadata'},
    const {'1': '_botMetricsMetadata'},
    const {'1': '_botLinkedAccountsMetadata'},
    const {'1': '_richResponseSourcesMetadata'},
    const {'1': '_aiConversationContext'},
    const {'1': '_botPromotionMessageMetadata'},
    const {'1': '_botModeSelectionMetadata'},
    const {'1': '_botQuotaMetadata'},
    const {'1': '_botAgeCollectionMetadata'},
    const {'1': '_conversationStarterPromptId'},
    const {'1': '_botResponseId'},
    const {'1': '_verificationMetadata'},
    const {'1': '_unifiedResponseMutation'},
    const {'1': '_botMessageOriginMetadata'},
    const {'1': '_inThreadSurveyMetadata'},
    const {'1': '_botThreadInfo'},
    const {'1': '_regenerateMetadata'},
    const {'1': '_sessionTransparencyMetadata'},
    const {'1': '_internalMetadata'},
  ],
};

/// Descriptor for `BotMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMetadataDescriptor = $convert.base64Decode('CgtCb3RNZXRhZGF0YRJFCg5hdmF0YXJNZXRhZGF0YRgBIAEoCzIYLnByb3RvLkJvdEF2YXRhck1ldGFkYXRhSABSDmF2YXRhck1ldGFkYXRhiAEBEiEKCXBlcnNvbmFJZBgCIAEoCUgBUglwZXJzb25hSWSIAQESRQoOcGx1Z2luTWV0YWRhdGEYAyABKAsyGC5wcm90by5Cb3RQbHVnaW5NZXRhZGF0YUgCUg5wbHVnaW5NZXRhZGF0YYgBARJgChdzdWdnZXN0ZWRQcm9tcHRNZXRhZGF0YRgEIAEoCzIhLnByb3RvLkJvdFN1Z2dlc3RlZFByb21wdE1ldGFkYXRhSANSF3N1Z2dlc3RlZFByb21wdE1ldGFkYXRhiAEBEiMKCmludm9rZXJKaWQYBSABKAlIBFIKaW52b2tlckppZIgBARJICg9zZXNzaW9uTWV0YWRhdGEYBiABKAsyGS5wcm90by5Cb3RTZXNzaW9uTWV0YWRhdGFIBVIPc2Vzc2lvbk1ldGFkYXRhiAEBEj8KDG1lbXVNZXRhZGF0YRgHIAEoCzIWLnByb3RvLkJvdE1lbXVNZXRhZGF0YUgGUgxtZW11TWV0YWRhdGGIAQESHwoIdGltZXpvbmUYCCABKAlIB1IIdGltZXpvbmWIAQESSwoQcmVtaW5kZXJNZXRhZGF0YRgJIAEoCzIaLnByb3RvLkJvdFJlbWluZGVyTWV0YWRhdGFICFIQcmVtaW5kZXJNZXRhZGF0YYgBARJCCg1tb2RlbE1ldGFkYXRhGAogASgLMhcucHJvdG8uQm90TW9kZWxNZXRhZGF0YUgJUg1tb2RlbE1ldGFkYXRhiAEBEjkKFW1lc3NhZ2VEaXNjbGFpbWVyVGV4dBgLIAEoCUgKUhVtZXNzYWdlRGlzY2xhaW1lclRleHSIAQESZgoZcHJvZ3Jlc3NJbmRpY2F0b3JNZXRhZGF0YRgMIAEoCzIjLnByb3RvLkJvdFByb2dyZXNzSW5kaWNhdG9yTWV0YWRhdGFIC1IZcHJvZ3Jlc3NJbmRpY2F0b3JNZXRhZGF0YYgBARJRChJjYXBhYmlsaXR5TWV0YWRhdGEYDSABKAsyHC5wcm90by5Cb3RDYXBhYmlsaXR5TWV0YWRhdGFIDFISY2FwYWJpbGl0eU1ldGFkYXRhiAEBEkgKD2ltYWdpbmVNZXRhZGF0YRgOIAEoCzIZLnByb3RvLkJvdEltYWdpbmVNZXRhZGF0YUgNUg9pbWFnaW5lTWV0YWRhdGGIAQESRQoObWVtb3J5TWV0YWRhdGEYDyABKAsyGC5wcm90by5Cb3RNZW1vcnlNZXRhZGF0YUgOUg5tZW1vcnlNZXRhZGF0YYgBARJOChFyZW5kZXJpbmdNZXRhZGF0YRgQIAEoCzIbLnByb3RvLkJvdFJlbmRlcmluZ01ldGFkYXRhSA9SEXJlbmRlcmluZ01ldGFkYXRhiAEBEk4KEmJvdE1ldHJpY3NNZXRhZGF0YRgRIAEoCzIZLnByb3RvLkJvdE1ldHJpY3NNZXRhZGF0YUgQUhJib3RNZXRyaWNzTWV0YWRhdGGIAQESYwoZYm90TGlua2VkQWNjb3VudHNNZXRhZGF0YRgSIAEoCzIgLnByb3RvLkJvdExpbmtlZEFjY291bnRzTWV0YWRhdGFIEVIZYm90TGlua2VkQWNjb3VudHNNZXRhZGF0YYgBARJgChtyaWNoUmVzcG9uc2VTb3VyY2VzTWV0YWRhdGEYEyABKAsyGS5wcm90by5Cb3RTb3VyY2VzTWV0YWRhdGFIElIbcmljaFJlc3BvbnNlU291cmNlc01ldGFkYXRhiAEBEjkKFWFpQ29udmVyc2F0aW9uQ29udGV4dBgUIAEoDEgTUhVhaUNvbnZlcnNhdGlvbkNvbnRleHSIAQESaQobYm90UHJvbW90aW9uTWVzc2FnZU1ldGFkYXRhGBUgASgLMiIucHJvdG8uQm90UHJvbW90aW9uTWVzc2FnZU1ldGFkYXRhSBRSG2JvdFByb21vdGlvbk1lc3NhZ2VNZXRhZGF0YYgBARJgChhib3RNb2RlU2VsZWN0aW9uTWV0YWRhdGEYFiABKAsyHy5wcm90by5Cb3RNb2RlU2VsZWN0aW9uTWV0YWRhdGFIFVIYYm90TW9kZVNlbGVjdGlvbk1ldGFkYXRhiAEBEkgKEGJvdFF1b3RhTWV0YWRhdGEYFyABKAsyFy5wcm90by5Cb3RRdW90YU1ldGFkYXRhSBZSEGJvdFF1b3RhTWV0YWRhdGGIAQESYAoYYm90QWdlQ29sbGVjdGlvbk1ldGFkYXRhGBggASgLMh8ucHJvdG8uQm90QWdlQ29sbGVjdGlvbk1ldGFkYXRhSBdSGGJvdEFnZUNvbGxlY3Rpb25NZXRhZGF0YYgBARJFChtjb252ZXJzYXRpb25TdGFydGVyUHJvbXB0SWQYGSABKAlIGFIbY29udmVyc2F0aW9uU3RhcnRlclByb21wdElkiAEBEikKDWJvdFJlc3BvbnNlSWQYGiABKAlIGVINYm90UmVzcG9uc2VJZIgBARJgChR2ZXJpZmljYXRpb25NZXRhZGF0YRgbIAEoCzInLnByb3RvLkJvdFNpZ25hdHVyZVZlcmlmaWNhdGlvbk1ldGFkYXRhSBpSFHZlcmlmaWNhdGlvbk1ldGFkYXRhiAEBEmAKF3VuaWZpZWRSZXNwb25zZU11dGF0aW9uGBwgASgLMiEucHJvdG8uQm90VW5pZmllZFJlc3BvbnNlTXV0YXRpb25IG1IXdW5pZmllZFJlc3BvbnNlTXV0YXRpb26IAQESYAoYYm90TWVzc2FnZU9yaWdpbk1ldGFkYXRhGB0gASgLMh8ucHJvdG8uQm90TWVzc2FnZU9yaWdpbk1ldGFkYXRhSBxSGGJvdE1lc3NhZ2VPcmlnaW5NZXRhZGF0YYgBARJaChZpblRocmVhZFN1cnZleU1ldGFkYXRhGB4gASgLMh0ucHJvdG8uSW5UaHJlYWRTdXJ2ZXlNZXRhZGF0YUgdUhZpblRocmVhZFN1cnZleU1ldGFkYXRhiAEBEj4KDWJvdFRocmVhZEluZm8YHyABKAsyEy5wcm90by5BSVRocmVhZEluZm9IHlINYm90VGhyZWFkSW5mb4gBARJQChJyZWdlbmVyYXRlTWV0YWRhdGEYICABKAsyGy5wcm90by5BSVJlZ2VuZXJhdGVNZXRhZGF0YUgfUhJyZWdlbmVyYXRlTWV0YWRhdGGIAQESaQobc2Vzc2lvblRyYW5zcGFyZW5jeU1ldGFkYXRhGCEgASgLMiIucHJvdG8uU2Vzc2lvblRyYW5zcGFyZW5jeU1ldGFkYXRhSCBSG3Nlc3Npb25UcmFuc3BhcmVuY3lNZXRhZGF0YYgBARIwChBpbnRlcm5hbE1ldGFkYXRhGOcHIAEoDEghUhBpbnRlcm5hbE1ldGFkYXRhiAEBQhEKD19hdmF0YXJNZXRhZGF0YUIMCgpfcGVyc29uYUlkQhEKD19wbHVnaW5NZXRhZGF0YUIaChhfc3VnZ2VzdGVkUHJvbXB0TWV0YWRhdGFCDQoLX2ludm9rZXJKaWRCEgoQX3Nlc3Npb25NZXRhZGF0YUIPCg1fbWVtdU1ldGFkYXRhQgsKCV90aW1lem9uZUITChFfcmVtaW5kZXJNZXRhZGF0YUIQCg5fbW9kZWxNZXRhZGF0YUIYChZfbWVzc2FnZURpc2NsYWltZXJUZXh0QhwKGl9wcm9ncmVzc0luZGljYXRvck1ldGFkYXRhQhUKE19jYXBhYmlsaXR5TWV0YWRhdGFCEgoQX2ltYWdpbmVNZXRhZGF0YUIRCg9fbWVtb3J5TWV0YWRhdGFCFAoSX3JlbmRlcmluZ01ldGFkYXRhQhUKE19ib3RNZXRyaWNzTWV0YWRhdGFCHAoaX2JvdExpbmtlZEFjY291bnRzTWV0YWRhdGFCHgocX3JpY2hSZXNwb25zZVNvdXJjZXNNZXRhZGF0YUIYChZfYWlDb252ZXJzYXRpb25Db250ZXh0Qh4KHF9ib3RQcm9tb3Rpb25NZXNzYWdlTWV0YWRhdGFCGwoZX2JvdE1vZGVTZWxlY3Rpb25NZXRhZGF0YUITChFfYm90UXVvdGFNZXRhZGF0YUIbChlfYm90QWdlQ29sbGVjdGlvbk1ldGFkYXRhQh4KHF9jb252ZXJzYXRpb25TdGFydGVyUHJvbXB0SWRCEAoOX2JvdFJlc3BvbnNlSWRCFwoVX3ZlcmlmaWNhdGlvbk1ldGFkYXRhQhoKGF91bmlmaWVkUmVzcG9uc2VNdXRhdGlvbkIbChlfYm90TWVzc2FnZU9yaWdpbk1ldGFkYXRhQhkKF19pblRocmVhZFN1cnZleU1ldGFkYXRhQhAKDl9ib3RUaHJlYWRJbmZvQhUKE19yZWdlbmVyYXRlTWV0YWRhdGFCHgocX3Nlc3Npb25UcmFuc3BhcmVuY3lNZXRhZGF0YUITChFfaW50ZXJuYWxNZXRhZGF0YQ==');
@$core.Deprecated('Use botMetricsMetadataDescriptor instead')
const BotMetricsMetadata$json = const {
  '1': 'BotMetricsMetadata',
  '2': const [
    const {'1': 'destinationId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'destinationId', '17': true},
    const {'1': 'destinationEntryPoint', '3': 2, '4': 1, '5': 14, '6': '.proto.BotMetricsEntryPoint', '9': 1, '10': 'destinationEntryPoint', '17': true},
    const {'1': 'threadOrigin', '3': 3, '4': 1, '5': 14, '6': '.proto.BotMetricsThreadEntryPoint', '9': 2, '10': 'threadOrigin', '17': true},
  ],
  '8': const [
    const {'1': '_destinationId'},
    const {'1': '_destinationEntryPoint'},
    const {'1': '_threadOrigin'},
  ],
};

/// Descriptor for `BotMetricsMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botMetricsMetadataDescriptor = $convert.base64Decode('ChJCb3RNZXRyaWNzTWV0YWRhdGESKQoNZGVzdGluYXRpb25JZBgBIAEoCUgAUg1kZXN0aW5hdGlvbklkiAEBElYKFWRlc3RpbmF0aW9uRW50cnlQb2ludBgCIAEoDjIbLnByb3RvLkJvdE1ldHJpY3NFbnRyeVBvaW50SAFSFWRlc3RpbmF0aW9uRW50cnlQb2ludIgBARJKCgx0aHJlYWRPcmlnaW4YAyABKA4yIS5wcm90by5Cb3RNZXRyaWNzVGhyZWFkRW50cnlQb2ludEgCUgx0aHJlYWRPcmlnaW6IAQFCEAoOX2Rlc3RpbmF0aW9uSWRCGAoWX2Rlc3RpbmF0aW9uRW50cnlQb2ludEIPCg1fdGhyZWFkT3JpZ2lu');
@$core.Deprecated('Use botModeSelectionMetadataDescriptor instead')
const BotModeSelectionMetadata$json = const {
  '1': 'BotModeSelectionMetadata',
  '2': const [
    const {'1': 'mode', '3': 1, '4': 3, '5': 14, '6': '.proto.BotModeSelectionMetadata.BotUserSelectionMode', '10': 'mode'},
  ],
  '4': const [BotModeSelectionMetadata_BotUserSelectionMode$json],
};

@$core.Deprecated('Use botModeSelectionMetadataDescriptor instead')
const BotModeSelectionMetadata_BotUserSelectionMode$json = const {
  '1': 'BotUserSelectionMode',
  '2': const [
    const {'1': 'UNKNOWN_MODE', '2': 0},
    const {'1': 'REASONING_MODE', '2': 1},
  ],
};

/// Descriptor for `BotModeSelectionMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botModeSelectionMetadataDescriptor = $convert.base64Decode('ChhCb3RNb2RlU2VsZWN0aW9uTWV0YWRhdGESSAoEbW9kZRgBIAMoDjI0LnByb3RvLkJvdE1vZGVTZWxlY3Rpb25NZXRhZGF0YS5Cb3RVc2VyU2VsZWN0aW9uTW9kZVIEbW9kZSI8ChRCb3RVc2VyU2VsZWN0aW9uTW9kZRIQCgxVTktOT1dOX01PREUQABISCg5SRUFTT05JTkdfTU9ERRAB');
@$core.Deprecated('Use botModelMetadataDescriptor instead')
const BotModelMetadata$json = const {
  '1': 'BotModelMetadata',
  '2': const [
    const {'1': 'modelType', '3': 1, '4': 1, '5': 14, '6': '.proto.BotModelMetadata.ModelType', '9': 0, '10': 'modelType', '17': true},
    const {'1': 'premiumModelStatus', '3': 2, '4': 1, '5': 14, '6': '.proto.BotModelMetadata.PremiumModelStatus', '9': 1, '10': 'premiumModelStatus', '17': true},
    const {'1': 'modelNameOverride', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'modelNameOverride', '17': true},
  ],
  '4': const [BotModelMetadata_ModelType$json, BotModelMetadata_PremiumModelStatus$json],
  '8': const [
    const {'1': '_modelType'},
    const {'1': '_premiumModelStatus'},
    const {'1': '_modelNameOverride'},
  ],
};

@$core.Deprecated('Use botModelMetadataDescriptor instead')
const BotModelMetadata_ModelType$json = const {
  '1': 'ModelType',
  '2': const [
    const {'1': 'UNKNOWN_TYPE', '2': 0},
    const {'1': 'LLAMA_PROD', '2': 1},
    const {'1': 'LLAMA_PROD_PREMIUM', '2': 2},
  ],
};

@$core.Deprecated('Use botModelMetadataDescriptor instead')
const BotModelMetadata_PremiumModelStatus$json = const {
  '1': 'PremiumModelStatus',
  '2': const [
    const {'1': 'UNKNOWN_STATUS', '2': 0},
    const {'1': 'AVAILABLE', '2': 1},
    const {'1': 'QUOTA_EXCEED_LIMIT', '2': 2},
  ],
};

/// Descriptor for `BotModelMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botModelMetadataDescriptor = $convert.base64Decode('ChBCb3RNb2RlbE1ldGFkYXRhEkQKCW1vZGVsVHlwZRgBIAEoDjIhLnByb3RvLkJvdE1vZGVsTWV0YWRhdGEuTW9kZWxUeXBlSABSCW1vZGVsVHlwZYgBARJfChJwcmVtaXVtTW9kZWxTdGF0dXMYAiABKA4yKi5wcm90by5Cb3RNb2RlbE1ldGFkYXRhLlByZW1pdW1Nb2RlbFN0YXR1c0gBUhJwcmVtaXVtTW9kZWxTdGF0dXOIAQESMQoRbW9kZWxOYW1lT3ZlcnJpZGUYAyABKAlIAlIRbW9kZWxOYW1lT3ZlcnJpZGWIAQEiRQoJTW9kZWxUeXBlEhAKDFVOS05PV05fVFlQRRAAEg4KCkxMQU1BX1BST0QQARIWChJMTEFNQV9QUk9EX1BSRU1JVU0QAiJPChJQcmVtaXVtTW9kZWxTdGF0dXMSEgoOVU5LTk9XTl9TVEFUVVMQABINCglBVkFJTEFCTEUQARIWChJRVU9UQV9FWENFRURfTElNSVQQAkIMCgpfbW9kZWxUeXBlQhUKE19wcmVtaXVtTW9kZWxTdGF0dXNCFAoSX21vZGVsTmFtZU92ZXJyaWRl');
@$core.Deprecated('Use botPluginMetadataDescriptor instead')
const BotPluginMetadata$json = const {
  '1': 'BotPluginMetadata',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.proto.BotPluginMetadata.SearchProvider', '9': 0, '10': 'provider', '17': true},
    const {'1': 'pluginType', '3': 2, '4': 1, '5': 14, '6': '.proto.BotPluginMetadata.PluginType', '9': 1, '10': 'pluginType', '17': true},
    const {'1': 'thumbnailCdnUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'thumbnailCdnUrl', '17': true},
    const {'1': 'profilePhotoCdnUrl', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'profilePhotoCdnUrl', '17': true},
    const {'1': 'searchProviderUrl', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'searchProviderUrl', '17': true},
    const {'1': 'referenceIndex', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'referenceIndex', '17': true},
    const {'1': 'expectedLinksCount', '3': 7, '4': 1, '5': 13, '9': 6, '10': 'expectedLinksCount', '17': true},
    const {'1': 'searchQuery', '3': 9, '4': 1, '5': 9, '9': 7, '10': 'searchQuery', '17': true},
    const {'1': 'parentPluginMessageKey', '3': 10, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 8, '10': 'parentPluginMessageKey', '17': true},
    const {'1': 'deprecatedField', '3': 11, '4': 1, '5': 14, '6': '.proto.BotPluginMetadata.PluginType', '9': 9, '10': 'deprecatedField', '17': true},
    const {'1': 'parentPluginType', '3': 12, '4': 1, '5': 14, '6': '.proto.BotPluginMetadata.PluginType', '9': 10, '10': 'parentPluginType', '17': true},
    const {'1': 'faviconCdnUrl', '3': 13, '4': 1, '5': 9, '9': 11, '10': 'faviconCdnUrl', '17': true},
  ],
  '4': const [BotPluginMetadata_PluginType$json, BotPluginMetadata_SearchProvider$json],
  '8': const [
    const {'1': '_provider'},
    const {'1': '_pluginType'},
    const {'1': '_thumbnailCdnUrl'},
    const {'1': '_profilePhotoCdnUrl'},
    const {'1': '_searchProviderUrl'},
    const {'1': '_referenceIndex'},
    const {'1': '_expectedLinksCount'},
    const {'1': '_searchQuery'},
    const {'1': '_parentPluginMessageKey'},
    const {'1': '_deprecatedField'},
    const {'1': '_parentPluginType'},
    const {'1': '_faviconCdnUrl'},
  ],
};

@$core.Deprecated('Use botPluginMetadataDescriptor instead')
const BotPluginMetadata_PluginType$json = const {
  '1': 'PluginType',
  '2': const [
    const {'1': 'UNKNOWN_PLUGIN', '2': 0},
    const {'1': 'REELS', '2': 1},
    const {'1': 'SEARCH', '2': 2},
  ],
};

@$core.Deprecated('Use botPluginMetadataDescriptor instead')
const BotPluginMetadata_SearchProvider$json = const {
  '1': 'SearchProvider',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'BING', '2': 1},
    const {'1': 'GOOGLE', '2': 2},
    const {'1': 'SUPPORT', '2': 3},
  ],
};

/// Descriptor for `BotPluginMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botPluginMetadataDescriptor = $convert.base64Decode('ChFCb3RQbHVnaW5NZXRhZGF0YRJICghwcm92aWRlchgBIAEoDjInLnByb3RvLkJvdFBsdWdpbk1ldGFkYXRhLlNlYXJjaFByb3ZpZGVySABSCHByb3ZpZGVyiAEBEkgKCnBsdWdpblR5cGUYAiABKA4yIy5wcm90by5Cb3RQbHVnaW5NZXRhZGF0YS5QbHVnaW5UeXBlSAFSCnBsdWdpblR5cGWIAQESLQoPdGh1bWJuYWlsQ2RuVXJsGAMgASgJSAJSD3RodW1ibmFpbENkblVybIgBARIzChJwcm9maWxlUGhvdG9DZG5VcmwYBCABKAlIA1IScHJvZmlsZVBob3RvQ2RuVXJsiAEBEjEKEXNlYXJjaFByb3ZpZGVyVXJsGAUgASgJSARSEXNlYXJjaFByb3ZpZGVyVXJsiAEBEisKDnJlZmVyZW5jZUluZGV4GAYgASgNSAVSDnJlZmVyZW5jZUluZGV4iAEBEjMKEmV4cGVjdGVkTGlua3NDb3VudBgHIAEoDUgGUhJleHBlY3RlZExpbmtzQ291bnSIAQESJQoLc2VhcmNoUXVlcnkYCSABKAlIB1ILc2VhcmNoUXVlcnmIAQESTgoWcGFyZW50UGx1Z2luTWVzc2FnZUtleRgKIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlICFIWcGFyZW50UGx1Z2luTWVzc2FnZUtleYgBARJSCg9kZXByZWNhdGVkRmllbGQYCyABKA4yIy5wcm90by5Cb3RQbHVnaW5NZXRhZGF0YS5QbHVnaW5UeXBlSAlSD2RlcHJlY2F0ZWRGaWVsZIgBARJUChBwYXJlbnRQbHVnaW5UeXBlGAwgASgOMiMucHJvdG8uQm90UGx1Z2luTWV0YWRhdGEuUGx1Z2luVHlwZUgKUhBwYXJlbnRQbHVnaW5UeXBliAEBEikKDWZhdmljb25DZG5VcmwYDSABKAlIC1INZmF2aWNvbkNkblVybIgBASI3CgpQbHVnaW5UeXBlEhIKDlVOS05PV05fUExVR0lOEAASCQoFUkVFTFMQARIKCgZTRUFSQ0gQAiJACg5TZWFyY2hQcm92aWRlchILCgdVTktOT1dOEAASCAoEQklORxABEgoKBkdPT0dMRRACEgsKB1NVUFBPUlQQA0ILCglfcHJvdmlkZXJCDQoLX3BsdWdpblR5cGVCEgoQX3RodW1ibmFpbENkblVybEIVChNfcHJvZmlsZVBob3RvQ2RuVXJsQhQKEl9zZWFyY2hQcm92aWRlclVybEIRCg9fcmVmZXJlbmNlSW5kZXhCFQoTX2V4cGVjdGVkTGlua3NDb3VudEIOCgxfc2VhcmNoUXVlcnlCGQoXX3BhcmVudFBsdWdpbk1lc3NhZ2VLZXlCEgoQX2RlcHJlY2F0ZWRGaWVsZEITChFfcGFyZW50UGx1Z2luVHlwZUIQCg5fZmF2aWNvbkNkblVybA==');
@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata$json = const {
  '1': 'BotProgressIndicatorMetadata',
  '2': const [
    const {'1': 'progressDescription', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'progressDescription', '17': true},
    const {'1': 'stepsMetadata', '3': 2, '4': 3, '5': 11, '6': '.proto.BotProgressIndicatorMetadata.BotPlanningStepMetadata', '10': 'stepsMetadata'},
  ],
  '3': const [BotProgressIndicatorMetadata_BotPlanningStepMetadata$json],
  '8': const [
    const {'1': '_progressDescription'},
  ],
};

@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata_BotPlanningStepMetadata$json = const {
  '1': 'BotPlanningStepMetadata',
  '2': const [
    const {'1': 'statusTitle', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'statusTitle', '17': true},
    const {'1': 'statusBody', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'statusBody', '17': true},
    const {'1': 'sourcesMetadata', '3': 3, '4': 3, '5': 11, '6': '.proto.BotProgressIndicatorMetadata.BotPlanningStepMetadata.BotPlanningSearchSourcesMetadata', '10': 'sourcesMetadata'},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.proto.BotProgressIndicatorMetadata.BotPlanningStepMetadata.PlanningStepStatus', '9': 2, '10': 'status', '17': true},
    const {'1': 'isReasoning', '3': 5, '4': 1, '5': 8, '9': 3, '10': 'isReasoning', '17': true},
    const {'1': 'isEnhancedSearch', '3': 6, '4': 1, '5': 8, '9': 4, '10': 'isEnhancedSearch', '17': true},
    const {'1': 'sections', '3': 7, '4': 3, '5': 11, '6': '.proto.BotProgressIndicatorMetadata.BotPlanningStepMetadata.BotPlanningStepSectionMetadata', '10': 'sections'},
  ],
  '3': const [BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourceMetadata$json, BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata$json, BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningStepSectionMetadata$json],
  '4': const [BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider$json, BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus$json],
  '8': const [
    const {'1': '_statusTitle'},
    const {'1': '_statusBody'},
    const {'1': '_status'},
    const {'1': '_isReasoning'},
    const {'1': '_isEnhancedSearch'},
  ],
};

@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourceMetadata$json = const {
  '1': 'BotPlanningSearchSourceMetadata',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.proto.BotProgressIndicatorMetadata.BotPlanningStepMetadata.BotSearchSourceProvider', '9': 1, '10': 'provider', '17': true},
    const {'1': 'sourceUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'sourceUrl', '17': true},
    const {'1': 'favIconUrl', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'favIconUrl', '17': true},
  ],
  '8': const [
    const {'1': '_title'},
    const {'1': '_provider'},
    const {'1': '_sourceUrl'},
    const {'1': '_favIconUrl'},
  ],
};

@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata$json = const {
  '1': 'BotPlanningSearchSourcesMetadata',
  '2': const [
    const {'1': 'sourceTitle', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sourceTitle', '17': true},
    const {'1': 'provider', '3': 2, '4': 1, '5': 14, '6': '.proto.BotProgressIndicatorMetadata.BotPlanningStepMetadata.BotPlanningSearchSourcesMetadata.BotPlanningSearchSourceProvider', '9': 1, '10': 'provider', '17': true},
    const {'1': 'sourceUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'sourceUrl', '17': true},
  ],
  '4': const [BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider$json],
  '8': const [
    const {'1': '_sourceTitle'},
    const {'1': '_provider'},
    const {'1': '_sourceUrl'},
  ],
};

@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider$json = const {
  '1': 'BotPlanningSearchSourceProvider',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'OTHER', '2': 1},
    const {'1': 'GOOGLE', '2': 2},
    const {'1': 'BING', '2': 3},
  ],
};

@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningStepSectionMetadata$json = const {
  '1': 'BotPlanningStepSectionMetadata',
  '2': const [
    const {'1': 'sectionTitle', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sectionTitle', '17': true},
    const {'1': 'sectionBody', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sectionBody', '17': true},
    const {'1': 'sourcesMetadata', '3': 3, '4': 3, '5': 11, '6': '.proto.BotProgressIndicatorMetadata.BotPlanningStepMetadata.BotPlanningSearchSourceMetadata', '10': 'sourcesMetadata'},
  ],
  '8': const [
    const {'1': '_sectionTitle'},
    const {'1': '_sectionBody'},
  ],
};

@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider$json = const {
  '1': 'BotSearchSourceProvider',
  '2': const [
    const {'1': 'UNKNOWN_PROVIDER', '2': 0},
    const {'1': 'OTHER', '2': 1},
    const {'1': 'GOOGLE', '2': 2},
    const {'1': 'BING', '2': 3},
  ],
};

@$core.Deprecated('Use botProgressIndicatorMetadataDescriptor instead')
const BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus$json = const {
  '1': 'PlanningStepStatus',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'PLANNED', '2': 1},
    const {'1': 'EXECUTING', '2': 2},
    const {'1': 'FINISHED', '2': 3},
  ],
};

/// Descriptor for `BotProgressIndicatorMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botProgressIndicatorMetadataDescriptor = $convert.base64Decode('ChxCb3RQcm9ncmVzc0luZGljYXRvck1ldGFkYXRhEjUKE3Byb2dyZXNzRGVzY3JpcHRpb24YASABKAlIAFITcHJvZ3Jlc3NEZXNjcmlwdGlvbogBARJhCg1zdGVwc01ldGFkYXRhGAIgAygLMjsucHJvdG8uQm90UHJvZ3Jlc3NJbmRpY2F0b3JNZXRhZGF0YS5Cb3RQbGFubmluZ1N0ZXBNZXRhZGF0YVINc3RlcHNNZXRhZGF0YRrxDQoXQm90UGxhbm5pbmdTdGVwTWV0YWRhdGESJQoLc3RhdHVzVGl0bGUYASABKAlIAFILc3RhdHVzVGl0bGWIAQESIwoKc3RhdHVzQm9keRgCIAEoCUgBUgpzdGF0dXNCb2R5iAEBEoYBCg9zb3VyY2VzTWV0YWRhdGEYAyADKAsyXC5wcm90by5Cb3RQcm9ncmVzc0luZGljYXRvck1ldGFkYXRhLkJvdFBsYW5uaW5nU3RlcE1ldGFkYXRhLkJvdFBsYW5uaW5nU2VhcmNoU291cmNlc01ldGFkYXRhUg9zb3VyY2VzTWV0YWRhdGESawoGc3RhdHVzGAQgASgOMk4ucHJvdG8uQm90UHJvZ3Jlc3NJbmRpY2F0b3JNZXRhZGF0YS5Cb3RQbGFubmluZ1N0ZXBNZXRhZGF0YS5QbGFubmluZ1N0ZXBTdGF0dXNIAlIGc3RhdHVziAEBEiUKC2lzUmVhc29uaW5nGAUgASgISANSC2lzUmVhc29uaW5niAEBEi8KEGlzRW5oYW5jZWRTZWFyY2gYBiABKAhIBFIQaXNFbmhhbmNlZFNlYXJjaIgBARJ2CghzZWN0aW9ucxgHIAMoCzJaLnByb3RvLkJvdFByb2dyZXNzSW5kaWNhdG9yTWV0YWRhdGEuQm90UGxhbm5pbmdTdGVwTWV0YWRhdGEuQm90UGxhbm5pbmdTdGVwU2VjdGlvbk1ldGFkYXRhUghzZWN0aW9ucxquAgofQm90UGxhbm5pbmdTZWFyY2hTb3VyY2VNZXRhZGF0YRIZCgV0aXRsZRgBIAEoCUgAUgV0aXRsZYgBARJ0Cghwcm92aWRlchgCIAEoDjJTLnByb3RvLkJvdFByb2dyZXNzSW5kaWNhdG9yTWV0YWRhdGEuQm90UGxhbm5pbmdTdGVwTWV0YWRhdGEuQm90U2VhcmNoU291cmNlUHJvdmlkZXJIAVIIcHJvdmlkZXKIAQESIQoJc291cmNlVXJsGAMgASgJSAJSCXNvdXJjZVVybIgBARIjCgpmYXZJY29uVXJsGAQgASgJSANSCmZhdkljb25VcmyIAQFCCAoGX3RpdGxlQgsKCV9wcm92aWRlckIMCgpfc291cmNlVXJsQg0KC19mYXZJY29uVXJsGogDCiBCb3RQbGFubmluZ1NlYXJjaFNvdXJjZXNNZXRhZGF0YRIlCgtzb3VyY2VUaXRsZRgBIAEoCUgAUgtzb3VyY2VUaXRsZYgBARKdAQoIcHJvdmlkZXIYAiABKA4yfC5wcm90by5Cb3RQcm9ncmVzc0luZGljYXRvck1ldGFkYXRhLkJvdFBsYW5uaW5nU3RlcE1ldGFkYXRhLkJvdFBsYW5uaW5nU2VhcmNoU291cmNlc01ldGFkYXRhLkJvdFBsYW5uaW5nU2VhcmNoU291cmNlUHJvdmlkZXJIAVIIcHJvdmlkZXKIAQESIQoJc291cmNlVXJsGAMgASgJSAJSCXNvdXJjZVVybIgBASJPCh9Cb3RQbGFubmluZ1NlYXJjaFNvdXJjZVByb3ZpZGVyEgsKB1VOS05PV04QABIJCgVPVEhFUhABEgoKBkdPT0dMRRACEggKBEJJTkcQA0IOCgxfc291cmNlVGl0bGVCCwoJX3Byb3ZpZGVyQgwKCl9zb3VyY2VVcmwamQIKHkJvdFBsYW5uaW5nU3RlcFNlY3Rpb25NZXRhZGF0YRInCgxzZWN0aW9uVGl0bGUYASABKAlIAFIMc2VjdGlvblRpdGxliAEBEiUKC3NlY3Rpb25Cb2R5GAIgASgJSAFSC3NlY3Rpb25Cb2R5iAEBEoUBCg9zb3VyY2VzTWV0YWRhdGEYAyADKAsyWy5wcm90by5Cb3RQcm9ncmVzc0luZGljYXRvck1ldGFkYXRhLkJvdFBsYW5uaW5nU3RlcE1ldGFkYXRhLkJvdFBsYW5uaW5nU2VhcmNoU291cmNlTWV0YWRhdGFSD3NvdXJjZXNNZXRhZGF0YUIPCg1fc2VjdGlvblRpdGxlQg4KDF9zZWN0aW9uQm9keSJQChdCb3RTZWFyY2hTb3VyY2VQcm92aWRlchIUChBVTktOT1dOX1BST1ZJREVSEAASCQoFT1RIRVIQARIKCgZHT09HTEUQAhIICgRCSU5HEAMiSwoSUGxhbm5pbmdTdGVwU3RhdHVzEgsKB1VOS05PV04QABILCgdQTEFOTkVEEAESDQoJRVhFQ1VUSU5HEAISDAoIRklOSVNIRUQQA0IOCgxfc3RhdHVzVGl0bGVCDQoLX3N0YXR1c0JvZHlCCQoHX3N0YXR1c0IOCgxfaXNSZWFzb25pbmdCEwoRX2lzRW5oYW5jZWRTZWFyY2hCFgoUX3Byb2dyZXNzRGVzY3JpcHRpb24=');
@$core.Deprecated('Use botPromotionMessageMetadataDescriptor instead')
const BotPromotionMessageMetadata$json = const {
  '1': 'BotPromotionMessageMetadata',
  '2': const [
    const {'1': 'promotionType', '3': 1, '4': 1, '5': 14, '6': '.proto.BotPromotionMessageMetadata.BotPromotionType', '9': 0, '10': 'promotionType', '17': true},
    const {'1': 'buttonTitle', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'buttonTitle', '17': true},
  ],
  '4': const [BotPromotionMessageMetadata_BotPromotionType$json],
  '8': const [
    const {'1': '_promotionType'},
    const {'1': '_buttonTitle'},
  ],
};

@$core.Deprecated('Use botPromotionMessageMetadataDescriptor instead')
const BotPromotionMessageMetadata_BotPromotionType$json = const {
  '1': 'BotPromotionType',
  '2': const [
    const {'1': 'UNKNOWN_TYPE', '2': 0},
    const {'1': 'C50', '2': 1},
    const {'1': 'SURVEY_PLATFORM', '2': 2},
  ],
};

/// Descriptor for `BotPromotionMessageMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botPromotionMessageMetadataDescriptor = $convert.base64Decode('ChtCb3RQcm9tb3Rpb25NZXNzYWdlTWV0YWRhdGESXgoNcHJvbW90aW9uVHlwZRgBIAEoDjIzLnByb3RvLkJvdFByb21vdGlvbk1lc3NhZ2VNZXRhZGF0YS5Cb3RQcm9tb3Rpb25UeXBlSABSDXByb21vdGlvblR5cGWIAQESJQoLYnV0dG9uVGl0bGUYAiABKAlIAVILYnV0dG9uVGl0bGWIAQEiQgoQQm90UHJvbW90aW9uVHlwZRIQCgxVTktOT1dOX1RZUEUQABIHCgNDNTAQARITCg9TVVJWRVlfUExBVEZPUk0QAkIQCg5fcHJvbW90aW9uVHlwZUIOCgxfYnV0dG9uVGl0bGU=');
@$core.Deprecated('Use botPromptSuggestionDescriptor instead')
const BotPromptSuggestion$json = const {
  '1': 'BotPromptSuggestion',
  '2': const [
    const {'1': 'prompt', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'prompt', '17': true},
    const {'1': 'promptId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'promptId', '17': true},
  ],
  '8': const [
    const {'1': '_prompt'},
    const {'1': '_promptId'},
  ],
};

/// Descriptor for `BotPromptSuggestion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botPromptSuggestionDescriptor = $convert.base64Decode('ChNCb3RQcm9tcHRTdWdnZXN0aW9uEhsKBnByb21wdBgBIAEoCUgAUgZwcm9tcHSIAQESHwoIcHJvbXB0SWQYAiABKAlIAVIIcHJvbXB0SWSIAQFCCQoHX3Byb21wdEILCglfcHJvbXB0SWQ=');
@$core.Deprecated('Use botPromptSuggestionsDescriptor instead')
const BotPromptSuggestions$json = const {
  '1': 'BotPromptSuggestions',
  '2': const [
    const {'1': 'suggestions', '3': 1, '4': 3, '5': 11, '6': '.proto.BotPromptSuggestion', '10': 'suggestions'},
  ],
};

/// Descriptor for `BotPromptSuggestions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botPromptSuggestionsDescriptor = $convert.base64Decode('ChRCb3RQcm9tcHRTdWdnZXN0aW9ucxI8CgtzdWdnZXN0aW9ucxgBIAMoCzIaLnByb3RvLkJvdFByb21wdFN1Z2dlc3Rpb25SC3N1Z2dlc3Rpb25z');
@$core.Deprecated('Use botQuotaMetadataDescriptor instead')
const BotQuotaMetadata$json = const {
  '1': 'BotQuotaMetadata',
  '2': const [
    const {'1': 'botFeatureQuotaMetadata', '3': 1, '4': 3, '5': 11, '6': '.proto.BotQuotaMetadata.BotFeatureQuotaMetadata', '10': 'botFeatureQuotaMetadata'},
  ],
  '3': const [BotQuotaMetadata_BotFeatureQuotaMetadata$json],
};

@$core.Deprecated('Use botQuotaMetadataDescriptor instead')
const BotQuotaMetadata_BotFeatureQuotaMetadata$json = const {
  '1': 'BotFeatureQuotaMetadata',
  '2': const [
    const {'1': 'featureType', '3': 1, '4': 1, '5': 14, '6': '.proto.BotQuotaMetadata.BotFeatureQuotaMetadata.BotFeatureType', '9': 0, '10': 'featureType', '17': true},
    const {'1': 'remainingQuota', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'remainingQuota', '17': true},
    const {'1': 'expirationTimestamp', '3': 3, '4': 1, '5': 4, '9': 2, '10': 'expirationTimestamp', '17': true},
  ],
  '4': const [BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType$json],
  '8': const [
    const {'1': '_featureType'},
    const {'1': '_remainingQuota'},
    const {'1': '_expirationTimestamp'},
  ],
};

@$core.Deprecated('Use botQuotaMetadataDescriptor instead')
const BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType$json = const {
  '1': 'BotFeatureType',
  '2': const [
    const {'1': 'UNKNOWN_FEATURE', '2': 0},
    const {'1': 'REASONING_FEATURE', '2': 1},
  ],
};

/// Descriptor for `BotQuotaMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botQuotaMetadataDescriptor = $convert.base64Decode('ChBCb3RRdW90YU1ldGFkYXRhEmkKF2JvdEZlYXR1cmVRdW90YU1ldGFkYXRhGAEgAygLMi8ucHJvdG8uQm90UXVvdGFNZXRhZGF0YS5Cb3RGZWF0dXJlUXVvdGFNZXRhZGF0YVIXYm90RmVhdHVyZVF1b3RhTWV0YWRhdGEa3QIKF0JvdEZlYXR1cmVRdW90YU1ldGFkYXRhEmUKC2ZlYXR1cmVUeXBlGAEgASgOMj4ucHJvdG8uQm90UXVvdGFNZXRhZGF0YS5Cb3RGZWF0dXJlUXVvdGFNZXRhZGF0YS5Cb3RGZWF0dXJlVHlwZUgAUgtmZWF0dXJlVHlwZYgBARIrCg5yZW1haW5pbmdRdW90YRgCIAEoDUgBUg5yZW1haW5pbmdRdW90YYgBARI1ChNleHBpcmF0aW9uVGltZXN0YW1wGAMgASgESAJSE2V4cGlyYXRpb25UaW1lc3RhbXCIAQEiPAoOQm90RmVhdHVyZVR5cGUSEwoPVU5LTk9XTl9GRUFUVVJFEAASFQoRUkVBU09OSU5HX0ZFQVRVUkUQAUIOCgxfZmVhdHVyZVR5cGVCEQoPX3JlbWFpbmluZ1F1b3RhQhYKFF9leHBpcmF0aW9uVGltZXN0YW1w');
@$core.Deprecated('Use botReminderMetadataDescriptor instead')
const BotReminderMetadata$json = const {
  '1': 'BotReminderMetadata',
  '2': const [
    const {'1': 'requestMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'requestMessageKey', '17': true},
    const {'1': 'action', '3': 2, '4': 1, '5': 14, '6': '.proto.BotReminderMetadata.ReminderAction', '9': 1, '10': 'action', '17': true},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'name', '17': true},
    const {'1': 'nextTriggerTimestamp', '3': 4, '4': 1, '5': 4, '9': 3, '10': 'nextTriggerTimestamp', '17': true},
    const {'1': 'frequency', '3': 5, '4': 1, '5': 14, '6': '.proto.BotReminderMetadata.ReminderFrequency', '9': 4, '10': 'frequency', '17': true},
  ],
  '4': const [BotReminderMetadata_ReminderAction$json, BotReminderMetadata_ReminderFrequency$json],
  '8': const [
    const {'1': '_requestMessageKey'},
    const {'1': '_action'},
    const {'1': '_name'},
    const {'1': '_nextTriggerTimestamp'},
    const {'1': '_frequency'},
  ],
};

@$core.Deprecated('Use botReminderMetadataDescriptor instead')
const BotReminderMetadata_ReminderAction$json = const {
  '1': 'ReminderAction',
  '2': const [
    const {'1': 'UNKNOWN_REMINDERACTION_ZERO', '2': 0},
    const {'1': 'NOTIFY', '2': 1},
    const {'1': 'CREATE', '2': 2},
    const {'1': 'DELETE', '2': 3},
    const {'1': 'UPDATE', '2': 4},
  ],
};

@$core.Deprecated('Use botReminderMetadataDescriptor instead')
const BotReminderMetadata_ReminderFrequency$json = const {
  '1': 'ReminderFrequency',
  '2': const [
    const {'1': 'UNKNOWN_REMINDERFREQUENCY_ZERO', '2': 0},
    const {'1': 'ONCE', '2': 1},
    const {'1': 'DAILY', '2': 2},
    const {'1': 'WEEKLY', '2': 3},
    const {'1': 'BIWEEKLY', '2': 4},
    const {'1': 'MONTHLY', '2': 5},
  ],
};

/// Descriptor for `BotReminderMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botReminderMetadataDescriptor = $convert.base64Decode('ChNCb3RSZW1pbmRlck1ldGFkYXRhEkQKEXJlcXVlc3RNZXNzYWdlS2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUhFyZXF1ZXN0TWVzc2FnZUtleYgBARJGCgZhY3Rpb24YAiABKA4yKS5wcm90by5Cb3RSZW1pbmRlck1ldGFkYXRhLlJlbWluZGVyQWN0aW9uSAFSBmFjdGlvbogBARIXCgRuYW1lGAMgASgJSAJSBG5hbWWIAQESNwoUbmV4dFRyaWdnZXJUaW1lc3RhbXAYBCABKARIA1IUbmV4dFRyaWdnZXJUaW1lc3RhbXCIAQESTwoJZnJlcXVlbmN5GAUgASgOMiwucHJvdG8uQm90UmVtaW5kZXJNZXRhZGF0YS5SZW1pbmRlckZyZXF1ZW5jeUgEUglmcmVxdWVuY3mIAQEiYQoOUmVtaW5kZXJBY3Rpb24SHwobVU5LTk9XTl9SRU1JTkRFUkFDVElPTl9aRVJPEAASCgoGTk9USUZZEAESCgoGQ1JFQVRFEAISCgoGREVMRVRFEAMSCgoGVVBEQVRFEAQicwoRUmVtaW5kZXJGcmVxdWVuY3kSIgoeVU5LTk9XTl9SRU1JTkRFUkZSRVFVRU5DWV9aRVJPEAASCAoET05DRRABEgkKBURBSUxZEAISCgoGV0VFS0xZEAMSDAoIQklXRUVLTFkQBBILCgdNT05USExZEAVCFAoSX3JlcXVlc3RNZXNzYWdlS2V5QgkKB19hY3Rpb25CBwoFX25hbWVCFwoVX25leHRUcmlnZ2VyVGltZXN0YW1wQgwKCl9mcmVxdWVuY3k=');
@$core.Deprecated('Use botRenderingMetadataDescriptor instead')
const BotRenderingMetadata$json = const {
  '1': 'BotRenderingMetadata',
  '2': const [
    const {'1': 'keywords', '3': 1, '4': 3, '5': 11, '6': '.proto.BotRenderingMetadata.Keyword', '10': 'keywords'},
  ],
  '3': const [BotRenderingMetadata_Keyword$json],
};

@$core.Deprecated('Use botRenderingMetadataDescriptor instead')
const BotRenderingMetadata_Keyword$json = const {
  '1': 'Keyword',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'value', '17': true},
    const {'1': 'associatedPrompts', '3': 2, '4': 3, '5': 9, '10': 'associatedPrompts'},
  ],
  '8': const [
    const {'1': '_value'},
  ],
};

/// Descriptor for `BotRenderingMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botRenderingMetadataDescriptor = $convert.base64Decode('ChRCb3RSZW5kZXJpbmdNZXRhZGF0YRI/CghrZXl3b3JkcxgBIAMoCzIjLnByb3RvLkJvdFJlbmRlcmluZ01ldGFkYXRhLktleXdvcmRSCGtleXdvcmRzGlwKB0tleXdvcmQSGQoFdmFsdWUYASABKAlIAFIFdmFsdWWIAQESLAoRYXNzb2NpYXRlZFByb21wdHMYAiADKAlSEWFzc29jaWF0ZWRQcm9tcHRzQggKBl92YWx1ZQ==');
@$core.Deprecated('Use botSessionMetadataDescriptor instead')
const BotSessionMetadata$json = const {
  '1': 'BotSessionMetadata',
  '2': const [
    const {'1': 'sessionId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sessionId', '17': true},
    const {'1': 'sessionSource', '3': 2, '4': 1, '5': 14, '6': '.proto.BotSessionSource', '9': 1, '10': 'sessionSource', '17': true},
  ],
  '8': const [
    const {'1': '_sessionId'},
    const {'1': '_sessionSource'},
  ],
};

/// Descriptor for `BotSessionMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botSessionMetadataDescriptor = $convert.base64Decode('ChJCb3RTZXNzaW9uTWV0YWRhdGESIQoJc2Vzc2lvbklkGAEgASgJSABSCXNlc3Npb25JZIgBARJCCg1zZXNzaW9uU291cmNlGAIgASgOMhcucHJvdG8uQm90U2Vzc2lvblNvdXJjZUgBUg1zZXNzaW9uU291cmNliAEBQgwKCl9zZXNzaW9uSWRCEAoOX3Nlc3Npb25Tb3VyY2U=');
@$core.Deprecated('Use botSignatureVerificationMetadataDescriptor instead')
const BotSignatureVerificationMetadata$json = const {
  '1': 'BotSignatureVerificationMetadata',
  '2': const [
    const {'1': 'proofs', '3': 1, '4': 3, '5': 11, '6': '.proto.BotSignatureVerificationUseCaseProof', '10': 'proofs'},
  ],
};

/// Descriptor for `BotSignatureVerificationMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botSignatureVerificationMetadataDescriptor = $convert.base64Decode('CiBCb3RTaWduYXR1cmVWZXJpZmljYXRpb25NZXRhZGF0YRJDCgZwcm9vZnMYASADKAsyKy5wcm90by5Cb3RTaWduYXR1cmVWZXJpZmljYXRpb25Vc2VDYXNlUHJvb2ZSBnByb29mcw==');
@$core.Deprecated('Use botSignatureVerificationUseCaseProofDescriptor instead')
const BotSignatureVerificationUseCaseProof$json = const {
  '1': 'BotSignatureVerificationUseCaseProof',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'version', '17': true},
    const {'1': 'useCase', '3': 2, '4': 1, '5': 14, '6': '.proto.BotSignatureVerificationUseCaseProof.BotSignatureUseCase', '9': 1, '10': 'useCase', '17': true},
    const {'1': 'signature', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'signature', '17': true},
    const {'1': 'certificateChain', '3': 4, '4': 3, '5': 12, '10': 'certificateChain'},
  ],
  '4': const [BotSignatureVerificationUseCaseProof_BotSignatureUseCase$json],
  '8': const [
    const {'1': '_version'},
    const {'1': '_useCase'},
    const {'1': '_signature'},
  ],
};

@$core.Deprecated('Use botSignatureVerificationUseCaseProofDescriptor instead')
const BotSignatureVerificationUseCaseProof_BotSignatureUseCase$json = const {
  '1': 'BotSignatureUseCase',
  '2': const [
    const {'1': 'UNSPECIFIED', '2': 0},
    const {'1': 'WA_BOT_MSG', '2': 1},
  ],
};

/// Descriptor for `BotSignatureVerificationUseCaseProof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botSignatureVerificationUseCaseProofDescriptor = $convert.base64Decode('CiRCb3RTaWduYXR1cmVWZXJpZmljYXRpb25Vc2VDYXNlUHJvb2YSHQoHdmVyc2lvbhgBIAEoBUgAUgd2ZXJzaW9uiAEBEl4KB3VzZUNhc2UYAiABKA4yPy5wcm90by5Cb3RTaWduYXR1cmVWZXJpZmljYXRpb25Vc2VDYXNlUHJvb2YuQm90U2lnbmF0dXJlVXNlQ2FzZUgBUgd1c2VDYXNliAEBEiEKCXNpZ25hdHVyZRgDIAEoDEgCUglzaWduYXR1cmWIAQESKgoQY2VydGlmaWNhdGVDaGFpbhgEIAMoDFIQY2VydGlmaWNhdGVDaGFpbiI2ChNCb3RTaWduYXR1cmVVc2VDYXNlEg8KC1VOU1BFQ0lGSUVEEAASDgoKV0FfQk9UX01TRxABQgoKCF92ZXJzaW9uQgoKCF91c2VDYXNlQgwKCl9zaWduYXR1cmU=');
@$core.Deprecated('Use botSourcesMetadataDescriptor instead')
const BotSourcesMetadata$json = const {
  '1': 'BotSourcesMetadata',
  '2': const [
    const {'1': 'sources', '3': 1, '4': 3, '5': 11, '6': '.proto.BotSourcesMetadata.BotSourceItem', '10': 'sources'},
  ],
  '3': const [BotSourcesMetadata_BotSourceItem$json],
};

@$core.Deprecated('Use botSourcesMetadataDescriptor instead')
const BotSourcesMetadata_BotSourceItem$json = const {
  '1': 'BotSourceItem',
  '2': const [
    const {'1': 'provider', '3': 1, '4': 1, '5': 14, '6': '.proto.BotSourcesMetadata.BotSourceItem.SourceProvider', '9': 0, '10': 'provider', '17': true},
    const {'1': 'thumbnailCdnUrl', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'thumbnailCdnUrl', '17': true},
    const {'1': 'sourceProviderUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'sourceProviderUrl', '17': true},
    const {'1': 'sourceQuery', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'sourceQuery', '17': true},
    const {'1': 'faviconCdnUrl', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'faviconCdnUrl', '17': true},
    const {'1': 'citationNumber', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'citationNumber', '17': true},
    const {'1': 'sourceTitle', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'sourceTitle', '17': true},
  ],
  '4': const [BotSourcesMetadata_BotSourceItem_SourceProvider$json],
  '8': const [
    const {'1': '_provider'},
    const {'1': '_thumbnailCdnUrl'},
    const {'1': '_sourceProviderUrl'},
    const {'1': '_sourceQuery'},
    const {'1': '_faviconCdnUrl'},
    const {'1': '_citationNumber'},
    const {'1': '_sourceTitle'},
  ],
};

@$core.Deprecated('Use botSourcesMetadataDescriptor instead')
const BotSourcesMetadata_BotSourceItem_SourceProvider$json = const {
  '1': 'SourceProvider',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'BING', '2': 1},
    const {'1': 'GOOGLE', '2': 2},
    const {'1': 'SUPPORT', '2': 3},
    const {'1': 'OTHER', '2': 4},
  ],
};

/// Descriptor for `BotSourcesMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botSourcesMetadataDescriptor = $convert.base64Decode('ChJCb3RTb3VyY2VzTWV0YWRhdGESQQoHc291cmNlcxgBIAMoCzInLnByb3RvLkJvdFNvdXJjZXNNZXRhZGF0YS5Cb3RTb3VyY2VJdGVtUgdzb3VyY2VzGrkECg1Cb3RTb3VyY2VJdGVtElcKCHByb3ZpZGVyGAEgASgOMjYucHJvdG8uQm90U291cmNlc01ldGFkYXRhLkJvdFNvdXJjZUl0ZW0uU291cmNlUHJvdmlkZXJIAFIIcHJvdmlkZXKIAQESLQoPdGh1bWJuYWlsQ2RuVXJsGAIgASgJSAFSD3RodW1ibmFpbENkblVybIgBARIxChFzb3VyY2VQcm92aWRlclVybBgDIAEoCUgCUhFzb3VyY2VQcm92aWRlclVybIgBARIlCgtzb3VyY2VRdWVyeRgEIAEoCUgDUgtzb3VyY2VRdWVyeYgBARIpCg1mYXZpY29uQ2RuVXJsGAUgASgJSARSDWZhdmljb25DZG5VcmyIAQESKwoOY2l0YXRpb25OdW1iZXIYBiABKA1IBVIOY2l0YXRpb25OdW1iZXKIAQESJQoLc291cmNlVGl0bGUYByABKAlIBlILc291cmNlVGl0bGWIAQEiSwoOU291cmNlUHJvdmlkZXISCwoHVU5LTk9XThAAEggKBEJJTkcQARIKCgZHT09HTEUQAhILCgdTVVBQT1JUEAMSCQoFT1RIRVIQBEILCglfcHJvdmlkZXJCEgoQX3RodW1ibmFpbENkblVybEIUChJfc291cmNlUHJvdmlkZXJVcmxCDgoMX3NvdXJjZVF1ZXJ5QhAKDl9mYXZpY29uQ2RuVXJsQhEKD19jaXRhdGlvbk51bWJlckIOCgxfc291cmNlVGl0bGU=');
@$core.Deprecated('Use botSuggestedPromptMetadataDescriptor instead')
const BotSuggestedPromptMetadata$json = const {
  '1': 'BotSuggestedPromptMetadata',
  '2': const [
    const {'1': 'suggestedPrompts', '3': 1, '4': 3, '5': 9, '10': 'suggestedPrompts'},
    const {'1': 'selectedPromptIndex', '3': 2, '4': 1, '5': 13, '9': 0, '10': 'selectedPromptIndex', '17': true},
    const {'1': 'promptSuggestions', '3': 3, '4': 1, '5': 11, '6': '.proto.BotPromptSuggestions', '9': 1, '10': 'promptSuggestions', '17': true},
    const {'1': 'selectedPromptId', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'selectedPromptId', '17': true},
  ],
  '8': const [
    const {'1': '_selectedPromptIndex'},
    const {'1': '_promptSuggestions'},
    const {'1': '_selectedPromptId'},
  ],
};

/// Descriptor for `BotSuggestedPromptMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botSuggestedPromptMetadataDescriptor = $convert.base64Decode('ChpCb3RTdWdnZXN0ZWRQcm9tcHRNZXRhZGF0YRIqChBzdWdnZXN0ZWRQcm9tcHRzGAEgAygJUhBzdWdnZXN0ZWRQcm9tcHRzEjUKE3NlbGVjdGVkUHJvbXB0SW5kZXgYAiABKA1IAFITc2VsZWN0ZWRQcm9tcHRJbmRleIgBARJOChFwcm9tcHRTdWdnZXN0aW9ucxgDIAEoCzIbLnByb3RvLkJvdFByb21wdFN1Z2dlc3Rpb25zSAFSEXByb21wdFN1Z2dlc3Rpb25ziAEBEi8KEHNlbGVjdGVkUHJvbXB0SWQYBCABKAlIAlIQc2VsZWN0ZWRQcm9tcHRJZIgBAUIWChRfc2VsZWN0ZWRQcm9tcHRJbmRleEIUChJfcHJvbXB0U3VnZ2VzdGlvbnNCEwoRX3NlbGVjdGVkUHJvbXB0SWQ=');
@$core.Deprecated('Use botUnifiedResponseMutationDescriptor instead')
const BotUnifiedResponseMutation$json = const {
  '1': 'BotUnifiedResponseMutation',
  '2': const [
    const {'1': 'sbsMetadata', '3': 1, '4': 1, '5': 11, '6': '.proto.BotUnifiedResponseMutation.SideBySideMetadata', '9': 0, '10': 'sbsMetadata', '17': true},
    const {'1': 'mediaDetailsMetadataList', '3': 2, '4': 3, '5': 11, '6': '.proto.BotUnifiedResponseMutation.MediaDetailsMetadata', '10': 'mediaDetailsMetadataList'},
  ],
  '3': const [BotUnifiedResponseMutation_MediaDetailsMetadata$json, BotUnifiedResponseMutation_SideBySideMetadata$json],
  '8': const [
    const {'1': '_sbsMetadata'},
  ],
};

@$core.Deprecated('Use botUnifiedResponseMutationDescriptor instead')
const BotUnifiedResponseMutation_MediaDetailsMetadata$json = const {
  '1': 'MediaDetailsMetadata',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
    const {'1': 'highResMedia', '3': 2, '4': 1, '5': 11, '6': '.proto.BotMediaMetadata', '9': 1, '10': 'highResMedia', '17': true},
    const {'1': 'previewMedia', '3': 3, '4': 1, '5': 11, '6': '.proto.BotMediaMetadata', '9': 2, '10': 'previewMedia', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_highResMedia'},
    const {'1': '_previewMedia'},
  ],
};

@$core.Deprecated('Use botUnifiedResponseMutationDescriptor instead')
const BotUnifiedResponseMutation_SideBySideMetadata$json = const {
  '1': 'SideBySideMetadata',
  '2': const [
    const {'1': 'primaryResponseId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'primaryResponseId', '17': true},
    const {'1': 'surveyCtaHasRendered', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'surveyCtaHasRendered', '17': true},
  ],
  '8': const [
    const {'1': '_primaryResponseId'},
    const {'1': '_surveyCtaHasRendered'},
  ],
};

/// Descriptor for `BotUnifiedResponseMutation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List botUnifiedResponseMutationDescriptor = $convert.base64Decode('ChpCb3RVbmlmaWVkUmVzcG9uc2VNdXRhdGlvbhJbCgtzYnNNZXRhZGF0YRgBIAEoCzI0LnByb3RvLkJvdFVuaWZpZWRSZXNwb25zZU11dGF0aW9uLlNpZGVCeVNpZGVNZXRhZGF0YUgAUgtzYnNNZXRhZGF0YYgBARJyChhtZWRpYURldGFpbHNNZXRhZGF0YUxpc3QYAiADKAsyNi5wcm90by5Cb3RVbmlmaWVkUmVzcG9uc2VNdXRhdGlvbi5NZWRpYURldGFpbHNNZXRhZGF0YVIYbWVkaWFEZXRhaWxzTWV0YWRhdGFMaXN0GtgBChRNZWRpYURldGFpbHNNZXRhZGF0YRITCgJpZBgBIAEoCUgAUgJpZIgBARJACgxoaWdoUmVzTWVkaWEYAiABKAsyFy5wcm90by5Cb3RNZWRpYU1ldGFkYXRhSAFSDGhpZ2hSZXNNZWRpYYgBARJACgxwcmV2aWV3TWVkaWEYAyABKAsyFy5wcm90by5Cb3RNZWRpYU1ldGFkYXRhSAJSDHByZXZpZXdNZWRpYYgBAUIFCgNfaWRCDwoNX2hpZ2hSZXNNZWRpYUIPCg1fcHJldmlld01lZGlhGq8BChJTaWRlQnlTaWRlTWV0YWRhdGESMQoRcHJpbWFyeVJlc3BvbnNlSWQYASABKAlIAFIRcHJpbWFyeVJlc3BvbnNlSWSIAQESNwoUc3VydmV5Q3RhSGFzUmVuZGVyZWQYAiABKAhIAVIUc3VydmV5Q3RhSGFzUmVuZGVyZWSIAQFCFAoSX3ByaW1hcnlSZXNwb25zZUlkQhcKFV9zdXJ2ZXlDdGFIYXNSZW5kZXJlZEIOCgxfc2JzTWV0YWRhdGE=');
@$core.Deprecated('Use callLogRecordDescriptor instead')
const CallLogRecord$json = const {
  '1': 'CallLogRecord',
  '2': const [
    const {'1': 'callResult', '3': 1, '4': 1, '5': 14, '6': '.proto.CallLogRecord.CallResult', '9': 0, '10': 'callResult', '17': true},
    const {'1': 'isDndMode', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'isDndMode', '17': true},
    const {'1': 'silenceReason', '3': 3, '4': 1, '5': 14, '6': '.proto.CallLogRecord.SilenceReason', '9': 2, '10': 'silenceReason', '17': true},
    const {'1': 'duration', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'duration', '17': true},
    const {'1': 'startTime', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'startTime', '17': true},
    const {'1': 'isIncoming', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'isIncoming', '17': true},
    const {'1': 'isVideo', '3': 7, '4': 1, '5': 8, '9': 6, '10': 'isVideo', '17': true},
    const {'1': 'isCallLink', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'isCallLink', '17': true},
    const {'1': 'callLinkToken', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'callLinkToken', '17': true},
    const {'1': 'scheduledCallId', '3': 10, '4': 1, '5': 9, '9': 9, '10': 'scheduledCallId', '17': true},
    const {'1': 'callId', '3': 11, '4': 1, '5': 9, '9': 10, '10': 'callId', '17': true},
    const {'1': 'callCreatorJid', '3': 12, '4': 1, '5': 9, '9': 11, '10': 'callCreatorJid', '17': true},
    const {'1': 'groupJid', '3': 13, '4': 1, '5': 9, '9': 12, '10': 'groupJid', '17': true},
    const {'1': 'participants', '3': 14, '4': 3, '5': 11, '6': '.proto.CallLogRecord.ParticipantInfo', '10': 'participants'},
    const {'1': 'callType', '3': 15, '4': 1, '5': 14, '6': '.proto.CallLogRecord.CallType', '9': 13, '10': 'callType', '17': true},
  ],
  '3': const [CallLogRecord_ParticipantInfo$json],
  '4': const [CallLogRecord_CallResult$json, CallLogRecord_CallType$json, CallLogRecord_SilenceReason$json],
  '8': const [
    const {'1': '_callResult'},
    const {'1': '_isDndMode'},
    const {'1': '_silenceReason'},
    const {'1': '_duration'},
    const {'1': '_startTime'},
    const {'1': '_isIncoming'},
    const {'1': '_isVideo'},
    const {'1': '_isCallLink'},
    const {'1': '_callLinkToken'},
    const {'1': '_scheduledCallId'},
    const {'1': '_callId'},
    const {'1': '_callCreatorJid'},
    const {'1': '_groupJid'},
    const {'1': '_callType'},
  ],
};

@$core.Deprecated('Use callLogRecordDescriptor instead')
const CallLogRecord_ParticipantInfo$json = const {
  '1': 'ParticipantInfo',
  '2': const [
    const {'1': 'userJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'userJid', '17': true},
    const {'1': 'callResult', '3': 2, '4': 1, '5': 14, '6': '.proto.CallLogRecord.CallResult', '9': 1, '10': 'callResult', '17': true},
  ],
  '8': const [
    const {'1': '_userJid'},
    const {'1': '_callResult'},
  ],
};

@$core.Deprecated('Use callLogRecordDescriptor instead')
const CallLogRecord_CallResult$json = const {
  '1': 'CallResult',
  '2': const [
    const {'1': 'CONNECTED', '2': 0},
    const {'1': 'REJECTED', '2': 1},
    const {'1': 'CANCELLED', '2': 2},
    const {'1': 'ACCEPTEDELSEWHERE', '2': 3},
    const {'1': 'MISSED', '2': 4},
    const {'1': 'INVALID', '2': 5},
    const {'1': 'UNAVAILABLE', '2': 6},
    const {'1': 'UPCOMING', '2': 7},
    const {'1': 'FAILED', '2': 8},
    const {'1': 'ABANDONED', '2': 9},
    const {'1': 'ONGOING', '2': 10},
  ],
};

@$core.Deprecated('Use callLogRecordDescriptor instead')
const CallLogRecord_CallType$json = const {
  '1': 'CallType',
  '2': const [
    const {'1': 'REGULAR', '2': 0},
    const {'1': 'SCHEDULED_CALL', '2': 1},
    const {'1': 'VOICE_CHAT', '2': 2},
  ],
};

@$core.Deprecated('Use callLogRecordDescriptor instead')
const CallLogRecord_SilenceReason$json = const {
  '1': 'SilenceReason',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'SCHEDULED', '2': 1},
    const {'1': 'PRIVACY', '2': 2},
    const {'1': 'LIGHTWEIGHT', '2': 3},
  ],
};

/// Descriptor for `CallLogRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List callLogRecordDescriptor = $convert.base64Decode('Cg1DYWxsTG9nUmVjb3JkEkQKCmNhbGxSZXN1bHQYASABKA4yHy5wcm90by5DYWxsTG9nUmVjb3JkLkNhbGxSZXN1bHRIAFIKY2FsbFJlc3VsdIgBARIhCglpc0RuZE1vZGUYAiABKAhIAVIJaXNEbmRNb2RliAEBEk0KDXNpbGVuY2VSZWFzb24YAyABKA4yIi5wcm90by5DYWxsTG9nUmVjb3JkLlNpbGVuY2VSZWFzb25IAlINc2lsZW5jZVJlYXNvbogBARIfCghkdXJhdGlvbhgEIAEoA0gDUghkdXJhdGlvbogBARIhCglzdGFydFRpbWUYBSABKANIBFIJc3RhcnRUaW1liAEBEiMKCmlzSW5jb21pbmcYBiABKAhIBVIKaXNJbmNvbWluZ4gBARIdCgdpc1ZpZGVvGAcgASgISAZSB2lzVmlkZW+IAQESIwoKaXNDYWxsTGluaxgIIAEoCEgHUgppc0NhbGxMaW5riAEBEikKDWNhbGxMaW5rVG9rZW4YCSABKAlICFINY2FsbExpbmtUb2tlbogBARItCg9zY2hlZHVsZWRDYWxsSWQYCiABKAlICVIPc2NoZWR1bGVkQ2FsbElkiAEBEhsKBmNhbGxJZBgLIAEoCUgKUgZjYWxsSWSIAQESKwoOY2FsbENyZWF0b3JKaWQYDCABKAlIC1IOY2FsbENyZWF0b3JKaWSIAQESHwoIZ3JvdXBKaWQYDSABKAlIDFIIZ3JvdXBKaWSIAQESSAoMcGFydGljaXBhbnRzGA4gAygLMiQucHJvdG8uQ2FsbExvZ1JlY29yZC5QYXJ0aWNpcGFudEluZm9SDHBhcnRpY2lwYW50cxI+CghjYWxsVHlwZRgPIAEoDjIdLnByb3RvLkNhbGxMb2dSZWNvcmQuQ2FsbFR5cGVIDVIIY2FsbFR5cGWIAQEakQEKD1BhcnRpY2lwYW50SW5mbxIdCgd1c2VySmlkGAEgASgJSABSB3VzZXJKaWSIAQESRAoKY2FsbFJlc3VsdBgCIAEoDjIfLnByb3RvLkNhbGxMb2dSZWNvcmQuQ2FsbFJlc3VsdEgBUgpjYWxsUmVzdWx0iAEBQgoKCF91c2VySmlkQg0KC19jYWxsUmVzdWx0Iq8BCgpDYWxsUmVzdWx0Eg0KCUNPTk5FQ1RFRBAAEgwKCFJFSkVDVEVEEAESDQoJQ0FOQ0VMTEVEEAISFQoRQUNDRVBURURFTFNFV0hFUkUQAxIKCgZNSVNTRUQQBBILCgdJTlZBTElEEAUSDwoLVU5BVkFJTEFCTEUQBhIMCghVUENPTUlORxAHEgoKBkZBSUxFRBAIEg0KCUFCQU5ET05FRBAJEgsKB09OR09JTkcQCiI7CghDYWxsVHlwZRILCgdSRUdVTEFSEAASEgoOU0NIRURVTEVEX0NBTEwQARIOCgpWT0lDRV9DSEFUEAIiRgoNU2lsZW5jZVJlYXNvbhIICgROT05FEAASDQoJU0NIRURVTEVEEAESCwoHUFJJVkFDWRACEg8KC0xJR0hUV0VJR0hUEANCDQoLX2NhbGxSZXN1bHRCDAoKX2lzRG5kTW9kZUIQCg5fc2lsZW5jZVJlYXNvbkILCglfZHVyYXRpb25CDAoKX3N0YXJ0VGltZUINCgtfaXNJbmNvbWluZ0IKCghfaXNWaWRlb0INCgtfaXNDYWxsTGlua0IQCg5fY2FsbExpbmtUb2tlbkISChBfc2NoZWR1bGVkQ2FsbElkQgkKB19jYWxsSWRCEQoPX2NhbGxDcmVhdG9ySmlkQgsKCV9ncm91cEppZEILCglfY2FsbFR5cGU=');
@$core.Deprecated('Use certChainDescriptor instead')
const CertChain$json = const {
  '1': 'CertChain',
  '2': const [
    const {'1': 'leaf', '3': 1, '4': 1, '5': 11, '6': '.proto.CertChain.NoiseCertificate', '9': 0, '10': 'leaf', '17': true},
    const {'1': 'intermediate', '3': 2, '4': 1, '5': 11, '6': '.proto.CertChain.NoiseCertificate', '9': 1, '10': 'intermediate', '17': true},
  ],
  '3': const [CertChain_NoiseCertificate$json],
  '8': const [
    const {'1': '_leaf'},
    const {'1': '_intermediate'},
  ],
};

@$core.Deprecated('Use certChainDescriptor instead')
const CertChain_NoiseCertificate$json = const {
  '1': 'NoiseCertificate',
  '2': const [
    const {'1': 'details', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'details', '17': true},
    const {'1': 'signature', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'signature', '17': true},
  ],
  '3': const [CertChain_NoiseCertificate_Details$json],
  '8': const [
    const {'1': '_details'},
    const {'1': '_signature'},
  ],
};

@$core.Deprecated('Use certChainDescriptor instead')
const CertChain_NoiseCertificate_Details$json = const {
  '1': 'Details',
  '2': const [
    const {'1': 'serial', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'serial', '17': true},
    const {'1': 'issuerSerial', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'issuerSerial', '17': true},
    const {'1': 'key', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'key', '17': true},
    const {'1': 'notBefore', '3': 4, '4': 1, '5': 4, '9': 3, '10': 'notBefore', '17': true},
    const {'1': 'notAfter', '3': 5, '4': 1, '5': 4, '9': 4, '10': 'notAfter', '17': true},
  ],
  '8': const [
    const {'1': '_serial'},
    const {'1': '_issuerSerial'},
    const {'1': '_key'},
    const {'1': '_notBefore'},
    const {'1': '_notAfter'},
  ],
};

/// Descriptor for `CertChain`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List certChainDescriptor = $convert.base64Decode('CglDZXJ0Q2hhaW4SOgoEbGVhZhgBIAEoCzIhLnByb3RvLkNlcnRDaGFpbi5Ob2lzZUNlcnRpZmljYXRlSABSBGxlYWaIAQESSgoMaW50ZXJtZWRpYXRlGAIgASgLMiEucHJvdG8uQ2VydENoYWluLk5vaXNlQ2VydGlmaWNhdGVIAVIMaW50ZXJtZWRpYXRliAEBGtoCChBOb2lzZUNlcnRpZmljYXRlEh0KB2RldGFpbHMYASABKAxIAFIHZGV0YWlsc4gBARIhCglzaWduYXR1cmUYAiABKAxIAVIJc2lnbmF0dXJliAEBGukBCgdEZXRhaWxzEhsKBnNlcmlhbBgBIAEoDUgAUgZzZXJpYWyIAQESJwoMaXNzdWVyU2VyaWFsGAIgASgNSAFSDGlzc3VlclNlcmlhbIgBARIVCgNrZXkYAyABKAxIAlIDa2V5iAEBEiEKCW5vdEJlZm9yZRgEIAEoBEgDUglub3RCZWZvcmWIAQESHwoIbm90QWZ0ZXIYBSABKARIBFIIbm90QWZ0ZXKIAQFCCQoHX3NlcmlhbEIPCg1faXNzdWVyU2VyaWFsQgYKBF9rZXlCDAoKX25vdEJlZm9yZUILCglfbm90QWZ0ZXJCCgoIX2RldGFpbHNCDAoKX3NpZ25hdHVyZUIHCgVfbGVhZkIPCg1faW50ZXJtZWRpYXRl');
@$core.Deprecated('Use chatLockSettingsDescriptor instead')
const ChatLockSettings$json = const {
  '1': 'ChatLockSettings',
  '2': const [
    const {'1': 'hideLockedChats', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'hideLockedChats', '17': true},
    const {'1': 'secretCode', '3': 2, '4': 1, '5': 11, '6': '.proto.UserPassword', '9': 1, '10': 'secretCode', '17': true},
  ],
  '8': const [
    const {'1': '_hideLockedChats'},
    const {'1': '_secretCode'},
  ],
};

/// Descriptor for `ChatLockSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatLockSettingsDescriptor = $convert.base64Decode('ChBDaGF0TG9ja1NldHRpbmdzEi0KD2hpZGVMb2NrZWRDaGF0cxgBIAEoCEgAUg9oaWRlTG9ja2VkQ2hhdHOIAQESOAoKc2VjcmV0Q29kZRgCIAEoCzITLnByb3RvLlVzZXJQYXNzd29yZEgBUgpzZWNyZXRDb2RliAEBQhIKEF9oaWRlTG9ja2VkQ2hhdHNCDQoLX3NlY3JldENvZGU=');
@$core.Deprecated('Use chatRowOpaqueDataDescriptor instead')
const ChatRowOpaqueData$json = const {
  '1': 'ChatRowOpaqueData',
  '2': const [
    const {'1': 'draftMessage', '3': 1, '4': 1, '5': 11, '6': '.proto.ChatRowOpaqueData.DraftMessage', '9': 0, '10': 'draftMessage', '17': true},
  ],
  '3': const [ChatRowOpaqueData_DraftMessage$json],
  '8': const [
    const {'1': '_draftMessage'},
  ],
};

@$core.Deprecated('Use chatRowOpaqueDataDescriptor instead')
const ChatRowOpaqueData_DraftMessage$json = const {
  '1': 'DraftMessage',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'omittedUrl', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'omittedUrl', '17': true},
    const {'1': 'ctwaContextLinkData', '3': 3, '4': 1, '5': 11, '6': '.proto.ChatRowOpaqueData.DraftMessage.CtwaContextLinkData', '9': 2, '10': 'ctwaContextLinkData', '17': true},
    const {'1': 'ctwaContext', '3': 4, '4': 1, '5': 11, '6': '.proto.ChatRowOpaqueData.DraftMessage.CtwaContextData', '9': 3, '10': 'ctwaContext', '17': true},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'timestamp', '17': true},
  ],
  '3': const [ChatRowOpaqueData_DraftMessage_CtwaContextData$json, ChatRowOpaqueData_DraftMessage_CtwaContextLinkData$json],
  '8': const [
    const {'1': '_text'},
    const {'1': '_omittedUrl'},
    const {'1': '_ctwaContextLinkData'},
    const {'1': '_ctwaContext'},
    const {'1': '_timestamp'},
  ],
};

@$core.Deprecated('Use chatRowOpaqueDataDescriptor instead')
const ChatRowOpaqueData_DraftMessage_CtwaContextData$json = const {
  '1': 'CtwaContextData',
  '2': const [
    const {'1': 'conversionSource', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'conversionSource', '17': true},
    const {'1': 'conversionData', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'conversionData', '17': true},
    const {'1': 'sourceUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'sourceUrl', '17': true},
    const {'1': 'sourceId', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'sourceId', '17': true},
    const {'1': 'sourceType', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'sourceType', '17': true},
    const {'1': 'title', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'title', '17': true},
    const {'1': 'description', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'description', '17': true},
    const {'1': 'thumbnail', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'thumbnail', '17': true},
    const {'1': 'thumbnailUrl', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'thumbnailUrl', '17': true},
    const {'1': 'mediaType', '3': 10, '4': 1, '5': 14, '6': '.proto.ChatRowOpaqueData.DraftMessage.CtwaContextData.ContextInfoExternalAdReplyInfoMediaType', '9': 9, '10': 'mediaType', '17': true},
    const {'1': 'mediaUrl', '3': 11, '4': 1, '5': 9, '9': 10, '10': 'mediaUrl', '17': true},
    const {'1': 'isSuspiciousLink', '3': 12, '4': 1, '5': 8, '9': 11, '10': 'isSuspiciousLink', '17': true},
  ],
  '4': const [ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType$json],
  '8': const [
    const {'1': '_conversionSource'},
    const {'1': '_conversionData'},
    const {'1': '_sourceUrl'},
    const {'1': '_sourceId'},
    const {'1': '_sourceType'},
    const {'1': '_title'},
    const {'1': '_description'},
    const {'1': '_thumbnail'},
    const {'1': '_thumbnailUrl'},
    const {'1': '_mediaType'},
    const {'1': '_mediaUrl'},
    const {'1': '_isSuspiciousLink'},
  ],
};

@$core.Deprecated('Use chatRowOpaqueDataDescriptor instead')
const ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType$json = const {
  '1': 'ContextInfoExternalAdReplyInfoMediaType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'IMAGE', '2': 1},
    const {'1': 'VIDEO', '2': 2},
  ],
};

@$core.Deprecated('Use chatRowOpaqueDataDescriptor instead')
const ChatRowOpaqueData_DraftMessage_CtwaContextLinkData$json = const {
  '1': 'CtwaContextLinkData',
  '2': const [
    const {'1': 'context', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'context', '17': true},
    const {'1': 'sourceUrl', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'sourceUrl', '17': true},
    const {'1': 'icebreaker', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'icebreaker', '17': true},
    const {'1': 'phone', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'phone', '17': true},
  ],
  '8': const [
    const {'1': '_context'},
    const {'1': '_sourceUrl'},
    const {'1': '_icebreaker'},
    const {'1': '_phone'},
  ],
};

/// Descriptor for `ChatRowOpaqueData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRowOpaqueDataDescriptor = $convert.base64Decode('ChFDaGF0Um93T3BhcXVlRGF0YRJOCgxkcmFmdE1lc3NhZ2UYASABKAsyJS5wcm90by5DaGF0Um93T3BhcXVlRGF0YS5EcmFmdE1lc3NhZ2VIAFIMZHJhZnRNZXNzYWdliAEBGp4LCgxEcmFmdE1lc3NhZ2USFwoEdGV4dBgBIAEoCUgAUgR0ZXh0iAEBEiMKCm9taXR0ZWRVcmwYAiABKAlIAVIKb21pdHRlZFVybIgBARJwChNjdHdhQ29udGV4dExpbmtEYXRhGAMgASgLMjkucHJvdG8uQ2hhdFJvd09wYXF1ZURhdGEuRHJhZnRNZXNzYWdlLkN0d2FDb250ZXh0TGlua0RhdGFIAlITY3R3YUNvbnRleHRMaW5rRGF0YYgBARJcCgtjdHdhQ29udGV4dBgEIAEoCzI1LnByb3RvLkNoYXRSb3dPcGFxdWVEYXRhLkRyYWZ0TWVzc2FnZS5DdHdhQ29udGV4dERhdGFIA1ILY3R3YUNvbnRleHSIAQESIQoJdGltZXN0YW1wGAUgASgDSARSCXRpbWVzdGFtcIgBARrBBgoPQ3R3YUNvbnRleHREYXRhEi8KEGNvbnZlcnNpb25Tb3VyY2UYASABKAlIAFIQY29udmVyc2lvblNvdXJjZYgBARIrCg5jb252ZXJzaW9uRGF0YRgCIAEoDEgBUg5jb252ZXJzaW9uRGF0YYgBARIhCglzb3VyY2VVcmwYAyABKAlIAlIJc291cmNlVXJsiAEBEh8KCHNvdXJjZUlkGAQgASgJSANSCHNvdXJjZUlkiAEBEiMKCnNvdXJjZVR5cGUYBSABKAlIBFIKc291cmNlVHlwZYgBARIZCgV0aXRsZRgGIAEoCUgFUgV0aXRsZYgBARIlCgtkZXNjcmlwdGlvbhgHIAEoCUgGUgtkZXNjcmlwdGlvbogBARIhCgl0aHVtYm5haWwYCCABKAlIB1IJdGh1bWJuYWlsiAEBEicKDHRodW1ibmFpbFVybBgJIAEoCUgIUgx0aHVtYm5haWxVcmyIAQESgAEKCW1lZGlhVHlwZRgKIAEoDjJdLnByb3RvLkNoYXRSb3dPcGFxdWVEYXRhLkRyYWZ0TWVzc2FnZS5DdHdhQ29udGV4dERhdGEuQ29udGV4dEluZm9FeHRlcm5hbEFkUmVwbHlJbmZvTWVkaWFUeXBlSAlSCW1lZGlhVHlwZYgBARIfCghtZWRpYVVybBgLIAEoCUgKUghtZWRpYVVybIgBARIvChBpc1N1c3BpY2lvdXNMaW5rGAwgASgISAtSEGlzU3VzcGljaW91c0xpbmuIAQEiSQonQ29udGV4dEluZm9FeHRlcm5hbEFkUmVwbHlJbmZvTWVkaWFUeXBlEggKBE5PTkUQABIJCgVJTUFHRRABEgkKBVZJREVPEAJCEwoRX2NvbnZlcnNpb25Tb3VyY2VCEQoPX2NvbnZlcnNpb25EYXRhQgwKCl9zb3VyY2VVcmxCCwoJX3NvdXJjZUlkQg0KC19zb3VyY2VUeXBlQggKBl90aXRsZUIOCgxfZGVzY3JpcHRpb25CDAoKX3RodW1ibmFpbEIPCg1fdGh1bWJuYWlsVXJsQgwKCl9tZWRpYVR5cGVCCwoJX21lZGlhVXJsQhMKEV9pc1N1c3BpY2lvdXNMaW5rGsoBChNDdHdhQ29udGV4dExpbmtEYXRhEh0KB2NvbnRleHQYASABKAlIAFIHY29udGV4dIgBARIhCglzb3VyY2VVcmwYAiABKAlIAVIJc291cmNlVXJsiAEBEiMKCmljZWJyZWFrZXIYAyABKAlIAlIKaWNlYnJlYWtlcogBARIZCgVwaG9uZRgEIAEoCUgDUgVwaG9uZYgBAUIKCghfY29udGV4dEIMCgpfc291cmNlVXJsQg0KC19pY2VicmVha2VyQggKBl9waG9uZUIHCgVfdGV4dEINCgtfb21pdHRlZFVybEIWChRfY3R3YUNvbnRleHRMaW5rRGF0YUIOCgxfY3R3YUNvbnRleHRCDAoKX3RpbWVzdGFtcEIPCg1fZHJhZnRNZXNzYWdl');
@$core.Deprecated('Use citationDescriptor instead')
const Citation$json = const {
  '1': 'Citation',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '10': 'subtitle'},
    const {'1': 'cmsId', '3': 3, '4': 1, '5': 9, '10': 'cmsId'},
    const {'1': 'imageUrl', '3': 4, '4': 1, '5': 9, '10': 'imageUrl'},
  ],
};

/// Descriptor for `Citation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List citationDescriptor = $convert.base64Decode('CghDaXRhdGlvbhIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSGgoIc3VidGl0bGUYAiABKAlSCHN1YnRpdGxlEhQKBWNtc0lkGAMgASgJUgVjbXNJZBIaCghpbWFnZVVybBgEIAEoCVIIaW1hZ2VVcmw=');
@$core.Deprecated('Use clientPairingPropsDescriptor instead')
const ClientPairingProps$json = const {
  '1': 'ClientPairingProps',
  '2': const [
    const {'1': 'isChatDbLidMigrated', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isChatDbLidMigrated', '17': true},
    const {'1': 'isSyncdPureLidSession', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'isSyncdPureLidSession', '17': true},
    const {'1': 'isSyncdSnapshotRecoveryEnabled', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'isSyncdSnapshotRecoveryEnabled', '17': true},
  ],
  '8': const [
    const {'1': '_isChatDbLidMigrated'},
    const {'1': '_isSyncdPureLidSession'},
    const {'1': '_isSyncdSnapshotRecoveryEnabled'},
  ],
};

/// Descriptor for `ClientPairingProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientPairingPropsDescriptor = $convert.base64Decode('ChJDbGllbnRQYWlyaW5nUHJvcHMSNQoTaXNDaGF0RGJMaWRNaWdyYXRlZBgBIAEoCEgAUhNpc0NoYXREYkxpZE1pZ3JhdGVkiAEBEjkKFWlzU3luY2RQdXJlTGlkU2Vzc2lvbhgCIAEoCEgBUhVpc1N5bmNkUHVyZUxpZFNlc3Npb26IAQESSwoeaXNTeW5jZFNuYXBzaG90UmVjb3ZlcnlFbmFibGVkGAMgASgISAJSHmlzU3luY2RTbmFwc2hvdFJlY292ZXJ5RW5hYmxlZIgBAUIWChRfaXNDaGF0RGJMaWRNaWdyYXRlZEIYChZfaXNTeW5jZFB1cmVMaWRTZXNzaW9uQiEKH19pc1N5bmNkU25hcHNob3RSZWNvdmVyeUVuYWJsZWQ=');
@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload$json = const {
  '1': 'ClientPayload',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'username', '17': true},
    const {'1': 'passive', '3': 3, '4': 1, '5': 8, '9': 1, '10': 'passive', '17': true},
    const {'1': 'userAgent', '3': 5, '4': 1, '5': 11, '6': '.proto.ClientPayload.UserAgent', '9': 2, '10': 'userAgent', '17': true},
    const {'1': 'webInfo', '3': 6, '4': 1, '5': 11, '6': '.proto.ClientPayload.WebInfo', '9': 3, '10': 'webInfo', '17': true},
    const {'1': 'pushName', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'pushName', '17': true},
    const {'1': 'sessionId', '3': 9, '4': 1, '5': 15, '9': 5, '10': 'sessionId', '17': true},
    const {'1': 'shortConnect', '3': 10, '4': 1, '5': 8, '9': 6, '10': 'shortConnect', '17': true},
    const {'1': 'connectType', '3': 12, '4': 1, '5': 14, '6': '.proto.ClientPayload.ConnectType', '9': 7, '10': 'connectType', '17': true},
    const {'1': 'connectReason', '3': 13, '4': 1, '5': 14, '6': '.proto.ClientPayload.ConnectReason', '9': 8, '10': 'connectReason', '17': true},
    const {'1': 'shards', '3': 14, '4': 3, '5': 5, '10': 'shards'},
    const {'1': 'dnsSource', '3': 15, '4': 1, '5': 11, '6': '.proto.ClientPayload.DNSSource', '9': 9, '10': 'dnsSource', '17': true},
    const {'1': 'connectAttemptCount', '3': 16, '4': 1, '5': 13, '9': 10, '10': 'connectAttemptCount', '17': true},
    const {'1': 'device', '3': 18, '4': 1, '5': 13, '9': 11, '10': 'device', '17': true},
    const {'1': 'devicePairingData', '3': 19, '4': 1, '5': 11, '6': '.proto.ClientPayload.DevicePairingRegistrationData', '9': 12, '10': 'devicePairingData', '17': true},
    const {'1': 'product', '3': 20, '4': 1, '5': 14, '6': '.proto.ClientPayload.Product', '9': 13, '10': 'product', '17': true},
    const {'1': 'fbCat', '3': 21, '4': 1, '5': 12, '9': 14, '10': 'fbCat', '17': true},
    const {'1': 'fbUserAgent', '3': 22, '4': 1, '5': 12, '9': 15, '10': 'fbUserAgent', '17': true},
    const {'1': 'oc', '3': 23, '4': 1, '5': 8, '9': 16, '10': 'oc', '17': true},
    const {'1': 'lc', '3': 24, '4': 1, '5': 5, '9': 17, '10': 'lc', '17': true},
    const {'1': 'iosAppExtension', '3': 30, '4': 1, '5': 14, '6': '.proto.ClientPayload.IOSAppExtension', '9': 18, '10': 'iosAppExtension', '17': true},
    const {'1': 'fbAppId', '3': 31, '4': 1, '5': 4, '9': 19, '10': 'fbAppId', '17': true},
    const {'1': 'fbDeviceId', '3': 32, '4': 1, '5': 12, '9': 20, '10': 'fbDeviceId', '17': true},
    const {'1': 'pull', '3': 33, '4': 1, '5': 8, '9': 21, '10': 'pull', '17': true},
    const {'1': 'paddingBytes', '3': 34, '4': 1, '5': 12, '9': 22, '10': 'paddingBytes', '17': true},
    const {'1': 'yearClass', '3': 36, '4': 1, '5': 5, '9': 23, '10': 'yearClass', '17': true},
    const {'1': 'memClass', '3': 37, '4': 1, '5': 5, '9': 24, '10': 'memClass', '17': true},
    const {'1': 'interopData', '3': 38, '4': 1, '5': 11, '6': '.proto.ClientPayload.InteropData', '9': 25, '10': 'interopData', '17': true},
    const {'1': 'trafficAnonymization', '3': 40, '4': 1, '5': 14, '6': '.proto.ClientPayload.TrafficAnonymization', '9': 26, '10': 'trafficAnonymization', '17': true},
    const {'1': 'lidDbMigrated', '3': 41, '4': 1, '5': 8, '9': 27, '10': 'lidDbMigrated', '17': true},
    const {'1': 'accountType', '3': 42, '4': 1, '5': 14, '6': '.proto.ClientPayload.AccountType', '9': 28, '10': 'accountType', '17': true},
    const {'1': 'connectionSequenceInfo', '3': 43, '4': 1, '5': 15, '9': 29, '10': 'connectionSequenceInfo', '17': true},
    const {'1': 'paaLink', '3': 44, '4': 1, '5': 8, '9': 30, '10': 'paaLink', '17': true},
    const {'1': 'preacksCount', '3': 45, '4': 1, '5': 5, '9': 31, '10': 'preacksCount', '17': true},
    const {'1': 'processingQueueSize', '3': 46, '4': 1, '5': 5, '9': 32, '10': 'processingQueueSize', '17': true},
  ],
  '3': const [ClientPayload_DNSSource$json, ClientPayload_DevicePairingRegistrationData$json, ClientPayload_InteropData$json, ClientPayload_UserAgent$json, ClientPayload_WebInfo$json],
  '4': const [ClientPayload_AccountType$json, ClientPayload_ConnectReason$json, ClientPayload_ConnectType$json, ClientPayload_IOSAppExtension$json, ClientPayload_Product$json, ClientPayload_TrafficAnonymization$json],
  '8': const [
    const {'1': '_username'},
    const {'1': '_passive'},
    const {'1': '_userAgent'},
    const {'1': '_webInfo'},
    const {'1': '_pushName'},
    const {'1': '_sessionId'},
    const {'1': '_shortConnect'},
    const {'1': '_connectType'},
    const {'1': '_connectReason'},
    const {'1': '_dnsSource'},
    const {'1': '_connectAttemptCount'},
    const {'1': '_device'},
    const {'1': '_devicePairingData'},
    const {'1': '_product'},
    const {'1': '_fbCat'},
    const {'1': '_fbUserAgent'},
    const {'1': '_oc'},
    const {'1': '_lc'},
    const {'1': '_iosAppExtension'},
    const {'1': '_fbAppId'},
    const {'1': '_fbDeviceId'},
    const {'1': '_pull'},
    const {'1': '_paddingBytes'},
    const {'1': '_yearClass'},
    const {'1': '_memClass'},
    const {'1': '_interopData'},
    const {'1': '_trafficAnonymization'},
    const {'1': '_lidDbMigrated'},
    const {'1': '_accountType'},
    const {'1': '_connectionSequenceInfo'},
    const {'1': '_paaLink'},
    const {'1': '_preacksCount'},
    const {'1': '_processingQueueSize'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_DNSSource$json = const {
  '1': 'DNSSource',
  '2': const [
    const {'1': 'dnsMethod', '3': 15, '4': 1, '5': 14, '6': '.proto.ClientPayload.DNSSource.DNSResolutionMethod', '9': 0, '10': 'dnsMethod', '17': true},
    const {'1': 'appCached', '3': 16, '4': 1, '5': 8, '9': 1, '10': 'appCached', '17': true},
  ],
  '4': const [ClientPayload_DNSSource_DNSResolutionMethod$json],
  '8': const [
    const {'1': '_dnsMethod'},
    const {'1': '_appCached'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_DNSSource_DNSResolutionMethod$json = const {
  '1': 'DNSResolutionMethod',
  '2': const [
    const {'1': 'SYSTEM', '2': 0},
    const {'1': 'GOOGLE', '2': 1},
    const {'1': 'HARDCODED', '2': 2},
    const {'1': 'OVERRIDE', '2': 3},
    const {'1': 'FALLBACK', '2': 4},
    const {'1': 'MNS', '2': 5},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_DevicePairingRegistrationData$json = const {
  '1': 'DevicePairingRegistrationData',
  '2': const [
    const {'1': 'eRegid', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'eRegid', '17': true},
    const {'1': 'eKeytype', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'eKeytype', '17': true},
    const {'1': 'eIdent', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'eIdent', '17': true},
    const {'1': 'eSkeyId', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'eSkeyId', '17': true},
    const {'1': 'eSkeyVal', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'eSkeyVal', '17': true},
    const {'1': 'eSkeySig', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'eSkeySig', '17': true},
    const {'1': 'buildHash', '3': 7, '4': 1, '5': 12, '9': 6, '10': 'buildHash', '17': true},
    const {'1': 'deviceProps', '3': 8, '4': 1, '5': 12, '9': 7, '10': 'deviceProps', '17': true},
  ],
  '8': const [
    const {'1': '_eRegid'},
    const {'1': '_eKeytype'},
    const {'1': '_eIdent'},
    const {'1': '_eSkeyId'},
    const {'1': '_eSkeyVal'},
    const {'1': '_eSkeySig'},
    const {'1': '_buildHash'},
    const {'1': '_deviceProps'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_InteropData$json = const {
  '1': 'InteropData',
  '2': const [
    const {'1': 'accountId', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'accountId', '17': true},
    const {'1': 'token', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'token', '17': true},
    const {'1': 'enableReadReceipts', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'enableReadReceipts', '17': true},
  ],
  '8': const [
    const {'1': '_accountId'},
    const {'1': '_token'},
    const {'1': '_enableReadReceipts'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_UserAgent$json = const {
  '1': 'UserAgent',
  '2': const [
    const {'1': 'platform', '3': 1, '4': 1, '5': 14, '6': '.proto.ClientPayload.UserAgent.Platform', '9': 0, '10': 'platform', '17': true},
    const {'1': 'appVersion', '3': 2, '4': 1, '5': 11, '6': '.proto.ClientPayload.UserAgent.AppVersion', '9': 1, '10': 'appVersion', '17': true},
    const {'1': 'mcc', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'mcc', '17': true},
    const {'1': 'mnc', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'mnc', '17': true},
    const {'1': 'osVersion', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'osVersion', '17': true},
    const {'1': 'manufacturer', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'manufacturer', '17': true},
    const {'1': 'device', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'device', '17': true},
    const {'1': 'osBuildNumber', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'osBuildNumber', '17': true},
    const {'1': 'phoneId', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'phoneId', '17': true},
    const {'1': 'releaseChannel', '3': 10, '4': 1, '5': 14, '6': '.proto.ClientPayload.UserAgent.ReleaseChannel', '9': 9, '10': 'releaseChannel', '17': true},
    const {'1': 'localeLanguageIso6391', '3': 11, '4': 1, '5': 9, '9': 10, '10': 'localeLanguageIso6391', '17': true},
    const {'1': 'localeCountryIso31661Alpha2', '3': 12, '4': 1, '5': 9, '9': 11, '10': 'localeCountryIso31661Alpha2', '17': true},
    const {'1': 'deviceBoard', '3': 13, '4': 1, '5': 9, '9': 12, '10': 'deviceBoard', '17': true},
    const {'1': 'deviceExpId', '3': 14, '4': 1, '5': 9, '9': 13, '10': 'deviceExpId', '17': true},
    const {'1': 'deviceType', '3': 15, '4': 1, '5': 14, '6': '.proto.ClientPayload.UserAgent.DeviceType', '9': 14, '10': 'deviceType', '17': true},
    const {'1': 'deviceModelType', '3': 16, '4': 1, '5': 9, '9': 15, '10': 'deviceModelType', '17': true},
  ],
  '3': const [ClientPayload_UserAgent_AppVersion$json],
  '4': const [ClientPayload_UserAgent_DeviceType$json, ClientPayload_UserAgent_Platform$json, ClientPayload_UserAgent_ReleaseChannel$json],
  '8': const [
    const {'1': '_platform'},
    const {'1': '_appVersion'},
    const {'1': '_mcc'},
    const {'1': '_mnc'},
    const {'1': '_osVersion'},
    const {'1': '_manufacturer'},
    const {'1': '_device'},
    const {'1': '_osBuildNumber'},
    const {'1': '_phoneId'},
    const {'1': '_releaseChannel'},
    const {'1': '_localeLanguageIso6391'},
    const {'1': '_localeCountryIso31661Alpha2'},
    const {'1': '_deviceBoard'},
    const {'1': '_deviceExpId'},
    const {'1': '_deviceType'},
    const {'1': '_deviceModelType'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_UserAgent_AppVersion$json = const {
  '1': 'AppVersion',
  '2': const [
    const {'1': 'primary', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'primary', '17': true},
    const {'1': 'secondary', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'secondary', '17': true},
    const {'1': 'tertiary', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'tertiary', '17': true},
    const {'1': 'quaternary', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'quaternary', '17': true},
    const {'1': 'quinary', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'quinary', '17': true},
  ],
  '8': const [
    const {'1': '_primary'},
    const {'1': '_secondary'},
    const {'1': '_tertiary'},
    const {'1': '_quaternary'},
    const {'1': '_quinary'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_UserAgent_DeviceType$json = const {
  '1': 'DeviceType',
  '2': const [
    const {'1': 'PHONE', '2': 0},
    const {'1': 'TABLET', '2': 1},
    const {'1': 'DESKTOP', '2': 2},
    const {'1': 'WEARABLE', '2': 3},
    const {'1': 'VR', '2': 4},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_UserAgent_Platform$json = const {
  '1': 'Platform',
  '2': const [
    const {'1': 'ANDROID', '2': 0},
    const {'1': 'IOS', '2': 1},
    const {'1': 'WINDOWS_PHONE', '2': 2},
    const {'1': 'BLACKBERRY', '2': 3},
    const {'1': 'BLACKBERRYX', '2': 4},
    const {'1': 'S40', '2': 5},
    const {'1': 'S60', '2': 6},
    const {'1': 'PYTHON_CLIENT', '2': 7},
    const {'1': 'TIZEN', '2': 8},
    const {'1': 'ENTERPRISE', '2': 9},
    const {'1': 'SMB_ANDROID', '2': 10},
    const {'1': 'KAIOS', '2': 11},
    const {'1': 'SMB_IOS', '2': 12},
    const {'1': 'WINDOWS', '2': 13},
    const {'1': 'WEB', '2': 14},
    const {'1': 'PORTAL', '2': 15},
    const {'1': 'GREEN_ANDROID', '2': 16},
    const {'1': 'GREEN_IPHONE', '2': 17},
    const {'1': 'BLUE_ANDROID', '2': 18},
    const {'1': 'BLUE_IPHONE', '2': 19},
    const {'1': 'FBLITE_ANDROID', '2': 20},
    const {'1': 'MLITE_ANDROID', '2': 21},
    const {'1': 'IGLITE_ANDROID', '2': 22},
    const {'1': 'PAGE', '2': 23},
    const {'1': 'MACOS', '2': 24},
    const {'1': 'OCULUS_MSG', '2': 25},
    const {'1': 'OCULUS_CALL', '2': 26},
    const {'1': 'MILAN', '2': 27},
    const {'1': 'CAPI', '2': 28},
    const {'1': 'WEAROS', '2': 29},
    const {'1': 'ARDEVICE', '2': 30},
    const {'1': 'VRDEVICE', '2': 31},
    const {'1': 'BLUE_WEB', '2': 32},
    const {'1': 'IPAD', '2': 33},
    const {'1': 'TEST', '2': 34},
    const {'1': 'SMART_GLASSES', '2': 35},
    const {'1': 'BLUE_VR', '2': 36},
    const {'1': 'AR_WRIST', '2': 37},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_UserAgent_ReleaseChannel$json = const {
  '1': 'ReleaseChannel',
  '2': const [
    const {'1': 'RELEASE', '2': 0},
    const {'1': 'BETA', '2': 1},
    const {'1': 'ALPHA', '2': 2},
    const {'1': 'DEBUG', '2': 3},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_WebInfo$json = const {
  '1': 'WebInfo',
  '2': const [
    const {'1': 'refToken', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refToken', '17': true},
    const {'1': 'version', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'version', '17': true},
    const {'1': 'webdPayload', '3': 3, '4': 1, '5': 11, '6': '.proto.ClientPayload.WebInfo.WebdPayload', '9': 2, '10': 'webdPayload', '17': true},
    const {'1': 'webSubPlatform', '3': 4, '4': 1, '5': 14, '6': '.proto.ClientPayload.WebInfo.WebSubPlatform', '9': 3, '10': 'webSubPlatform', '17': true},
  ],
  '3': const [ClientPayload_WebInfo_WebdPayload$json],
  '4': const [ClientPayload_WebInfo_WebSubPlatform$json],
  '8': const [
    const {'1': '_refToken'},
    const {'1': '_version'},
    const {'1': '_webdPayload'},
    const {'1': '_webSubPlatform'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_WebInfo_WebdPayload$json = const {
  '1': 'WebdPayload',
  '2': const [
    const {'1': 'usesParticipantInKey', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'usesParticipantInKey', '17': true},
    const {'1': 'supportsStarredMessages', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'supportsStarredMessages', '17': true},
    const {'1': 'supportsDocumentMessages', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'supportsDocumentMessages', '17': true},
    const {'1': 'supportsUrlMessages', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'supportsUrlMessages', '17': true},
    const {'1': 'supportsMediaRetry', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'supportsMediaRetry', '17': true},
    const {'1': 'supportsE2EImage', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'supportsE2EImage', '17': true},
    const {'1': 'supportsE2EVideo', '3': 7, '4': 1, '5': 8, '9': 6, '10': 'supportsE2EVideo', '17': true},
    const {'1': 'supportsE2EAudio', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'supportsE2EAudio', '17': true},
    const {'1': 'supportsE2EDocument', '3': 9, '4': 1, '5': 8, '9': 8, '10': 'supportsE2EDocument', '17': true},
    const {'1': 'documentTypes', '3': 10, '4': 1, '5': 9, '9': 9, '10': 'documentTypes', '17': true},
    const {'1': 'features', '3': 11, '4': 1, '5': 12, '9': 10, '10': 'features', '17': true},
  ],
  '8': const [
    const {'1': '_usesParticipantInKey'},
    const {'1': '_supportsStarredMessages'},
    const {'1': '_supportsDocumentMessages'},
    const {'1': '_supportsUrlMessages'},
    const {'1': '_supportsMediaRetry'},
    const {'1': '_supportsE2EImage'},
    const {'1': '_supportsE2EVideo'},
    const {'1': '_supportsE2EAudio'},
    const {'1': '_supportsE2EDocument'},
    const {'1': '_documentTypes'},
    const {'1': '_features'},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_WebInfo_WebSubPlatform$json = const {
  '1': 'WebSubPlatform',
  '2': const [
    const {'1': 'WEB_BROWSER', '2': 0},
    const {'1': 'APP_STORE', '2': 1},
    const {'1': 'WIN_STORE', '2': 2},
    const {'1': 'DARWIN', '2': 3},
    const {'1': 'WIN32', '2': 4},
    const {'1': 'WIN_HYBRID', '2': 5},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_AccountType$json = const {
  '1': 'AccountType',
  '2': const [
    const {'1': 'DEFAULT', '2': 0},
    const {'1': 'GUEST', '2': 1},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_ConnectReason$json = const {
  '1': 'ConnectReason',
  '2': const [
    const {'1': 'PUSH', '2': 0},
    const {'1': 'USER_ACTIVATED', '2': 1},
    const {'1': 'SCHEDULED', '2': 2},
    const {'1': 'ERROR_RECONNECT', '2': 3},
    const {'1': 'NETWORK_SWITCH', '2': 4},
    const {'1': 'PING_RECONNECT', '2': 5},
    const {'1': 'UNKNOWN', '2': 6},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_ConnectType$json = const {
  '1': 'ConnectType',
  '2': const [
    const {'1': 'CELLULAR_UNKNOWN', '2': 0},
    const {'1': 'WIFI_UNKNOWN', '2': 1},
    const {'1': 'CELLULAR_EDGE', '2': 100},
    const {'1': 'CELLULAR_IDEN', '2': 101},
    const {'1': 'CELLULAR_UMTS', '2': 102},
    const {'1': 'CELLULAR_EVDO', '2': 103},
    const {'1': 'CELLULAR_GPRS', '2': 104},
    const {'1': 'CELLULAR_HSDPA', '2': 105},
    const {'1': 'CELLULAR_HSUPA', '2': 106},
    const {'1': 'CELLULAR_HSPA', '2': 107},
    const {'1': 'CELLULAR_CDMA', '2': 108},
    const {'1': 'CELLULAR_1XRTT', '2': 109},
    const {'1': 'CELLULAR_EHRPD', '2': 110},
    const {'1': 'CELLULAR_LTE', '2': 111},
    const {'1': 'CELLULAR_HSPAP', '2': 112},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_IOSAppExtension$json = const {
  '1': 'IOSAppExtension',
  '2': const [
    const {'1': 'SHARE_EXTENSION', '2': 0},
    const {'1': 'SERVICE_EXTENSION', '2': 1},
    const {'1': 'INTENTS_EXTENSION', '2': 2},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_Product$json = const {
  '1': 'Product',
  '2': const [
    const {'1': 'WHATSAPP', '2': 0},
    const {'1': 'MESSENGER', '2': 1},
    const {'1': 'INTEROP', '2': 2},
    const {'1': 'INTEROP_MSGR', '2': 3},
    const {'1': 'WHATSAPP_LID', '2': 4},
  ],
};

@$core.Deprecated('Use clientPayloadDescriptor instead')
const ClientPayload_TrafficAnonymization$json = const {
  '1': 'TrafficAnonymization',
  '2': const [
    const {'1': 'OFF', '2': 0},
    const {'1': 'STANDARD', '2': 1},
  ],
};

/// Descriptor for `ClientPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientPayloadDescriptor = $convert.base64Decode('Cg1DbGllbnRQYXlsb2FkEh8KCHVzZXJuYW1lGAEgASgESABSCHVzZXJuYW1liAEBEh0KB3Bhc3NpdmUYAyABKAhIAVIHcGFzc2l2ZYgBARJBCgl1c2VyQWdlbnQYBSABKAsyHi5wcm90by5DbGllbnRQYXlsb2FkLlVzZXJBZ2VudEgCUgl1c2VyQWdlbnSIAQESOwoHd2ViSW5mbxgGIAEoCzIcLnByb3RvLkNsaWVudFBheWxvYWQuV2ViSW5mb0gDUgd3ZWJJbmZviAEBEh8KCHB1c2hOYW1lGAcgASgJSARSCHB1c2hOYW1liAEBEiEKCXNlc3Npb25JZBgJIAEoD0gFUglzZXNzaW9uSWSIAQESJwoMc2hvcnRDb25uZWN0GAogASgISAZSDHNob3J0Q29ubmVjdIgBARJHCgtjb25uZWN0VHlwZRgMIAEoDjIgLnByb3RvLkNsaWVudFBheWxvYWQuQ29ubmVjdFR5cGVIB1ILY29ubmVjdFR5cGWIAQESTQoNY29ubmVjdFJlYXNvbhgNIAEoDjIiLnByb3RvLkNsaWVudFBheWxvYWQuQ29ubmVjdFJlYXNvbkgIUg1jb25uZWN0UmVhc29uiAEBEhYKBnNoYXJkcxgOIAMoBVIGc2hhcmRzEkEKCWRuc1NvdXJjZRgPIAEoCzIeLnByb3RvLkNsaWVudFBheWxvYWQuRE5TU291cmNlSAlSCWRuc1NvdXJjZYgBARI1ChNjb25uZWN0QXR0ZW1wdENvdW50GBAgASgNSApSE2Nvbm5lY3RBdHRlbXB0Q291bnSIAQESGwoGZGV2aWNlGBIgASgNSAtSBmRldmljZYgBARJlChFkZXZpY2VQYWlyaW5nRGF0YRgTIAEoCzIyLnByb3RvLkNsaWVudFBheWxvYWQuRGV2aWNlUGFpcmluZ1JlZ2lzdHJhdGlvbkRhdGFIDFIRZGV2aWNlUGFpcmluZ0RhdGGIAQESOwoHcHJvZHVjdBgUIAEoDjIcLnByb3RvLkNsaWVudFBheWxvYWQuUHJvZHVjdEgNUgdwcm9kdWN0iAEBEhkKBWZiQ2F0GBUgASgMSA5SBWZiQ2F0iAEBEiUKC2ZiVXNlckFnZW50GBYgASgMSA9SC2ZiVXNlckFnZW50iAEBEhMKAm9jGBcgASgISBBSAm9jiAEBEhMKAmxjGBggASgFSBFSAmxjiAEBElMKD2lvc0FwcEV4dGVuc2lvbhgeIAEoDjIkLnByb3RvLkNsaWVudFBheWxvYWQuSU9TQXBwRXh0ZW5zaW9uSBJSD2lvc0FwcEV4dGVuc2lvbogBARIdCgdmYkFwcElkGB8gASgESBNSB2ZiQXBwSWSIAQESIwoKZmJEZXZpY2VJZBggIAEoDEgUUgpmYkRldmljZUlkiAEBEhcKBHB1bGwYISABKAhIFVIEcHVsbIgBARInCgxwYWRkaW5nQnl0ZXMYIiABKAxIFlIMcGFkZGluZ0J5dGVziAEBEiEKCXllYXJDbGFzcxgkIAEoBUgXUgl5ZWFyQ2xhc3OIAQESHwoIbWVtQ2xhc3MYJSABKAVIGFIIbWVtQ2xhc3OIAQESRwoLaW50ZXJvcERhdGEYJiABKAsyIC5wcm90by5DbGllbnRQYXlsb2FkLkludGVyb3BEYXRhSBlSC2ludGVyb3BEYXRhiAEBEmIKFHRyYWZmaWNBbm9ueW1pemF0aW9uGCggASgOMikucHJvdG8uQ2xpZW50UGF5bG9hZC5UcmFmZmljQW5vbnltaXphdGlvbkgaUhR0cmFmZmljQW5vbnltaXphdGlvbogBARIpCg1saWREYk1pZ3JhdGVkGCkgASgISBtSDWxpZERiTWlncmF0ZWSIAQESRwoLYWNjb3VudFR5cGUYKiABKA4yIC5wcm90by5DbGllbnRQYXlsb2FkLkFjY291bnRUeXBlSBxSC2FjY291bnRUeXBliAEBEjsKFmNvbm5lY3Rpb25TZXF1ZW5jZUluZm8YKyABKA9IHVIWY29ubmVjdGlvblNlcXVlbmNlSW5mb4gBARIdCgdwYWFMaW5rGCwgASgISB5SB3BhYUxpbmuIAQESJwoMcHJlYWNrc0NvdW50GC0gASgFSB9SDHByZWFja3NDb3VudIgBARI1ChNwcm9jZXNzaW5nUXVldWVTaXplGC4gASgFSCBSE3Byb2Nlc3NpbmdRdWV1ZVNpemWIAQEahAIKCUROU1NvdXJjZRJVCglkbnNNZXRob2QYDyABKA4yMi5wcm90by5DbGllbnRQYXlsb2FkLkROU1NvdXJjZS5ETlNSZXNvbHV0aW9uTWV0aG9kSABSCWRuc01ldGhvZIgBARIhCglhcHBDYWNoZWQYECABKAhIAVIJYXBwQ2FjaGVkiAEBImEKE0ROU1Jlc29sdXRpb25NZXRob2QSCgoGU1lTVEVNEAASCgoGR09PR0xFEAESDQoJSEFSRENPREVEEAISDAoIT1ZFUlJJREUQAxIMCghGQUxMQkFDSxAEEgcKA01OUxAFQgwKCl9kbnNNZXRob2RCDAoKX2FwcENhY2hlZBqMAwodRGV2aWNlUGFpcmluZ1JlZ2lzdHJhdGlvbkRhdGESGwoGZVJlZ2lkGAEgASgMSABSBmVSZWdpZIgBARIfCghlS2V5dHlwZRgCIAEoDEgBUghlS2V5dHlwZYgBARIbCgZlSWRlbnQYAyABKAxIAlIGZUlkZW50iAEBEh0KB2VTa2V5SWQYBCABKAxIA1IHZVNrZXlJZIgBARIfCghlU2tleVZhbBgFIAEoDEgEUghlU2tleVZhbIgBARIfCghlU2tleVNpZxgGIAEoDEgFUghlU2tleVNpZ4gBARIhCglidWlsZEhhc2gYByABKAxIBlIJYnVpbGRIYXNoiAEBEiUKC2RldmljZVByb3BzGAggASgMSAdSC2RldmljZVByb3BziAEBQgkKB19lUmVnaWRCCwoJX2VLZXl0eXBlQgkKB19lSWRlbnRCCgoIX2VTa2V5SWRCCwoJX2VTa2V5VmFsQgsKCV9lU2tleVNpZ0IMCgpfYnVpbGRIYXNoQg4KDF9kZXZpY2VQcm9wcxqvAQoLSW50ZXJvcERhdGESIQoJYWNjb3VudElkGAEgASgESABSCWFjY291bnRJZIgBARIZCgV0b2tlbhgCIAEoDEgBUgV0b2tlbogBARIzChJlbmFibGVSZWFkUmVjZWlwdHMYAyABKAhIAlISZW5hYmxlUmVhZFJlY2VpcHRziAEBQgwKCl9hY2NvdW50SWRCCAoGX3Rva2VuQhUKE19lbmFibGVSZWFkUmVjZWlwdHMa3A8KCVVzZXJBZ2VudBJICghwbGF0Zm9ybRgBIAEoDjInLnByb3RvLkNsaWVudFBheWxvYWQuVXNlckFnZW50LlBsYXRmb3JtSABSCHBsYXRmb3JtiAEBEk4KCmFwcFZlcnNpb24YAiABKAsyKS5wcm90by5DbGllbnRQYXlsb2FkLlVzZXJBZ2VudC5BcHBWZXJzaW9uSAFSCmFwcFZlcnNpb26IAQESFQoDbWNjGAMgASgJSAJSA21jY4gBARIVCgNtbmMYBCABKAlIA1IDbW5jiAEBEiEKCW9zVmVyc2lvbhgFIAEoCUgEUglvc1ZlcnNpb26IAQESJwoMbWFudWZhY3R1cmVyGAYgASgJSAVSDG1hbnVmYWN0dXJlcogBARIbCgZkZXZpY2UYByABKAlIBlIGZGV2aWNliAEBEikKDW9zQnVpbGROdW1iZXIYCCABKAlIB1INb3NCdWlsZE51bWJlcogBARIdCgdwaG9uZUlkGAkgASgJSAhSB3Bob25lSWSIAQESWgoOcmVsZWFzZUNoYW5uZWwYCiABKA4yLS5wcm90by5DbGllbnRQYXlsb2FkLlVzZXJBZ2VudC5SZWxlYXNlQ2hhbm5lbEgJUg5yZWxlYXNlQ2hhbm5lbIgBARI5ChVsb2NhbGVMYW5ndWFnZUlzbzYzOTEYCyABKAlIClIVbG9jYWxlTGFuZ3VhZ2VJc282MzkxiAEBEkUKG2xvY2FsZUNvdW50cnlJc28zMTY2MUFscGhhMhgMIAEoCUgLUhtsb2NhbGVDb3VudHJ5SXNvMzE2NjFBbHBoYTKIAQESJQoLZGV2aWNlQm9hcmQYDSABKAlIDFILZGV2aWNlQm9hcmSIAQESJQoLZGV2aWNlRXhwSWQYDiABKAlIDVILZGV2aWNlRXhwSWSIAQESTgoKZGV2aWNlVHlwZRgPIAEoDjIpLnByb3RvLkNsaWVudFBheWxvYWQuVXNlckFnZW50LkRldmljZVR5cGVIDlIKZGV2aWNlVHlwZYgBARItCg9kZXZpY2VNb2RlbFR5cGUYECABKAlID1IPZGV2aWNlTW9kZWxUeXBliAEBGvUBCgpBcHBWZXJzaW9uEh0KB3ByaW1hcnkYASABKA1IAFIHcHJpbWFyeYgBARIhCglzZWNvbmRhcnkYAiABKA1IAVIJc2Vjb25kYXJ5iAEBEh8KCHRlcnRpYXJ5GAMgASgNSAJSCHRlcnRpYXJ5iAEBEiMKCnF1YXRlcm5hcnkYBCABKA1IA1IKcXVhdGVybmFyeYgBARIdCgdxdWluYXJ5GAUgASgNSARSB3F1aW5hcnmIAQFCCgoIX3ByaW1hcnlCDAoKX3NlY29uZGFyeUILCglfdGVydGlhcnlCDQoLX3F1YXRlcm5hcnlCCgoIX3F1aW5hcnkiRgoKRGV2aWNlVHlwZRIJCgVQSE9ORRAAEgoKBlRBQkxFVBABEgsKB0RFU0tUT1AQAhIMCghXRUFSQUJMRRADEgYKAlZSEAQipQQKCFBsYXRmb3JtEgsKB0FORFJPSUQQABIHCgNJT1MQARIRCg1XSU5ET1dTX1BIT05FEAISDgoKQkxBQ0tCRVJSWRADEg8KC0JMQUNLQkVSUllYEAQSBwoDUzQwEAUSBwoDUzYwEAYSEQoNUFlUSE9OX0NMSUVOVBAHEgkKBVRJWkVOEAgSDgoKRU5URVJQUklTRRAJEg8KC1NNQl9BTkRST0lEEAoSCQoFS0FJT1MQCxILCgdTTUJfSU9TEAwSCwoHV0lORE9XUxANEgcKA1dFQhAOEgoKBlBPUlRBTBAPEhEKDUdSRUVOX0FORFJPSUQQEBIQCgxHUkVFTl9JUEhPTkUQERIQCgxCTFVFX0FORFJPSUQQEhIPCgtCTFVFX0lQSE9ORRATEhIKDkZCTElURV9BTkRST0lEEBQSEQoNTUxJVEVfQU5EUk9JRBAVEhIKDklHTElURV9BTkRST0lEEBYSCAoEUEFHRRAXEgkKBU1BQ09TEBgSDgoKT0NVTFVTX01TRxAZEg8KC09DVUxVU19DQUxMEBoSCQoFTUlMQU4QGxIICgRDQVBJEBwSCgoGV0VBUk9TEB0SDAoIQVJERVZJQ0UQHhIMCghWUkRFVklDRRAfEgwKCEJMVUVfV0VCECASCAoESVBBRBAhEggKBFRFU1QQIhIRCg1TTUFSVF9HTEFTU0VTECMSCwoHQkxVRV9WUhAkEgwKCEFSX1dSSVNUECUiPQoOUmVsZWFzZUNoYW5uZWwSCwoHUkVMRUFTRRAAEggKBEJFVEEQARIJCgVBTFBIQRACEgkKBURFQlVHEANCCwoJX3BsYXRmb3JtQg0KC19hcHBWZXJzaW9uQgYKBF9tY2NCBgoEX21uY0IMCgpfb3NWZXJzaW9uQg8KDV9tYW51ZmFjdHVyZXJCCQoHX2RldmljZUIQCg5fb3NCdWlsZE51bWJlckIKCghfcGhvbmVJZEIRCg9fcmVsZWFzZUNoYW5uZWxCGAoWX2xvY2FsZUxhbmd1YWdlSXNvNjM5MUIeChxfbG9jYWxlQ291bnRyeUlzbzMxNjYxQWxwaGEyQg4KDF9kZXZpY2VCb2FyZEIOCgxfZGV2aWNlRXhwSWRCDQoLX2RldmljZVR5cGVCEgoQX2RldmljZU1vZGVsVHlwZRraCQoHV2ViSW5mbxIfCghyZWZUb2tlbhgBIAEoCUgAUghyZWZUb2tlbogBARIdCgd2ZXJzaW9uGAIgASgJSAFSB3ZlcnNpb26IAQESTwoLd2ViZFBheWxvYWQYAyABKAsyKC5wcm90by5DbGllbnRQYXlsb2FkLldlYkluZm8uV2ViZFBheWxvYWRIAlILd2ViZFBheWxvYWSIAQESWAoOd2ViU3ViUGxhdGZvcm0YBCABKA4yKy5wcm90by5DbGllbnRQYXlsb2FkLldlYkluZm8uV2ViU3ViUGxhdGZvcm1IA1IOd2ViU3ViUGxhdGZvcm2IAQEavwYKC1dlYmRQYXlsb2FkEjcKFHVzZXNQYXJ0aWNpcGFudEluS2V5GAEgASgISABSFHVzZXNQYXJ0aWNpcGFudEluS2V5iAEBEj0KF3N1cHBvcnRzU3RhcnJlZE1lc3NhZ2VzGAIgASgISAFSF3N1cHBvcnRzU3RhcnJlZE1lc3NhZ2VziAEBEj8KGHN1cHBvcnRzRG9jdW1lbnRNZXNzYWdlcxgDIAEoCEgCUhhzdXBwb3J0c0RvY3VtZW50TWVzc2FnZXOIAQESNQoTc3VwcG9ydHNVcmxNZXNzYWdlcxgEIAEoCEgDUhNzdXBwb3J0c1VybE1lc3NhZ2VziAEBEjMKEnN1cHBvcnRzTWVkaWFSZXRyeRgFIAEoCEgEUhJzdXBwb3J0c01lZGlhUmV0cnmIAQESLwoQc3VwcG9ydHNFMkVJbWFnZRgGIAEoCEgFUhBzdXBwb3J0c0UyRUltYWdliAEBEi8KEHN1cHBvcnRzRTJFVmlkZW8YByABKAhIBlIQc3VwcG9ydHNFMkVWaWRlb4gBARIvChBzdXBwb3J0c0UyRUF1ZGlvGAggASgISAdSEHN1cHBvcnRzRTJFQXVkaW+IAQESNQoTc3VwcG9ydHNFMkVEb2N1bWVudBgJIAEoCEgIUhNzdXBwb3J0c0UyRURvY3VtZW50iAEBEikKDWRvY3VtZW50VHlwZXMYCiABKAlICVINZG9jdW1lbnRUeXBlc4gBARIfCghmZWF0dXJlcxgLIAEoDEgKUghmZWF0dXJlc4gBAUIXChVfdXNlc1BhcnRpY2lwYW50SW5LZXlCGgoYX3N1cHBvcnRzU3RhcnJlZE1lc3NhZ2VzQhsKGV9zdXBwb3J0c0RvY3VtZW50TWVzc2FnZXNCFgoUX3N1cHBvcnRzVXJsTWVzc2FnZXNCFQoTX3N1cHBvcnRzTWVkaWFSZXRyeUITChFfc3VwcG9ydHNFMkVJbWFnZUITChFfc3VwcG9ydHNFMkVWaWRlb0ITChFfc3VwcG9ydHNFMkVBdWRpb0IWChRfc3VwcG9ydHNFMkVEb2N1bWVudEIQCg5fZG9jdW1lbnRUeXBlc0ILCglfZmVhdHVyZXMiZgoOV2ViU3ViUGxhdGZvcm0SDwoLV0VCX0JST1dTRVIQABINCglBUFBfU1RPUkUQARINCglXSU5fU1RPUkUQAhIKCgZEQVJXSU4QAxIJCgVXSU4zMhAEEg4KCldJTl9IWUJSSUQQBUILCglfcmVmVG9rZW5CCgoIX3ZlcnNpb25CDgoMX3dlYmRQYXlsb2FkQhEKD193ZWJTdWJQbGF0Zm9ybSIlCgtBY2NvdW50VHlwZRILCgdERUZBVUxUEAASCQoFR1VFU1QQASKGAQoNQ29ubmVjdFJlYXNvbhIICgRQVVNIEAASEgoOVVNFUl9BQ1RJVkFURUQQARINCglTQ0hFRFVMRUQQAhITCg9FUlJPUl9SRUNPTk5FQ1QQAxISCg5ORVRXT1JLX1NXSVRDSBAEEhIKDlBJTkdfUkVDT05ORUNUEAUSCwoHVU5LTk9XThAGIrACCgtDb25uZWN0VHlwZRIUChBDRUxMVUxBUl9VTktOT1dOEAASEAoMV0lGSV9VTktOT1dOEAESEQoNQ0VMTFVMQVJfRURHRRBkEhEKDUNFTExVTEFSX0lERU4QZRIRCg1DRUxMVUxBUl9VTVRTEGYSEQoNQ0VMTFVMQVJfRVZETxBnEhEKDUNFTExVTEFSX0dQUlMQaBISCg5DRUxMVUxBUl9IU0RQQRBpEhIKDkNFTExVTEFSX0hTVVBBEGoSEQoNQ0VMTFVMQVJfSFNQQRBrEhEKDUNFTExVTEFSX0NETUEQbBISCg5DRUxMVUxBUl8xWFJUVBBtEhIKDkNFTExVTEFSX0VIUlBEEG4SEAoMQ0VMTFVMQVJfTFRFEG8SEgoOQ0VMTFVMQVJfSFNQQVAQcCJUCg9JT1NBcHBFeHRlbnNpb24SEwoPU0hBUkVfRVhURU5TSU9OEAASFQoRU0VSVklDRV9FWFRFTlNJT04QARIVChFJTlRFTlRTX0VYVEVOU0lPThACIlcKB1Byb2R1Y3QSDAoIV0hBVFNBUFAQABINCglNRVNTRU5HRVIQARILCgdJTlRFUk9QEAISEAoMSU5URVJPUF9NU0dSEAMSEAoMV0hBVFNBUFBfTElEEAQiLQoUVHJhZmZpY0Fub255bWl6YXRpb24SBwoDT0ZGEAASDAoIU1RBTkRBUkQQAUILCglfdXNlcm5hbWVCCgoIX3Bhc3NpdmVCDAoKX3VzZXJBZ2VudEIKCghfd2ViSW5mb0ILCglfcHVzaE5hbWVCDAoKX3Nlc3Npb25JZEIPCg1fc2hvcnRDb25uZWN0Qg4KDF9jb25uZWN0VHlwZUIQCg5fY29ubmVjdFJlYXNvbkIMCgpfZG5zU291cmNlQhYKFF9jb25uZWN0QXR0ZW1wdENvdW50QgkKB19kZXZpY2VCFAoSX2RldmljZVBhaXJpbmdEYXRhQgoKCF9wcm9kdWN0QggKBl9mYkNhdEIOCgxfZmJVc2VyQWdlbnRCBQoDX29jQgUKA19sY0ISChBfaW9zQXBwRXh0ZW5zaW9uQgoKCF9mYkFwcElkQg0KC19mYkRldmljZUlkQgcKBV9wdWxsQg8KDV9wYWRkaW5nQnl0ZXNCDAoKX3llYXJDbGFzc0ILCglfbWVtQ2xhc3NCDgoMX2ludGVyb3BEYXRhQhcKFV90cmFmZmljQW5vbnltaXphdGlvbkIQCg5fbGlkRGJNaWdyYXRlZEIOCgxfYWNjb3VudFR5cGVCGQoXX2Nvbm5lY3Rpb25TZXF1ZW5jZUluZm9CCgoIX3BhYUxpbmtCDwoNX3ByZWFja3NDb3VudEIWChRfcHJvY2Vzc2luZ1F1ZXVlU2l6ZQ==');
@$core.Deprecated('Use commentMetadataDescriptor instead')
const CommentMetadata$json = const {
  '1': 'CommentMetadata',
  '2': const [
    const {'1': 'commentParentKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'commentParentKey', '17': true},
    const {'1': 'replyCount', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'replyCount', '17': true},
  ],
  '8': const [
    const {'1': '_commentParentKey'},
    const {'1': '_replyCount'},
  ],
};

/// Descriptor for `CommentMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentMetadataDescriptor = $convert.base64Decode('Cg9Db21tZW50TWV0YWRhdGESQgoQY29tbWVudFBhcmVudEtleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIQY29tbWVudFBhcmVudEtleYgBARIjCgpyZXBseUNvdW50GAIgASgNSAFSCnJlcGx5Q291bnSIAQFCEwoRX2NvbW1lbnRQYXJlbnRLZXlCDQoLX3JlcGx5Q291bnQ=');
@$core.Deprecated('Use companionCommitmentDescriptor instead')
const CompanionCommitment$json = const {
  '1': 'CompanionCommitment',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'hash', '17': true},
  ],
  '8': const [
    const {'1': '_hash'},
  ],
};

/// Descriptor for `CompanionCommitment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List companionCommitmentDescriptor = $convert.base64Decode('ChNDb21wYW5pb25Db21taXRtZW50EhcKBGhhc2gYASABKAxIAFIEaGFzaIgBAUIHCgVfaGFzaA==');
@$core.Deprecated('Use companionEphemeralIdentityDescriptor instead')
const CompanionEphemeralIdentity$json = const {
  '1': 'CompanionEphemeralIdentity',
  '2': const [
    const {'1': 'publicKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'publicKey', '17': true},
    const {'1': 'deviceType', '3': 2, '4': 1, '5': 14, '6': '.proto.DeviceProps.PlatformType', '9': 1, '10': 'deviceType', '17': true},
    const {'1': 'ref', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'ref', '17': true},
  ],
  '8': const [
    const {'1': '_publicKey'},
    const {'1': '_deviceType'},
    const {'1': '_ref'},
  ],
};

/// Descriptor for `CompanionEphemeralIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List companionEphemeralIdentityDescriptor = $convert.base64Decode('ChpDb21wYW5pb25FcGhlbWVyYWxJZGVudGl0eRIhCglwdWJsaWNLZXkYASABKAxIAFIJcHVibGljS2V5iAEBEkQKCmRldmljZVR5cGUYAiABKA4yHy5wcm90by5EZXZpY2VQcm9wcy5QbGF0Zm9ybVR5cGVIAVIKZGV2aWNlVHlwZYgBARIVCgNyZWYYAyABKAlIAlIDcmVmiAEBQgwKCl9wdWJsaWNLZXlCDQoLX2RldmljZVR5cGVCBgoEX3JlZg==');
@$core.Deprecated('Use configDescriptor instead')
const Config$json = const {
  '1': 'Config',
  '2': const [
    const {'1': 'field', '3': 1, '4': 3, '5': 11, '6': '.proto.Config.FieldEntry', '10': 'field'},
    const {'1': 'version', '3': 2, '4': 1, '5': 13, '9': 0, '10': 'version', '17': true},
  ],
  '3': const [Config_FieldEntry$json],
  '8': const [
    const {'1': '_version'},
  ],
};

@$core.Deprecated('Use configDescriptor instead')
const Config_FieldEntry$json = const {
  '1': 'FieldEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.proto.Field', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Config`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configDescriptor = $convert.base64Decode('CgZDb25maWcSLgoFZmllbGQYASADKAsyGC5wcm90by5Db25maWcuRmllbGRFbnRyeVIFZmllbGQSHQoHdmVyc2lvbhgCIAEoDUgAUgd2ZXJzaW9uiAEBGkYKCkZpZWxkRW50cnkSEAoDa2V5GAEgASgNUgNrZXkSIgoFdmFsdWUYAiABKAsyDC5wcm90by5GaWVsZFIFdmFsdWU6AjgBQgoKCF92ZXJzaW9u');
@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo$json = const {
  '1': 'ContextInfo',
  '2': const [
    const {'1': 'stanzaId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stanzaId', '17': true},
    const {'1': 'participant', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'participant', '17': true},
    const {'1': 'quotedMessage', '3': 3, '4': 1, '5': 11, '6': '.proto.Message', '9': 2, '10': 'quotedMessage', '17': true},
    const {'1': 'remoteJid', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'remoteJid', '17': true},
    const {'1': 'mentionedJid', '3': 15, '4': 3, '5': 9, '10': 'mentionedJid'},
    const {'1': 'conversionSource', '3': 18, '4': 1, '5': 9, '9': 4, '10': 'conversionSource', '17': true},
    const {'1': 'conversionData', '3': 19, '4': 1, '5': 12, '9': 5, '10': 'conversionData', '17': true},
    const {'1': 'conversionDelaySeconds', '3': 20, '4': 1, '5': 13, '9': 6, '10': 'conversionDelaySeconds', '17': true},
    const {'1': 'forwardingScore', '3': 21, '4': 1, '5': 13, '9': 7, '10': 'forwardingScore', '17': true},
    const {'1': 'isForwarded', '3': 22, '4': 1, '5': 8, '9': 8, '10': 'isForwarded', '17': true},
    const {'1': 'quotedAd', '3': 23, '4': 1, '5': 11, '6': '.proto.ContextInfo.AdReplyInfo', '9': 9, '10': 'quotedAd', '17': true},
    const {'1': 'placeholderKey', '3': 24, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 10, '10': 'placeholderKey', '17': true},
    const {'1': 'expiration', '3': 25, '4': 1, '5': 13, '9': 11, '10': 'expiration', '17': true},
    const {'1': 'ephemeralSettingTimestamp', '3': 26, '4': 1, '5': 3, '9': 12, '10': 'ephemeralSettingTimestamp', '17': true},
    const {'1': 'ephemeralSharedSecret', '3': 27, '4': 1, '5': 12, '9': 13, '10': 'ephemeralSharedSecret', '17': true},
    const {'1': 'externalAdReply', '3': 28, '4': 1, '5': 11, '6': '.proto.ContextInfo.ExternalAdReplyInfo', '9': 14, '10': 'externalAdReply', '17': true},
    const {'1': 'entryPointConversionSource', '3': 29, '4': 1, '5': 9, '9': 15, '10': 'entryPointConversionSource', '17': true},
    const {'1': 'entryPointConversionApp', '3': 30, '4': 1, '5': 9, '9': 16, '10': 'entryPointConversionApp', '17': true},
    const {'1': 'entryPointConversionDelaySeconds', '3': 31, '4': 1, '5': 13, '9': 17, '10': 'entryPointConversionDelaySeconds', '17': true},
    const {'1': 'disappearingMode', '3': 32, '4': 1, '5': 11, '6': '.proto.DisappearingMode', '9': 18, '10': 'disappearingMode', '17': true},
    const {'1': 'actionLink', '3': 33, '4': 1, '5': 11, '6': '.proto.ActionLink', '9': 19, '10': 'actionLink', '17': true},
    const {'1': 'groupSubject', '3': 34, '4': 1, '5': 9, '9': 20, '10': 'groupSubject', '17': true},
    const {'1': 'parentGroupJid', '3': 35, '4': 1, '5': 9, '9': 21, '10': 'parentGroupJid', '17': true},
    const {'1': 'trustBannerType', '3': 37, '4': 1, '5': 9, '9': 22, '10': 'trustBannerType', '17': true},
    const {'1': 'trustBannerAction', '3': 38, '4': 1, '5': 13, '9': 23, '10': 'trustBannerAction', '17': true},
    const {'1': 'isSampled', '3': 39, '4': 1, '5': 8, '9': 24, '10': 'isSampled', '17': true},
    const {'1': 'groupMentions', '3': 40, '4': 3, '5': 11, '6': '.proto.GroupMention', '10': 'groupMentions'},
    const {'1': 'utm', '3': 41, '4': 1, '5': 11, '6': '.proto.ContextInfo.UTMInfo', '9': 25, '10': 'utm', '17': true},
    const {'1': 'forwardedNewsletterMessageInfo', '3': 43, '4': 1, '5': 11, '6': '.proto.ContextInfo.ForwardedNewsletterMessageInfo', '9': 26, '10': 'forwardedNewsletterMessageInfo', '17': true},
    const {'1': 'businessMessageForwardInfo', '3': 44, '4': 1, '5': 11, '6': '.proto.ContextInfo.BusinessMessageForwardInfo', '9': 27, '10': 'businessMessageForwardInfo', '17': true},
    const {'1': 'smbClientCampaignId', '3': 45, '4': 1, '5': 9, '9': 28, '10': 'smbClientCampaignId', '17': true},
    const {'1': 'smbServerCampaignId', '3': 46, '4': 1, '5': 9, '9': 29, '10': 'smbServerCampaignId', '17': true},
    const {'1': 'dataSharingContext', '3': 47, '4': 1, '5': 11, '6': '.proto.ContextInfo.DataSharingContext', '9': 30, '10': 'dataSharingContext', '17': true},
    const {'1': 'alwaysShowAdAttribution', '3': 48, '4': 1, '5': 8, '9': 31, '10': 'alwaysShowAdAttribution', '17': true},
    const {'1': 'featureEligibilities', '3': 49, '4': 1, '5': 11, '6': '.proto.ContextInfo.FeatureEligibilities', '9': 32, '10': 'featureEligibilities', '17': true},
    const {'1': 'entryPointConversionExternalSource', '3': 50, '4': 1, '5': 9, '9': 33, '10': 'entryPointConversionExternalSource', '17': true},
    const {'1': 'entryPointConversionExternalMedium', '3': 51, '4': 1, '5': 9, '9': 34, '10': 'entryPointConversionExternalMedium', '17': true},
    const {'1': 'ctwaSignals', '3': 54, '4': 1, '5': 9, '9': 35, '10': 'ctwaSignals', '17': true},
    const {'1': 'ctwaPayload', '3': 55, '4': 1, '5': 12, '9': 36, '10': 'ctwaPayload', '17': true},
    const {'1': 'forwardedAiBotMessageInfo', '3': 56, '4': 1, '5': 11, '6': '.proto.ForwardedAIBotMessageInfo', '9': 37, '10': 'forwardedAiBotMessageInfo', '17': true},
    const {'1': 'statusAttributionType', '3': 57, '4': 1, '5': 14, '6': '.proto.ContextInfo.StatusAttributionType', '9': 38, '10': 'statusAttributionType', '17': true},
    const {'1': 'urlTrackingMap', '3': 58, '4': 1, '5': 11, '6': '.proto.UrlTrackingMap', '9': 39, '10': 'urlTrackingMap', '17': true},
    const {'1': 'pairedMediaType', '3': 59, '4': 1, '5': 14, '6': '.proto.ContextInfo.PairedMediaType', '9': 40, '10': 'pairedMediaType', '17': true},
    const {'1': 'rankingVersion', '3': 60, '4': 1, '5': 13, '9': 41, '10': 'rankingVersion', '17': true},
    const {'1': 'memberLabel', '3': 62, '4': 1, '5': 11, '6': '.proto.MemberLabel', '9': 42, '10': 'memberLabel', '17': true},
    const {'1': 'isQuestion', '3': 63, '4': 1, '5': 8, '9': 43, '10': 'isQuestion', '17': true},
    const {'1': 'statusSourceType', '3': 64, '4': 1, '5': 14, '6': '.proto.ContextInfo.StatusSourceType', '9': 44, '10': 'statusSourceType', '17': true},
    const {'1': 'statusAttributions', '3': 65, '4': 3, '5': 11, '6': '.proto.StatusAttribution', '10': 'statusAttributions'},
    const {'1': 'isGroupStatus', '3': 66, '4': 1, '5': 8, '9': 45, '10': 'isGroupStatus', '17': true},
    const {'1': 'forwardOrigin', '3': 67, '4': 1, '5': 14, '6': '.proto.ContextInfo.ForwardOrigin', '9': 46, '10': 'forwardOrigin', '17': true},
    const {'1': 'questionReplyQuotedMessage', '3': 68, '4': 1, '5': 11, '6': '.proto.ContextInfo.QuestionReplyQuotedMessage', '9': 47, '10': 'questionReplyQuotedMessage', '17': true},
    const {'1': 'statusAudienceMetadata', '3': 69, '4': 1, '5': 11, '6': '.proto.ContextInfo.StatusAudienceMetadata', '9': 48, '10': 'statusAudienceMetadata', '17': true},
    const {'1': 'nonJidMentions', '3': 70, '4': 1, '5': 13, '9': 49, '10': 'nonJidMentions', '17': true},
    const {'1': 'quotedType', '3': 71, '4': 1, '5': 14, '6': '.proto.ContextInfo.QuotedType', '9': 50, '10': 'quotedType', '17': true},
    const {'1': 'botMessageSharingInfo', '3': 72, '4': 1, '5': 11, '6': '.proto.BotMessageSharingInfo', '9': 51, '10': 'botMessageSharingInfo', '17': true},
  ],
  '3': const [ContextInfo_AdReplyInfo$json, ContextInfo_BusinessMessageForwardInfo$json, ContextInfo_DataSharingContext$json, ContextInfo_ExternalAdReplyInfo$json, ContextInfo_FeatureEligibilities$json, ContextInfo_ForwardedNewsletterMessageInfo$json, ContextInfo_QuestionReplyQuotedMessage$json, ContextInfo_StatusAudienceMetadata$json, ContextInfo_UTMInfo$json],
  '4': const [ContextInfo_ForwardOrigin$json, ContextInfo_PairedMediaType$json, ContextInfo_QuotedType$json, ContextInfo_StatusAttributionType$json, ContextInfo_StatusSourceType$json],
  '8': const [
    const {'1': '_stanzaId'},
    const {'1': '_participant'},
    const {'1': '_quotedMessage'},
    const {'1': '_remoteJid'},
    const {'1': '_conversionSource'},
    const {'1': '_conversionData'},
    const {'1': '_conversionDelaySeconds'},
    const {'1': '_forwardingScore'},
    const {'1': '_isForwarded'},
    const {'1': '_quotedAd'},
    const {'1': '_placeholderKey'},
    const {'1': '_expiration'},
    const {'1': '_ephemeralSettingTimestamp'},
    const {'1': '_ephemeralSharedSecret'},
    const {'1': '_externalAdReply'},
    const {'1': '_entryPointConversionSource'},
    const {'1': '_entryPointConversionApp'},
    const {'1': '_entryPointConversionDelaySeconds'},
    const {'1': '_disappearingMode'},
    const {'1': '_actionLink'},
    const {'1': '_groupSubject'},
    const {'1': '_parentGroupJid'},
    const {'1': '_trustBannerType'},
    const {'1': '_trustBannerAction'},
    const {'1': '_isSampled'},
    const {'1': '_utm'},
    const {'1': '_forwardedNewsletterMessageInfo'},
    const {'1': '_businessMessageForwardInfo'},
    const {'1': '_smbClientCampaignId'},
    const {'1': '_smbServerCampaignId'},
    const {'1': '_dataSharingContext'},
    const {'1': '_alwaysShowAdAttribution'},
    const {'1': '_featureEligibilities'},
    const {'1': '_entryPointConversionExternalSource'},
    const {'1': '_entryPointConversionExternalMedium'},
    const {'1': '_ctwaSignals'},
    const {'1': '_ctwaPayload'},
    const {'1': '_forwardedAiBotMessageInfo'},
    const {'1': '_statusAttributionType'},
    const {'1': '_urlTrackingMap'},
    const {'1': '_pairedMediaType'},
    const {'1': '_rankingVersion'},
    const {'1': '_memberLabel'},
    const {'1': '_isQuestion'},
    const {'1': '_statusSourceType'},
    const {'1': '_isGroupStatus'},
    const {'1': '_forwardOrigin'},
    const {'1': '_questionReplyQuotedMessage'},
    const {'1': '_statusAudienceMetadata'},
    const {'1': '_nonJidMentions'},
    const {'1': '_quotedType'},
    const {'1': '_botMessageSharingInfo'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_AdReplyInfo$json = const {
  '1': 'AdReplyInfo',
  '2': const [
    const {'1': 'advertiserName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'advertiserName', '17': true},
    const {'1': 'mediaType', '3': 2, '4': 1, '5': 14, '6': '.proto.ContextInfo.AdReplyInfo.MediaType', '9': 1, '10': 'mediaType', '17': true},
    const {'1': 'jpegThumbnail', '3': 16, '4': 1, '5': 12, '9': 2, '10': 'jpegThumbnail', '17': true},
    const {'1': 'caption', '3': 17, '4': 1, '5': 9, '9': 3, '10': 'caption', '17': true},
  ],
  '4': const [ContextInfo_AdReplyInfo_MediaType$json],
  '8': const [
    const {'1': '_advertiserName'},
    const {'1': '_mediaType'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_caption'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_AdReplyInfo_MediaType$json = const {
  '1': 'MediaType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'IMAGE', '2': 1},
    const {'1': 'VIDEO', '2': 2},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_BusinessMessageForwardInfo$json = const {
  '1': 'BusinessMessageForwardInfo',
  '2': const [
    const {'1': 'businessOwnerJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'businessOwnerJid', '17': true},
  ],
  '8': const [
    const {'1': '_businessOwnerJid'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_DataSharingContext$json = const {
  '1': 'DataSharingContext',
  '2': const [
    const {'1': 'showMmDisclosure', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'showMmDisclosure', '17': true},
    const {'1': 'encryptedSignalTokenConsented', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'encryptedSignalTokenConsented', '17': true},
    const {'1': 'parameters', '3': 3, '4': 3, '5': 11, '6': '.proto.ContextInfo.DataSharingContext.Parameters', '10': 'parameters'},
    const {'1': 'dataSharingFlags', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'dataSharingFlags', '17': true},
  ],
  '3': const [ContextInfo_DataSharingContext_Parameters$json],
  '4': const [ContextInfo_DataSharingContext_DataSharingFlags$json],
  '8': const [
    const {'1': '_showMmDisclosure'},
    const {'1': '_encryptedSignalTokenConsented'},
    const {'1': '_dataSharingFlags'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_DataSharingContext_Parameters$json = const {
  '1': 'Parameters',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'key', '17': true},
    const {'1': 'stringData', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'stringData', '17': true},
    const {'1': 'intData', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'intData', '17': true},
    const {'1': 'floatData', '3': 4, '4': 1, '5': 2, '9': 3, '10': 'floatData', '17': true},
    const {'1': 'contents', '3': 5, '4': 1, '5': 11, '6': '.proto.ContextInfo.DataSharingContext.Parameters', '9': 4, '10': 'contents', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_stringData'},
    const {'1': '_intData'},
    const {'1': '_floatData'},
    const {'1': '_contents'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_DataSharingContext_DataSharingFlags$json = const {
  '1': 'DataSharingFlags',
  '2': const [
    const {'1': 'UNKNOWN_DATASHARINGFLAGS_ZERO', '2': 0},
    const {'1': 'SHOW_MM_DISCLOSURE_ON_CLICK', '2': 1},
    const {'1': 'SHOW_MM_DISCLOSURE_ON_READ', '2': 2},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_ExternalAdReplyInfo$json = const {
  '1': 'ExternalAdReplyInfo',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'body', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'body', '17': true},
    const {'1': 'mediaType', '3': 3, '4': 1, '5': 14, '6': '.proto.ContextInfo.ExternalAdReplyInfo.MediaType', '9': 2, '10': 'mediaType', '17': true},
    const {'1': 'thumbnailUrl', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'thumbnailUrl', '17': true},
    const {'1': 'mediaUrl', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'mediaUrl', '17': true},
    const {'1': 'thumbnail', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'thumbnail', '17': true},
    const {'1': 'sourceType', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'sourceType', '17': true},
    const {'1': 'sourceId', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'sourceId', '17': true},
    const {'1': 'sourceUrl', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'sourceUrl', '17': true},
    const {'1': 'containsAutoReply', '3': 10, '4': 1, '5': 8, '9': 9, '10': 'containsAutoReply', '17': true},
    const {'1': 'renderLargerThumbnail', '3': 11, '4': 1, '5': 8, '9': 10, '10': 'renderLargerThumbnail', '17': true},
    const {'1': 'showAdAttribution', '3': 12, '4': 1, '5': 8, '9': 11, '10': 'showAdAttribution', '17': true},
    const {'1': 'ctwaClid', '3': 13, '4': 1, '5': 9, '9': 12, '10': 'ctwaClid', '17': true},
    const {'1': 'ref', '3': 14, '4': 1, '5': 9, '9': 13, '10': 'ref', '17': true},
    const {'1': 'clickToWhatsappCall', '3': 15, '4': 1, '5': 8, '9': 14, '10': 'clickToWhatsappCall', '17': true},
    const {'1': 'adContextPreviewDismissed', '3': 16, '4': 1, '5': 8, '9': 15, '10': 'adContextPreviewDismissed', '17': true},
    const {'1': 'sourceApp', '3': 17, '4': 1, '5': 9, '9': 16, '10': 'sourceApp', '17': true},
    const {'1': 'automatedGreetingMessageShown', '3': 18, '4': 1, '5': 8, '9': 17, '10': 'automatedGreetingMessageShown', '17': true},
    const {'1': 'greetingMessageBody', '3': 19, '4': 1, '5': 9, '9': 18, '10': 'greetingMessageBody', '17': true},
    const {'1': 'ctaPayload', '3': 20, '4': 1, '5': 9, '9': 19, '10': 'ctaPayload', '17': true},
    const {'1': 'disableNudge', '3': 21, '4': 1, '5': 8, '9': 20, '10': 'disableNudge', '17': true},
    const {'1': 'originalImageUrl', '3': 22, '4': 1, '5': 9, '9': 21, '10': 'originalImageUrl', '17': true},
    const {'1': 'automatedGreetingMessageCtaType', '3': 23, '4': 1, '5': 9, '9': 22, '10': 'automatedGreetingMessageCtaType', '17': true},
    const {'1': 'wtwaAdFormat', '3': 24, '4': 1, '5': 8, '9': 23, '10': 'wtwaAdFormat', '17': true},
    const {'1': 'adType', '3': 25, '4': 1, '5': 14, '6': '.proto.ContextInfo.ExternalAdReplyInfo.AdType', '9': 24, '10': 'adType', '17': true},
    const {'1': 'wtwaWebsiteUrl', '3': 26, '4': 1, '5': 9, '9': 25, '10': 'wtwaWebsiteUrl', '17': true},
    const {'1': 'adPreviewUrl', '3': 27, '4': 1, '5': 9, '9': 26, '10': 'adPreviewUrl', '17': true},
  ],
  '4': const [ContextInfo_ExternalAdReplyInfo_AdType$json, ContextInfo_ExternalAdReplyInfo_MediaType$json],
  '8': const [
    const {'1': '_title'},
    const {'1': '_body'},
    const {'1': '_mediaType'},
    const {'1': '_thumbnailUrl'},
    const {'1': '_mediaUrl'},
    const {'1': '_thumbnail'},
    const {'1': '_sourceType'},
    const {'1': '_sourceId'},
    const {'1': '_sourceUrl'},
    const {'1': '_containsAutoReply'},
    const {'1': '_renderLargerThumbnail'},
    const {'1': '_showAdAttribution'},
    const {'1': '_ctwaClid'},
    const {'1': '_ref'},
    const {'1': '_clickToWhatsappCall'},
    const {'1': '_adContextPreviewDismissed'},
    const {'1': '_sourceApp'},
    const {'1': '_automatedGreetingMessageShown'},
    const {'1': '_greetingMessageBody'},
    const {'1': '_ctaPayload'},
    const {'1': '_disableNudge'},
    const {'1': '_originalImageUrl'},
    const {'1': '_automatedGreetingMessageCtaType'},
    const {'1': '_wtwaAdFormat'},
    const {'1': '_adType'},
    const {'1': '_wtwaWebsiteUrl'},
    const {'1': '_adPreviewUrl'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_ExternalAdReplyInfo_AdType$json = const {
  '1': 'AdType',
  '2': const [
    const {'1': 'CTWA', '2': 0},
    const {'1': 'CAWC', '2': 1},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_ExternalAdReplyInfo_MediaType$json = const {
  '1': 'MediaType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'IMAGE', '2': 1},
    const {'1': 'VIDEO', '2': 2},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_FeatureEligibilities$json = const {
  '1': 'FeatureEligibilities',
  '2': const [
    const {'1': 'cannotBeReactedTo', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'cannotBeReactedTo', '17': true},
    const {'1': 'cannotBeRanked', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'cannotBeRanked', '17': true},
    const {'1': 'canRequestFeedback', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'canRequestFeedback', '17': true},
    const {'1': 'canBeReshared', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'canBeReshared', '17': true},
    const {'1': 'canReceiveMultiReact', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'canReceiveMultiReact', '17': true},
  ],
  '8': const [
    const {'1': '_cannotBeReactedTo'},
    const {'1': '_cannotBeRanked'},
    const {'1': '_canRequestFeedback'},
    const {'1': '_canBeReshared'},
    const {'1': '_canReceiveMultiReact'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_ForwardedNewsletterMessageInfo$json = const {
  '1': 'ForwardedNewsletterMessageInfo',
  '2': const [
    const {'1': 'newsletterJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'newsletterJid', '17': true},
    const {'1': 'serverMessageId', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'serverMessageId', '17': true},
    const {'1': 'newsletterName', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'newsletterName', '17': true},
    const {'1': 'contentType', '3': 4, '4': 1, '5': 14, '6': '.proto.ContextInfo.ForwardedNewsletterMessageInfo.ContentType', '9': 3, '10': 'contentType', '17': true},
    const {'1': 'accessibilityText', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'accessibilityText', '17': true},
  ],
  '4': const [ContextInfo_ForwardedNewsletterMessageInfo_ContentType$json],
  '8': const [
    const {'1': '_newsletterJid'},
    const {'1': '_serverMessageId'},
    const {'1': '_newsletterName'},
    const {'1': '_contentType'},
    const {'1': '_accessibilityText'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_ForwardedNewsletterMessageInfo_ContentType$json = const {
  '1': 'ContentType',
  '2': const [
    const {'1': 'UNKNOWN_CONTENTTYPE_ZERO', '2': 0},
    const {'1': 'UPDATE', '2': 1},
    const {'1': 'UPDATE_CARD', '2': 2},
    const {'1': 'LINK_CARD', '2': 3},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_QuestionReplyQuotedMessage$json = const {
  '1': 'QuestionReplyQuotedMessage',
  '2': const [
    const {'1': 'serverQuestionId', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'serverQuestionId', '17': true},
    const {'1': 'quotedQuestion', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 1, '10': 'quotedQuestion', '17': true},
    const {'1': 'quotedResponse', '3': 3, '4': 1, '5': 11, '6': '.proto.Message', '9': 2, '10': 'quotedResponse', '17': true},
  ],
  '8': const [
    const {'1': '_serverQuestionId'},
    const {'1': '_quotedQuestion'},
    const {'1': '_quotedResponse'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_StatusAudienceMetadata$json = const {
  '1': 'StatusAudienceMetadata',
  '2': const [
    const {'1': 'audienceType', '3': 1, '4': 1, '5': 14, '6': '.proto.ContextInfo.StatusAudienceMetadata.AudienceType', '9': 0, '10': 'audienceType', '17': true},
  ],
  '4': const [ContextInfo_StatusAudienceMetadata_AudienceType$json],
  '8': const [
    const {'1': '_audienceType'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_StatusAudienceMetadata_AudienceType$json = const {
  '1': 'AudienceType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CLOSE_FRIENDS', '2': 1},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_UTMInfo$json = const {
  '1': 'UTMInfo',
  '2': const [
    const {'1': 'utmSource', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'utmSource', '17': true},
    const {'1': 'utmCampaign', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'utmCampaign', '17': true},
  ],
  '8': const [
    const {'1': '_utmSource'},
    const {'1': '_utmCampaign'},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_ForwardOrigin$json = const {
  '1': 'ForwardOrigin',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CHAT', '2': 1},
    const {'1': 'STATUS', '2': 2},
    const {'1': 'CHANNELS', '2': 3},
    const {'1': 'META_AI', '2': 4},
    const {'1': 'UGC', '2': 5},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_PairedMediaType$json = const {
  '1': 'PairedMediaType',
  '2': const [
    const {'1': 'NOT_PAIRED_MEDIA', '2': 0},
    const {'1': 'SD_VIDEO_PARENT', '2': 1},
    const {'1': 'HD_VIDEO_CHILD', '2': 2},
    const {'1': 'SD_IMAGE_PARENT', '2': 3},
    const {'1': 'HD_IMAGE_CHILD', '2': 4},
    const {'1': 'MOTION_PHOTO_PARENT', '2': 5},
    const {'1': 'MOTION_PHOTO_CHILD', '2': 6},
    const {'1': 'HEVC_VIDEO_PARENT', '2': 7},
    const {'1': 'HEVC_VIDEO_CHILD', '2': 8},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_QuotedType$json = const {
  '1': 'QuotedType',
  '2': const [
    const {'1': 'EXPLICIT', '2': 0},
    const {'1': 'AUTO', '2': 1},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_StatusAttributionType$json = const {
  '1': 'StatusAttributionType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'RESHARED_FROM_MENTION', '2': 1},
    const {'1': 'RESHARED_FROM_POST', '2': 2},
    const {'1': 'RESHARED_FROM_POST_MANY_TIMES', '2': 3},
    const {'1': 'FORWARDED_FROM_STATUS', '2': 4},
  ],
};

@$core.Deprecated('Use contextInfoDescriptor instead')
const ContextInfo_StatusSourceType$json = const {
  '1': 'StatusSourceType',
  '2': const [
    const {'1': 'IMAGE', '2': 0},
    const {'1': 'VIDEO', '2': 1},
    const {'1': 'GIF', '2': 2},
    const {'1': 'AUDIO', '2': 3},
    const {'1': 'TEXT', '2': 4},
    const {'1': 'MUSIC_STANDALONE', '2': 5},
  ],
};

/// Descriptor for `ContextInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contextInfoDescriptor = $convert.base64Decode('CgtDb250ZXh0SW5mbxIfCghzdGFuemFJZBgBIAEoCUgAUghzdGFuemFJZIgBARIlCgtwYXJ0aWNpcGFudBgCIAEoCUgBUgtwYXJ0aWNpcGFudIgBARI5Cg1xdW90ZWRNZXNzYWdlGAMgASgLMg4ucHJvdG8uTWVzc2FnZUgCUg1xdW90ZWRNZXNzYWdliAEBEiEKCXJlbW90ZUppZBgEIAEoCUgDUglyZW1vdGVKaWSIAQESIgoMbWVudGlvbmVkSmlkGA8gAygJUgxtZW50aW9uZWRKaWQSLwoQY29udmVyc2lvblNvdXJjZRgSIAEoCUgEUhBjb252ZXJzaW9uU291cmNliAEBEisKDmNvbnZlcnNpb25EYXRhGBMgASgMSAVSDmNvbnZlcnNpb25EYXRhiAEBEjsKFmNvbnZlcnNpb25EZWxheVNlY29uZHMYFCABKA1IBlIWY29udmVyc2lvbkRlbGF5U2Vjb25kc4gBARItCg9mb3J3YXJkaW5nU2NvcmUYFSABKA1IB1IPZm9yd2FyZGluZ1Njb3JliAEBEiUKC2lzRm9yd2FyZGVkGBYgASgISAhSC2lzRm9yd2FyZGVkiAEBEj8KCHF1b3RlZEFkGBcgASgLMh4ucHJvdG8uQ29udGV4dEluZm8uQWRSZXBseUluZm9ICVIIcXVvdGVkQWSIAQESPgoOcGxhY2Vob2xkZXJLZXkYGCABKAsyES5wcm90by5NZXNzYWdlS2V5SApSDnBsYWNlaG9sZGVyS2V5iAEBEiMKCmV4cGlyYXRpb24YGSABKA1IC1IKZXhwaXJhdGlvbogBARJBChllcGhlbWVyYWxTZXR0aW5nVGltZXN0YW1wGBogASgDSAxSGWVwaGVtZXJhbFNldHRpbmdUaW1lc3RhbXCIAQESOQoVZXBoZW1lcmFsU2hhcmVkU2VjcmV0GBsgASgMSA1SFWVwaGVtZXJhbFNoYXJlZFNlY3JldIgBARJVCg9leHRlcm5hbEFkUmVwbHkYHCABKAsyJi5wcm90by5Db250ZXh0SW5mby5FeHRlcm5hbEFkUmVwbHlJbmZvSA5SD2V4dGVybmFsQWRSZXBseYgBARJDChplbnRyeVBvaW50Q29udmVyc2lvblNvdXJjZRgdIAEoCUgPUhplbnRyeVBvaW50Q29udmVyc2lvblNvdXJjZYgBARI9ChdlbnRyeVBvaW50Q29udmVyc2lvbkFwcBgeIAEoCUgQUhdlbnRyeVBvaW50Q29udmVyc2lvbkFwcIgBARJPCiBlbnRyeVBvaW50Q29udmVyc2lvbkRlbGF5U2Vjb25kcxgfIAEoDUgRUiBlbnRyeVBvaW50Q29udmVyc2lvbkRlbGF5U2Vjb25kc4gBARJIChBkaXNhcHBlYXJpbmdNb2RlGCAgASgLMhcucHJvdG8uRGlzYXBwZWFyaW5nTW9kZUgSUhBkaXNhcHBlYXJpbmdNb2RliAEBEjYKCmFjdGlvbkxpbmsYISABKAsyES5wcm90by5BY3Rpb25MaW5rSBNSCmFjdGlvbkxpbmuIAQESJwoMZ3JvdXBTdWJqZWN0GCIgASgJSBRSDGdyb3VwU3ViamVjdIgBARIrCg5wYXJlbnRHcm91cEppZBgjIAEoCUgVUg5wYXJlbnRHcm91cEppZIgBARItCg90cnVzdEJhbm5lclR5cGUYJSABKAlIFlIPdHJ1c3RCYW5uZXJUeXBliAEBEjEKEXRydXN0QmFubmVyQWN0aW9uGCYgASgNSBdSEXRydXN0QmFubmVyQWN0aW9uiAEBEiEKCWlzU2FtcGxlZBgnIAEoCEgYUglpc1NhbXBsZWSIAQESOQoNZ3JvdXBNZW50aW9ucxgoIAMoCzITLnByb3RvLkdyb3VwTWVudGlvblINZ3JvdXBNZW50aW9ucxIxCgN1dG0YKSABKAsyGi5wcm90by5Db250ZXh0SW5mby5VVE1JbmZvSBlSA3V0bYgBARJ+Ch5mb3J3YXJkZWROZXdzbGV0dGVyTWVzc2FnZUluZm8YKyABKAsyMS5wcm90by5Db250ZXh0SW5mby5Gb3J3YXJkZWROZXdzbGV0dGVyTWVzc2FnZUluZm9IGlIeZm9yd2FyZGVkTmV3c2xldHRlck1lc3NhZ2VJbmZviAEBEnIKGmJ1c2luZXNzTWVzc2FnZUZvcndhcmRJbmZvGCwgASgLMi0ucHJvdG8uQ29udGV4dEluZm8uQnVzaW5lc3NNZXNzYWdlRm9yd2FyZEluZm9IG1IaYnVzaW5lc3NNZXNzYWdlRm9yd2FyZEluZm+IAQESNQoTc21iQ2xpZW50Q2FtcGFpZ25JZBgtIAEoCUgcUhNzbWJDbGllbnRDYW1wYWlnbklkiAEBEjUKE3NtYlNlcnZlckNhbXBhaWduSWQYLiABKAlIHVITc21iU2VydmVyQ2FtcGFpZ25JZIgBARJaChJkYXRhU2hhcmluZ0NvbnRleHQYLyABKAsyJS5wcm90by5Db250ZXh0SW5mby5EYXRhU2hhcmluZ0NvbnRleHRIHlISZGF0YVNoYXJpbmdDb250ZXh0iAEBEj0KF2Fsd2F5c1Nob3dBZEF0dHJpYnV0aW9uGDAgASgISB9SF2Fsd2F5c1Nob3dBZEF0dHJpYnV0aW9uiAEBEmAKFGZlYXR1cmVFbGlnaWJpbGl0aWVzGDEgASgLMicucHJvdG8uQ29udGV4dEluZm8uRmVhdHVyZUVsaWdpYmlsaXRpZXNIIFIUZmVhdHVyZUVsaWdpYmlsaXRpZXOIAQESUwoiZW50cnlQb2ludENvbnZlcnNpb25FeHRlcm5hbFNvdXJjZRgyIAEoCUghUiJlbnRyeVBvaW50Q29udmVyc2lvbkV4dGVybmFsU291cmNliAEBElMKImVudHJ5UG9pbnRDb252ZXJzaW9uRXh0ZXJuYWxNZWRpdW0YMyABKAlIIlIiZW50cnlQb2ludENvbnZlcnNpb25FeHRlcm5hbE1lZGl1bYgBARIlCgtjdHdhU2lnbmFscxg2IAEoCUgjUgtjdHdhU2lnbmFsc4gBARIlCgtjdHdhUGF5bG9hZBg3IAEoDEgkUgtjdHdhUGF5bG9hZIgBARJjChlmb3J3YXJkZWRBaUJvdE1lc3NhZ2VJbmZvGDggASgLMiAucHJvdG8uRm9yd2FyZGVkQUlCb3RNZXNzYWdlSW5mb0glUhlmb3J3YXJkZWRBaUJvdE1lc3NhZ2VJbmZviAEBEmMKFXN0YXR1c0F0dHJpYnV0aW9uVHlwZRg5IAEoDjIoLnByb3RvLkNvbnRleHRJbmZvLlN0YXR1c0F0dHJpYnV0aW9uVHlwZUgmUhVzdGF0dXNBdHRyaWJ1dGlvblR5cGWIAQESQgoOdXJsVHJhY2tpbmdNYXAYOiABKAsyFS5wcm90by5VcmxUcmFja2luZ01hcEgnUg51cmxUcmFja2luZ01hcIgBARJRCg9wYWlyZWRNZWRpYVR5cGUYOyABKA4yIi5wcm90by5Db250ZXh0SW5mby5QYWlyZWRNZWRpYVR5cGVIKFIPcGFpcmVkTWVkaWFUeXBliAEBEisKDnJhbmtpbmdWZXJzaW9uGDwgASgNSClSDnJhbmtpbmdWZXJzaW9uiAEBEjkKC21lbWJlckxhYmVsGD4gASgLMhIucHJvdG8uTWVtYmVyTGFiZWxIKlILbWVtYmVyTGFiZWyIAQESIwoKaXNRdWVzdGlvbhg/IAEoCEgrUgppc1F1ZXN0aW9uiAEBElQKEHN0YXR1c1NvdXJjZVR5cGUYQCABKA4yIy5wcm90by5Db250ZXh0SW5mby5TdGF0dXNTb3VyY2VUeXBlSCxSEHN0YXR1c1NvdXJjZVR5cGWIAQESSAoSc3RhdHVzQXR0cmlidXRpb25zGEEgAygLMhgucHJvdG8uU3RhdHVzQXR0cmlidXRpb25SEnN0YXR1c0F0dHJpYnV0aW9ucxIpCg1pc0dyb3VwU3RhdHVzGEIgASgISC1SDWlzR3JvdXBTdGF0dXOIAQESSwoNZm9yd2FyZE9yaWdpbhhDIAEoDjIgLnByb3RvLkNvbnRleHRJbmZvLkZvcndhcmRPcmlnaW5ILlINZm9yd2FyZE9yaWdpbogBARJyChpxdWVzdGlvblJlcGx5UXVvdGVkTWVzc2FnZRhEIAEoCzItLnByb3RvLkNvbnRleHRJbmZvLlF1ZXN0aW9uUmVwbHlRdW90ZWRNZXNzYWdlSC9SGnF1ZXN0aW9uUmVwbHlRdW90ZWRNZXNzYWdliAEBEmYKFnN0YXR1c0F1ZGllbmNlTWV0YWRhdGEYRSABKAsyKS5wcm90by5Db250ZXh0SW5mby5TdGF0dXNBdWRpZW5jZU1ldGFkYXRhSDBSFnN0YXR1c0F1ZGllbmNlTWV0YWRhdGGIAQESKwoObm9uSmlkTWVudGlvbnMYRiABKA1IMVIObm9uSmlkTWVudGlvbnOIAQESQgoKcXVvdGVkVHlwZRhHIAEoDjIdLnByb3RvLkNvbnRleHRJbmZvLlF1b3RlZFR5cGVIMlIKcXVvdGVkVHlwZYgBARJXChVib3RNZXNzYWdlU2hhcmluZ0luZm8YSCABKAsyHC5wcm90by5Cb3RNZXNzYWdlU2hhcmluZ0luZm9IM1IVYm90TWVzc2FnZVNoYXJpbmdJbmZviAEBGr0CCgtBZFJlcGx5SW5mbxIrCg5hZHZlcnRpc2VyTmFtZRgBIAEoCUgAUg5hZHZlcnRpc2VyTmFtZYgBARJLCgltZWRpYVR5cGUYAiABKA4yKC5wcm90by5Db250ZXh0SW5mby5BZFJlcGx5SW5mby5NZWRpYVR5cGVIAVIJbWVkaWFUeXBliAEBEikKDWpwZWdUaHVtYm5haWwYECABKAxIAlINanBlZ1RodW1ibmFpbIgBARIdCgdjYXB0aW9uGBEgASgJSANSB2NhcHRpb26IAQEiKwoJTWVkaWFUeXBlEggKBE5PTkUQABIJCgVJTUFHRRABEgkKBVZJREVPEAJCEQoPX2FkdmVydGlzZXJOYW1lQgwKCl9tZWRpYVR5cGVCEAoOX2pwZWdUaHVtYm5haWxCCgoIX2NhcHRpb24aYgoaQnVzaW5lc3NNZXNzYWdlRm9yd2FyZEluZm8SLwoQYnVzaW5lc3NPd25lckppZBgBIAEoCUgAUhBidXNpbmVzc093bmVySmlkiAEBQhMKEV9idXNpbmVzc093bmVySmlkGvUFChJEYXRhU2hhcmluZ0NvbnRleHQSLwoQc2hvd01tRGlzY2xvc3VyZRgBIAEoCEgAUhBzaG93TW1EaXNjbG9zdXJliAEBEkkKHWVuY3J5cHRlZFNpZ25hbFRva2VuQ29uc2VudGVkGAIgASgJSAFSHWVuY3J5cHRlZFNpZ25hbFRva2VuQ29uc2VudGVkiAEBElAKCnBhcmFtZXRlcnMYAyADKAsyMC5wcm90by5Db250ZXh0SW5mby5EYXRhU2hhcmluZ0NvbnRleHQuUGFyYW1ldGVyc1IKcGFyYW1ldGVycxIvChBkYXRhU2hhcmluZ0ZsYWdzGAQgASgFSAJSEGRhdGFTaGFyaW5nRmxhZ3OIAQEamwIKClBhcmFtZXRlcnMSFQoDa2V5GAEgASgJSABSA2tleYgBARIjCgpzdHJpbmdEYXRhGAIgASgJSAFSCnN0cmluZ0RhdGGIAQESHQoHaW50RGF0YRgDIAEoA0gCUgdpbnREYXRhiAEBEiEKCWZsb2F0RGF0YRgEIAEoAkgDUglmbG9hdERhdGGIAQESUQoIY29udGVudHMYBSABKAsyMC5wcm90by5Db250ZXh0SW5mby5EYXRhU2hhcmluZ0NvbnRleHQuUGFyYW1ldGVyc0gEUghjb250ZW50c4gBAUIGCgRfa2V5Qg0KC19zdHJpbmdEYXRhQgoKCF9pbnREYXRhQgwKCl9mbG9hdERhdGFCCwoJX2NvbnRlbnRzInYKEERhdGFTaGFyaW5nRmxhZ3MSIQodVU5LTk9XTl9EQVRBU0hBUklOR0ZMQUdTX1pFUk8QABIfChtTSE9XX01NX0RJU0NMT1NVUkVfT05fQ0xJQ0sQARIeChpTSE9XX01NX0RJU0NMT1NVUkVfT05fUkVBRBACQhMKEV9zaG93TW1EaXNjbG9zdXJlQiAKHl9lbmNyeXB0ZWRTaWduYWxUb2tlbkNvbnNlbnRlZEITChFfZGF0YVNoYXJpbmdGbGFncxq5DgoTRXh0ZXJuYWxBZFJlcGx5SW5mbxIZCgV0aXRsZRgBIAEoCUgAUgV0aXRsZYgBARIXCgRib2R5GAIgASgJSAFSBGJvZHmIAQESUwoJbWVkaWFUeXBlGAMgASgOMjAucHJvdG8uQ29udGV4dEluZm8uRXh0ZXJuYWxBZFJlcGx5SW5mby5NZWRpYVR5cGVIAlIJbWVkaWFUeXBliAEBEicKDHRodW1ibmFpbFVybBgEIAEoCUgDUgx0aHVtYm5haWxVcmyIAQESHwoIbWVkaWFVcmwYBSABKAlIBFIIbWVkaWFVcmyIAQESIQoJdGh1bWJuYWlsGAYgASgMSAVSCXRodW1ibmFpbIgBARIjCgpzb3VyY2VUeXBlGAcgASgJSAZSCnNvdXJjZVR5cGWIAQESHwoIc291cmNlSWQYCCABKAlIB1IIc291cmNlSWSIAQESIQoJc291cmNlVXJsGAkgASgJSAhSCXNvdXJjZVVybIgBARIxChFjb250YWluc0F1dG9SZXBseRgKIAEoCEgJUhFjb250YWluc0F1dG9SZXBseYgBARI5ChVyZW5kZXJMYXJnZXJUaHVtYm5haWwYCyABKAhIClIVcmVuZGVyTGFyZ2VyVGh1bWJuYWlsiAEBEjEKEXNob3dBZEF0dHJpYnV0aW9uGAwgASgISAtSEXNob3dBZEF0dHJpYnV0aW9uiAEBEh8KCGN0d2FDbGlkGA0gASgJSAxSCGN0d2FDbGlkiAEBEhUKA3JlZhgOIAEoCUgNUgNyZWaIAQESNQoTY2xpY2tUb1doYXRzYXBwQ2FsbBgPIAEoCEgOUhNjbGlja1RvV2hhdHNhcHBDYWxsiAEBEkEKGWFkQ29udGV4dFByZXZpZXdEaXNtaXNzZWQYECABKAhID1IZYWRDb250ZXh0UHJldmlld0Rpc21pc3NlZIgBARIhCglzb3VyY2VBcHAYESABKAlIEFIJc291cmNlQXBwiAEBEkkKHWF1dG9tYXRlZEdyZWV0aW5nTWVzc2FnZVNob3duGBIgASgISBFSHWF1dG9tYXRlZEdyZWV0aW5nTWVzc2FnZVNob3duiAEBEjUKE2dyZWV0aW5nTWVzc2FnZUJvZHkYEyABKAlIElITZ3JlZXRpbmdNZXNzYWdlQm9keYgBARIjCgpjdGFQYXlsb2FkGBQgASgJSBNSCmN0YVBheWxvYWSIAQESJwoMZGlzYWJsZU51ZGdlGBUgASgISBRSDGRpc2FibGVOdWRnZYgBARIvChBvcmlnaW5hbEltYWdlVXJsGBYgASgJSBVSEG9yaWdpbmFsSW1hZ2VVcmyIAQESTQofYXV0b21hdGVkR3JlZXRpbmdNZXNzYWdlQ3RhVHlwZRgXIAEoCUgWUh9hdXRvbWF0ZWRHcmVldGluZ01lc3NhZ2VDdGFUeXBliAEBEicKDHd0d2FBZEZvcm1hdBgYIAEoCEgXUgx3dHdhQWRGb3JtYXSIAQESSgoGYWRUeXBlGBkgASgOMi0ucHJvdG8uQ29udGV4dEluZm8uRXh0ZXJuYWxBZFJlcGx5SW5mby5BZFR5cGVIGFIGYWRUeXBliAEBEisKDnd0d2FXZWJzaXRlVXJsGBogASgJSBlSDnd0d2FXZWJzaXRlVXJsiAEBEicKDGFkUHJldmlld1VybBgbIAEoCUgaUgxhZFByZXZpZXdVcmyIAQEiHAoGQWRUeXBlEggKBENUV0EQABIICgRDQVdDEAEiKwoJTWVkaWFUeXBlEggKBE5PTkUQABIJCgVJTUFHRRABEgkKBVZJREVPEAJCCAoGX3RpdGxlQgcKBV9ib2R5QgwKCl9tZWRpYVR5cGVCDwoNX3RodW1ibmFpbFVybEILCglfbWVkaWFVcmxCDAoKX3RodW1ibmFpbEINCgtfc291cmNlVHlwZUILCglfc291cmNlSWRCDAoKX3NvdXJjZVVybEIUChJfY29udGFpbnNBdXRvUmVwbHlCGAoWX3JlbmRlckxhcmdlclRodW1ibmFpbEIUChJfc2hvd0FkQXR0cmlidXRpb25CCwoJX2N0d2FDbGlkQgYKBF9yZWZCFgoUX2NsaWNrVG9XaGF0c2FwcENhbGxCHAoaX2FkQ29udGV4dFByZXZpZXdEaXNtaXNzZWRCDAoKX3NvdXJjZUFwcEIgCh5fYXV0b21hdGVkR3JlZXRpbmdNZXNzYWdlU2hvd25CFgoUX2dyZWV0aW5nTWVzc2FnZUJvZHlCDQoLX2N0YVBheWxvYWRCDwoNX2Rpc2FibGVOdWRnZUITChFfb3JpZ2luYWxJbWFnZVVybEIiCiBfYXV0b21hdGVkR3JlZXRpbmdNZXNzYWdlQ3RhVHlwZUIPCg1fd3R3YUFkRm9ybWF0QgkKB19hZFR5cGVCEQoPX3d0d2FXZWJzaXRlVXJsQg8KDV9hZFByZXZpZXdVcmwa+gIKFEZlYXR1cmVFbGlnaWJpbGl0aWVzEjEKEWNhbm5vdEJlUmVhY3RlZFRvGAEgASgISABSEWNhbm5vdEJlUmVhY3RlZFRviAEBEisKDmNhbm5vdEJlUmFua2VkGAIgASgISAFSDmNhbm5vdEJlUmFua2VkiAEBEjMKEmNhblJlcXVlc3RGZWVkYmFjaxgDIAEoCEgCUhJjYW5SZXF1ZXN0RmVlZGJhY2uIAQESKQoNY2FuQmVSZXNoYXJlZBgEIAEoCEgDUg1jYW5CZVJlc2hhcmVkiAEBEjcKFGNhblJlY2VpdmVNdWx0aVJlYWN0GAUgASgISARSFGNhblJlY2VpdmVNdWx0aVJlYWN0iAEBQhQKEl9jYW5ub3RCZVJlYWN0ZWRUb0IRCg9fY2Fubm90QmVSYW5rZWRCFQoTX2NhblJlcXVlc3RGZWVkYmFja0IQCg5fY2FuQmVSZXNoYXJlZEIXChVfY2FuUmVjZWl2ZU11bHRpUmVhY3Qa+AMKHkZvcndhcmRlZE5ld3NsZXR0ZXJNZXNzYWdlSW5mbxIpCg1uZXdzbGV0dGVySmlkGAEgASgJSABSDW5ld3NsZXR0ZXJKaWSIAQESLQoPc2VydmVyTWVzc2FnZUlkGAIgASgFSAFSD3NlcnZlck1lc3NhZ2VJZIgBARIrCg5uZXdzbGV0dGVyTmFtZRgDIAEoCUgCUg5uZXdzbGV0dGVyTmFtZYgBARJkCgtjb250ZW50VHlwZRgEIAEoDjI9LnByb3RvLkNvbnRleHRJbmZvLkZvcndhcmRlZE5ld3NsZXR0ZXJNZXNzYWdlSW5mby5Db250ZW50VHlwZUgDUgtjb250ZW50VHlwZYgBARIxChFhY2Nlc3NpYmlsaXR5VGV4dBgFIAEoCUgEUhFhY2Nlc3NpYmlsaXR5VGV4dIgBASJXCgtDb250ZW50VHlwZRIcChhVTktOT1dOX0NPTlRFTlRUWVBFX1pFUk8QABIKCgZVUERBVEUQARIPCgtVUERBVEVfQ0FSRBACEg0KCUxJTktfQ0FSRBADQhAKDl9uZXdzbGV0dGVySmlkQhIKEF9zZXJ2ZXJNZXNzYWdlSWRCEQoPX25ld3NsZXR0ZXJOYW1lQg4KDF9jb250ZW50VHlwZUIUChJfYWNjZXNzaWJpbGl0eVRleHQaggIKGlF1ZXN0aW9uUmVwbHlRdW90ZWRNZXNzYWdlEi8KEHNlcnZlclF1ZXN0aW9uSWQYASABKAVIAFIQc2VydmVyUXVlc3Rpb25JZIgBARI7Cg5xdW90ZWRRdWVzdGlvbhgCIAEoCzIOLnByb3RvLk1lc3NhZ2VIAVIOcXVvdGVkUXVlc3Rpb26IAQESOwoOcXVvdGVkUmVzcG9uc2UYAyABKAsyDi5wcm90by5NZXNzYWdlSAJSDnF1b3RlZFJlc3BvbnNliAEBQhMKEV9zZXJ2ZXJRdWVzdGlvbklkQhEKD19xdW90ZWRRdWVzdGlvbkIRCg9fcXVvdGVkUmVzcG9uc2UaugEKFlN0YXR1c0F1ZGllbmNlTWV0YWRhdGESXwoMYXVkaWVuY2VUeXBlGAEgASgOMjYucHJvdG8uQ29udGV4dEluZm8uU3RhdHVzQXVkaWVuY2VNZXRhZGF0YS5BdWRpZW5jZVR5cGVIAFIMYXVkaWVuY2VUeXBliAEBIi4KDEF1ZGllbmNlVHlwZRILCgdVTktOT1dOEAASEQoNQ0xPU0VfRlJJRU5EUxABQg8KDV9hdWRpZW5jZVR5cGUacQoHVVRNSW5mbxIhCgl1dG1Tb3VyY2UYASABKAlIAFIJdXRtU291cmNliAEBEiUKC3V0bUNhbXBhaWduGAIgASgJSAFSC3V0bUNhbXBhaWduiAEBQgwKCl91dG1Tb3VyY2VCDgoMX3V0bUNhbXBhaWduIlYKDUZvcndhcmRPcmlnaW4SCwoHVU5LTk9XThAAEggKBENIQVQQARIKCgZTVEFUVVMQAhIMCghDSEFOTkVMUxADEgsKB01FVEFfQUkQBBIHCgNVR0MQBSLXAQoPUGFpcmVkTWVkaWFUeXBlEhQKEE5PVF9QQUlSRURfTUVESUEQABITCg9TRF9WSURFT19QQVJFTlQQARISCg5IRF9WSURFT19DSElMRBACEhMKD1NEX0lNQUdFX1BBUkVOVBADEhIKDkhEX0lNQUdFX0NISUxEEAQSFwoTTU9USU9OX1BIT1RPX1BBUkVOVBAFEhYKEk1PVElPTl9QSE9UT19DSElMRBAGEhUKEUhFVkNfVklERU9fUEFSRU5UEAcSFAoQSEVWQ19WSURFT19DSElMRBAIIiQKClF1b3RlZFR5cGUSDAoIRVhQTElDSVQQABIICgRBVVRPEAEikgEKFVN0YXR1c0F0dHJpYnV0aW9uVHlwZRIICgROT05FEAASGQoVUkVTSEFSRURfRlJPTV9NRU5USU9OEAESFgoSUkVTSEFSRURfRlJPTV9QT1NUEAISIQodUkVTSEFSRURfRlJPTV9QT1NUX01BTllfVElNRVMQAxIZChVGT1JXQVJERURfRlJPTV9TVEFUVVMQBCJcChBTdGF0dXNTb3VyY2VUeXBlEgkKBUlNQUdFEAASCQoFVklERU8QARIHCgNHSUYQAhIJCgVBVURJTxADEggKBFRFWFQQBBIUChBNVVNJQ19TVEFOREFMT05FEAVCCwoJX3N0YW56YUlkQg4KDF9wYXJ0aWNpcGFudEIQCg5fcXVvdGVkTWVzc2FnZUIMCgpfcmVtb3RlSmlkQhMKEV9jb252ZXJzaW9uU291cmNlQhEKD19jb252ZXJzaW9uRGF0YUIZChdfY29udmVyc2lvbkRlbGF5U2Vjb25kc0ISChBfZm9yd2FyZGluZ1Njb3JlQg4KDF9pc0ZvcndhcmRlZEILCglfcXVvdGVkQWRCEQoPX3BsYWNlaG9sZGVyS2V5Qg0KC19leHBpcmF0aW9uQhwKGl9lcGhlbWVyYWxTZXR0aW5nVGltZXN0YW1wQhgKFl9lcGhlbWVyYWxTaGFyZWRTZWNyZXRCEgoQX2V4dGVybmFsQWRSZXBseUIdChtfZW50cnlQb2ludENvbnZlcnNpb25Tb3VyY2VCGgoYX2VudHJ5UG9pbnRDb252ZXJzaW9uQXBwQiMKIV9lbnRyeVBvaW50Q29udmVyc2lvbkRlbGF5U2Vjb25kc0ITChFfZGlzYXBwZWFyaW5nTW9kZUINCgtfYWN0aW9uTGlua0IPCg1fZ3JvdXBTdWJqZWN0QhEKD19wYXJlbnRHcm91cEppZEISChBfdHJ1c3RCYW5uZXJUeXBlQhQKEl90cnVzdEJhbm5lckFjdGlvbkIMCgpfaXNTYW1wbGVkQgYKBF91dG1CIQofX2ZvcndhcmRlZE5ld3NsZXR0ZXJNZXNzYWdlSW5mb0IdChtfYnVzaW5lc3NNZXNzYWdlRm9yd2FyZEluZm9CFgoUX3NtYkNsaWVudENhbXBhaWduSWRCFgoUX3NtYlNlcnZlckNhbXBhaWduSWRCFQoTX2RhdGFTaGFyaW5nQ29udGV4dEIaChhfYWx3YXlzU2hvd0FkQXR0cmlidXRpb25CFwoVX2ZlYXR1cmVFbGlnaWJpbGl0aWVzQiUKI19lbnRyeVBvaW50Q29udmVyc2lvbkV4dGVybmFsU291cmNlQiUKI19lbnRyeVBvaW50Q29udmVyc2lvbkV4dGVybmFsTWVkaXVtQg4KDF9jdHdhU2lnbmFsc0IOCgxfY3R3YVBheWxvYWRCHAoaX2ZvcndhcmRlZEFpQm90TWVzc2FnZUluZm9CGAoWX3N0YXR1c0F0dHJpYnV0aW9uVHlwZUIRCg9fdXJsVHJhY2tpbmdNYXBCEgoQX3BhaXJlZE1lZGlhVHlwZUIRCg9fcmFua2luZ1ZlcnNpb25CDgoMX21lbWJlckxhYmVsQg0KC19pc1F1ZXN0aW9uQhMKEV9zdGF0dXNTb3VyY2VUeXBlQhAKDl9pc0dyb3VwU3RhdHVzQhAKDl9mb3J3YXJkT3JpZ2luQh0KG19xdWVzdGlvblJlcGx5UXVvdGVkTWVzc2FnZUIZChdfc3RhdHVzQXVkaWVuY2VNZXRhZGF0YUIRCg9fbm9uSmlkTWVudGlvbnNCDQoLX3F1b3RlZFR5cGVCGAoWX2JvdE1lc3NhZ2VTaGFyaW5nSW5mbw==');
@$core.Deprecated('Use conversationDescriptor instead')
const Conversation$json = const {
  '1': 'Conversation',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'messages', '3': 2, '4': 3, '5': 11, '6': '.proto.HistorySyncMsg', '10': 'messages'},
    const {'1': 'newJid', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'newJid', '17': true},
    const {'1': 'oldJid', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'oldJid', '17': true},
    const {'1': 'lastMsgTimestamp', '3': 5, '4': 1, '5': 4, '9': 2, '10': 'lastMsgTimestamp', '17': true},
    const {'1': 'unreadCount', '3': 6, '4': 1, '5': 13, '9': 3, '10': 'unreadCount', '17': true},
    const {'1': 'readOnly', '3': 7, '4': 1, '5': 8, '9': 4, '10': 'readOnly', '17': true},
    const {'1': 'endOfHistoryTransfer', '3': 8, '4': 1, '5': 8, '9': 5, '10': 'endOfHistoryTransfer', '17': true},
    const {'1': 'ephemeralExpiration', '3': 9, '4': 1, '5': 13, '9': 6, '10': 'ephemeralExpiration', '17': true},
    const {'1': 'ephemeralSettingTimestamp', '3': 10, '4': 1, '5': 3, '9': 7, '10': 'ephemeralSettingTimestamp', '17': true},
    const {'1': 'endOfHistoryTransferType', '3': 11, '4': 1, '5': 14, '6': '.proto.Conversation.EndOfHistoryTransferType', '9': 8, '10': 'endOfHistoryTransferType', '17': true},
    const {'1': 'conversationTimestamp', '3': 12, '4': 1, '5': 4, '9': 9, '10': 'conversationTimestamp', '17': true},
    const {'1': 'name', '3': 13, '4': 1, '5': 9, '9': 10, '10': 'name', '17': true},
    const {'1': 'pHash', '3': 14, '4': 1, '5': 9, '9': 11, '10': 'pHash', '17': true},
    const {'1': 'notSpam', '3': 15, '4': 1, '5': 8, '9': 12, '10': 'notSpam', '17': true},
    const {'1': 'archived', '3': 16, '4': 1, '5': 8, '9': 13, '10': 'archived', '17': true},
    const {'1': 'disappearingMode', '3': 17, '4': 1, '5': 11, '6': '.proto.DisappearingMode', '9': 14, '10': 'disappearingMode', '17': true},
    const {'1': 'unreadMentionCount', '3': 18, '4': 1, '5': 13, '9': 15, '10': 'unreadMentionCount', '17': true},
    const {'1': 'markedAsUnread', '3': 19, '4': 1, '5': 8, '9': 16, '10': 'markedAsUnread', '17': true},
    const {'1': 'participant', '3': 20, '4': 3, '5': 11, '6': '.proto.GroupParticipant', '10': 'participant'},
    const {'1': 'tcToken', '3': 21, '4': 1, '5': 12, '9': 17, '10': 'tcToken', '17': true},
    const {'1': 'tcTokenTimestamp', '3': 22, '4': 1, '5': 4, '9': 18, '10': 'tcTokenTimestamp', '17': true},
    const {'1': 'contactPrimaryIdentityKey', '3': 23, '4': 1, '5': 12, '9': 19, '10': 'contactPrimaryIdentityKey', '17': true},
    const {'1': 'pinned', '3': 24, '4': 1, '5': 13, '9': 20, '10': 'pinned', '17': true},
    const {'1': 'muteEndTime', '3': 25, '4': 1, '5': 4, '9': 21, '10': 'muteEndTime', '17': true},
    const {'1': 'wallpaper', '3': 26, '4': 1, '5': 11, '6': '.proto.WallpaperSettings', '9': 22, '10': 'wallpaper', '17': true},
    const {'1': 'mediaVisibility', '3': 27, '4': 1, '5': 14, '6': '.proto.MediaVisibility', '9': 23, '10': 'mediaVisibility', '17': true},
    const {'1': 'tcTokenSenderTimestamp', '3': 28, '4': 1, '5': 4, '9': 24, '10': 'tcTokenSenderTimestamp', '17': true},
    const {'1': 'suspended', '3': 29, '4': 1, '5': 8, '9': 25, '10': 'suspended', '17': true},
    const {'1': 'terminated', '3': 30, '4': 1, '5': 8, '9': 26, '10': 'terminated', '17': true},
    const {'1': 'createdAt', '3': 31, '4': 1, '5': 4, '9': 27, '10': 'createdAt', '17': true},
    const {'1': 'createdBy', '3': 32, '4': 1, '5': 9, '9': 28, '10': 'createdBy', '17': true},
    const {'1': 'description', '3': 33, '4': 1, '5': 9, '9': 29, '10': 'description', '17': true},
    const {'1': 'support', '3': 34, '4': 1, '5': 8, '9': 30, '10': 'support', '17': true},
    const {'1': 'isParentGroup', '3': 35, '4': 1, '5': 8, '9': 31, '10': 'isParentGroup', '17': true},
    const {'1': 'parentGroupId', '3': 37, '4': 1, '5': 9, '9': 32, '10': 'parentGroupId', '17': true},
    const {'1': 'isDefaultSubgroup', '3': 36, '4': 1, '5': 8, '9': 33, '10': 'isDefaultSubgroup', '17': true},
    const {'1': 'displayName', '3': 38, '4': 1, '5': 9, '9': 34, '10': 'displayName', '17': true},
    const {'1': 'pnJid', '3': 39, '4': 1, '5': 9, '9': 35, '10': 'pnJid', '17': true},
    const {'1': 'shareOwnPn', '3': 40, '4': 1, '5': 8, '9': 36, '10': 'shareOwnPn', '17': true},
    const {'1': 'pnhDuplicateLidThread', '3': 41, '4': 1, '5': 8, '9': 37, '10': 'pnhDuplicateLidThread', '17': true},
    const {'1': 'lidJid', '3': 42, '4': 1, '5': 9, '9': 38, '10': 'lidJid', '17': true},
    const {'1': 'username', '3': 43, '4': 1, '5': 9, '9': 39, '10': 'username', '17': true},
    const {'1': 'lidOriginType', '3': 44, '4': 1, '5': 9, '9': 40, '10': 'lidOriginType', '17': true},
    const {'1': 'commentsCount', '3': 45, '4': 1, '5': 13, '9': 41, '10': 'commentsCount', '17': true},
    const {'1': 'locked', '3': 46, '4': 1, '5': 8, '9': 42, '10': 'locked', '17': true},
    const {'1': 'systemMessageToInsert', '3': 47, '4': 1, '5': 14, '6': '.proto.PrivacySystemMessage', '9': 43, '10': 'systemMessageToInsert', '17': true},
    const {'1': 'capiCreatedGroup', '3': 48, '4': 1, '5': 8, '9': 44, '10': 'capiCreatedGroup', '17': true},
    const {'1': 'accountLid', '3': 49, '4': 1, '5': 9, '9': 45, '10': 'accountLid', '17': true},
    const {'1': 'limitSharing', '3': 50, '4': 1, '5': 8, '9': 46, '10': 'limitSharing', '17': true},
    const {'1': 'limitSharingSettingTimestamp', '3': 51, '4': 1, '5': 3, '9': 47, '10': 'limitSharingSettingTimestamp', '17': true},
    const {'1': 'limitSharingTrigger', '3': 52, '4': 1, '5': 14, '6': '.proto.LimitSharing.TriggerType', '9': 48, '10': 'limitSharingTrigger', '17': true},
    const {'1': 'limitSharingInitiatedByMe', '3': 53, '4': 1, '5': 8, '9': 49, '10': 'limitSharingInitiatedByMe', '17': true},
    const {'1': 'maibaAiThreadEnabled', '3': 54, '4': 1, '5': 8, '9': 50, '10': 'maibaAiThreadEnabled', '17': true},
  ],
  '4': const [Conversation_EndOfHistoryTransferType$json],
  '8': const [
    const {'1': '_newJid'},
    const {'1': '_oldJid'},
    const {'1': '_lastMsgTimestamp'},
    const {'1': '_unreadCount'},
    const {'1': '_readOnly'},
    const {'1': '_endOfHistoryTransfer'},
    const {'1': '_ephemeralExpiration'},
    const {'1': '_ephemeralSettingTimestamp'},
    const {'1': '_endOfHistoryTransferType'},
    const {'1': '_conversationTimestamp'},
    const {'1': '_name'},
    const {'1': '_pHash'},
    const {'1': '_notSpam'},
    const {'1': '_archived'},
    const {'1': '_disappearingMode'},
    const {'1': '_unreadMentionCount'},
    const {'1': '_markedAsUnread'},
    const {'1': '_tcToken'},
    const {'1': '_tcTokenTimestamp'},
    const {'1': '_contactPrimaryIdentityKey'},
    const {'1': '_pinned'},
    const {'1': '_muteEndTime'},
    const {'1': '_wallpaper'},
    const {'1': '_mediaVisibility'},
    const {'1': '_tcTokenSenderTimestamp'},
    const {'1': '_suspended'},
    const {'1': '_terminated'},
    const {'1': '_createdAt'},
    const {'1': '_createdBy'},
    const {'1': '_description'},
    const {'1': '_support'},
    const {'1': '_isParentGroup'},
    const {'1': '_parentGroupId'},
    const {'1': '_isDefaultSubgroup'},
    const {'1': '_displayName'},
    const {'1': '_pnJid'},
    const {'1': '_shareOwnPn'},
    const {'1': '_pnhDuplicateLidThread'},
    const {'1': '_lidJid'},
    const {'1': '_username'},
    const {'1': '_lidOriginType'},
    const {'1': '_commentsCount'},
    const {'1': '_locked'},
    const {'1': '_systemMessageToInsert'},
    const {'1': '_capiCreatedGroup'},
    const {'1': '_accountLid'},
    const {'1': '_limitSharing'},
    const {'1': '_limitSharingSettingTimestamp'},
    const {'1': '_limitSharingTrigger'},
    const {'1': '_limitSharingInitiatedByMe'},
    const {'1': '_maibaAiThreadEnabled'},
  ],
};

@$core.Deprecated('Use conversationDescriptor instead')
const Conversation_EndOfHistoryTransferType$json = const {
  '1': 'EndOfHistoryTransferType',
  '2': const [
    const {'1': 'COMPLETE_BUT_MORE_MESSAGES_REMAIN_ON_PRIMARY', '2': 0},
    const {'1': 'COMPLETE_AND_NO_MORE_MESSAGE_REMAIN_ON_PRIMARY', '2': 1},
    const {'1': 'COMPLETE_ON_DEMAND_SYNC_BUT_MORE_MSG_REMAIN_ON_PRIMARY', '2': 2},
  ],
};

/// Descriptor for `Conversation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conversationDescriptor = $convert.base64Decode('CgxDb252ZXJzYXRpb24SDgoCaWQYASABKAlSAmlkEjEKCG1lc3NhZ2VzGAIgAygLMhUucHJvdG8uSGlzdG9yeVN5bmNNc2dSCG1lc3NhZ2VzEhsKBm5ld0ppZBgDIAEoCUgAUgZuZXdKaWSIAQESGwoGb2xkSmlkGAQgASgJSAFSBm9sZEppZIgBARIvChBsYXN0TXNnVGltZXN0YW1wGAUgASgESAJSEGxhc3RNc2dUaW1lc3RhbXCIAQESJQoLdW5yZWFkQ291bnQYBiABKA1IA1ILdW5yZWFkQ291bnSIAQESHwoIcmVhZE9ubHkYByABKAhIBFIIcmVhZE9ubHmIAQESNwoUZW5kT2ZIaXN0b3J5VHJhbnNmZXIYCCABKAhIBVIUZW5kT2ZIaXN0b3J5VHJhbnNmZXKIAQESNQoTZXBoZW1lcmFsRXhwaXJhdGlvbhgJIAEoDUgGUhNlcGhlbWVyYWxFeHBpcmF0aW9uiAEBEkEKGWVwaGVtZXJhbFNldHRpbmdUaW1lc3RhbXAYCiABKANIB1IZZXBoZW1lcmFsU2V0dGluZ1RpbWVzdGFtcIgBARJtChhlbmRPZkhpc3RvcnlUcmFuc2ZlclR5cGUYCyABKA4yLC5wcm90by5Db252ZXJzYXRpb24uRW5kT2ZIaXN0b3J5VHJhbnNmZXJUeXBlSAhSGGVuZE9mSGlzdG9yeVRyYW5zZmVyVHlwZYgBARI5ChVjb252ZXJzYXRpb25UaW1lc3RhbXAYDCABKARICVIVY29udmVyc2F0aW9uVGltZXN0YW1wiAEBEhcKBG5hbWUYDSABKAlIClIEbmFtZYgBARIZCgVwSGFzaBgOIAEoCUgLUgVwSGFzaIgBARIdCgdub3RTcGFtGA8gASgISAxSB25vdFNwYW2IAQESHwoIYXJjaGl2ZWQYECABKAhIDVIIYXJjaGl2ZWSIAQESSAoQZGlzYXBwZWFyaW5nTW9kZRgRIAEoCzIXLnByb3RvLkRpc2FwcGVhcmluZ01vZGVIDlIQZGlzYXBwZWFyaW5nTW9kZYgBARIzChJ1bnJlYWRNZW50aW9uQ291bnQYEiABKA1ID1ISdW5yZWFkTWVudGlvbkNvdW50iAEBEisKDm1hcmtlZEFzVW5yZWFkGBMgASgISBBSDm1hcmtlZEFzVW5yZWFkiAEBEjkKC3BhcnRpY2lwYW50GBQgAygLMhcucHJvdG8uR3JvdXBQYXJ0aWNpcGFudFILcGFydGljaXBhbnQSHQoHdGNUb2tlbhgVIAEoDEgRUgd0Y1Rva2VuiAEBEi8KEHRjVG9rZW5UaW1lc3RhbXAYFiABKARIElIQdGNUb2tlblRpbWVzdGFtcIgBARJBChljb250YWN0UHJpbWFyeUlkZW50aXR5S2V5GBcgASgMSBNSGWNvbnRhY3RQcmltYXJ5SWRlbnRpdHlLZXmIAQESGwoGcGlubmVkGBggASgNSBRSBnBpbm5lZIgBARIlCgttdXRlRW5kVGltZRgZIAEoBEgVUgttdXRlRW5kVGltZYgBARI7Cgl3YWxscGFwZXIYGiABKAsyGC5wcm90by5XYWxscGFwZXJTZXR0aW5nc0gWUgl3YWxscGFwZXKIAQESRQoPbWVkaWFWaXNpYmlsaXR5GBsgASgOMhYucHJvdG8uTWVkaWFWaXNpYmlsaXR5SBdSD21lZGlhVmlzaWJpbGl0eYgBARI7ChZ0Y1Rva2VuU2VuZGVyVGltZXN0YW1wGBwgASgESBhSFnRjVG9rZW5TZW5kZXJUaW1lc3RhbXCIAQESIQoJc3VzcGVuZGVkGB0gASgISBlSCXN1c3BlbmRlZIgBARIjCgp0ZXJtaW5hdGVkGB4gASgISBpSCnRlcm1pbmF0ZWSIAQESIQoJY3JlYXRlZEF0GB8gASgESBtSCWNyZWF0ZWRBdIgBARIhCgljcmVhdGVkQnkYICABKAlIHFIJY3JlYXRlZEJ5iAEBEiUKC2Rlc2NyaXB0aW9uGCEgASgJSB1SC2Rlc2NyaXB0aW9uiAEBEh0KB3N1cHBvcnQYIiABKAhIHlIHc3VwcG9ydIgBARIpCg1pc1BhcmVudEdyb3VwGCMgASgISB9SDWlzUGFyZW50R3JvdXCIAQESKQoNcGFyZW50R3JvdXBJZBglIAEoCUggUg1wYXJlbnRHcm91cElkiAEBEjEKEWlzRGVmYXVsdFN1Ymdyb3VwGCQgASgISCFSEWlzRGVmYXVsdFN1Ymdyb3VwiAEBEiUKC2Rpc3BsYXlOYW1lGCYgASgJSCJSC2Rpc3BsYXlOYW1liAEBEhkKBXBuSmlkGCcgASgJSCNSBXBuSmlkiAEBEiMKCnNoYXJlT3duUG4YKCABKAhIJFIKc2hhcmVPd25QbogBARI5ChVwbmhEdXBsaWNhdGVMaWRUaHJlYWQYKSABKAhIJVIVcG5oRHVwbGljYXRlTGlkVGhyZWFkiAEBEhsKBmxpZEppZBgqIAEoCUgmUgZsaWRKaWSIAQESHwoIdXNlcm5hbWUYKyABKAlIJ1IIdXNlcm5hbWWIAQESKQoNbGlkT3JpZ2luVHlwZRgsIAEoCUgoUg1saWRPcmlnaW5UeXBliAEBEikKDWNvbW1lbnRzQ291bnQYLSABKA1IKVINY29tbWVudHNDb3VudIgBARIbCgZsb2NrZWQYLiABKAhIKlIGbG9ja2VkiAEBElYKFXN5c3RlbU1lc3NhZ2VUb0luc2VydBgvIAEoDjIbLnByb3RvLlByaXZhY3lTeXN0ZW1NZXNzYWdlSCtSFXN5c3RlbU1lc3NhZ2VUb0luc2VydIgBARIvChBjYXBpQ3JlYXRlZEdyb3VwGDAgASgISCxSEGNhcGlDcmVhdGVkR3JvdXCIAQESIwoKYWNjb3VudExpZBgxIAEoCUgtUgphY2NvdW50TGlkiAEBEicKDGxpbWl0U2hhcmluZxgyIAEoCEguUgxsaW1pdFNoYXJpbmeIAQESRwocbGltaXRTaGFyaW5nU2V0dGluZ1RpbWVzdGFtcBgzIAEoA0gvUhxsaW1pdFNoYXJpbmdTZXR0aW5nVGltZXN0YW1wiAEBElYKE2xpbWl0U2hhcmluZ1RyaWdnZXIYNCABKA4yHy5wcm90by5MaW1pdFNoYXJpbmcuVHJpZ2dlclR5cGVIMFITbGltaXRTaGFyaW5nVHJpZ2dlcogBARJBChlsaW1pdFNoYXJpbmdJbml0aWF0ZWRCeU1lGDUgASgISDFSGWxpbWl0U2hhcmluZ0luaXRpYXRlZEJ5TWWIAQESNwoUbWFpYmFBaVRocmVhZEVuYWJsZWQYNiABKAhIMlIUbWFpYmFBaVRocmVhZEVuYWJsZWSIAQEivAEKGEVuZE9mSGlzdG9yeVRyYW5zZmVyVHlwZRIwCixDT01QTEVURV9CVVRfTU9SRV9NRVNTQUdFU19SRU1BSU5fT05fUFJJTUFSWRAAEjIKLkNPTVBMRVRFX0FORF9OT19NT1JFX01FU1NBR0VfUkVNQUlOX09OX1BSSU1BUlkQARI6CjZDT01QTEVURV9PTl9ERU1BTkRfU1lOQ19CVVRfTU9SRV9NU0dfUkVNQUlOX09OX1BSSU1BUlkQAkIJCgdfbmV3SmlkQgkKB19vbGRKaWRCEwoRX2xhc3RNc2dUaW1lc3RhbXBCDgoMX3VucmVhZENvdW50QgsKCV9yZWFkT25seUIXChVfZW5kT2ZIaXN0b3J5VHJhbnNmZXJCFgoUX2VwaGVtZXJhbEV4cGlyYXRpb25CHAoaX2VwaGVtZXJhbFNldHRpbmdUaW1lc3RhbXBCGwoZX2VuZE9mSGlzdG9yeVRyYW5zZmVyVHlwZUIYChZfY29udmVyc2F0aW9uVGltZXN0YW1wQgcKBV9uYW1lQggKBl9wSGFzaEIKCghfbm90U3BhbUILCglfYXJjaGl2ZWRCEwoRX2Rpc2FwcGVhcmluZ01vZGVCFQoTX3VucmVhZE1lbnRpb25Db3VudEIRCg9fbWFya2VkQXNVbnJlYWRCCgoIX3RjVG9rZW5CEwoRX3RjVG9rZW5UaW1lc3RhbXBCHAoaX2NvbnRhY3RQcmltYXJ5SWRlbnRpdHlLZXlCCQoHX3Bpbm5lZEIOCgxfbXV0ZUVuZFRpbWVCDAoKX3dhbGxwYXBlckISChBfbWVkaWFWaXNpYmlsaXR5QhkKF190Y1Rva2VuU2VuZGVyVGltZXN0YW1wQgwKCl9zdXNwZW5kZWRCDQoLX3Rlcm1pbmF0ZWRCDAoKX2NyZWF0ZWRBdEIMCgpfY3JlYXRlZEJ5Qg4KDF9kZXNjcmlwdGlvbkIKCghfc3VwcG9ydEIQCg5faXNQYXJlbnRHcm91cEIQCg5fcGFyZW50R3JvdXBJZEIUChJfaXNEZWZhdWx0U3ViZ3JvdXBCDgoMX2Rpc3BsYXlOYW1lQggKBl9wbkppZEINCgtfc2hhcmVPd25QbkIYChZfcG5oRHVwbGljYXRlTGlkVGhyZWFkQgkKB19saWRKaWRCCwoJX3VzZXJuYW1lQhAKDl9saWRPcmlnaW5UeXBlQhAKDl9jb21tZW50c0NvdW50QgkKB19sb2NrZWRCGAoWX3N5c3RlbU1lc3NhZ2VUb0luc2VydEITChFfY2FwaUNyZWF0ZWRHcm91cEINCgtfYWNjb3VudExpZEIPCg1fbGltaXRTaGFyaW5nQh8KHV9saW1pdFNoYXJpbmdTZXR0aW5nVGltZXN0YW1wQhYKFF9saW1pdFNoYXJpbmdUcmlnZ2VyQhwKGl9saW1pdFNoYXJpbmdJbml0aWF0ZWRCeU1lQhcKFV9tYWliYUFpVGhyZWFkRW5hYmxlZA==');
@$core.Deprecated('Use deviceCapabilitiesDescriptor instead')
const DeviceCapabilities$json = const {
  '1': 'DeviceCapabilities',
  '2': const [
    const {'1': 'chatLockSupportLevel', '3': 1, '4': 1, '5': 14, '6': '.proto.DeviceCapabilities.ChatLockSupportLevel', '9': 0, '10': 'chatLockSupportLevel', '17': true},
    const {'1': 'lidMigration', '3': 2, '4': 1, '5': 11, '6': '.proto.DeviceCapabilities.LIDMigration', '9': 1, '10': 'lidMigration', '17': true},
    const {'1': 'businessBroadcast', '3': 3, '4': 1, '5': 11, '6': '.proto.DeviceCapabilities.BusinessBroadcast', '9': 2, '10': 'businessBroadcast', '17': true},
    const {'1': 'userHasAvatar', '3': 4, '4': 1, '5': 11, '6': '.proto.DeviceCapabilities.UserHasAvatar', '9': 3, '10': 'userHasAvatar', '17': true},
    const {'1': 'memberNameTagPrimarySupport', '3': 5, '4': 1, '5': 14, '6': '.proto.DeviceCapabilities.MemberNameTagPrimarySupport', '9': 4, '10': 'memberNameTagPrimarySupport', '17': true},
  ],
  '3': const [DeviceCapabilities_BusinessBroadcast$json, DeviceCapabilities_LIDMigration$json, DeviceCapabilities_UserHasAvatar$json],
  '4': const [DeviceCapabilities_ChatLockSupportLevel$json, DeviceCapabilities_MemberNameTagPrimarySupport$json],
  '8': const [
    const {'1': '_chatLockSupportLevel'},
    const {'1': '_lidMigration'},
    const {'1': '_businessBroadcast'},
    const {'1': '_userHasAvatar'},
    const {'1': '_memberNameTagPrimarySupport'},
  ],
};

@$core.Deprecated('Use deviceCapabilitiesDescriptor instead')
const DeviceCapabilities_BusinessBroadcast$json = const {
  '1': 'BusinessBroadcast',
  '2': const [
    const {'1': 'importListEnabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'importListEnabled', '17': true},
  ],
  '8': const [
    const {'1': '_importListEnabled'},
  ],
};

@$core.Deprecated('Use deviceCapabilitiesDescriptor instead')
const DeviceCapabilities_LIDMigration$json = const {
  '1': 'LIDMigration',
  '2': const [
    const {'1': 'chatDbMigrationTimestamp', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'chatDbMigrationTimestamp', '17': true},
  ],
  '8': const [
    const {'1': '_chatDbMigrationTimestamp'},
  ],
};

@$core.Deprecated('Use deviceCapabilitiesDescriptor instead')
const DeviceCapabilities_UserHasAvatar$json = const {
  '1': 'UserHasAvatar',
  '2': const [
    const {'1': 'userHasAvatar', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'userHasAvatar', '17': true},
  ],
  '8': const [
    const {'1': '_userHasAvatar'},
  ],
};

@$core.Deprecated('Use deviceCapabilitiesDescriptor instead')
const DeviceCapabilities_ChatLockSupportLevel$json = const {
  '1': 'ChatLockSupportLevel',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'MINIMAL', '2': 1},
    const {'1': 'FULL', '2': 2},
  ],
};

@$core.Deprecated('Use deviceCapabilitiesDescriptor instead')
const DeviceCapabilities_MemberNameTagPrimarySupport$json = const {
  '1': 'MemberNameTagPrimarySupport',
  '2': const [
    const {'1': 'DISABLED', '2': 0},
    const {'1': 'RECEIVER_ENABLED', '2': 1},
    const {'1': 'SENDER_ENABLED', '2': 2},
  ],
};

/// Descriptor for `DeviceCapabilities`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceCapabilitiesDescriptor = $convert.base64Decode('ChJEZXZpY2VDYXBhYmlsaXRpZXMSZwoUY2hhdExvY2tTdXBwb3J0TGV2ZWwYASABKA4yLi5wcm90by5EZXZpY2VDYXBhYmlsaXRpZXMuQ2hhdExvY2tTdXBwb3J0TGV2ZWxIAFIUY2hhdExvY2tTdXBwb3J0TGV2ZWyIAQESTwoMbGlkTWlncmF0aW9uGAIgASgLMiYucHJvdG8uRGV2aWNlQ2FwYWJpbGl0aWVzLkxJRE1pZ3JhdGlvbkgBUgxsaWRNaWdyYXRpb26IAQESXgoRYnVzaW5lc3NCcm9hZGNhc3QYAyABKAsyKy5wcm90by5EZXZpY2VDYXBhYmlsaXRpZXMuQnVzaW5lc3NCcm9hZGNhc3RIAlIRYnVzaW5lc3NCcm9hZGNhc3SIAQESUgoNdXNlckhhc0F2YXRhchgEIAEoCzInLnByb3RvLkRldmljZUNhcGFiaWxpdGllcy5Vc2VySGFzQXZhdGFySANSDXVzZXJIYXNBdmF0YXKIAQESfAobbWVtYmVyTmFtZVRhZ1ByaW1hcnlTdXBwb3J0GAUgASgOMjUucHJvdG8uRGV2aWNlQ2FwYWJpbGl0aWVzLk1lbWJlck5hbWVUYWdQcmltYXJ5U3VwcG9ydEgEUhttZW1iZXJOYW1lVGFnUHJpbWFyeVN1cHBvcnSIAQEaXAoRQnVzaW5lc3NCcm9hZGNhc3QSMQoRaW1wb3J0TGlzdEVuYWJsZWQYASABKAhIAFIRaW1wb3J0TGlzdEVuYWJsZWSIAQFCFAoSX2ltcG9ydExpc3RFbmFibGVkGmwKDExJRE1pZ3JhdGlvbhI/ChhjaGF0RGJNaWdyYXRpb25UaW1lc3RhbXAYASABKARIAFIYY2hhdERiTWlncmF0aW9uVGltZXN0YW1wiAEBQhsKGV9jaGF0RGJNaWdyYXRpb25UaW1lc3RhbXAaTAoNVXNlckhhc0F2YXRhchIpCg11c2VySGFzQXZhdGFyGAEgASgISABSDXVzZXJIYXNBdmF0YXKIAQFCEAoOX3VzZXJIYXNBdmF0YXIiNwoUQ2hhdExvY2tTdXBwb3J0TGV2ZWwSCAoETk9ORRAAEgsKB01JTklNQUwQARIICgRGVUxMEAIiVQobTWVtYmVyTmFtZVRhZ1ByaW1hcnlTdXBwb3J0EgwKCERJU0FCTEVEEAASFAoQUkVDRUlWRVJfRU5BQkxFRBABEhIKDlNFTkRFUl9FTkFCTEVEEAJCFwoVX2NoYXRMb2NrU3VwcG9ydExldmVsQg8KDV9saWRNaWdyYXRpb25CFAoSX2J1c2luZXNzQnJvYWRjYXN0QhAKDl91c2VySGFzQXZhdGFyQh4KHF9tZW1iZXJOYW1lVGFnUHJpbWFyeVN1cHBvcnQ=');
@$core.Deprecated('Use deviceConsistencyCodeMessageDescriptor instead')
const DeviceConsistencyCodeMessage$json = const {
  '1': 'DeviceConsistencyCodeMessage',
  '2': const [
    const {'1': 'generation', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'generation', '17': true},
    const {'1': 'signature', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'signature', '17': true},
  ],
  '8': const [
    const {'1': '_generation'},
    const {'1': '_signature'},
  ],
};

/// Descriptor for `DeviceConsistencyCodeMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceConsistencyCodeMessageDescriptor = $convert.base64Decode('ChxEZXZpY2VDb25zaXN0ZW5jeUNvZGVNZXNzYWdlEiMKCmdlbmVyYXRpb24YASABKA1IAFIKZ2VuZXJhdGlvbogBARIhCglzaWduYXR1cmUYAiABKAxIAVIJc2lnbmF0dXJliAEBQg0KC19nZW5lcmF0aW9uQgwKCl9zaWduYXR1cmU=');
@$core.Deprecated('Use deviceListMetadataDescriptor instead')
const DeviceListMetadata$json = const {
  '1': 'DeviceListMetadata',
  '2': const [
    const {'1': 'senderKeyHash', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'senderKeyHash', '17': true},
    const {'1': 'senderTimestamp', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'senderTimestamp', '17': true},
    const {
      '1': 'senderKeyIndexes',
      '3': 3,
      '4': 3,
      '5': 13,
      '8': const {'2': true},
      '10': 'senderKeyIndexes',
    },
    const {'1': 'senderAccountType', '3': 4, '4': 1, '5': 14, '6': '.proto.ADVEncryptionType', '9': 2, '10': 'senderAccountType', '17': true},
    const {'1': 'receiverAccountType', '3': 5, '4': 1, '5': 14, '6': '.proto.ADVEncryptionType', '9': 3, '10': 'receiverAccountType', '17': true},
    const {'1': 'recipientKeyHash', '3': 8, '4': 1, '5': 12, '9': 4, '10': 'recipientKeyHash', '17': true},
    const {'1': 'recipientTimestamp', '3': 9, '4': 1, '5': 4, '9': 5, '10': 'recipientTimestamp', '17': true},
    const {
      '1': 'recipientKeyIndexes',
      '3': 10,
      '4': 3,
      '5': 13,
      '8': const {'2': true},
      '10': 'recipientKeyIndexes',
    },
  ],
  '8': const [
    const {'1': '_senderKeyHash'},
    const {'1': '_senderTimestamp'},
    const {'1': '_senderAccountType'},
    const {'1': '_receiverAccountType'},
    const {'1': '_recipientKeyHash'},
    const {'1': '_recipientTimestamp'},
  ],
};

/// Descriptor for `DeviceListMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceListMetadataDescriptor = $convert.base64Decode('ChJEZXZpY2VMaXN0TWV0YWRhdGESKQoNc2VuZGVyS2V5SGFzaBgBIAEoDEgAUg1zZW5kZXJLZXlIYXNoiAEBEi0KD3NlbmRlclRpbWVzdGFtcBgCIAEoBEgBUg9zZW5kZXJUaW1lc3RhbXCIAQESLgoQc2VuZGVyS2V5SW5kZXhlcxgDIAMoDUICEAFSEHNlbmRlcktleUluZGV4ZXMSSwoRc2VuZGVyQWNjb3VudFR5cGUYBCABKA4yGC5wcm90by5BRFZFbmNyeXB0aW9uVHlwZUgCUhFzZW5kZXJBY2NvdW50VHlwZYgBARJPChNyZWNlaXZlckFjY291bnRUeXBlGAUgASgOMhgucHJvdG8uQURWRW5jcnlwdGlvblR5cGVIA1ITcmVjZWl2ZXJBY2NvdW50VHlwZYgBARIvChByZWNpcGllbnRLZXlIYXNoGAggASgMSARSEHJlY2lwaWVudEtleUhhc2iIAQESMwoScmVjaXBpZW50VGltZXN0YW1wGAkgASgESAVSEnJlY2lwaWVudFRpbWVzdGFtcIgBARI0ChNyZWNpcGllbnRLZXlJbmRleGVzGAogAygNQgIQAVITcmVjaXBpZW50S2V5SW5kZXhlc0IQCg5fc2VuZGVyS2V5SGFzaEISChBfc2VuZGVyVGltZXN0YW1wQhQKEl9zZW5kZXJBY2NvdW50VHlwZUIWChRfcmVjZWl2ZXJBY2NvdW50VHlwZUITChFfcmVjaXBpZW50S2V5SGFzaEIVChNfcmVjaXBpZW50VGltZXN0YW1w');
@$core.Deprecated('Use devicePropsDescriptor instead')
const DeviceProps$json = const {
  '1': 'DeviceProps',
  '2': const [
    const {'1': 'os', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'os', '17': true},
    const {'1': 'version', '3': 2, '4': 1, '5': 11, '6': '.proto.DeviceProps.AppVersion', '9': 1, '10': 'version', '17': true},
    const {'1': 'platformType', '3': 3, '4': 1, '5': 14, '6': '.proto.DeviceProps.PlatformType', '9': 2, '10': 'platformType', '17': true},
    const {'1': 'requireFullSync', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'requireFullSync', '17': true},
    const {'1': 'historySyncConfig', '3': 5, '4': 1, '5': 11, '6': '.proto.DeviceProps.HistorySyncConfig', '9': 4, '10': 'historySyncConfig', '17': true},
  ],
  '3': const [DeviceProps_AppVersion$json, DeviceProps_HistorySyncConfig$json],
  '4': const [DeviceProps_PlatformType$json],
  '8': const [
    const {'1': '_os'},
    const {'1': '_version'},
    const {'1': '_platformType'},
    const {'1': '_requireFullSync'},
    const {'1': '_historySyncConfig'},
  ],
};

@$core.Deprecated('Use devicePropsDescriptor instead')
const DeviceProps_AppVersion$json = const {
  '1': 'AppVersion',
  '2': const [
    const {'1': 'primary', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'primary', '17': true},
    const {'1': 'secondary', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'secondary', '17': true},
    const {'1': 'tertiary', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'tertiary', '17': true},
    const {'1': 'quaternary', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'quaternary', '17': true},
    const {'1': 'quinary', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'quinary', '17': true},
  ],
  '8': const [
    const {'1': '_primary'},
    const {'1': '_secondary'},
    const {'1': '_tertiary'},
    const {'1': '_quaternary'},
    const {'1': '_quinary'},
  ],
};

@$core.Deprecated('Use devicePropsDescriptor instead')
const DeviceProps_HistorySyncConfig$json = const {
  '1': 'HistorySyncConfig',
  '2': const [
    const {'1': 'fullSyncDaysLimit', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'fullSyncDaysLimit', '17': true},
    const {'1': 'fullSyncSizeMbLimit', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'fullSyncSizeMbLimit', '17': true},
    const {'1': 'storageQuotaMb', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'storageQuotaMb', '17': true},
    const {'1': 'inlineInitialPayloadInE2EeMsg', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'inlineInitialPayloadInE2EeMsg', '17': true},
    const {'1': 'recentSyncDaysLimit', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'recentSyncDaysLimit', '17': true},
    const {'1': 'supportCallLogHistory', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'supportCallLogHistory', '17': true},
    const {'1': 'supportBotUserAgentChatHistory', '3': 7, '4': 1, '5': 8, '9': 6, '10': 'supportBotUserAgentChatHistory', '17': true},
    const {'1': 'supportCagReactionsAndPolls', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'supportCagReactionsAndPolls', '17': true},
    const {'1': 'supportBizHostedMsg', '3': 9, '4': 1, '5': 8, '9': 8, '10': 'supportBizHostedMsg', '17': true},
    const {'1': 'supportRecentSyncChunkMessageCountTuning', '3': 10, '4': 1, '5': 8, '9': 9, '10': 'supportRecentSyncChunkMessageCountTuning', '17': true},
    const {'1': 'supportHostedGroupMsg', '3': 11, '4': 1, '5': 8, '9': 10, '10': 'supportHostedGroupMsg', '17': true},
    const {'1': 'supportFbidBotChatHistory', '3': 12, '4': 1, '5': 8, '9': 11, '10': 'supportFbidBotChatHistory', '17': true},
    const {'1': 'supportAddOnHistorySyncMigration', '3': 13, '4': 1, '5': 8, '9': 12, '10': 'supportAddOnHistorySyncMigration', '17': true},
    const {'1': 'supportMessageAssociation', '3': 14, '4': 1, '5': 8, '9': 13, '10': 'supportMessageAssociation', '17': true},
    const {'1': 'supportGroupHistory', '3': 15, '4': 1, '5': 8, '9': 14, '10': 'supportGroupHistory', '17': true},
    const {'1': 'onDemandReady', '3': 16, '4': 1, '5': 8, '9': 15, '10': 'onDemandReady', '17': true},
    const {'1': 'supportGuestChat', '3': 17, '4': 1, '5': 8, '9': 16, '10': 'supportGuestChat', '17': true},
    const {'1': 'completeOnDemandReady', '3': 18, '4': 1, '5': 8, '9': 17, '10': 'completeOnDemandReady', '17': true},
    const {'1': 'thumbnailSyncDaysLimit', '3': 19, '4': 1, '5': 13, '9': 18, '10': 'thumbnailSyncDaysLimit', '17': true},
  ],
  '8': const [
    const {'1': '_fullSyncDaysLimit'},
    const {'1': '_fullSyncSizeMbLimit'},
    const {'1': '_storageQuotaMb'},
    const {'1': '_inlineInitialPayloadInE2EeMsg'},
    const {'1': '_recentSyncDaysLimit'},
    const {'1': '_supportCallLogHistory'},
    const {'1': '_supportBotUserAgentChatHistory'},
    const {'1': '_supportCagReactionsAndPolls'},
    const {'1': '_supportBizHostedMsg'},
    const {'1': '_supportRecentSyncChunkMessageCountTuning'},
    const {'1': '_supportHostedGroupMsg'},
    const {'1': '_supportFbidBotChatHistory'},
    const {'1': '_supportAddOnHistorySyncMigration'},
    const {'1': '_supportMessageAssociation'},
    const {'1': '_supportGroupHistory'},
    const {'1': '_onDemandReady'},
    const {'1': '_supportGuestChat'},
    const {'1': '_completeOnDemandReady'},
    const {'1': '_thumbnailSyncDaysLimit'},
  ],
};

@$core.Deprecated('Use devicePropsDescriptor instead')
const DeviceProps_PlatformType$json = const {
  '1': 'PlatformType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CHROME', '2': 1},
    const {'1': 'FIREFOX', '2': 2},
    const {'1': 'IE', '2': 3},
    const {'1': 'OPERA', '2': 4},
    const {'1': 'SAFARI', '2': 5},
    const {'1': 'EDGE', '2': 6},
    const {'1': 'DESKTOP', '2': 7},
    const {'1': 'IPAD', '2': 8},
    const {'1': 'ANDROID_TABLET', '2': 9},
    const {'1': 'OHANA', '2': 10},
    const {'1': 'ALOHA', '2': 11},
    const {'1': 'CATALINA', '2': 12},
    const {'1': 'TCL_TV', '2': 13},
    const {'1': 'IOS_PHONE', '2': 14},
    const {'1': 'IOS_CATALYST', '2': 15},
    const {'1': 'ANDROID_PHONE', '2': 16},
    const {'1': 'ANDROID_AMBIGUOUS', '2': 17},
    const {'1': 'WEAR_OS', '2': 18},
    const {'1': 'AR_WRIST', '2': 19},
    const {'1': 'AR_DEVICE', '2': 20},
    const {'1': 'UWP', '2': 21},
    const {'1': 'VR', '2': 22},
    const {'1': 'CLOUD_API', '2': 23},
    const {'1': 'SMARTGLASSES', '2': 24},
  ],
};

/// Descriptor for `DeviceProps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List devicePropsDescriptor = $convert.base64Decode('CgtEZXZpY2VQcm9wcxITCgJvcxgBIAEoCUgAUgJvc4gBARI8Cgd2ZXJzaW9uGAIgASgLMh0ucHJvdG8uRGV2aWNlUHJvcHMuQXBwVmVyc2lvbkgBUgd2ZXJzaW9uiAEBEkgKDHBsYXRmb3JtVHlwZRgDIAEoDjIfLnByb3RvLkRldmljZVByb3BzLlBsYXRmb3JtVHlwZUgCUgxwbGF0Zm9ybVR5cGWIAQESLQoPcmVxdWlyZUZ1bGxTeW5jGAQgASgISANSD3JlcXVpcmVGdWxsU3luY4gBARJXChFoaXN0b3J5U3luY0NvbmZpZxgFIAEoCzIkLnByb3RvLkRldmljZVByb3BzLkhpc3RvcnlTeW5jQ29uZmlnSARSEWhpc3RvcnlTeW5jQ29uZmlniAEBGvUBCgpBcHBWZXJzaW9uEh0KB3ByaW1hcnkYASABKA1IAFIHcHJpbWFyeYgBARIhCglzZWNvbmRhcnkYAiABKA1IAVIJc2Vjb25kYXJ5iAEBEh8KCHRlcnRpYXJ5GAMgASgNSAJSCHRlcnRpYXJ5iAEBEiMKCnF1YXRlcm5hcnkYBCABKA1IA1IKcXVhdGVybmFyeYgBARIdCgdxdWluYXJ5GAUgASgNSARSB3F1aW5hcnmIAQFCCgoIX3ByaW1hcnlCDAoKX3NlY29uZGFyeUILCglfdGVydGlhcnlCDQoLX3F1YXRlcm5hcnlCCgoIX3F1aW5hcnkavA0KEUhpc3RvcnlTeW5jQ29uZmlnEjEKEWZ1bGxTeW5jRGF5c0xpbWl0GAEgASgNSABSEWZ1bGxTeW5jRGF5c0xpbWl0iAEBEjUKE2Z1bGxTeW5jU2l6ZU1iTGltaXQYAiABKA1IAVITZnVsbFN5bmNTaXplTWJMaW1pdIgBARIrCg5zdG9yYWdlUXVvdGFNYhgDIAEoDUgCUg5zdG9yYWdlUXVvdGFNYogBARJJCh1pbmxpbmVJbml0aWFsUGF5bG9hZEluRTJFZU1zZxgEIAEoCEgDUh1pbmxpbmVJbml0aWFsUGF5bG9hZEluRTJFZU1zZ4gBARI1ChNyZWNlbnRTeW5jRGF5c0xpbWl0GAUgASgNSARSE3JlY2VudFN5bmNEYXlzTGltaXSIAQESOQoVc3VwcG9ydENhbGxMb2dIaXN0b3J5GAYgASgISAVSFXN1cHBvcnRDYWxsTG9nSGlzdG9yeYgBARJLCh5zdXBwb3J0Qm90VXNlckFnZW50Q2hhdEhpc3RvcnkYByABKAhIBlIec3VwcG9ydEJvdFVzZXJBZ2VudENoYXRIaXN0b3J5iAEBEkUKG3N1cHBvcnRDYWdSZWFjdGlvbnNBbmRQb2xscxgIIAEoCEgHUhtzdXBwb3J0Q2FnUmVhY3Rpb25zQW5kUG9sbHOIAQESNQoTc3VwcG9ydEJpekhvc3RlZE1zZxgJIAEoCEgIUhNzdXBwb3J0Qml6SG9zdGVkTXNniAEBEl8KKHN1cHBvcnRSZWNlbnRTeW5jQ2h1bmtNZXNzYWdlQ291bnRUdW5pbmcYCiABKAhICVIoc3VwcG9ydFJlY2VudFN5bmNDaHVua01lc3NhZ2VDb3VudFR1bmluZ4gBARI5ChVzdXBwb3J0SG9zdGVkR3JvdXBNc2cYCyABKAhIClIVc3VwcG9ydEhvc3RlZEdyb3VwTXNniAEBEkEKGXN1cHBvcnRGYmlkQm90Q2hhdEhpc3RvcnkYDCABKAhIC1IZc3VwcG9ydEZiaWRCb3RDaGF0SGlzdG9yeYgBARJPCiBzdXBwb3J0QWRkT25IaXN0b3J5U3luY01pZ3JhdGlvbhgNIAEoCEgMUiBzdXBwb3J0QWRkT25IaXN0b3J5U3luY01pZ3JhdGlvbogBARJBChlzdXBwb3J0TWVzc2FnZUFzc29jaWF0aW9uGA4gASgISA1SGXN1cHBvcnRNZXNzYWdlQXNzb2NpYXRpb26IAQESNQoTc3VwcG9ydEdyb3VwSGlzdG9yeRgPIAEoCEgOUhNzdXBwb3J0R3JvdXBIaXN0b3J5iAEBEikKDW9uRGVtYW5kUmVhZHkYECABKAhID1INb25EZW1hbmRSZWFkeYgBARIvChBzdXBwb3J0R3Vlc3RDaGF0GBEgASgISBBSEHN1cHBvcnRHdWVzdENoYXSIAQESOQoVY29tcGxldGVPbkRlbWFuZFJlYWR5GBIgASgISBFSFWNvbXBsZXRlT25EZW1hbmRSZWFkeYgBARI7ChZ0aHVtYm5haWxTeW5jRGF5c0xpbWl0GBMgASgNSBJSFnRodW1ibmFpbFN5bmNEYXlzTGltaXSIAQFCFAoSX2Z1bGxTeW5jRGF5c0xpbWl0QhYKFF9mdWxsU3luY1NpemVNYkxpbWl0QhEKD19zdG9yYWdlUXVvdGFNYkIgCh5faW5saW5lSW5pdGlhbFBheWxvYWRJbkUyRWVNc2dCFgoUX3JlY2VudFN5bmNEYXlzTGltaXRCGAoWX3N1cHBvcnRDYWxsTG9nSGlzdG9yeUIhCh9fc3VwcG9ydEJvdFVzZXJBZ2VudENoYXRIaXN0b3J5Qh4KHF9zdXBwb3J0Q2FnUmVhY3Rpb25zQW5kUG9sbHNCFgoUX3N1cHBvcnRCaXpIb3N0ZWRNc2dCKwopX3N1cHBvcnRSZWNlbnRTeW5jQ2h1bmtNZXNzYWdlQ291bnRUdW5pbmdCGAoWX3N1cHBvcnRIb3N0ZWRHcm91cE1zZ0IcChpfc3VwcG9ydEZiaWRCb3RDaGF0SGlzdG9yeUIjCiFfc3VwcG9ydEFkZE9uSGlzdG9yeVN5bmNNaWdyYXRpb25CHAoaX3N1cHBvcnRNZXNzYWdlQXNzb2NpYXRpb25CFgoUX3N1cHBvcnRHcm91cEhpc3RvcnlCEAoOX29uRGVtYW5kUmVhZHlCEwoRX3N1cHBvcnRHdWVzdENoYXRCGAoWX2NvbXBsZXRlT25EZW1hbmRSZWFkeUIZChdfdGh1bWJuYWlsU3luY0RheXNMaW1pdCLfAgoMUGxhdGZvcm1UeXBlEgsKB1VOS05PV04QABIKCgZDSFJPTUUQARILCgdGSVJFRk9YEAISBgoCSUUQAxIJCgVPUEVSQRAEEgoKBlNBRkFSSRAFEggKBEVER0UQBhILCgdERVNLVE9QEAcSCAoESVBBRBAIEhIKDkFORFJPSURfVEFCTEVUEAkSCQoFT0hBTkEQChIJCgVBTE9IQRALEgwKCENBVEFMSU5BEAwSCgoGVENMX1RWEA0SDQoJSU9TX1BIT05FEA4SEAoMSU9TX0NBVEFMWVNUEA8SEQoNQU5EUk9JRF9QSE9ORRAQEhUKEUFORFJPSURfQU1CSUdVT1VTEBESCwoHV0VBUl9PUxASEgwKCEFSX1dSSVNUEBMSDQoJQVJfREVWSUNFEBQSBwoDVVdQEBUSBgoCVlIQFhINCglDTE9VRF9BUEkQFxIQCgxTTUFSVEdMQVNTRVMQGEIFCgNfb3NCCgoIX3ZlcnNpb25CDwoNX3BsYXRmb3JtVHlwZUISChBfcmVxdWlyZUZ1bGxTeW5jQhQKEl9oaXN0b3J5U3luY0NvbmZpZw==');
@$core.Deprecated('Use disappearingModeDescriptor instead')
const DisappearingMode$json = const {
  '1': 'DisappearingMode',
  '2': const [
    const {'1': 'initiator', '3': 1, '4': 1, '5': 14, '6': '.proto.DisappearingMode.Initiator', '9': 0, '10': 'initiator', '17': true},
    const {'1': 'trigger', '3': 2, '4': 1, '5': 14, '6': '.proto.DisappearingMode.Trigger', '9': 1, '10': 'trigger', '17': true},
    const {'1': 'initiatorDeviceJid', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'initiatorDeviceJid', '17': true},
    const {'1': 'initiatedByMe', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'initiatedByMe', '17': true},
  ],
  '4': const [DisappearingMode_Initiator$json, DisappearingMode_Trigger$json],
  '8': const [
    const {'1': '_initiator'},
    const {'1': '_trigger'},
    const {'1': '_initiatorDeviceJid'},
    const {'1': '_initiatedByMe'},
  ],
};

@$core.Deprecated('Use disappearingModeDescriptor instead')
const DisappearingMode_Initiator$json = const {
  '1': 'Initiator',
  '2': const [
    const {'1': 'CHANGED_IN_CHAT', '2': 0},
    const {'1': 'INITIATED_BY_ME', '2': 1},
    const {'1': 'INITIATED_BY_OTHER', '2': 2},
    const {'1': 'BIZ_UPGRADE_FB_HOSTING', '2': 3},
  ],
};

@$core.Deprecated('Use disappearingModeDescriptor instead')
const DisappearingMode_Trigger$json = const {
  '1': 'Trigger',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CHAT_SETTING', '2': 1},
    const {'1': 'ACCOUNT_SETTING', '2': 2},
    const {'1': 'BULK_CHANGE', '2': 3},
    const {'1': 'BIZ_SUPPORTS_FB_HOSTING', '2': 4},
    const {'1': 'UNKNOWN_GROUPS', '2': 5},
  ],
};

/// Descriptor for `DisappearingMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disappearingModeDescriptor = $convert.base64Decode('ChBEaXNhcHBlYXJpbmdNb2RlEkQKCWluaXRpYXRvchgBIAEoDjIhLnByb3RvLkRpc2FwcGVhcmluZ01vZGUuSW5pdGlhdG9ySABSCWluaXRpYXRvcogBARI+Cgd0cmlnZ2VyGAIgASgOMh8ucHJvdG8uRGlzYXBwZWFyaW5nTW9kZS5UcmlnZ2VySAFSB3RyaWdnZXKIAQESMwoSaW5pdGlhdG9yRGV2aWNlSmlkGAMgASgJSAJSEmluaXRpYXRvckRldmljZUppZIgBARIpCg1pbml0aWF0ZWRCeU1lGAQgASgISANSDWluaXRpYXRlZEJ5TWWIAQEiaQoJSW5pdGlhdG9yEhMKD0NIQU5HRURfSU5fQ0hBVBAAEhMKD0lOSVRJQVRFRF9CWV9NRRABEhYKEklOSVRJQVRFRF9CWV9PVEhFUhACEhoKFkJJWl9VUEdSQURFX0ZCX0hPU1RJTkcQAyJ/CgdUcmlnZ2VyEgsKB1VOS05PV04QABIQCgxDSEFUX1NFVFRJTkcQARITCg9BQ0NPVU5UX1NFVFRJTkcQAhIPCgtCVUxLX0NIQU5HRRADEhsKF0JJWl9TVVBQT1JUU19GQl9IT1NUSU5HEAQSEgoOVU5LTk9XTl9HUk9VUFMQBUIMCgpfaW5pdGlhdG9yQgoKCF90cmlnZ2VyQhUKE19pbml0aWF0b3JEZXZpY2VKaWRCEAoOX2luaXRpYXRlZEJ5TWU=');
@$core.Deprecated('Use embeddedContentDescriptor instead')
const EmbeddedContent$json = const {
  '1': 'EmbeddedContent',
  '2': const [
    const {'1': 'embeddedMessage', '3': 1, '4': 1, '5': 11, '6': '.proto.EmbeddedMessage', '9': 0, '10': 'embeddedMessage'},
    const {'1': 'embeddedMusic', '3': 2, '4': 1, '5': 11, '6': '.proto.EmbeddedMusic', '9': 0, '10': 'embeddedMusic'},
  ],
  '8': const [
    const {'1': 'content'},
  ],
};

/// Descriptor for `EmbeddedContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List embeddedContentDescriptor = $convert.base64Decode('Cg9FbWJlZGRlZENvbnRlbnQSQgoPZW1iZWRkZWRNZXNzYWdlGAEgASgLMhYucHJvdG8uRW1iZWRkZWRNZXNzYWdlSABSD2VtYmVkZGVkTWVzc2FnZRI8Cg1lbWJlZGRlZE11c2ljGAIgASgLMhQucHJvdG8uRW1iZWRkZWRNdXNpY0gAUg1lbWJlZGRlZE11c2ljQgkKB2NvbnRlbnQ=');
@$core.Deprecated('Use embeddedMessageDescriptor instead')
const EmbeddedMessage$json = const {
  '1': 'EmbeddedMessage',
  '2': const [
    const {'1': 'stanzaId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stanzaId', '17': true},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 1, '10': 'message', '17': true},
  ],
  '8': const [
    const {'1': '_stanzaId'},
    const {'1': '_message'},
  ],
};

/// Descriptor for `EmbeddedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List embeddedMessageDescriptor = $convert.base64Decode('Cg9FbWJlZGRlZE1lc3NhZ2USHwoIc3RhbnphSWQYASABKAlIAFIIc3RhbnphSWSIAQESLQoHbWVzc2FnZRgCIAEoCzIOLnByb3RvLk1lc3NhZ2VIAVIHbWVzc2FnZYgBAUILCglfc3RhbnphSWRCCgoIX21lc3NhZ2U=');
@$core.Deprecated('Use embeddedMusicDescriptor instead')
const EmbeddedMusic$json = const {
  '1': 'EmbeddedMusic',
  '2': const [
    const {'1': 'musicContentMediaId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'musicContentMediaId', '17': true},
    const {'1': 'songId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'songId', '17': true},
    const {'1': 'author', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'author', '17': true},
    const {'1': 'title', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'title', '17': true},
    const {'1': 'artworkDirectPath', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'artworkDirectPath', '17': true},
    const {'1': 'artworkSha256', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'artworkSha256', '17': true},
    const {'1': 'artworkEncSha256', '3': 7, '4': 1, '5': 12, '9': 6, '10': 'artworkEncSha256', '17': true},
    const {'1': 'artistAttribution', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'artistAttribution', '17': true},
    const {'1': 'countryBlocklist', '3': 9, '4': 1, '5': 12, '9': 8, '10': 'countryBlocklist', '17': true},
    const {'1': 'isExplicit', '3': 10, '4': 1, '5': 8, '9': 9, '10': 'isExplicit', '17': true},
    const {'1': 'artworkMediaKey', '3': 11, '4': 1, '5': 12, '9': 10, '10': 'artworkMediaKey', '17': true},
    const {'1': 'musicSongStartTimeInMs', '3': 12, '4': 1, '5': 3, '9': 11, '10': 'musicSongStartTimeInMs', '17': true},
    const {'1': 'derivedContentStartTimeInMs', '3': 13, '4': 1, '5': 3, '9': 12, '10': 'derivedContentStartTimeInMs', '17': true},
    const {'1': 'overlapDurationInMs', '3': 14, '4': 1, '5': 3, '9': 13, '10': 'overlapDurationInMs', '17': true},
  ],
  '8': const [
    const {'1': '_musicContentMediaId'},
    const {'1': '_songId'},
    const {'1': '_author'},
    const {'1': '_title'},
    const {'1': '_artworkDirectPath'},
    const {'1': '_artworkSha256'},
    const {'1': '_artworkEncSha256'},
    const {'1': '_artistAttribution'},
    const {'1': '_countryBlocklist'},
    const {'1': '_isExplicit'},
    const {'1': '_artworkMediaKey'},
    const {'1': '_musicSongStartTimeInMs'},
    const {'1': '_derivedContentStartTimeInMs'},
    const {'1': '_overlapDurationInMs'},
  ],
};

/// Descriptor for `EmbeddedMusic`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List embeddedMusicDescriptor = $convert.base64Decode('Cg1FbWJlZGRlZE11c2ljEjUKE211c2ljQ29udGVudE1lZGlhSWQYASABKAlIAFITbXVzaWNDb250ZW50TWVkaWFJZIgBARIbCgZzb25nSWQYAiABKAlIAVIGc29uZ0lkiAEBEhsKBmF1dGhvchgDIAEoCUgCUgZhdXRob3KIAQESGQoFdGl0bGUYBCABKAlIA1IFdGl0bGWIAQESMQoRYXJ0d29ya0RpcmVjdFBhdGgYBSABKAlIBFIRYXJ0d29ya0RpcmVjdFBhdGiIAQESKQoNYXJ0d29ya1NoYTI1NhgGIAEoDEgFUg1hcnR3b3JrU2hhMjU2iAEBEi8KEGFydHdvcmtFbmNTaGEyNTYYByABKAxIBlIQYXJ0d29ya0VuY1NoYTI1NogBARIxChFhcnRpc3RBdHRyaWJ1dGlvbhgIIAEoCUgHUhFhcnRpc3RBdHRyaWJ1dGlvbogBARIvChBjb3VudHJ5QmxvY2tsaXN0GAkgASgMSAhSEGNvdW50cnlCbG9ja2xpc3SIAQESIwoKaXNFeHBsaWNpdBgKIAEoCEgJUgppc0V4cGxpY2l0iAEBEi0KD2FydHdvcmtNZWRpYUtleRgLIAEoDEgKUg9hcnR3b3JrTWVkaWFLZXmIAQESOwoWbXVzaWNTb25nU3RhcnRUaW1lSW5NcxgMIAEoA0gLUhZtdXNpY1NvbmdTdGFydFRpbWVJbk1ziAEBEkUKG2Rlcml2ZWRDb250ZW50U3RhcnRUaW1lSW5NcxgNIAEoA0gMUhtkZXJpdmVkQ29udGVudFN0YXJ0VGltZUluTXOIAQESNQoTb3ZlcmxhcER1cmF0aW9uSW5NcxgOIAEoA0gNUhNvdmVybGFwRHVyYXRpb25Jbk1ziAEBQhYKFF9tdXNpY0NvbnRlbnRNZWRpYUlkQgkKB19zb25nSWRCCQoHX2F1dGhvckIICgZfdGl0bGVCFAoSX2FydHdvcmtEaXJlY3RQYXRoQhAKDl9hcnR3b3JrU2hhMjU2QhMKEV9hcnR3b3JrRW5jU2hhMjU2QhQKEl9hcnRpc3RBdHRyaWJ1dGlvbkITChFfY291bnRyeUJsb2NrbGlzdEINCgtfaXNFeHBsaWNpdEISChBfYXJ0d29ya01lZGlhS2V5QhkKF19tdXNpY1NvbmdTdGFydFRpbWVJbk1zQh4KHF9kZXJpdmVkQ29udGVudFN0YXJ0VGltZUluTXNCFgoUX292ZXJsYXBEdXJhdGlvbkluTXM=');
@$core.Deprecated('Use encryptedPairingRequestDescriptor instead')
const EncryptedPairingRequest$json = const {
  '1': 'EncryptedPairingRequest',
  '2': const [
    const {'1': 'encryptedPayload', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'encryptedPayload', '17': true},
    const {'1': 'iv', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'iv', '17': true},
  ],
  '8': const [
    const {'1': '_encryptedPayload'},
    const {'1': '_iv'},
  ],
};

/// Descriptor for `EncryptedPairingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List encryptedPairingRequestDescriptor = $convert.base64Decode('ChdFbmNyeXB0ZWRQYWlyaW5nUmVxdWVzdBIvChBlbmNyeXB0ZWRQYXlsb2FkGAEgASgMSABSEGVuY3J5cHRlZFBheWxvYWSIAQESEwoCaXYYAiABKAxIAVICaXaIAQFCEwoRX2VuY3J5cHRlZFBheWxvYWRCBQoDX2l2');
@$core.Deprecated('Use ephemeralSettingDescriptor instead')
const EphemeralSetting$json = const {
  '1': 'EphemeralSetting',
  '2': const [
    const {'1': 'duration', '3': 1, '4': 1, '5': 15, '9': 0, '10': 'duration', '17': true},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 16, '9': 1, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_duration'},
    const {'1': '_timestamp'},
  ],
};

/// Descriptor for `EphemeralSetting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ephemeralSettingDescriptor = $convert.base64Decode('ChBFcGhlbWVyYWxTZXR0aW5nEh8KCGR1cmF0aW9uGAEgASgPSABSCGR1cmF0aW9uiAEBEiEKCXRpbWVzdGFtcBgCIAEoEEgBUgl0aW1lc3RhbXCIAQFCCwoJX2R1cmF0aW9uQgwKCl90aW1lc3RhbXA=');
@$core.Deprecated('Use eventAdditionalMetadataDescriptor instead')
const EventAdditionalMetadata$json = const {
  '1': 'EventAdditionalMetadata',
  '2': const [
    const {'1': 'isStale', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isStale', '17': true},
  ],
  '8': const [
    const {'1': '_isStale'},
  ],
};

/// Descriptor for `EventAdditionalMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventAdditionalMetadataDescriptor = $convert.base64Decode('ChdFdmVudEFkZGl0aW9uYWxNZXRhZGF0YRIdCgdpc1N0YWxlGAEgASgISABSB2lzU3RhbGWIAQFCCgoIX2lzU3RhbGU=');
@$core.Deprecated('Use eventResponseDescriptor instead')
const EventResponse$json = const {
  '1': 'EventResponse',
  '2': const [
    const {'1': 'eventResponseMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'eventResponseMessageKey', '17': true},
    const {'1': 'timestampMs', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'timestampMs', '17': true},
    const {'1': 'eventResponseMessage', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.EventResponseMessage', '9': 2, '10': 'eventResponseMessage', '17': true},
    const {'1': 'unread', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'unread', '17': true},
  ],
  '8': const [
    const {'1': '_eventResponseMessageKey'},
    const {'1': '_timestampMs'},
    const {'1': '_eventResponseMessage'},
    const {'1': '_unread'},
  ],
};

/// Descriptor for `EventResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List eventResponseDescriptor = $convert.base64Decode('Cg1FdmVudFJlc3BvbnNlElAKF2V2ZW50UmVzcG9uc2VNZXNzYWdlS2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUhdldmVudFJlc3BvbnNlTWVzc2FnZUtleYgBARIlCgt0aW1lc3RhbXBNcxgCIAEoA0gBUgt0aW1lc3RhbXBNc4gBARJcChRldmVudFJlc3BvbnNlTWVzc2FnZRgDIAEoCzIjLnByb3RvLk1lc3NhZ2UuRXZlbnRSZXNwb25zZU1lc3NhZ2VIAlIUZXZlbnRSZXNwb25zZU1lc3NhZ2WIAQESGwoGdW5yZWFkGAQgASgISANSBnVucmVhZIgBAUIaChhfZXZlbnRSZXNwb25zZU1lc3NhZ2VLZXlCDgoMX3RpbWVzdGFtcE1zQhcKFV9ldmVudFJlc3BvbnNlTWVzc2FnZUIJCgdfdW5yZWFk');
@$core.Deprecated('Use exitCodeDescriptor instead')
const ExitCode$json = const {
  '1': 'ExitCode',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'code', '17': true},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
  ],
  '8': const [
    const {'1': '_code'},
    const {'1': '_text'},
  ],
};

/// Descriptor for `ExitCode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List exitCodeDescriptor = $convert.base64Decode('CghFeGl0Q29kZRIXCgRjb2RlGAEgASgESABSBGNvZGWIAQESFwoEdGV4dBgCIAEoCUgBUgR0ZXh0iAEBQgcKBV9jb2RlQgcKBV90ZXh0');
@$core.Deprecated('Use externalBlobReferenceDescriptor instead')
const ExternalBlobReference$json = const {
  '1': 'ExternalBlobReference',
  '2': const [
    const {'1': 'mediaKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'mediaKey', '17': true},
    const {'1': 'directPath', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'directPath', '17': true},
    const {'1': 'handle', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'handle', '17': true},
    const {'1': 'fileSizeBytes', '3': 4, '4': 1, '5': 4, '9': 3, '10': 'fileSizeBytes', '17': true},
    const {'1': 'fileSha256', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'fileSha256', '17': true},
    const {'1': 'fileEncSha256', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'fileEncSha256', '17': true},
  ],
  '8': const [
    const {'1': '_mediaKey'},
    const {'1': '_directPath'},
    const {'1': '_handle'},
    const {'1': '_fileSizeBytes'},
    const {'1': '_fileSha256'},
    const {'1': '_fileEncSha256'},
  ],
};

/// Descriptor for `ExternalBlobReference`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalBlobReferenceDescriptor = $convert.base64Decode('ChVFeHRlcm5hbEJsb2JSZWZlcmVuY2USHwoIbWVkaWFLZXkYASABKAxIAFIIbWVkaWFLZXmIAQESIwoKZGlyZWN0UGF0aBgCIAEoCUgBUgpkaXJlY3RQYXRoiAEBEhsKBmhhbmRsZRgDIAEoCUgCUgZoYW5kbGWIAQESKQoNZmlsZVNpemVCeXRlcxgEIAEoBEgDUg1maWxlU2l6ZUJ5dGVziAEBEiMKCmZpbGVTaGEyNTYYBSABKAxIBFIKZmlsZVNoYTI1NogBARIpCg1maWxlRW5jU2hhMjU2GAYgASgMSAVSDWZpbGVFbmNTaGEyNTaIAQFCCwoJX21lZGlhS2V5Qg0KC19kaXJlY3RQYXRoQgkKB19oYW5kbGVCEAoOX2ZpbGVTaXplQnl0ZXNCDQoLX2ZpbGVTaGEyNTZCEAoOX2ZpbGVFbmNTaGEyNTY=');
@$core.Deprecated('Use fieldDescriptor instead')
const Field$json = const {
  '1': 'Field',
  '2': const [
    const {'1': 'minVersion', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'minVersion', '17': true},
    const {'1': 'maxVersion', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'maxVersion', '17': true},
    const {'1': 'notReportableMinVersion', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'notReportableMinVersion', '17': true},
    const {'1': 'isMessage', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'isMessage', '17': true},
    const {'1': 'subfield', '3': 5, '4': 3, '5': 11, '6': '.proto.Field.SubfieldEntry', '10': 'subfield'},
  ],
  '3': const [Field_SubfieldEntry$json],
  '8': const [
    const {'1': '_minVersion'},
    const {'1': '_maxVersion'},
    const {'1': '_notReportableMinVersion'},
    const {'1': '_isMessage'},
  ],
};

@$core.Deprecated('Use fieldDescriptor instead')
const Field_SubfieldEntry$json = const {
  '1': 'SubfieldEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.proto.Field', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Field`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fieldDescriptor = $convert.base64Decode('CgVGaWVsZBIjCgptaW5WZXJzaW9uGAEgASgNSABSCm1pblZlcnNpb26IAQESIwoKbWF4VmVyc2lvbhgCIAEoDUgBUgptYXhWZXJzaW9uiAEBEj0KF25vdFJlcG9ydGFibGVNaW5WZXJzaW9uGAMgASgNSAJSF25vdFJlcG9ydGFibGVNaW5WZXJzaW9uiAEBEiEKCWlzTWVzc2FnZRgEIAEoCEgDUglpc01lc3NhZ2WIAQESNgoIc3ViZmllbGQYBSADKAsyGi5wcm90by5GaWVsZC5TdWJmaWVsZEVudHJ5UghzdWJmaWVsZBpJCg1TdWJmaWVsZEVudHJ5EhAKA2tleRgBIAEoDVIDa2V5EiIKBXZhbHVlGAIgASgLMgwucHJvdG8uRmllbGRSBXZhbHVlOgI4AUINCgtfbWluVmVyc2lvbkINCgtfbWF4VmVyc2lvbkIaChhfbm90UmVwb3J0YWJsZU1pblZlcnNpb25CDAoKX2lzTWVzc2FnZQ==');
@$core.Deprecated('Use forwardedAIBotMessageInfoDescriptor instead')
const ForwardedAIBotMessageInfo$json = const {
  '1': 'ForwardedAIBotMessageInfo',
  '2': const [
    const {'1': 'botName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'botName', '17': true},
    const {'1': 'botJid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'botJid', '17': true},
    const {'1': 'creatorName', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'creatorName', '17': true},
  ],
  '8': const [
    const {'1': '_botName'},
    const {'1': '_botJid'},
    const {'1': '_creatorName'},
  ],
};

/// Descriptor for `ForwardedAIBotMessageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forwardedAIBotMessageInfoDescriptor = $convert.base64Decode('ChlGb3J3YXJkZWRBSUJvdE1lc3NhZ2VJbmZvEh0KB2JvdE5hbWUYASABKAlIAFIHYm90TmFtZYgBARIbCgZib3RKaWQYAiABKAlIAVIGYm90SmlkiAEBEiUKC2NyZWF0b3JOYW1lGAMgASgJSAJSC2NyZWF0b3JOYW1liAEBQgoKCF9ib3ROYW1lQgkKB19ib3RKaWRCDgoMX2NyZWF0b3JOYW1l');
@$core.Deprecated('Use globalSettingsDescriptor instead')
const GlobalSettings$json = const {
  '1': 'GlobalSettings',
  '2': const [
    const {'1': 'lightThemeWallpaper', '3': 1, '4': 1, '5': 11, '6': '.proto.WallpaperSettings', '9': 0, '10': 'lightThemeWallpaper', '17': true},
    const {'1': 'mediaVisibility', '3': 2, '4': 1, '5': 14, '6': '.proto.MediaVisibility', '9': 1, '10': 'mediaVisibility', '17': true},
    const {'1': 'darkThemeWallpaper', '3': 3, '4': 1, '5': 11, '6': '.proto.WallpaperSettings', '9': 2, '10': 'darkThemeWallpaper', '17': true},
    const {'1': 'autoDownloadWiFi', '3': 4, '4': 1, '5': 11, '6': '.proto.AutoDownloadSettings', '9': 3, '10': 'autoDownloadWiFi', '17': true},
    const {'1': 'autoDownloadCellular', '3': 5, '4': 1, '5': 11, '6': '.proto.AutoDownloadSettings', '9': 4, '10': 'autoDownloadCellular', '17': true},
    const {'1': 'autoDownloadRoaming', '3': 6, '4': 1, '5': 11, '6': '.proto.AutoDownloadSettings', '9': 5, '10': 'autoDownloadRoaming', '17': true},
    const {'1': 'showIndividualNotificationsPreview', '3': 7, '4': 1, '5': 8, '9': 6, '10': 'showIndividualNotificationsPreview', '17': true},
    const {'1': 'showGroupNotificationsPreview', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'showGroupNotificationsPreview', '17': true},
    const {'1': 'disappearingModeDuration', '3': 9, '4': 1, '5': 5, '9': 8, '10': 'disappearingModeDuration', '17': true},
    const {'1': 'disappearingModeTimestamp', '3': 10, '4': 1, '5': 3, '9': 9, '10': 'disappearingModeTimestamp', '17': true},
    const {'1': 'avatarUserSettings', '3': 11, '4': 1, '5': 11, '6': '.proto.AvatarUserSettings', '9': 10, '10': 'avatarUserSettings', '17': true},
    const {'1': 'fontSize', '3': 12, '4': 1, '5': 5, '9': 11, '10': 'fontSize', '17': true},
    const {'1': 'securityNotifications', '3': 13, '4': 1, '5': 8, '9': 12, '10': 'securityNotifications', '17': true},
    const {'1': 'autoUnarchiveChats', '3': 14, '4': 1, '5': 8, '9': 13, '10': 'autoUnarchiveChats', '17': true},
    const {'1': 'videoQualityMode', '3': 15, '4': 1, '5': 5, '9': 14, '10': 'videoQualityMode', '17': true},
    const {'1': 'photoQualityMode', '3': 16, '4': 1, '5': 5, '9': 15, '10': 'photoQualityMode', '17': true},
    const {'1': 'individualNotificationSettings', '3': 17, '4': 1, '5': 11, '6': '.proto.NotificationSettings', '9': 16, '10': 'individualNotificationSettings', '17': true},
    const {'1': 'groupNotificationSettings', '3': 18, '4': 1, '5': 11, '6': '.proto.NotificationSettings', '9': 17, '10': 'groupNotificationSettings', '17': true},
    const {'1': 'chatLockSettings', '3': 19, '4': 1, '5': 11, '6': '.proto.ChatLockSettings', '9': 18, '10': 'chatLockSettings', '17': true},
    const {'1': 'chatDbLidMigrationTimestamp', '3': 20, '4': 1, '5': 3, '9': 19, '10': 'chatDbLidMigrationTimestamp', '17': true},
  ],
  '8': const [
    const {'1': '_lightThemeWallpaper'},
    const {'1': '_mediaVisibility'},
    const {'1': '_darkThemeWallpaper'},
    const {'1': '_autoDownloadWiFi'},
    const {'1': '_autoDownloadCellular'},
    const {'1': '_autoDownloadRoaming'},
    const {'1': '_showIndividualNotificationsPreview'},
    const {'1': '_showGroupNotificationsPreview'},
    const {'1': '_disappearingModeDuration'},
    const {'1': '_disappearingModeTimestamp'},
    const {'1': '_avatarUserSettings'},
    const {'1': '_fontSize'},
    const {'1': '_securityNotifications'},
    const {'1': '_autoUnarchiveChats'},
    const {'1': '_videoQualityMode'},
    const {'1': '_photoQualityMode'},
    const {'1': '_individualNotificationSettings'},
    const {'1': '_groupNotificationSettings'},
    const {'1': '_chatLockSettings'},
    const {'1': '_chatDbLidMigrationTimestamp'},
  ],
};

/// Descriptor for `GlobalSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List globalSettingsDescriptor = $convert.base64Decode('Cg5HbG9iYWxTZXR0aW5ncxJPChNsaWdodFRoZW1lV2FsbHBhcGVyGAEgASgLMhgucHJvdG8uV2FsbHBhcGVyU2V0dGluZ3NIAFITbGlnaHRUaGVtZVdhbGxwYXBlcogBARJFCg9tZWRpYVZpc2liaWxpdHkYAiABKA4yFi5wcm90by5NZWRpYVZpc2liaWxpdHlIAVIPbWVkaWFWaXNpYmlsaXR5iAEBEk0KEmRhcmtUaGVtZVdhbGxwYXBlchgDIAEoCzIYLnByb3RvLldhbGxwYXBlclNldHRpbmdzSAJSEmRhcmtUaGVtZVdhbGxwYXBlcogBARJMChBhdXRvRG93bmxvYWRXaUZpGAQgASgLMhsucHJvdG8uQXV0b0Rvd25sb2FkU2V0dGluZ3NIA1IQYXV0b0Rvd25sb2FkV2lGaYgBARJUChRhdXRvRG93bmxvYWRDZWxsdWxhchgFIAEoCzIbLnByb3RvLkF1dG9Eb3dubG9hZFNldHRpbmdzSARSFGF1dG9Eb3dubG9hZENlbGx1bGFyiAEBElIKE2F1dG9Eb3dubG9hZFJvYW1pbmcYBiABKAsyGy5wcm90by5BdXRvRG93bmxvYWRTZXR0aW5nc0gFUhNhdXRvRG93bmxvYWRSb2FtaW5niAEBElMKInNob3dJbmRpdmlkdWFsTm90aWZpY2F0aW9uc1ByZXZpZXcYByABKAhIBlIic2hvd0luZGl2aWR1YWxOb3RpZmljYXRpb25zUHJldmlld4gBARJJCh1zaG93R3JvdXBOb3RpZmljYXRpb25zUHJldmlldxgIIAEoCEgHUh1zaG93R3JvdXBOb3RpZmljYXRpb25zUHJldmlld4gBARI/ChhkaXNhcHBlYXJpbmdNb2RlRHVyYXRpb24YCSABKAVICFIYZGlzYXBwZWFyaW5nTW9kZUR1cmF0aW9uiAEBEkEKGWRpc2FwcGVhcmluZ01vZGVUaW1lc3RhbXAYCiABKANICVIZZGlzYXBwZWFyaW5nTW9kZVRpbWVzdGFtcIgBARJOChJhdmF0YXJVc2VyU2V0dGluZ3MYCyABKAsyGS5wcm90by5BdmF0YXJVc2VyU2V0dGluZ3NIClISYXZhdGFyVXNlclNldHRpbmdziAEBEh8KCGZvbnRTaXplGAwgASgFSAtSCGZvbnRTaXpliAEBEjkKFXNlY3VyaXR5Tm90aWZpY2F0aW9ucxgNIAEoCEgMUhVzZWN1cml0eU5vdGlmaWNhdGlvbnOIAQESMwoSYXV0b1VuYXJjaGl2ZUNoYXRzGA4gASgISA1SEmF1dG9VbmFyY2hpdmVDaGF0c4gBARIvChB2aWRlb1F1YWxpdHlNb2RlGA8gASgFSA5SEHZpZGVvUXVhbGl0eU1vZGWIAQESLwoQcGhvdG9RdWFsaXR5TW9kZRgQIAEoBUgPUhBwaG90b1F1YWxpdHlNb2RliAEBEmgKHmluZGl2aWR1YWxOb3RpZmljYXRpb25TZXR0aW5ncxgRIAEoCzIbLnByb3RvLk5vdGlmaWNhdGlvblNldHRpbmdzSBBSHmluZGl2aWR1YWxOb3RpZmljYXRpb25TZXR0aW5nc4gBARJeChlncm91cE5vdGlmaWNhdGlvblNldHRpbmdzGBIgASgLMhsucHJvdG8uTm90aWZpY2F0aW9uU2V0dGluZ3NIEVIZZ3JvdXBOb3RpZmljYXRpb25TZXR0aW5nc4gBARJIChBjaGF0TG9ja1NldHRpbmdzGBMgASgLMhcucHJvdG8uQ2hhdExvY2tTZXR0aW5nc0gSUhBjaGF0TG9ja1NldHRpbmdziAEBEkUKG2NoYXREYkxpZE1pZ3JhdGlvblRpbWVzdGFtcBgUIAEoA0gTUhtjaGF0RGJMaWRNaWdyYXRpb25UaW1lc3RhbXCIAQFCFgoUX2xpZ2h0VGhlbWVXYWxscGFwZXJCEgoQX21lZGlhVmlzaWJpbGl0eUIVChNfZGFya1RoZW1lV2FsbHBhcGVyQhMKEV9hdXRvRG93bmxvYWRXaUZpQhcKFV9hdXRvRG93bmxvYWRDZWxsdWxhckIWChRfYXV0b0Rvd25sb2FkUm9hbWluZ0IlCiNfc2hvd0luZGl2aWR1YWxOb3RpZmljYXRpb25zUHJldmlld0IgCh5fc2hvd0dyb3VwTm90aWZpY2F0aW9uc1ByZXZpZXdCGwoZX2Rpc2FwcGVhcmluZ01vZGVEdXJhdGlvbkIcChpfZGlzYXBwZWFyaW5nTW9kZVRpbWVzdGFtcEIVChNfYXZhdGFyVXNlclNldHRpbmdzQgsKCV9mb250U2l6ZUIYChZfc2VjdXJpdHlOb3RpZmljYXRpb25zQhUKE19hdXRvVW5hcmNoaXZlQ2hhdHNCEwoRX3ZpZGVvUXVhbGl0eU1vZGVCEwoRX3Bob3RvUXVhbGl0eU1vZGVCIQofX2luZGl2aWR1YWxOb3RpZmljYXRpb25TZXR0aW5nc0IcChpfZ3JvdXBOb3RpZmljYXRpb25TZXR0aW5nc0ITChFfY2hhdExvY2tTZXR0aW5nc0IeChxfY2hhdERiTGlkTWlncmF0aW9uVGltZXN0YW1w');
@$core.Deprecated('Use groupHistoryBundleInfoDescriptor instead')
const GroupHistoryBundleInfo$json = const {
  '1': 'GroupHistoryBundleInfo',
  '2': const [
    const {'1': 'deprecatedMessageHistoryBundle', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.MessageHistoryBundle', '9': 0, '10': 'deprecatedMessageHistoryBundle', '17': true},
    const {'1': 'processState', '3': 2, '4': 1, '5': 14, '6': '.proto.GroupHistoryBundleInfo.ProcessState', '9': 1, '10': 'processState', '17': true},
  ],
  '4': const [GroupHistoryBundleInfo_ProcessState$json],
  '8': const [
    const {'1': '_deprecatedMessageHistoryBundle'},
    const {'1': '_processState'},
  ],
};

@$core.Deprecated('Use groupHistoryBundleInfoDescriptor instead')
const GroupHistoryBundleInfo_ProcessState$json = const {
  '1': 'ProcessState',
  '2': const [
    const {'1': 'NOT_INJECTED', '2': 0},
    const {'1': 'INJECTED', '2': 1},
    const {'1': 'INJECTED_PARTIAL', '2': 2},
    const {'1': 'INJECTION_FAILED', '2': 3},
    const {'1': 'INJECTION_FAILED_NO_RETRY', '2': 4},
  ],
};

/// Descriptor for `GroupHistoryBundleInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupHistoryBundleInfoDescriptor = $convert.base64Decode('ChZHcm91cEhpc3RvcnlCdW5kbGVJbmZvEnAKHmRlcHJlY2F0ZWRNZXNzYWdlSGlzdG9yeUJ1bmRsZRgBIAEoCzIjLnByb3RvLk1lc3NhZ2UuTWVzc2FnZUhpc3RvcnlCdW5kbGVIAFIeZGVwcmVjYXRlZE1lc3NhZ2VIaXN0b3J5QnVuZGxliAEBElMKDHByb2Nlc3NTdGF0ZRgCIAEoDjIqLnByb3RvLkdyb3VwSGlzdG9yeUJ1bmRsZUluZm8uUHJvY2Vzc1N0YXRlSAFSDHByb2Nlc3NTdGF0ZYgBASJ5CgxQcm9jZXNzU3RhdGUSEAoMTk9UX0lOSkVDVEVEEAASDAoISU5KRUNURUQQARIUChBJTkpFQ1RFRF9QQVJUSUFMEAISFAoQSU5KRUNUSU9OX0ZBSUxFRBADEh0KGUlOSkVDVElPTl9GQUlMRURfTk9fUkVUUlkQBEIhCh9fZGVwcmVjYXRlZE1lc3NhZ2VIaXN0b3J5QnVuZGxlQg8KDV9wcm9jZXNzU3RhdGU=');
@$core.Deprecated('Use groupHistoryIndividualMessageInfoDescriptor instead')
const GroupHistoryIndividualMessageInfo$json = const {
  '1': 'GroupHistoryIndividualMessageInfo',
  '2': const [
    const {'1': 'bundleMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'bundleMessageKey', '17': true},
    const {'1': 'editedAfterReceivedAsHistory', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'editedAfterReceivedAsHistory', '17': true},
  ],
  '8': const [
    const {'1': '_bundleMessageKey'},
    const {'1': '_editedAfterReceivedAsHistory'},
  ],
};

/// Descriptor for `GroupHistoryIndividualMessageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupHistoryIndividualMessageInfoDescriptor = $convert.base64Decode('CiFHcm91cEhpc3RvcnlJbmRpdmlkdWFsTWVzc2FnZUluZm8SQgoQYnVuZGxlTWVzc2FnZUtleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIQYnVuZGxlTWVzc2FnZUtleYgBARJHChxlZGl0ZWRBZnRlclJlY2VpdmVkQXNIaXN0b3J5GAIgASgISAFSHGVkaXRlZEFmdGVyUmVjZWl2ZWRBc0hpc3RvcnmIAQFCEwoRX2J1bmRsZU1lc3NhZ2VLZXlCHwodX2VkaXRlZEFmdGVyUmVjZWl2ZWRBc0hpc3Rvcnk=');
@$core.Deprecated('Use groupMentionDescriptor instead')
const GroupMention$json = const {
  '1': 'GroupMention',
  '2': const [
    const {'1': 'groupJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'groupJid', '17': true},
    const {'1': 'groupSubject', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'groupSubject', '17': true},
  ],
  '8': const [
    const {'1': '_groupJid'},
    const {'1': '_groupSubject'},
  ],
};

/// Descriptor for `GroupMention`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupMentionDescriptor = $convert.base64Decode('CgxHcm91cE1lbnRpb24SHwoIZ3JvdXBKaWQYASABKAlIAFIIZ3JvdXBKaWSIAQESJwoMZ3JvdXBTdWJqZWN0GAIgASgJSAFSDGdyb3VwU3ViamVjdIgBAUILCglfZ3JvdXBKaWRCDwoNX2dyb3VwU3ViamVjdA==');
@$core.Deprecated('Use groupParticipantDescriptor instead')
const GroupParticipant$json = const {
  '1': 'GroupParticipant',
  '2': const [
    const {'1': 'userJid', '3': 1, '4': 1, '5': 9, '10': 'userJid'},
    const {'1': 'rank', '3': 2, '4': 1, '5': 14, '6': '.proto.GroupParticipant.Rank', '9': 0, '10': 'rank', '17': true},
    const {'1': 'memberLabel', '3': 3, '4': 1, '5': 11, '6': '.proto.MemberLabel', '9': 1, '10': 'memberLabel', '17': true},
  ],
  '4': const [GroupParticipant_Rank$json],
  '8': const [
    const {'1': '_rank'},
    const {'1': '_memberLabel'},
  ],
};

@$core.Deprecated('Use groupParticipantDescriptor instead')
const GroupParticipant_Rank$json = const {
  '1': 'Rank',
  '2': const [
    const {'1': 'REGULAR', '2': 0},
    const {'1': 'ADMIN', '2': 1},
    const {'1': 'SUPERADMIN', '2': 2},
  ],
};

/// Descriptor for `GroupParticipant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List groupParticipantDescriptor = $convert.base64Decode('ChBHcm91cFBhcnRpY2lwYW50EhgKB3VzZXJKaWQYASABKAlSB3VzZXJKaWQSNQoEcmFuaxgCIAEoDjIcLnByb3RvLkdyb3VwUGFydGljaXBhbnQuUmFua0gAUgRyYW5riAEBEjkKC21lbWJlckxhYmVsGAMgASgLMhIucHJvdG8uTWVtYmVyTGFiZWxIAVILbWVtYmVyTGFiZWyIAQEiLgoEUmFuaxILCgdSRUdVTEFSEAASCQoFQURNSU4QARIOCgpTVVBFUkFETUlOEAJCBwoFX3JhbmtCDgoMX21lbWJlckxhYmVs');
@$core.Deprecated('Use handshakeMessageDescriptor instead')
const HandshakeMessage$json = const {
  '1': 'HandshakeMessage',
  '2': const [
    const {'1': 'clientHello', '3': 2, '4': 1, '5': 11, '6': '.proto.HandshakeMessage.ClientHello', '9': 0, '10': 'clientHello', '17': true},
    const {'1': 'serverHello', '3': 3, '4': 1, '5': 11, '6': '.proto.HandshakeMessage.ServerHello', '9': 1, '10': 'serverHello', '17': true},
    const {'1': 'clientFinish', '3': 4, '4': 1, '5': 11, '6': '.proto.HandshakeMessage.ClientFinish', '9': 2, '10': 'clientFinish', '17': true},
  ],
  '3': const [HandshakeMessage_ClientFinish$json, HandshakeMessage_ClientHello$json, HandshakeMessage_ServerHello$json],
  '8': const [
    const {'1': '_clientHello'},
    const {'1': '_serverHello'},
    const {'1': '_clientFinish'},
  ],
};

@$core.Deprecated('Use handshakeMessageDescriptor instead')
const HandshakeMessage_ClientFinish$json = const {
  '1': 'ClientFinish',
  '2': const [
    const {'1': 'static', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'static', '17': true},
    const {'1': 'payload', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'payload', '17': true},
    const {'1': 'extendedCiphertext', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'extendedCiphertext', '17': true},
  ],
  '8': const [
    const {'1': '_static'},
    const {'1': '_payload'},
    const {'1': '_extendedCiphertext'},
  ],
};

@$core.Deprecated('Use handshakeMessageDescriptor instead')
const HandshakeMessage_ClientHello$json = const {
  '1': 'ClientHello',
  '2': const [
    const {'1': 'ephemeral', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'ephemeral', '17': true},
    const {'1': 'static', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'static', '17': true},
    const {'1': 'payload', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'payload', '17': true},
    const {'1': 'useExtended', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'useExtended', '17': true},
    const {'1': 'extendedCiphertext', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'extendedCiphertext', '17': true},
  ],
  '8': const [
    const {'1': '_ephemeral'},
    const {'1': '_static'},
    const {'1': '_payload'},
    const {'1': '_useExtended'},
    const {'1': '_extendedCiphertext'},
  ],
};

@$core.Deprecated('Use handshakeMessageDescriptor instead')
const HandshakeMessage_ServerHello$json = const {
  '1': 'ServerHello',
  '2': const [
    const {'1': 'ephemeral', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'ephemeral', '17': true},
    const {'1': 'static', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'static', '17': true},
    const {'1': 'payload', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'payload', '17': true},
    const {'1': 'extendedStatic', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'extendedStatic', '17': true},
  ],
  '8': const [
    const {'1': '_ephemeral'},
    const {'1': '_static'},
    const {'1': '_payload'},
    const {'1': '_extendedStatic'},
  ],
};

/// Descriptor for `HandshakeMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List handshakeMessageDescriptor = $convert.base64Decode('ChBIYW5kc2hha2VNZXNzYWdlEkoKC2NsaWVudEhlbGxvGAIgASgLMiMucHJvdG8uSGFuZHNoYWtlTWVzc2FnZS5DbGllbnRIZWxsb0gAUgtjbGllbnRIZWxsb4gBARJKCgtzZXJ2ZXJIZWxsbxgDIAEoCzIjLnByb3RvLkhhbmRzaGFrZU1lc3NhZ2UuU2VydmVySGVsbG9IAVILc2VydmVySGVsbG+IAQESTQoMY2xpZW50RmluaXNoGAQgASgLMiQucHJvdG8uSGFuZHNoYWtlTWVzc2FnZS5DbGllbnRGaW5pc2hIAlIMY2xpZW50RmluaXNoiAEBGq0BCgxDbGllbnRGaW5pc2gSGwoGc3RhdGljGAEgASgMSABSBnN0YXRpY4gBARIdCgdwYXlsb2FkGAIgASgMSAFSB3BheWxvYWSIAQESMwoSZXh0ZW5kZWRDaXBoZXJ0ZXh0GAMgASgMSAJSEmV4dGVuZGVkQ2lwaGVydGV4dIgBAUIJCgdfc3RhdGljQgoKCF9wYXlsb2FkQhUKE19leHRlbmRlZENpcGhlcnRleHQalAIKC0NsaWVudEhlbGxvEiEKCWVwaGVtZXJhbBgBIAEoDEgAUgllcGhlbWVyYWyIAQESGwoGc3RhdGljGAIgASgMSAFSBnN0YXRpY4gBARIdCgdwYXlsb2FkGAMgASgMSAJSB3BheWxvYWSIAQESJQoLdXNlRXh0ZW5kZWQYBCABKAhIA1ILdXNlRXh0ZW5kZWSIAQESMwoSZXh0ZW5kZWRDaXBoZXJ0ZXh0GAUgASgMSARSEmV4dGVuZGVkQ2lwaGVydGV4dIgBAUIMCgpfZXBoZW1lcmFsQgkKB19zdGF0aWNCCgoIX3BheWxvYWRCDgoMX3VzZUV4dGVuZGVkQhUKE19leHRlbmRlZENpcGhlcnRleHQa0QEKC1NlcnZlckhlbGxvEiEKCWVwaGVtZXJhbBgBIAEoDEgAUgllcGhlbWVyYWyIAQESGwoGc3RhdGljGAIgASgMSAFSBnN0YXRpY4gBARIdCgdwYXlsb2FkGAMgASgMSAJSB3BheWxvYWSIAQESKwoOZXh0ZW5kZWRTdGF0aWMYBCABKAxIA1IOZXh0ZW5kZWRTdGF0aWOIAQFCDAoKX2VwaGVtZXJhbEIJCgdfc3RhdGljQgoKCF9wYXlsb2FkQhEKD19leHRlbmRlZFN0YXRpY0IOCgxfY2xpZW50SGVsbG9CDgoMX3NlcnZlckhlbGxvQg8KDV9jbGllbnRGaW5pc2g=');
@$core.Deprecated('Use historySyncDescriptor instead')
const HistorySync$json = const {
  '1': 'HistorySync',
  '2': const [
    const {'1': 'syncType', '3': 1, '4': 1, '5': 14, '6': '.proto.HistorySync.HistorySyncType', '10': 'syncType'},
    const {'1': 'conversations', '3': 2, '4': 3, '5': 11, '6': '.proto.Conversation', '10': 'conversations'},
    const {'1': 'statusV3Messages', '3': 3, '4': 3, '5': 11, '6': '.proto.WebMessageInfo', '10': 'statusV3Messages'},
    const {'1': 'chunkOrder', '3': 5, '4': 1, '5': 13, '9': 0, '10': 'chunkOrder', '17': true},
    const {'1': 'progress', '3': 6, '4': 1, '5': 13, '9': 1, '10': 'progress', '17': true},
    const {'1': 'pushnames', '3': 7, '4': 3, '5': 11, '6': '.proto.Pushname', '10': 'pushnames'},
    const {'1': 'globalSettings', '3': 8, '4': 1, '5': 11, '6': '.proto.GlobalSettings', '9': 2, '10': 'globalSettings', '17': true},
    const {'1': 'threadIdUserSecret', '3': 9, '4': 1, '5': 12, '9': 3, '10': 'threadIdUserSecret', '17': true},
    const {'1': 'threadDsTimeframeOffset', '3': 10, '4': 1, '5': 13, '9': 4, '10': 'threadDsTimeframeOffset', '17': true},
    const {'1': 'recentStickers', '3': 11, '4': 3, '5': 11, '6': '.proto.StickerMetadata', '10': 'recentStickers'},
    const {'1': 'pastParticipants', '3': 12, '4': 3, '5': 11, '6': '.proto.PastParticipants', '10': 'pastParticipants'},
    const {'1': 'callLogRecords', '3': 13, '4': 3, '5': 11, '6': '.proto.CallLogRecord', '10': 'callLogRecords'},
    const {'1': 'aiWaitListState', '3': 14, '4': 1, '5': 14, '6': '.proto.HistorySync.BotAIWaitListState', '9': 5, '10': 'aiWaitListState', '17': true},
    const {'1': 'phoneNumberToLidMappings', '3': 15, '4': 3, '5': 11, '6': '.proto.PhoneNumberToLIDMapping', '10': 'phoneNumberToLidMappings'},
    const {'1': 'companionMetaNonce', '3': 16, '4': 1, '5': 9, '9': 6, '10': 'companionMetaNonce', '17': true},
    const {'1': 'shareableChatIdentifierEncryptionKey', '3': 17, '4': 1, '5': 12, '9': 7, '10': 'shareableChatIdentifierEncryptionKey', '17': true},
    const {'1': 'accounts', '3': 18, '4': 3, '5': 11, '6': '.proto.Account', '10': 'accounts'},
  ],
  '4': const [HistorySync_BotAIWaitListState$json, HistorySync_HistorySyncType$json],
  '8': const [
    const {'1': '_chunkOrder'},
    const {'1': '_progress'},
    const {'1': '_globalSettings'},
    const {'1': '_threadIdUserSecret'},
    const {'1': '_threadDsTimeframeOffset'},
    const {'1': '_aiWaitListState'},
    const {'1': '_companionMetaNonce'},
    const {'1': '_shareableChatIdentifierEncryptionKey'},
  ],
};

@$core.Deprecated('Use historySyncDescriptor instead')
const HistorySync_BotAIWaitListState$json = const {
  '1': 'BotAIWaitListState',
  '2': const [
    const {'1': 'IN_WAITLIST', '2': 0},
    const {'1': 'AI_AVAILABLE', '2': 1},
  ],
};

@$core.Deprecated('Use historySyncDescriptor instead')
const HistorySync_HistorySyncType$json = const {
  '1': 'HistorySyncType',
  '2': const [
    const {'1': 'INITIAL_BOOTSTRAP', '2': 0},
    const {'1': 'INITIAL_STATUS_V3', '2': 1},
    const {'1': 'FULL', '2': 2},
    const {'1': 'RECENT', '2': 3},
    const {'1': 'PUSH_NAME', '2': 4},
    const {'1': 'NON_BLOCKING_DATA', '2': 5},
    const {'1': 'ON_DEMAND', '2': 6},
  ],
};

/// Descriptor for `HistorySync`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List historySyncDescriptor = $convert.base64Decode('CgtIaXN0b3J5U3luYxI+CghzeW5jVHlwZRgBIAEoDjIiLnByb3RvLkhpc3RvcnlTeW5jLkhpc3RvcnlTeW5jVHlwZVIIc3luY1R5cGUSOQoNY29udmVyc2F0aW9ucxgCIAMoCzITLnByb3RvLkNvbnZlcnNhdGlvblINY29udmVyc2F0aW9ucxJBChBzdGF0dXNWM01lc3NhZ2VzGAMgAygLMhUucHJvdG8uV2ViTWVzc2FnZUluZm9SEHN0YXR1c1YzTWVzc2FnZXMSIwoKY2h1bmtPcmRlchgFIAEoDUgAUgpjaHVua09yZGVyiAEBEh8KCHByb2dyZXNzGAYgASgNSAFSCHByb2dyZXNziAEBEi0KCXB1c2huYW1lcxgHIAMoCzIPLnByb3RvLlB1c2huYW1lUglwdXNobmFtZXMSQgoOZ2xvYmFsU2V0dGluZ3MYCCABKAsyFS5wcm90by5HbG9iYWxTZXR0aW5nc0gCUg5nbG9iYWxTZXR0aW5nc4gBARIzChJ0aHJlYWRJZFVzZXJTZWNyZXQYCSABKAxIA1ISdGhyZWFkSWRVc2VyU2VjcmV0iAEBEj0KF3RocmVhZERzVGltZWZyYW1lT2Zmc2V0GAogASgNSARSF3RocmVhZERzVGltZWZyYW1lT2Zmc2V0iAEBEj4KDnJlY2VudFN0aWNrZXJzGAsgAygLMhYucHJvdG8uU3RpY2tlck1ldGFkYXRhUg5yZWNlbnRTdGlja2VycxJDChBwYXN0UGFydGljaXBhbnRzGAwgAygLMhcucHJvdG8uUGFzdFBhcnRpY2lwYW50c1IQcGFzdFBhcnRpY2lwYW50cxI8Cg5jYWxsTG9nUmVjb3JkcxgNIAMoCzIULnByb3RvLkNhbGxMb2dSZWNvcmRSDmNhbGxMb2dSZWNvcmRzElQKD2FpV2FpdExpc3RTdGF0ZRgOIAEoDjIlLnByb3RvLkhpc3RvcnlTeW5jLkJvdEFJV2FpdExpc3RTdGF0ZUgFUg9haVdhaXRMaXN0U3RhdGWIAQESWgoYcGhvbmVOdW1iZXJUb0xpZE1hcHBpbmdzGA8gAygLMh4ucHJvdG8uUGhvbmVOdW1iZXJUb0xJRE1hcHBpbmdSGHBob25lTnVtYmVyVG9MaWRNYXBwaW5ncxIzChJjb21wYW5pb25NZXRhTm9uY2UYECABKAlIBlISY29tcGFuaW9uTWV0YU5vbmNliAEBElcKJHNoYXJlYWJsZUNoYXRJZGVudGlmaWVyRW5jcnlwdGlvbktleRgRIAEoDEgHUiRzaGFyZWFibGVDaGF0SWRlbnRpZmllckVuY3J5cHRpb25LZXmIAQESKgoIYWNjb3VudHMYEiADKAsyDi5wcm90by5BY2NvdW50UghhY2NvdW50cyI3ChJCb3RBSVdhaXRMaXN0U3RhdGUSDwoLSU5fV0FJVExJU1QQABIQCgxBSV9BVkFJTEFCTEUQASKKAQoPSGlzdG9yeVN5bmNUeXBlEhUKEUlOSVRJQUxfQk9PVFNUUkFQEAASFQoRSU5JVElBTF9TVEFUVVNfVjMQARIICgRGVUxMEAISCgoGUkVDRU5UEAMSDQoJUFVTSF9OQU1FEAQSFQoRTk9OX0JMT0NLSU5HX0RBVEEQBRINCglPTl9ERU1BTkQQBkINCgtfY2h1bmtPcmRlckILCglfcHJvZ3Jlc3NCEQoPX2dsb2JhbFNldHRpbmdzQhUKE190aHJlYWRJZFVzZXJTZWNyZXRCGgoYX3RocmVhZERzVGltZWZyYW1lT2Zmc2V0QhIKEF9haVdhaXRMaXN0U3RhdGVCFQoTX2NvbXBhbmlvbk1ldGFOb25jZUInCiVfc2hhcmVhYmxlQ2hhdElkZW50aWZpZXJFbmNyeXB0aW9uS2V5');
@$core.Deprecated('Use historySyncMsgDescriptor instead')
const HistorySyncMsg$json = const {
  '1': 'HistorySyncMsg',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.proto.WebMessageInfo', '9': 0, '10': 'message', '17': true},
    const {'1': 'msgOrderId', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'msgOrderId', '17': true},
  ],
  '8': const [
    const {'1': '_message'},
    const {'1': '_msgOrderId'},
  ],
};

/// Descriptor for `HistorySyncMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List historySyncMsgDescriptor = $convert.base64Decode('Cg5IaXN0b3J5U3luY01zZxI0CgdtZXNzYWdlGAEgASgLMhUucHJvdG8uV2ViTWVzc2FnZUluZm9IAFIHbWVzc2FnZYgBARIjCgptc2dPcmRlcklkGAIgASgESAFSCm1zZ09yZGVySWSIAQFCCgoIX21lc3NhZ2VCDQoLX21zZ09yZGVySWQ=');
@$core.Deprecated('Use hydratedTemplateButtonDescriptor instead')
const HydratedTemplateButton$json = const {
  '1': 'HydratedTemplateButton',
  '2': const [
    const {'1': 'index', '3': 4, '4': 1, '5': 13, '9': 1, '10': 'index', '17': true},
    const {'1': 'quickReplyButton', '3': 1, '4': 1, '5': 11, '6': '.proto.HydratedTemplateButton.HydratedQuickReplyButton', '9': 0, '10': 'quickReplyButton'},
    const {'1': 'urlButton', '3': 2, '4': 1, '5': 11, '6': '.proto.HydratedTemplateButton.HydratedURLButton', '9': 0, '10': 'urlButton'},
    const {'1': 'callButton', '3': 3, '4': 1, '5': 11, '6': '.proto.HydratedTemplateButton.HydratedCallButton', '9': 0, '10': 'callButton'},
  ],
  '3': const [HydratedTemplateButton_HydratedCallButton$json, HydratedTemplateButton_HydratedQuickReplyButton$json, HydratedTemplateButton_HydratedURLButton$json],
  '8': const [
    const {'1': 'hydratedButton'},
    const {'1': '_index'},
  ],
};

@$core.Deprecated('Use hydratedTemplateButtonDescriptor instead')
const HydratedTemplateButton_HydratedCallButton$json = const {
  '1': 'HydratedCallButton',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayText', '17': true},
    const {'1': 'phoneNumber', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'phoneNumber', '17': true},
  ],
  '8': const [
    const {'1': '_displayText'},
    const {'1': '_phoneNumber'},
  ],
};

@$core.Deprecated('Use hydratedTemplateButtonDescriptor instead')
const HydratedTemplateButton_HydratedQuickReplyButton$json = const {
  '1': 'HydratedQuickReplyButton',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayText', '17': true},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'id', '17': true},
  ],
  '8': const [
    const {'1': '_displayText'},
    const {'1': '_id'},
  ],
};

@$core.Deprecated('Use hydratedTemplateButtonDescriptor instead')
const HydratedTemplateButton_HydratedURLButton$json = const {
  '1': 'HydratedURLButton',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayText', '17': true},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'url', '17': true},
    const {'1': 'consentedUsersUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'consentedUsersUrl', '17': true},
    const {'1': 'webviewPresentation', '3': 4, '4': 1, '5': 14, '6': '.proto.HydratedTemplateButton.HydratedURLButton.WebviewPresentationType', '9': 3, '10': 'webviewPresentation', '17': true},
  ],
  '4': const [HydratedTemplateButton_HydratedURLButton_WebviewPresentationType$json],
  '8': const [
    const {'1': '_displayText'},
    const {'1': '_url'},
    const {'1': '_consentedUsersUrl'},
    const {'1': '_webviewPresentation'},
  ],
};

@$core.Deprecated('Use hydratedTemplateButtonDescriptor instead')
const HydratedTemplateButton_HydratedURLButton_WebviewPresentationType$json = const {
  '1': 'WebviewPresentationType',
  '2': const [
    const {'1': 'UNKNOWN_WEBVIEWPRESENTATIONTYPE_ZERO', '2': 0},
    const {'1': 'FULL', '2': 1},
    const {'1': 'TALL', '2': 2},
    const {'1': 'COMPACT', '2': 3},
  ],
};

/// Descriptor for `HydratedTemplateButton`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hydratedTemplateButtonDescriptor = $convert.base64Decode('ChZIeWRyYXRlZFRlbXBsYXRlQnV0dG9uEhkKBWluZGV4GAQgASgNSAFSBWluZGV4iAEBEmQKEHF1aWNrUmVwbHlCdXR0b24YASABKAsyNi5wcm90by5IeWRyYXRlZFRlbXBsYXRlQnV0dG9uLkh5ZHJhdGVkUXVpY2tSZXBseUJ1dHRvbkgAUhBxdWlja1JlcGx5QnV0dG9uEk8KCXVybEJ1dHRvbhgCIAEoCzIvLnByb3RvLkh5ZHJhdGVkVGVtcGxhdGVCdXR0b24uSHlkcmF0ZWRVUkxCdXR0b25IAFIJdXJsQnV0dG9uElIKCmNhbGxCdXR0b24YAyABKAsyMC5wcm90by5IeWRyYXRlZFRlbXBsYXRlQnV0dG9uLkh5ZHJhdGVkQ2FsbEJ1dHRvbkgAUgpjYWxsQnV0dG9uGoIBChJIeWRyYXRlZENhbGxCdXR0b24SJQoLZGlzcGxheVRleHQYASABKAlIAFILZGlzcGxheVRleHSIAQESJQoLcGhvbmVOdW1iZXIYAiABKAlIAVILcGhvbmVOdW1iZXKIAQFCDgoMX2Rpc3BsYXlUZXh0Qg4KDF9waG9uZU51bWJlchptChhIeWRyYXRlZFF1aWNrUmVwbHlCdXR0b24SJQoLZGlzcGxheVRleHQYASABKAlIAFILZGlzcGxheVRleHSIAQESEwoCaWQYAiABKAlIAVICaWSIAQFCDgoMX2Rpc3BsYXlUZXh0QgUKA19pZBqwAwoRSHlkcmF0ZWRVUkxCdXR0b24SJQoLZGlzcGxheVRleHQYASABKAlIAFILZGlzcGxheVRleHSIAQESFQoDdXJsGAIgASgJSAFSA3VybIgBARIxChFjb25zZW50ZWRVc2Vyc1VybBgDIAEoCUgCUhFjb25zZW50ZWRVc2Vyc1VybIgBARJ+ChN3ZWJ2aWV3UHJlc2VudGF0aW9uGAQgASgOMkcucHJvdG8uSHlkcmF0ZWRUZW1wbGF0ZUJ1dHRvbi5IeWRyYXRlZFVSTEJ1dHRvbi5XZWJ2aWV3UHJlc2VudGF0aW9uVHlwZUgDUhN3ZWJ2aWV3UHJlc2VudGF0aW9uiAEBImQKF1dlYnZpZXdQcmVzZW50YXRpb25UeXBlEigKJFVOS05PV05fV0VCVklFV1BSRVNFTlRBVElPTlRZUEVfWkVSTxAAEggKBEZVTEwQARIICgRUQUxMEAISCwoHQ09NUEFDVBADQg4KDF9kaXNwbGF5VGV4dEIGCgRfdXJsQhQKEl9jb25zZW50ZWRVc2Vyc1VybEIWChRfd2Vidmlld1ByZXNlbnRhdGlvbkIQCg5oeWRyYXRlZEJ1dHRvbkIICgZfaW5kZXg=');
@$core.Deprecated('Use identityKeyPairStructureDescriptor instead')
const IdentityKeyPairStructure$json = const {
  '1': 'IdentityKeyPairStructure',
  '2': const [
    const {'1': 'publicKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'publicKey', '17': true},
    const {'1': 'privateKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'privateKey', '17': true},
  ],
  '8': const [
    const {'1': '_publicKey'},
    const {'1': '_privateKey'},
  ],
};

/// Descriptor for `IdentityKeyPairStructure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List identityKeyPairStructureDescriptor = $convert.base64Decode('ChhJZGVudGl0eUtleVBhaXJTdHJ1Y3R1cmUSIQoJcHVibGljS2V5GAEgASgMSABSCXB1YmxpY0tleYgBARIjCgpwcml2YXRlS2V5GAIgASgMSAFSCnByaXZhdGVLZXmIAQFCDAoKX3B1YmxpY0tleUINCgtfcHJpdmF0ZUtleQ==');
@$core.Deprecated('Use inThreadSurveyMetadataDescriptor instead')
const InThreadSurveyMetadata$json = const {
  '1': 'InThreadSurveyMetadata',
  '2': const [
    const {'1': 'tessaSessionId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'tessaSessionId', '17': true},
    const {'1': 'simonSessionId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'simonSessionId', '17': true},
    const {'1': 'simonSurveyId', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'simonSurveyId', '17': true},
    const {'1': 'tessaRootId', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'tessaRootId', '17': true},
    const {'1': 'requestId', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'requestId', '17': true},
    const {'1': 'tessaEvent', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'tessaEvent', '17': true},
    const {'1': 'invitationHeaderText', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'invitationHeaderText', '17': true},
    const {'1': 'invitationBodyText', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'invitationBodyText', '17': true},
    const {'1': 'invitationCtaText', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'invitationCtaText', '17': true},
    const {'1': 'invitationCtaUrl', '3': 10, '4': 1, '5': 9, '9': 9, '10': 'invitationCtaUrl', '17': true},
    const {'1': 'surveyTitle', '3': 11, '4': 1, '5': 9, '9': 10, '10': 'surveyTitle', '17': true},
    const {'1': 'questions', '3': 12, '4': 3, '5': 11, '6': '.proto.InThreadSurveyMetadata.InThreadSurveyQuestion', '10': 'questions'},
    const {'1': 'surveyContinueButtonText', '3': 13, '4': 1, '5': 9, '9': 11, '10': 'surveyContinueButtonText', '17': true},
    const {'1': 'surveySubmitButtonText', '3': 14, '4': 1, '5': 9, '9': 12, '10': 'surveySubmitButtonText', '17': true},
    const {'1': 'privacyStatementFull', '3': 15, '4': 1, '5': 9, '9': 13, '10': 'privacyStatementFull', '17': true},
    const {'1': 'privacyStatementParts', '3': 16, '4': 3, '5': 11, '6': '.proto.InThreadSurveyMetadata.InThreadSurveyPrivacyStatementPart', '10': 'privacyStatementParts'},
    const {'1': 'feedbackToastText', '3': 17, '4': 1, '5': 9, '9': 14, '10': 'feedbackToastText', '17': true},
  ],
  '3': const [InThreadSurveyMetadata_InThreadSurveyOption$json, InThreadSurveyMetadata_InThreadSurveyPrivacyStatementPart$json, InThreadSurveyMetadata_InThreadSurveyQuestion$json],
  '8': const [
    const {'1': '_tessaSessionId'},
    const {'1': '_simonSessionId'},
    const {'1': '_simonSurveyId'},
    const {'1': '_tessaRootId'},
    const {'1': '_requestId'},
    const {'1': '_tessaEvent'},
    const {'1': '_invitationHeaderText'},
    const {'1': '_invitationBodyText'},
    const {'1': '_invitationCtaText'},
    const {'1': '_invitationCtaUrl'},
    const {'1': '_surveyTitle'},
    const {'1': '_surveyContinueButtonText'},
    const {'1': '_surveySubmitButtonText'},
    const {'1': '_privacyStatementFull'},
    const {'1': '_feedbackToastText'},
  ],
};

@$core.Deprecated('Use inThreadSurveyMetadataDescriptor instead')
const InThreadSurveyMetadata_InThreadSurveyOption$json = const {
  '1': 'InThreadSurveyOption',
  '2': const [
    const {'1': 'stringValue', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stringValue', '17': true},
    const {'1': 'numericValue', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'numericValue', '17': true},
    const {'1': 'textTranslated', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'textTranslated', '17': true},
  ],
  '8': const [
    const {'1': '_stringValue'},
    const {'1': '_numericValue'},
    const {'1': '_textTranslated'},
  ],
};

@$core.Deprecated('Use inThreadSurveyMetadataDescriptor instead')
const InThreadSurveyMetadata_InThreadSurveyPrivacyStatementPart$json = const {
  '1': 'InThreadSurveyPrivacyStatementPart',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'url', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'url', '17': true},
  ],
  '8': const [
    const {'1': '_text'},
    const {'1': '_url'},
  ],
};

@$core.Deprecated('Use inThreadSurveyMetadataDescriptor instead')
const InThreadSurveyMetadata_InThreadSurveyQuestion$json = const {
  '1': 'InThreadSurveyQuestion',
  '2': const [
    const {'1': 'questionText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'questionText', '17': true},
    const {'1': 'questionId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'questionId', '17': true},
    const {'1': 'questionOptions', '3': 3, '4': 3, '5': 11, '6': '.proto.InThreadSurveyMetadata.InThreadSurveyOption', '10': 'questionOptions'},
  ],
  '8': const [
    const {'1': '_questionText'},
    const {'1': '_questionId'},
  ],
};

/// Descriptor for `InThreadSurveyMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inThreadSurveyMetadataDescriptor = $convert.base64Decode('ChZJblRocmVhZFN1cnZleU1ldGFkYXRhEisKDnRlc3NhU2Vzc2lvbklkGAEgASgJSABSDnRlc3NhU2Vzc2lvbklkiAEBEisKDnNpbW9uU2Vzc2lvbklkGAIgASgJSAFSDnNpbW9uU2Vzc2lvbklkiAEBEikKDXNpbW9uU3VydmV5SWQYAyABKAlIAlINc2ltb25TdXJ2ZXlJZIgBARIlCgt0ZXNzYVJvb3RJZBgEIAEoCUgDUgt0ZXNzYVJvb3RJZIgBARIhCglyZXF1ZXN0SWQYBSABKAlIBFIJcmVxdWVzdElkiAEBEiMKCnRlc3NhRXZlbnQYBiABKAlIBVIKdGVzc2FFdmVudIgBARI3ChRpbnZpdGF0aW9uSGVhZGVyVGV4dBgHIAEoCUgGUhRpbnZpdGF0aW9uSGVhZGVyVGV4dIgBARIzChJpbnZpdGF0aW9uQm9keVRleHQYCCABKAlIB1ISaW52aXRhdGlvbkJvZHlUZXh0iAEBEjEKEWludml0YXRpb25DdGFUZXh0GAkgASgJSAhSEWludml0YXRpb25DdGFUZXh0iAEBEi8KEGludml0YXRpb25DdGFVcmwYCiABKAlICVIQaW52aXRhdGlvbkN0YVVybIgBARIlCgtzdXJ2ZXlUaXRsZRgLIAEoCUgKUgtzdXJ2ZXlUaXRsZYgBARJSCglxdWVzdGlvbnMYDCADKAsyNC5wcm90by5JblRocmVhZFN1cnZleU1ldGFkYXRhLkluVGhyZWFkU3VydmV5UXVlc3Rpb25SCXF1ZXN0aW9ucxI/ChhzdXJ2ZXlDb250aW51ZUJ1dHRvblRleHQYDSABKAlIC1IYc3VydmV5Q29udGludWVCdXR0b25UZXh0iAEBEjsKFnN1cnZleVN1Ym1pdEJ1dHRvblRleHQYDiABKAlIDFIWc3VydmV5U3VibWl0QnV0dG9uVGV4dIgBARI3ChRwcml2YWN5U3RhdGVtZW50RnVsbBgPIAEoCUgNUhRwcml2YWN5U3RhdGVtZW50RnVsbIgBARJ2ChVwcml2YWN5U3RhdGVtZW50UGFydHMYECADKAsyQC5wcm90by5JblRocmVhZFN1cnZleU1ldGFkYXRhLkluVGhyZWFkU3VydmV5UHJpdmFjeVN0YXRlbWVudFBhcnRSFXByaXZhY3lTdGF0ZW1lbnRQYXJ0cxIxChFmZWVkYmFja1RvYXN0VGV4dBgRIAEoCUgOUhFmZWVkYmFja1RvYXN0VGV4dIgBARrHAQoUSW5UaHJlYWRTdXJ2ZXlPcHRpb24SJQoLc3RyaW5nVmFsdWUYASABKAlIAFILc3RyaW5nVmFsdWWIAQESJwoMbnVtZXJpY1ZhbHVlGAIgASgNSAFSDG51bWVyaWNWYWx1ZYgBARIrCg50ZXh0VHJhbnNsYXRlZBgDIAEoCUgCUg50ZXh0VHJhbnNsYXRlZIgBAUIOCgxfc3RyaW5nVmFsdWVCDwoNX251bWVyaWNWYWx1ZUIRCg9fdGV4dFRyYW5zbGF0ZWQaZQoiSW5UaHJlYWRTdXJ2ZXlQcml2YWN5U3RhdGVtZW50UGFydBIXCgR0ZXh0GAEgASgJSABSBHRleHSIAQESFQoDdXJsGAIgASgJSAFSA3VybIgBAUIHCgVfdGV4dEIGCgRfdXJsGuQBChZJblRocmVhZFN1cnZleVF1ZXN0aW9uEicKDHF1ZXN0aW9uVGV4dBgBIAEoCUgAUgxxdWVzdGlvblRleHSIAQESIwoKcXVlc3Rpb25JZBgCIAEoCUgBUgpxdWVzdGlvbklkiAEBElwKD3F1ZXN0aW9uT3B0aW9ucxgDIAMoCzIyLnByb3RvLkluVGhyZWFkU3VydmV5TWV0YWRhdGEuSW5UaHJlYWRTdXJ2ZXlPcHRpb25SD3F1ZXN0aW9uT3B0aW9uc0IPCg1fcXVlc3Rpb25UZXh0Qg0KC19xdWVzdGlvbklkQhEKD190ZXNzYVNlc3Npb25JZEIRCg9fc2ltb25TZXNzaW9uSWRCEAoOX3NpbW9uU3VydmV5SWRCDgoMX3Rlc3NhUm9vdElkQgwKCl9yZXF1ZXN0SWRCDQoLX3Rlc3NhRXZlbnRCFwoVX2ludml0YXRpb25IZWFkZXJUZXh0QhUKE19pbnZpdGF0aW9uQm9keVRleHRCFAoSX2ludml0YXRpb25DdGFUZXh0QhMKEV9pbnZpdGF0aW9uQ3RhVXJsQg4KDF9zdXJ2ZXlUaXRsZUIbChlfc3VydmV5Q29udGludWVCdXR0b25UZXh0QhkKF19zdXJ2ZXlTdWJtaXRCdXR0b25UZXh0QhcKFV9wcml2YWN5U3RhdGVtZW50RnVsbEIUChJfZmVlZGJhY2tUb2FzdFRleHQ=');
@$core.Deprecated('Use interactiveAnnotationDescriptor instead')
const InteractiveAnnotation$json = const {
  '1': 'InteractiveAnnotation',
  '2': const [
    const {'1': 'polygonVertices', '3': 1, '4': 3, '5': 11, '6': '.proto.Point', '10': 'polygonVertices'},
    const {'1': 'shouldSkipConfirmation', '3': 4, '4': 1, '5': 8, '9': 1, '10': 'shouldSkipConfirmation', '17': true},
    const {'1': 'embeddedContent', '3': 5, '4': 1, '5': 11, '6': '.proto.EmbeddedContent', '9': 2, '10': 'embeddedContent', '17': true},
    const {'1': 'statusLinkType', '3': 8, '4': 1, '5': 14, '6': '.proto.InteractiveAnnotation.StatusLinkType', '9': 3, '10': 'statusLinkType', '17': true},
    const {'1': 'location', '3': 2, '4': 1, '5': 11, '6': '.proto.Location', '9': 0, '10': 'location'},
    const {'1': 'newsletter', '3': 3, '4': 1, '5': 11, '6': '.proto.ContextInfo.ForwardedNewsletterMessageInfo', '9': 0, '10': 'newsletter'},
    const {'1': 'embeddedAction', '3': 6, '4': 1, '5': 8, '9': 0, '10': 'embeddedAction'},
    const {'1': 'tapAction', '3': 7, '4': 1, '5': 11, '6': '.proto.TapLinkAction', '9': 0, '10': 'tapAction'},
  ],
  '4': const [InteractiveAnnotation_StatusLinkType$json],
  '8': const [
    const {'1': 'action'},
    const {'1': '_shouldSkipConfirmation'},
    const {'1': '_embeddedContent'},
    const {'1': '_statusLinkType'},
  ],
};

@$core.Deprecated('Use interactiveAnnotationDescriptor instead')
const InteractiveAnnotation_StatusLinkType$json = const {
  '1': 'StatusLinkType',
  '2': const [
    const {'1': 'UNKNOWN_STATUSLINKTYPE_ZERO', '2': 0},
    const {'1': 'RASTERIZED_LINK_PREVIEW', '2': 1},
    const {'1': 'RASTERIZED_LINK_TRUNCATED', '2': 2},
    const {'1': 'RASTERIZED_LINK_FULL_URL', '2': 3},
  ],
};

/// Descriptor for `InteractiveAnnotation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List interactiveAnnotationDescriptor = $convert.base64Decode('ChVJbnRlcmFjdGl2ZUFubm90YXRpb24SNgoPcG9seWdvblZlcnRpY2VzGAEgAygLMgwucHJvdG8uUG9pbnRSD3BvbHlnb25WZXJ0aWNlcxI7ChZzaG91bGRTa2lwQ29uZmlybWF0aW9uGAQgASgISAFSFnNob3VsZFNraXBDb25maXJtYXRpb26IAQESRQoPZW1iZWRkZWRDb250ZW50GAUgASgLMhYucHJvdG8uRW1iZWRkZWRDb250ZW50SAJSD2VtYmVkZGVkQ29udGVudIgBARJYCg5zdGF0dXNMaW5rVHlwZRgIIAEoDjIrLnByb3RvLkludGVyYWN0aXZlQW5ub3RhdGlvbi5TdGF0dXNMaW5rVHlwZUgDUg5zdGF0dXNMaW5rVHlwZYgBARItCghsb2NhdGlvbhgCIAEoCzIPLnByb3RvLkxvY2F0aW9uSABSCGxvY2F0aW9uElMKCm5ld3NsZXR0ZXIYAyABKAsyMS5wcm90by5Db250ZXh0SW5mby5Gb3J3YXJkZWROZXdzbGV0dGVyTWVzc2FnZUluZm9IAFIKbmV3c2xldHRlchIoCg5lbWJlZGRlZEFjdGlvbhgGIAEoCEgAUg5lbWJlZGRlZEFjdGlvbhI0Cgl0YXBBY3Rpb24YByABKAsyFC5wcm90by5UYXBMaW5rQWN0aW9uSABSCXRhcEFjdGlvbiKLAQoOU3RhdHVzTGlua1R5cGUSHwobVU5LTk9XTl9TVEFUVVNMSU5LVFlQRV9aRVJPEAASGwoXUkFTVEVSSVpFRF9MSU5LX1BSRVZJRVcQARIdChlSQVNURVJJWkVEX0xJTktfVFJVTkNBVEVEEAISHAoYUkFTVEVSSVpFRF9MSU5LX0ZVTExfVVJMEANCCAoGYWN0aW9uQhkKF19zaG91bGRTa2lwQ29uZmlybWF0aW9uQhIKEF9lbWJlZGRlZENvbnRlbnRCEQoPX3N0YXR1c0xpbmtUeXBl');
@$core.Deprecated('Use interactiveMessageAdditionalMetadataDescriptor instead')
const InteractiveMessageAdditionalMetadata$json = const {
  '1': 'InteractiveMessageAdditionalMetadata',
  '2': const [
    const {'1': 'isGalaxyFlowCompleted', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isGalaxyFlowCompleted', '17': true},
  ],
  '8': const [
    const {'1': '_isGalaxyFlowCompleted'},
  ],
};

/// Descriptor for `InteractiveMessageAdditionalMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List interactiveMessageAdditionalMetadataDescriptor = $convert.base64Decode('CiRJbnRlcmFjdGl2ZU1lc3NhZ2VBZGRpdGlvbmFsTWV0YWRhdGESOQoVaXNHYWxheHlGbG93Q29tcGxldGVkGAEgASgISABSFWlzR2FsYXh5Rmxvd0NvbXBsZXRlZIgBAUIYChZfaXNHYWxheHlGbG93Q29tcGxldGVk');
@$core.Deprecated('Use keepInChatDescriptor instead')
const KeepInChat$json = const {
  '1': 'KeepInChat',
  '2': const [
    const {'1': 'keepType', '3': 1, '4': 1, '5': 14, '6': '.proto.KeepType', '9': 0, '10': 'keepType', '17': true},
    const {'1': 'serverTimestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'serverTimestamp', '17': true},
    const {'1': 'key', '3': 3, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 2, '10': 'key', '17': true},
    const {'1': 'deviceJid', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'deviceJid', '17': true},
    const {'1': 'clientTimestampMs', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'clientTimestampMs', '17': true},
    const {'1': 'serverTimestampMs', '3': 6, '4': 1, '5': 3, '9': 5, '10': 'serverTimestampMs', '17': true},
  ],
  '8': const [
    const {'1': '_keepType'},
    const {'1': '_serverTimestamp'},
    const {'1': '_key'},
    const {'1': '_deviceJid'},
    const {'1': '_clientTimestampMs'},
    const {'1': '_serverTimestampMs'},
  ],
};

/// Descriptor for `KeepInChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keepInChatDescriptor = $convert.base64Decode('CgpLZWVwSW5DaGF0EjAKCGtlZXBUeXBlGAEgASgOMg8ucHJvdG8uS2VlcFR5cGVIAFIIa2VlcFR5cGWIAQESLQoPc2VydmVyVGltZXN0YW1wGAIgASgDSAFSD3NlcnZlclRpbWVzdGFtcIgBARIoCgNrZXkYAyABKAsyES5wcm90by5NZXNzYWdlS2V5SAJSA2tleYgBARIhCglkZXZpY2VKaWQYBCABKAlIA1IJZGV2aWNlSmlkiAEBEjEKEWNsaWVudFRpbWVzdGFtcE1zGAUgASgDSARSEWNsaWVudFRpbWVzdGFtcE1ziAEBEjEKEXNlcnZlclRpbWVzdGFtcE1zGAYgASgDSAVSEXNlcnZlclRpbWVzdGFtcE1ziAEBQgsKCV9rZWVwVHlwZUISChBfc2VydmVyVGltZXN0YW1wQgYKBF9rZXlCDAoKX2RldmljZUppZEIUChJfY2xpZW50VGltZXN0YW1wTXNCFAoSX3NlcnZlclRpbWVzdGFtcE1z');
@$core.Deprecated('Use keyExchangeMessageDescriptor instead')
const KeyExchangeMessage$json = const {
  '1': 'KeyExchangeMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'id', '17': true},
    const {'1': 'baseKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'baseKey', '17': true},
    const {'1': 'ratchetKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'ratchetKey', '17': true},
    const {'1': 'identityKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'identityKey', '17': true},
    const {'1': 'baseKeySignature', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'baseKeySignature', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_baseKey'},
    const {'1': '_ratchetKey'},
    const {'1': '_identityKey'},
    const {'1': '_baseKeySignature'},
  ],
};

/// Descriptor for `KeyExchangeMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyExchangeMessageDescriptor = $convert.base64Decode('ChJLZXlFeGNoYW5nZU1lc3NhZ2USEwoCaWQYASABKA1IAFICaWSIAQESHQoHYmFzZUtleRgCIAEoDEgBUgdiYXNlS2V5iAEBEiMKCnJhdGNoZXRLZXkYAyABKAxIAlIKcmF0Y2hldEtleYgBARIlCgtpZGVudGl0eUtleRgEIAEoDEgDUgtpZGVudGl0eUtleYgBARIvChBiYXNlS2V5U2lnbmF0dXJlGAUgASgMSARSEGJhc2VLZXlTaWduYXR1cmWIAQFCBQoDX2lkQgoKCF9iYXNlS2V5Qg0KC19yYXRjaGV0S2V5Qg4KDF9pZGVudGl0eUtleUITChFfYmFzZUtleVNpZ25hdHVyZQ==');
@$core.Deprecated('Use keyIdDescriptor instead')
const KeyId$json = const {
  '1': 'KeyId',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'id', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
  ],
};

/// Descriptor for `KeyId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyIdDescriptor = $convert.base64Decode('CgVLZXlJZBITCgJpZBgBIAEoDEgAUgJpZIgBAUIFCgNfaWQ=');
@$core.Deprecated('Use lIDMigrationMappingDescriptor instead')
const LIDMigrationMapping$json = const {
  '1': 'LIDMigrationMapping',
  '2': const [
    const {'1': 'pn', '3': 1, '4': 1, '5': 4, '10': 'pn'},
    const {'1': 'assignedLid', '3': 2, '4': 1, '5': 4, '10': 'assignedLid'},
    const {'1': 'latestLid', '3': 3, '4': 1, '5': 4, '9': 0, '10': 'latestLid', '17': true},
  ],
  '8': const [
    const {'1': '_latestLid'},
  ],
};

/// Descriptor for `LIDMigrationMapping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lIDMigrationMappingDescriptor = $convert.base64Decode('ChNMSURNaWdyYXRpb25NYXBwaW5nEg4KAnBuGAEgASgEUgJwbhIgCgthc3NpZ25lZExpZBgCIAEoBFILYXNzaWduZWRMaWQSIQoJbGF0ZXN0TGlkGAMgASgESABSCWxhdGVzdExpZIgBAUIMCgpfbGF0ZXN0TGlk');
@$core.Deprecated('Use lIDMigrationMappingSyncMessageDescriptor instead')
const LIDMigrationMappingSyncMessage$json = const {
  '1': 'LIDMigrationMappingSyncMessage',
  '2': const [
    const {'1': 'encodedMappingPayload', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'encodedMappingPayload', '17': true},
  ],
  '8': const [
    const {'1': '_encodedMappingPayload'},
  ],
};

/// Descriptor for `LIDMigrationMappingSyncMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lIDMigrationMappingSyncMessageDescriptor = $convert.base64Decode('Ch5MSURNaWdyYXRpb25NYXBwaW5nU3luY01lc3NhZ2USOQoVZW5jb2RlZE1hcHBpbmdQYXlsb2FkGAEgASgMSABSFWVuY29kZWRNYXBwaW5nUGF5bG9hZIgBAUIYChZfZW5jb2RlZE1hcHBpbmdQYXlsb2Fk');
@$core.Deprecated('Use lIDMigrationMappingSyncPayloadDescriptor instead')
const LIDMigrationMappingSyncPayload$json = const {
  '1': 'LIDMigrationMappingSyncPayload',
  '2': const [
    const {'1': 'pnToLidMappings', '3': 1, '4': 3, '5': 11, '6': '.proto.LIDMigrationMapping', '10': 'pnToLidMappings'},
    const {'1': 'chatDbMigrationTimestamp', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'chatDbMigrationTimestamp', '17': true},
  ],
  '8': const [
    const {'1': '_chatDbMigrationTimestamp'},
  ],
};

/// Descriptor for `LIDMigrationMappingSyncPayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lIDMigrationMappingSyncPayloadDescriptor = $convert.base64Decode('Ch5MSURNaWdyYXRpb25NYXBwaW5nU3luY1BheWxvYWQSRAoPcG5Ub0xpZE1hcHBpbmdzGAEgAygLMhoucHJvdG8uTElETWlncmF0aW9uTWFwcGluZ1IPcG5Ub0xpZE1hcHBpbmdzEj8KGGNoYXREYk1pZ3JhdGlvblRpbWVzdGFtcBgCIAEoBEgAUhhjaGF0RGJNaWdyYXRpb25UaW1lc3RhbXCIAQFCGwoZX2NoYXREYk1pZ3JhdGlvblRpbWVzdGFtcA==');
@$core.Deprecated('Use legacyMessageDescriptor instead')
const LegacyMessage$json = const {
  '1': 'LegacyMessage',
  '2': const [
    const {'1': 'eventResponseMessage', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.EventResponseMessage', '9': 0, '10': 'eventResponseMessage', '17': true},
    const {'1': 'pollVote', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.PollVoteMessage', '9': 1, '10': 'pollVote', '17': true},
  ],
  '8': const [
    const {'1': '_eventResponseMessage'},
    const {'1': '_pollVote'},
  ],
};

/// Descriptor for `LegacyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List legacyMessageDescriptor = $convert.base64Decode('Cg1MZWdhY3lNZXNzYWdlElwKFGV2ZW50UmVzcG9uc2VNZXNzYWdlGAEgASgLMiMucHJvdG8uTWVzc2FnZS5FdmVudFJlc3BvbnNlTWVzc2FnZUgAUhRldmVudFJlc3BvbnNlTWVzc2FnZYgBARI/Cghwb2xsVm90ZRgCIAEoCzIeLnByb3RvLk1lc3NhZ2UuUG9sbFZvdGVNZXNzYWdlSAFSCHBvbGxWb3RliAEBQhcKFV9ldmVudFJlc3BvbnNlTWVzc2FnZUILCglfcG9sbFZvdGU=');
@$core.Deprecated('Use limitSharingDescriptor instead')
const LimitSharing$json = const {
  '1': 'LimitSharing',
  '2': const [
    const {'1': 'sharingLimited', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'sharingLimited', '17': true},
    const {'1': 'trigger', '3': 2, '4': 1, '5': 14, '6': '.proto.LimitSharing.TriggerType', '9': 1, '10': 'trigger', '17': true},
    const {'1': 'limitSharingSettingTimestamp', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'limitSharingSettingTimestamp', '17': true},
    const {'1': 'initiatedByMe', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'initiatedByMe', '17': true},
  ],
  '4': const [LimitSharing_TriggerType$json],
  '8': const [
    const {'1': '_sharingLimited'},
    const {'1': '_trigger'},
    const {'1': '_limitSharingSettingTimestamp'},
    const {'1': '_initiatedByMe'},
  ],
};

@$core.Deprecated('Use limitSharingDescriptor instead')
const LimitSharing_TriggerType$json = const {
  '1': 'TriggerType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CHAT_SETTING', '2': 1},
    const {'1': 'BIZ_SUPPORTS_FB_HOSTING', '2': 2},
    const {'1': 'UNKNOWN_GROUP', '2': 3},
  ],
};

/// Descriptor for `LimitSharing`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List limitSharingDescriptor = $convert.base64Decode('CgxMaW1pdFNoYXJpbmcSKwoOc2hhcmluZ0xpbWl0ZWQYASABKAhIAFIOc2hhcmluZ0xpbWl0ZWSIAQESPgoHdHJpZ2dlchgCIAEoDjIfLnByb3RvLkxpbWl0U2hhcmluZy5UcmlnZ2VyVHlwZUgBUgd0cmlnZ2VyiAEBEkcKHGxpbWl0U2hhcmluZ1NldHRpbmdUaW1lc3RhbXAYAyABKANIAlIcbGltaXRTaGFyaW5nU2V0dGluZ1RpbWVzdGFtcIgBARIpCg1pbml0aWF0ZWRCeU1lGAQgASgISANSDWluaXRpYXRlZEJ5TWWIAQEiXAoLVHJpZ2dlclR5cGUSCwoHVU5LTk9XThAAEhAKDENIQVRfU0VUVElORxABEhsKF0JJWl9TVVBQT1JUU19GQl9IT1NUSU5HEAISEQoNVU5LTk9XTl9HUk9VUBADQhEKD19zaGFyaW5nTGltaXRlZEIKCghfdHJpZ2dlckIfCh1fbGltaXRTaGFyaW5nU2V0dGluZ1RpbWVzdGFtcEIQCg5faW5pdGlhdGVkQnlNZQ==');
@$core.Deprecated('Use localizedNameDescriptor instead')
const LocalizedName$json = const {
  '1': 'LocalizedName',
  '2': const [
    const {'1': 'lg', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'lg', '17': true},
    const {'1': 'lc', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'lc', '17': true},
    const {'1': 'verifiedName', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'verifiedName', '17': true},
  ],
  '8': const [
    const {'1': '_lg'},
    const {'1': '_lc'},
    const {'1': '_verifiedName'},
  ],
};

/// Descriptor for `LocalizedName`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localizedNameDescriptor = $convert.base64Decode('Cg1Mb2NhbGl6ZWROYW1lEhMKAmxnGAEgASgJSABSAmxniAEBEhMKAmxjGAIgASgJSAFSAmxjiAEBEicKDHZlcmlmaWVkTmFtZRgDIAEoCUgCUgx2ZXJpZmllZE5hbWWIAQFCBQoDX2xnQgUKA19sY0IPCg1fdmVyaWZpZWROYW1l');
@$core.Deprecated('Use locationDescriptor instead')
const Location$json = const {
  '1': 'Location',
  '2': const [
    const {'1': 'degreesLatitude', '3': 1, '4': 1, '5': 1, '9': 0, '10': 'degreesLatitude', '17': true},
    const {'1': 'degreesLongitude', '3': 2, '4': 1, '5': 1, '9': 1, '10': 'degreesLongitude', '17': true},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'name', '17': true},
  ],
  '8': const [
    const {'1': '_degreesLatitude'},
    const {'1': '_degreesLongitude'},
    const {'1': '_name'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode('CghMb2NhdGlvbhItCg9kZWdyZWVzTGF0aXR1ZGUYASABKAFIAFIPZGVncmVlc0xhdGl0dWRliAEBEi8KEGRlZ3JlZXNMb25naXR1ZGUYAiABKAFIAVIQZGVncmVlc0xvbmdpdHVkZYgBARIXCgRuYW1lGAMgASgJSAJSBG5hbWWIAQFCEgoQX2RlZ3JlZXNMYXRpdHVkZUITChFfZGVncmVlc0xvbmdpdHVkZUIHCgVfbmFtZQ==');
@$core.Deprecated('Use mediaDataDescriptor instead')
const MediaData$json = const {
  '1': 'MediaData',
  '2': const [
    const {'1': 'localPath', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'localPath', '17': true},
  ],
  '8': const [
    const {'1': '_localPath'},
  ],
};

/// Descriptor for `MediaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaDataDescriptor = $convert.base64Decode('CglNZWRpYURhdGESIQoJbG9jYWxQYXRoGAEgASgJSABSCWxvY2FsUGF0aIgBAUIMCgpfbG9jYWxQYXRo');
@$core.Deprecated('Use mediaNotifyMessageDescriptor instead')
const MediaNotifyMessage$json = const {
  '1': 'MediaNotifyMessage',
  '2': const [
    const {'1': 'expressPathUrl', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'expressPathUrl', '17': true},
    const {'1': 'fileEncSha256', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'fileEncSha256', '17': true},
    const {'1': 'fileLength', '3': 3, '4': 1, '5': 4, '9': 2, '10': 'fileLength', '17': true},
  ],
  '8': const [
    const {'1': '_expressPathUrl'},
    const {'1': '_fileEncSha256'},
    const {'1': '_fileLength'},
  ],
};

/// Descriptor for `MediaNotifyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaNotifyMessageDescriptor = $convert.base64Decode('ChJNZWRpYU5vdGlmeU1lc3NhZ2USKwoOZXhwcmVzc1BhdGhVcmwYASABKAlIAFIOZXhwcmVzc1BhdGhVcmyIAQESKQoNZmlsZUVuY1NoYTI1NhgCIAEoDEgBUg1maWxlRW5jU2hhMjU2iAEBEiMKCmZpbGVMZW5ndGgYAyABKARIAlIKZmlsZUxlbmd0aIgBAUIRCg9fZXhwcmVzc1BhdGhVcmxCEAoOX2ZpbGVFbmNTaGEyNTZCDQoLX2ZpbGVMZW5ndGg=');
@$core.Deprecated('Use mediaRetryNotificationDescriptor instead')
const MediaRetryNotification$json = const {
  '1': 'MediaRetryNotification',
  '2': const [
    const {'1': 'stanzaId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stanzaId', '17': true},
    const {'1': 'directPath', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'directPath', '17': true},
    const {'1': 'result', '3': 3, '4': 1, '5': 14, '6': '.proto.MediaRetryNotification.ResultType', '9': 2, '10': 'result', '17': true},
    const {'1': 'messageSecret', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'messageSecret', '17': true},
  ],
  '4': const [MediaRetryNotification_ResultType$json],
  '8': const [
    const {'1': '_stanzaId'},
    const {'1': '_directPath'},
    const {'1': '_result'},
    const {'1': '_messageSecret'},
  ],
};

@$core.Deprecated('Use mediaRetryNotificationDescriptor instead')
const MediaRetryNotification_ResultType$json = const {
  '1': 'ResultType',
  '2': const [
    const {'1': 'GENERAL_ERROR', '2': 0},
    const {'1': 'SUCCESS', '2': 1},
    const {'1': 'NOT_FOUND', '2': 2},
    const {'1': 'DECRYPTION_ERROR', '2': 3},
  ],
};

/// Descriptor for `MediaRetryNotification`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaRetryNotificationDescriptor = $convert.base64Decode('ChZNZWRpYVJldHJ5Tm90aWZpY2F0aW9uEh8KCHN0YW56YUlkGAEgASgJSABSCHN0YW56YUlkiAEBEiMKCmRpcmVjdFBhdGgYAiABKAlIAVIKZGlyZWN0UGF0aIgBARJFCgZyZXN1bHQYAyABKA4yKC5wcm90by5NZWRpYVJldHJ5Tm90aWZpY2F0aW9uLlJlc3VsdFR5cGVIAlIGcmVzdWx0iAEBEikKDW1lc3NhZ2VTZWNyZXQYBCABKAxIA1INbWVzc2FnZVNlY3JldIgBASJRCgpSZXN1bHRUeXBlEhEKDUdFTkVSQUxfRVJST1IQABILCgdTVUNDRVNTEAESDQoJTk9UX0ZPVU5EEAISFAoQREVDUllQVElPTl9FUlJPUhADQgsKCV9zdGFuemFJZEINCgtfZGlyZWN0UGF0aEIJCgdfcmVzdWx0QhAKDl9tZXNzYWdlU2VjcmV0');
@$core.Deprecated('Use memberLabelDescriptor instead')
const MemberLabel$json = const {
  '1': 'MemberLabel',
  '2': const [
    const {'1': 'label', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'label', '17': true},
    const {'1': 'labelTimestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'labelTimestamp', '17': true},
  ],
  '8': const [
    const {'1': '_label'},
    const {'1': '_labelTimestamp'},
  ],
};

/// Descriptor for `MemberLabel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List memberLabelDescriptor = $convert.base64Decode('CgtNZW1iZXJMYWJlbBIZCgVsYWJlbBgBIAEoCUgAUgVsYWJlbIgBARIrCg5sYWJlbFRpbWVzdGFtcBgCIAEoA0gBUg5sYWJlbFRpbWVzdGFtcIgBAUIICgZfbGFiZWxCEQoPX2xhYmVsVGltZXN0YW1w');
@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'conversation', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'conversation', '17': true},
    const {'1': 'senderKeyDistributionMessage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.SenderKeyDistributionMessage', '9': 1, '10': 'senderKeyDistributionMessage', '17': true},
    const {'1': 'imageMessage', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.ImageMessage', '9': 2, '10': 'imageMessage', '17': true},
    const {'1': 'contactMessage', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.ContactMessage', '9': 3, '10': 'contactMessage', '17': true},
    const {'1': 'locationMessage', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.LocationMessage', '9': 4, '10': 'locationMessage', '17': true},
    const {'1': 'extendedTextMessage', '3': 6, '4': 1, '5': 11, '6': '.proto.Message.ExtendedTextMessage', '9': 5, '10': 'extendedTextMessage', '17': true},
    const {'1': 'documentMessage', '3': 7, '4': 1, '5': 11, '6': '.proto.Message.DocumentMessage', '9': 6, '10': 'documentMessage', '17': true},
    const {'1': 'audioMessage', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.AudioMessage', '9': 7, '10': 'audioMessage', '17': true},
    const {'1': 'videoMessage', '3': 9, '4': 1, '5': 11, '6': '.proto.Message.VideoMessage', '9': 8, '10': 'videoMessage', '17': true},
    const {'1': 'call', '3': 10, '4': 1, '5': 11, '6': '.proto.Message.Call', '9': 9, '10': 'call', '17': true},
    const {'1': 'chat', '3': 11, '4': 1, '5': 11, '6': '.proto.Message.Chat', '9': 10, '10': 'chat', '17': true},
    const {'1': 'protocolMessage', '3': 12, '4': 1, '5': 11, '6': '.proto.Message.ProtocolMessage', '9': 11, '10': 'protocolMessage', '17': true},
    const {'1': 'contactsArrayMessage', '3': 13, '4': 1, '5': 11, '6': '.proto.Message.ContactsArrayMessage', '9': 12, '10': 'contactsArrayMessage', '17': true},
    const {'1': 'highlyStructuredMessage', '3': 14, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 13, '10': 'highlyStructuredMessage', '17': true},
    const {'1': 'fastRatchetKeySenderKeyDistributionMessage', '3': 15, '4': 1, '5': 11, '6': '.proto.Message.SenderKeyDistributionMessage', '9': 14, '10': 'fastRatchetKeySenderKeyDistributionMessage', '17': true},
    const {'1': 'sendPaymentMessage', '3': 16, '4': 1, '5': 11, '6': '.proto.Message.SendPaymentMessage', '9': 15, '10': 'sendPaymentMessage', '17': true},
    const {'1': 'liveLocationMessage', '3': 18, '4': 1, '5': 11, '6': '.proto.Message.LiveLocationMessage', '9': 16, '10': 'liveLocationMessage', '17': true},
    const {'1': 'requestPaymentMessage', '3': 22, '4': 1, '5': 11, '6': '.proto.Message.RequestPaymentMessage', '9': 17, '10': 'requestPaymentMessage', '17': true},
    const {'1': 'declinePaymentRequestMessage', '3': 23, '4': 1, '5': 11, '6': '.proto.Message.DeclinePaymentRequestMessage', '9': 18, '10': 'declinePaymentRequestMessage', '17': true},
    const {'1': 'cancelPaymentRequestMessage', '3': 24, '4': 1, '5': 11, '6': '.proto.Message.CancelPaymentRequestMessage', '9': 19, '10': 'cancelPaymentRequestMessage', '17': true},
    const {'1': 'templateMessage', '3': 25, '4': 1, '5': 11, '6': '.proto.Message.TemplateMessage', '9': 20, '10': 'templateMessage', '17': true},
    const {'1': 'stickerMessage', '3': 26, '4': 1, '5': 11, '6': '.proto.Message.StickerMessage', '9': 21, '10': 'stickerMessage', '17': true},
    const {'1': 'groupInviteMessage', '3': 28, '4': 1, '5': 11, '6': '.proto.Message.GroupInviteMessage', '9': 22, '10': 'groupInviteMessage', '17': true},
    const {'1': 'templateButtonReplyMessage', '3': 29, '4': 1, '5': 11, '6': '.proto.Message.TemplateButtonReplyMessage', '9': 23, '10': 'templateButtonReplyMessage', '17': true},
    const {'1': 'productMessage', '3': 30, '4': 1, '5': 11, '6': '.proto.Message.ProductMessage', '9': 24, '10': 'productMessage', '17': true},
    const {'1': 'deviceSentMessage', '3': 31, '4': 1, '5': 11, '6': '.proto.Message.DeviceSentMessage', '9': 25, '10': 'deviceSentMessage', '17': true},
    const {'1': 'messageContextInfo', '3': 35, '4': 1, '5': 11, '6': '.proto.MessageContextInfo', '9': 26, '10': 'messageContextInfo', '17': true},
    const {'1': 'listMessage', '3': 36, '4': 1, '5': 11, '6': '.proto.Message.ListMessage', '9': 27, '10': 'listMessage', '17': true},
    const {'1': 'viewOnceMessage', '3': 37, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 28, '10': 'viewOnceMessage', '17': true},
    const {'1': 'orderMessage', '3': 38, '4': 1, '5': 11, '6': '.proto.Message.OrderMessage', '9': 29, '10': 'orderMessage', '17': true},
    const {'1': 'listResponseMessage', '3': 39, '4': 1, '5': 11, '6': '.proto.Message.ListResponseMessage', '9': 30, '10': 'listResponseMessage', '17': true},
    const {'1': 'ephemeralMessage', '3': 40, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 31, '10': 'ephemeralMessage', '17': true},
    const {'1': 'invoiceMessage', '3': 41, '4': 1, '5': 11, '6': '.proto.Message.InvoiceMessage', '9': 32, '10': 'invoiceMessage', '17': true},
    const {'1': 'buttonsMessage', '3': 42, '4': 1, '5': 11, '6': '.proto.Message.ButtonsMessage', '9': 33, '10': 'buttonsMessage', '17': true},
    const {'1': 'buttonsResponseMessage', '3': 43, '4': 1, '5': 11, '6': '.proto.Message.ButtonsResponseMessage', '9': 34, '10': 'buttonsResponseMessage', '17': true},
    const {'1': 'paymentInviteMessage', '3': 44, '4': 1, '5': 11, '6': '.proto.Message.PaymentInviteMessage', '9': 35, '10': 'paymentInviteMessage', '17': true},
    const {'1': 'interactiveMessage', '3': 45, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage', '9': 36, '10': 'interactiveMessage', '17': true},
    const {'1': 'reactionMessage', '3': 46, '4': 1, '5': 11, '6': '.proto.Message.ReactionMessage', '9': 37, '10': 'reactionMessage', '17': true},
    const {'1': 'stickerSyncRmrMessage', '3': 47, '4': 1, '5': 11, '6': '.proto.Message.StickerSyncRMRMessage', '9': 38, '10': 'stickerSyncRmrMessage', '17': true},
    const {'1': 'interactiveResponseMessage', '3': 48, '4': 1, '5': 11, '6': '.proto.Message.InteractiveResponseMessage', '9': 39, '10': 'interactiveResponseMessage', '17': true},
    const {'1': 'pollCreationMessage', '3': 49, '4': 1, '5': 11, '6': '.proto.Message.PollCreationMessage', '9': 40, '10': 'pollCreationMessage', '17': true},
    const {'1': 'pollUpdateMessage', '3': 50, '4': 1, '5': 11, '6': '.proto.Message.PollUpdateMessage', '9': 41, '10': 'pollUpdateMessage', '17': true},
    const {'1': 'keepInChatMessage', '3': 51, '4': 1, '5': 11, '6': '.proto.Message.KeepInChatMessage', '9': 42, '10': 'keepInChatMessage', '17': true},
    const {'1': 'documentWithCaptionMessage', '3': 53, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 43, '10': 'documentWithCaptionMessage', '17': true},
    const {'1': 'requestPhoneNumberMessage', '3': 54, '4': 1, '5': 11, '6': '.proto.Message.RequestPhoneNumberMessage', '9': 44, '10': 'requestPhoneNumberMessage', '17': true},
    const {'1': 'viewOnceMessageV2', '3': 55, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 45, '10': 'viewOnceMessageV2', '17': true},
    const {'1': 'encReactionMessage', '3': 56, '4': 1, '5': 11, '6': '.proto.Message.EncReactionMessage', '9': 46, '10': 'encReactionMessage', '17': true},
    const {'1': 'editedMessage', '3': 58, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 47, '10': 'editedMessage', '17': true},
    const {'1': 'viewOnceMessageV2Extension', '3': 59, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 48, '10': 'viewOnceMessageV2Extension', '17': true},
    const {'1': 'pollCreationMessageV2', '3': 60, '4': 1, '5': 11, '6': '.proto.Message.PollCreationMessage', '9': 49, '10': 'pollCreationMessageV2', '17': true},
    const {'1': 'scheduledCallCreationMessage', '3': 61, '4': 1, '5': 11, '6': '.proto.Message.ScheduledCallCreationMessage', '9': 50, '10': 'scheduledCallCreationMessage', '17': true},
    const {'1': 'groupMentionedMessage', '3': 62, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 51, '10': 'groupMentionedMessage', '17': true},
    const {'1': 'pinInChatMessage', '3': 63, '4': 1, '5': 11, '6': '.proto.Message.PinInChatMessage', '9': 52, '10': 'pinInChatMessage', '17': true},
    const {'1': 'pollCreationMessageV3', '3': 64, '4': 1, '5': 11, '6': '.proto.Message.PollCreationMessage', '9': 53, '10': 'pollCreationMessageV3', '17': true},
    const {'1': 'scheduledCallEditMessage', '3': 65, '4': 1, '5': 11, '6': '.proto.Message.ScheduledCallEditMessage', '9': 54, '10': 'scheduledCallEditMessage', '17': true},
    const {'1': 'ptvMessage', '3': 66, '4': 1, '5': 11, '6': '.proto.Message.VideoMessage', '9': 55, '10': 'ptvMessage', '17': true},
    const {'1': 'botInvokeMessage', '3': 67, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 56, '10': 'botInvokeMessage', '17': true},
    const {'1': 'callLogMesssage', '3': 69, '4': 1, '5': 11, '6': '.proto.Message.CallLogMessage', '9': 57, '10': 'callLogMesssage', '17': true},
    const {'1': 'messageHistoryBundle', '3': 70, '4': 1, '5': 11, '6': '.proto.Message.MessageHistoryBundle', '9': 58, '10': 'messageHistoryBundle', '17': true},
    const {'1': 'encCommentMessage', '3': 71, '4': 1, '5': 11, '6': '.proto.Message.EncCommentMessage', '9': 59, '10': 'encCommentMessage', '17': true},
    const {'1': 'bcallMessage', '3': 72, '4': 1, '5': 11, '6': '.proto.Message.BCallMessage', '9': 60, '10': 'bcallMessage', '17': true},
    const {'1': 'lottieStickerMessage', '3': 74, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 61, '10': 'lottieStickerMessage', '17': true},
    const {'1': 'eventMessage', '3': 75, '4': 1, '5': 11, '6': '.proto.Message.EventMessage', '9': 62, '10': 'eventMessage', '17': true},
    const {'1': 'encEventResponseMessage', '3': 76, '4': 1, '5': 11, '6': '.proto.Message.EncEventResponseMessage', '9': 63, '10': 'encEventResponseMessage', '17': true},
    const {'1': 'commentMessage', '3': 77, '4': 1, '5': 11, '6': '.proto.Message.CommentMessage', '9': 64, '10': 'commentMessage', '17': true},
    const {'1': 'newsletterAdminInviteMessage', '3': 78, '4': 1, '5': 11, '6': '.proto.Message.NewsletterAdminInviteMessage', '9': 65, '10': 'newsletterAdminInviteMessage', '17': true},
    const {'1': 'placeholderMessage', '3': 80, '4': 1, '5': 11, '6': '.proto.Message.PlaceholderMessage', '9': 66, '10': 'placeholderMessage', '17': true},
    const {'1': 'secretEncryptedMessage', '3': 82, '4': 1, '5': 11, '6': '.proto.Message.SecretEncryptedMessage', '9': 67, '10': 'secretEncryptedMessage', '17': true},
    const {'1': 'albumMessage', '3': 83, '4': 1, '5': 11, '6': '.proto.Message.AlbumMessage', '9': 68, '10': 'albumMessage', '17': true},
    const {'1': 'eventCoverImage', '3': 85, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 69, '10': 'eventCoverImage', '17': true},
    const {'1': 'stickerPackMessage', '3': 86, '4': 1, '5': 11, '6': '.proto.Message.StickerPackMessage', '9': 70, '10': 'stickerPackMessage', '17': true},
    const {'1': 'statusMentionMessage', '3': 87, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 71, '10': 'statusMentionMessage', '17': true},
    const {'1': 'pollResultSnapshotMessage', '3': 88, '4': 1, '5': 11, '6': '.proto.Message.PollResultSnapshotMessage', '9': 72, '10': 'pollResultSnapshotMessage', '17': true},
    const {'1': 'pollCreationOptionImageMessage', '3': 90, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 73, '10': 'pollCreationOptionImageMessage', '17': true},
    const {'1': 'associatedChildMessage', '3': 91, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 74, '10': 'associatedChildMessage', '17': true},
    const {'1': 'groupStatusMentionMessage', '3': 92, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 75, '10': 'groupStatusMentionMessage', '17': true},
    const {'1': 'pollCreationMessageV4', '3': 93, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 76, '10': 'pollCreationMessageV4', '17': true},
    const {'1': 'statusAddYours', '3': 95, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 77, '10': 'statusAddYours', '17': true},
    const {'1': 'groupStatusMessage', '3': 96, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 78, '10': 'groupStatusMessage', '17': true},
    const {'1': 'richResponseMessage', '3': 97, '4': 1, '5': 11, '6': '.proto.AIRichResponseMessage', '9': 79, '10': 'richResponseMessage', '17': true},
    const {'1': 'statusNotificationMessage', '3': 98, '4': 1, '5': 11, '6': '.proto.Message.StatusNotificationMessage', '9': 80, '10': 'statusNotificationMessage', '17': true},
    const {'1': 'limitSharingMessage', '3': 99, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 81, '10': 'limitSharingMessage', '17': true},
    const {'1': 'botTaskMessage', '3': 100, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 82, '10': 'botTaskMessage', '17': true},
    const {'1': 'questionMessage', '3': 101, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 83, '10': 'questionMessage', '17': true},
    const {'1': 'messageHistoryNotice', '3': 102, '4': 1, '5': 11, '6': '.proto.Message.MessageHistoryNotice', '9': 84, '10': 'messageHistoryNotice', '17': true},
    const {'1': 'groupStatusMessageV2', '3': 103, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 85, '10': 'groupStatusMessageV2', '17': true},
    const {'1': 'botForwardedMessage', '3': 104, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 86, '10': 'botForwardedMessage', '17': true},
    const {'1': 'statusQuestionAnswerMessage', '3': 105, '4': 1, '5': 11, '6': '.proto.Message.StatusQuestionAnswerMessage', '9': 87, '10': 'statusQuestionAnswerMessage', '17': true},
    const {'1': 'questionReplyMessage', '3': 106, '4': 1, '5': 11, '6': '.proto.Message.FutureProofMessage', '9': 88, '10': 'questionReplyMessage', '17': true},
    const {'1': 'questionResponseMessage', '3': 107, '4': 1, '5': 11, '6': '.proto.Message.QuestionResponseMessage', '9': 89, '10': 'questionResponseMessage', '17': true},
    const {'1': 'statusQuotedMessage', '3': 109, '4': 1, '5': 11, '6': '.proto.Message.StatusQuotedMessage', '9': 90, '10': 'statusQuotedMessage', '17': true},
    const {'1': 'statusStickerInteractionMessage', '3': 110, '4': 1, '5': 11, '6': '.proto.Message.StatusStickerInteractionMessage', '9': 91, '10': 'statusStickerInteractionMessage', '17': true},
    const {'1': 'pollCreationMessageV5', '3': 111, '4': 1, '5': 11, '6': '.proto.Message.PollCreationMessage', '9': 92, '10': 'pollCreationMessageV5', '17': true},
    const {'1': 'newsletterFollowerInviteMessageV2', '3': 113, '4': 1, '5': 11, '6': '.proto.Message.NewsletterFollowerInviteMessage', '9': 93, '10': 'newsletterFollowerInviteMessageV2', '17': true},
    const {'1': 'pollResultSnapshotMessageV3', '3': 114, '4': 1, '5': 11, '6': '.proto.Message.PollResultSnapshotMessage', '9': 94, '10': 'pollResultSnapshotMessageV3', '17': true},
  ],
  '3': const [Message_AlbumMessage$json, Message_AppStateFatalExceptionNotification$json, Message_AppStateSyncKey$json, Message_AppStateSyncKeyData$json, Message_AppStateSyncKeyFingerprint$json, Message_AppStateSyncKeyId$json, Message_AppStateSyncKeyRequest$json, Message_AppStateSyncKeyShare$json, Message_AudioMessage$json, Message_BCallMessage$json, Message_ButtonsMessage$json, Message_ButtonsResponseMessage$json, Message_Call$json, Message_CallLogMessage$json, Message_CancelPaymentRequestMessage$json, Message_Chat$json, Message_CloudAPIThreadControlNotification$json, Message_CommentMessage$json, Message_ContactMessage$json, Message_ContactsArrayMessage$json, Message_DeclinePaymentRequestMessage$json, Message_DeviceSentMessage$json, Message_DocumentMessage$json, Message_EncCommentMessage$json, Message_EncEventResponseMessage$json, Message_EncReactionMessage$json, Message_EventMessage$json, Message_EventResponseMessage$json, Message_ExtendedTextMessage$json, Message_FullHistorySyncOnDemandRequestMetadata$json, Message_FutureProofMessage$json, Message_GroupInviteMessage$json, Message_HighlyStructuredMessage$json, Message_HistorySyncMessageAccessStatus$json, Message_HistorySyncNotification$json, Message_ImageMessage$json, Message_InitialSecurityNotificationSettingSync$json, Message_InteractiveMessage$json, Message_InteractiveResponseMessage$json, Message_InvoiceMessage$json, Message_KeepInChatMessage$json, Message_LinkPreviewMetadata$json, Message_ListMessage$json, Message_ListResponseMessage$json, Message_LiveLocationMessage$json, Message_LocationMessage$json, Message_MMSThumbnailMetadata$json, Message_MessageHistoryBundle$json, Message_MessageHistoryMetadata$json, Message_MessageHistoryNotice$json, Message_NewsletterAdminInviteMessage$json, Message_NewsletterFollowerInviteMessage$json, Message_OrderMessage$json, Message_PaymentExtendedMetadata$json, Message_PaymentInviteMessage$json, Message_PaymentLinkMetadata$json, Message_PeerDataOperationRequestMessage$json, Message_PeerDataOperationRequestResponseMessage$json, Message_PinInChatMessage$json, Message_PlaceholderMessage$json, Message_PollCreationMessage$json, Message_PollEncValue$json, Message_PollResultSnapshotMessage$json, Message_PollUpdateMessage$json, Message_PollUpdateMessageMetadata$json, Message_PollVoteMessage$json, Message_ProductMessage$json, Message_ProtocolMessage$json, Message_QuestionResponseMessage$json, Message_ReactionMessage$json, Message_RequestPaymentMessage$json, Message_RequestPhoneNumberMessage$json, Message_RequestWelcomeMessageMetadata$json, Message_ScheduledCallCreationMessage$json, Message_ScheduledCallEditMessage$json, Message_SecretEncryptedMessage$json, Message_SendPaymentMessage$json, Message_SenderKeyDistributionMessage$json, Message_StatusNotificationMessage$json, Message_StatusQuestionAnswerMessage$json, Message_StatusQuotedMessage$json, Message_StatusStickerInteractionMessage$json, Message_StickerMessage$json, Message_StickerPackMessage$json, Message_StickerSyncRMRMessage$json, Message_TemplateButtonReplyMessage$json, Message_TemplateMessage$json, Message_URLMetadata$json, Message_VideoEndCard$json, Message_VideoMessage$json],
  '4': const [Message_HistorySyncType$json, Message_MediaKeyDomain$json, Message_PeerDataOperationRequestType$json, Message_PollContentType$json, Message_PollType$json],
  '8': const [
    const {'1': '_conversation'},
    const {'1': '_senderKeyDistributionMessage'},
    const {'1': '_imageMessage'},
    const {'1': '_contactMessage'},
    const {'1': '_locationMessage'},
    const {'1': '_extendedTextMessage'},
    const {'1': '_documentMessage'},
    const {'1': '_audioMessage'},
    const {'1': '_videoMessage'},
    const {'1': '_call'},
    const {'1': '_chat'},
    const {'1': '_protocolMessage'},
    const {'1': '_contactsArrayMessage'},
    const {'1': '_highlyStructuredMessage'},
    const {'1': '_fastRatchetKeySenderKeyDistributionMessage'},
    const {'1': '_sendPaymentMessage'},
    const {'1': '_liveLocationMessage'},
    const {'1': '_requestPaymentMessage'},
    const {'1': '_declinePaymentRequestMessage'},
    const {'1': '_cancelPaymentRequestMessage'},
    const {'1': '_templateMessage'},
    const {'1': '_stickerMessage'},
    const {'1': '_groupInviteMessage'},
    const {'1': '_templateButtonReplyMessage'},
    const {'1': '_productMessage'},
    const {'1': '_deviceSentMessage'},
    const {'1': '_messageContextInfo'},
    const {'1': '_listMessage'},
    const {'1': '_viewOnceMessage'},
    const {'1': '_orderMessage'},
    const {'1': '_listResponseMessage'},
    const {'1': '_ephemeralMessage'},
    const {'1': '_invoiceMessage'},
    const {'1': '_buttonsMessage'},
    const {'1': '_buttonsResponseMessage'},
    const {'1': '_paymentInviteMessage'},
    const {'1': '_interactiveMessage'},
    const {'1': '_reactionMessage'},
    const {'1': '_stickerSyncRmrMessage'},
    const {'1': '_interactiveResponseMessage'},
    const {'1': '_pollCreationMessage'},
    const {'1': '_pollUpdateMessage'},
    const {'1': '_keepInChatMessage'},
    const {'1': '_documentWithCaptionMessage'},
    const {'1': '_requestPhoneNumberMessage'},
    const {'1': '_viewOnceMessageV2'},
    const {'1': '_encReactionMessage'},
    const {'1': '_editedMessage'},
    const {'1': '_viewOnceMessageV2Extension'},
    const {'1': '_pollCreationMessageV2'},
    const {'1': '_scheduledCallCreationMessage'},
    const {'1': '_groupMentionedMessage'},
    const {'1': '_pinInChatMessage'},
    const {'1': '_pollCreationMessageV3'},
    const {'1': '_scheduledCallEditMessage'},
    const {'1': '_ptvMessage'},
    const {'1': '_botInvokeMessage'},
    const {'1': '_callLogMesssage'},
    const {'1': '_messageHistoryBundle'},
    const {'1': '_encCommentMessage'},
    const {'1': '_bcallMessage'},
    const {'1': '_lottieStickerMessage'},
    const {'1': '_eventMessage'},
    const {'1': '_encEventResponseMessage'},
    const {'1': '_commentMessage'},
    const {'1': '_newsletterAdminInviteMessage'},
    const {'1': '_placeholderMessage'},
    const {'1': '_secretEncryptedMessage'},
    const {'1': '_albumMessage'},
    const {'1': '_eventCoverImage'},
    const {'1': '_stickerPackMessage'},
    const {'1': '_statusMentionMessage'},
    const {'1': '_pollResultSnapshotMessage'},
    const {'1': '_pollCreationOptionImageMessage'},
    const {'1': '_associatedChildMessage'},
    const {'1': '_groupStatusMentionMessage'},
    const {'1': '_pollCreationMessageV4'},
    const {'1': '_statusAddYours'},
    const {'1': '_groupStatusMessage'},
    const {'1': '_richResponseMessage'},
    const {'1': '_statusNotificationMessage'},
    const {'1': '_limitSharingMessage'},
    const {'1': '_botTaskMessage'},
    const {'1': '_questionMessage'},
    const {'1': '_messageHistoryNotice'},
    const {'1': '_groupStatusMessageV2'},
    const {'1': '_botForwardedMessage'},
    const {'1': '_statusQuestionAnswerMessage'},
    const {'1': '_questionReplyMessage'},
    const {'1': '_questionResponseMessage'},
    const {'1': '_statusQuotedMessage'},
    const {'1': '_statusStickerInteractionMessage'},
    const {'1': '_pollCreationMessageV5'},
    const {'1': '_newsletterFollowerInviteMessageV2'},
    const {'1': '_pollResultSnapshotMessageV3'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AlbumMessage$json = const {
  '1': 'AlbumMessage',
  '2': const [
    const {'1': 'expectedImageCount', '3': 2, '4': 1, '5': 13, '9': 0, '10': 'expectedImageCount', '17': true},
    const {'1': 'expectedVideoCount', '3': 3, '4': 1, '5': 13, '9': 1, '10': 'expectedVideoCount', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 2, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_expectedImageCount'},
    const {'1': '_expectedVideoCount'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AppStateFatalExceptionNotification$json = const {
  '1': 'AppStateFatalExceptionNotification',
  '2': const [
    const {'1': 'collectionNames', '3': 1, '4': 3, '5': 9, '10': 'collectionNames'},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_timestamp'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AppStateSyncKey$json = const {
  '1': 'AppStateSyncKey',
  '2': const [
    const {'1': 'keyId', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.AppStateSyncKeyId', '9': 0, '10': 'keyId', '17': true},
    const {'1': 'keyData', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.AppStateSyncKeyData', '9': 1, '10': 'keyData', '17': true},
  ],
  '8': const [
    const {'1': '_keyId'},
    const {'1': '_keyData'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AppStateSyncKeyData$json = const {
  '1': 'AppStateSyncKeyData',
  '2': const [
    const {'1': 'keyData', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'keyData', '17': true},
    const {'1': 'fingerprint', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.AppStateSyncKeyFingerprint', '9': 1, '10': 'fingerprint', '17': true},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_keyData'},
    const {'1': '_fingerprint'},
    const {'1': '_timestamp'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AppStateSyncKeyFingerprint$json = const {
  '1': 'AppStateSyncKeyFingerprint',
  '2': const [
    const {'1': 'rawId', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'rawId', '17': true},
    const {'1': 'currentIndex', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'currentIndex', '17': true},
    const {
      '1': 'deviceIndexes',
      '3': 3,
      '4': 3,
      '5': 13,
      '8': const {'2': true},
      '10': 'deviceIndexes',
    },
  ],
  '8': const [
    const {'1': '_rawId'},
    const {'1': '_currentIndex'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AppStateSyncKeyId$json = const {
  '1': 'AppStateSyncKeyId',
  '2': const [
    const {'1': 'keyId', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'keyId', '17': true},
  ],
  '8': const [
    const {'1': '_keyId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AppStateSyncKeyRequest$json = const {
  '1': 'AppStateSyncKeyRequest',
  '2': const [
    const {'1': 'keyIds', '3': 1, '4': 3, '5': 11, '6': '.proto.Message.AppStateSyncKeyId', '10': 'keyIds'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AppStateSyncKeyShare$json = const {
  '1': 'AppStateSyncKeyShare',
  '2': const [
    const {'1': 'keys', '3': 1, '4': 3, '5': 11, '6': '.proto.Message.AppStateSyncKey', '10': 'keys'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_AudioMessage$json = const {
  '1': 'AudioMessage',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'mimetype', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'mimetype', '17': true},
    const {'1': 'fileSha256', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'fileSha256', '17': true},
    const {'1': 'fileLength', '3': 4, '4': 1, '5': 4, '9': 3, '10': 'fileLength', '17': true},
    const {'1': 'seconds', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'seconds', '17': true},
    const {'1': 'ptt', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'ptt', '17': true},
    const {'1': 'mediaKey', '3': 7, '4': 1, '5': 12, '9': 6, '10': 'mediaKey', '17': true},
    const {'1': 'fileEncSha256', '3': 8, '4': 1, '5': 12, '9': 7, '10': 'fileEncSha256', '17': true},
    const {'1': 'directPath', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'directPath', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 10, '4': 1, '5': 3, '9': 9, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 10, '10': 'contextInfo', '17': true},
    const {'1': 'streamingSidecar', '3': 18, '4': 1, '5': 12, '9': 11, '10': 'streamingSidecar', '17': true},
    const {'1': 'waveform', '3': 19, '4': 1, '5': 12, '9': 12, '10': 'waveform', '17': true},
    const {'1': 'backgroundArgb', '3': 20, '4': 1, '5': 7, '9': 13, '10': 'backgroundArgb', '17': true},
    const {'1': 'viewOnce', '3': 21, '4': 1, '5': 8, '9': 14, '10': 'viewOnce', '17': true},
    const {'1': 'accessibilityLabel', '3': 22, '4': 1, '5': 9, '9': 15, '10': 'accessibilityLabel', '17': true},
    const {'1': 'mediaKeyDomain', '3': 23, '4': 1, '5': 14, '6': '.proto.Message.MediaKeyDomain', '9': 16, '10': 'mediaKeyDomain', '17': true},
  ],
  '8': const [
    const {'1': '_url'},
    const {'1': '_mimetype'},
    const {'1': '_fileSha256'},
    const {'1': '_fileLength'},
    const {'1': '_seconds'},
    const {'1': '_ptt'},
    const {'1': '_mediaKey'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_contextInfo'},
    const {'1': '_streamingSidecar'},
    const {'1': '_waveform'},
    const {'1': '_backgroundArgb'},
    const {'1': '_viewOnce'},
    const {'1': '_accessibilityLabel'},
    const {'1': '_mediaKeyDomain'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_BCallMessage$json = const {
  '1': 'BCallMessage',
  '2': const [
    const {'1': 'sessionId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'sessionId', '17': true},
    const {'1': 'mediaType', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.BCallMessage.MediaType', '9': 1, '10': 'mediaType', '17': true},
    const {'1': 'masterKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'masterKey', '17': true},
    const {'1': 'caption', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'caption', '17': true},
  ],
  '4': const [Message_BCallMessage_MediaType$json],
  '8': const [
    const {'1': '_sessionId'},
    const {'1': '_mediaType'},
    const {'1': '_masterKey'},
    const {'1': '_caption'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_BCallMessage_MediaType$json = const {
  '1': 'MediaType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'AUDIO', '2': 1},
    const {'1': 'VIDEO', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsMessage$json = const {
  '1': 'ButtonsMessage',
  '2': const [
    const {'1': 'contentText', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'contentText', '17': true},
    const {'1': 'footerText', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'footerText', '17': true},
    const {'1': 'contextInfo', '3': 8, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 3, '10': 'contextInfo', '17': true},
    const {'1': 'buttons', '3': 9, '4': 3, '5': 11, '6': '.proto.Message.ButtonsMessage.Button', '10': 'buttons'},
    const {'1': 'headerType', '3': 10, '4': 1, '5': 14, '6': '.proto.Message.ButtonsMessage.HeaderType', '9': 4, '10': 'headerType', '17': true},
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text'},
    const {'1': 'documentMessage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.DocumentMessage', '9': 0, '10': 'documentMessage'},
    const {'1': 'imageMessage', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.ImageMessage', '9': 0, '10': 'imageMessage'},
    const {'1': 'videoMessage', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.VideoMessage', '9': 0, '10': 'videoMessage'},
    const {'1': 'locationMessage', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.LocationMessage', '9': 0, '10': 'locationMessage'},
  ],
  '3': const [Message_ButtonsMessage_Button$json],
  '4': const [Message_ButtonsMessage_HeaderType$json],
  '8': const [
    const {'1': 'header'},
    const {'1': '_contentText'},
    const {'1': '_footerText'},
    const {'1': '_contextInfo'},
    const {'1': '_headerType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsMessage_Button$json = const {
  '1': 'Button',
  '2': const [
    const {'1': 'buttonId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'buttonId', '17': true},
    const {'1': 'buttonText', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.ButtonsMessage.Button.ButtonText', '9': 1, '10': 'buttonText', '17': true},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.proto.Message.ButtonsMessage.Button.Type', '9': 2, '10': 'type', '17': true},
    const {'1': 'nativeFlowInfo', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.ButtonsMessage.Button.NativeFlowInfo', '9': 3, '10': 'nativeFlowInfo', '17': true},
  ],
  '3': const [Message_ButtonsMessage_Button_ButtonText$json, Message_ButtonsMessage_Button_NativeFlowInfo$json],
  '4': const [Message_ButtonsMessage_Button_Type$json],
  '8': const [
    const {'1': '_buttonId'},
    const {'1': '_buttonText'},
    const {'1': '_type'},
    const {'1': '_nativeFlowInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsMessage_Button_ButtonText$json = const {
  '1': 'ButtonText',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayText', '17': true},
  ],
  '8': const [
    const {'1': '_displayText'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsMessage_Button_NativeFlowInfo$json = const {
  '1': 'NativeFlowInfo',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'paramsJson', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'paramsJson', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_paramsJson'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsMessage_Button_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'RESPONSE', '2': 1},
    const {'1': 'NATIVE_FLOW', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsMessage_HeaderType$json = const {
  '1': 'HeaderType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'EMPTY', '2': 1},
    const {'1': 'TEXT', '2': 2},
    const {'1': 'DOCUMENT', '2': 3},
    const {'1': 'IMAGE', '2': 4},
    const {'1': 'VIDEO', '2': 5},
    const {'1': 'LOCATION', '2': 6},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsResponseMessage$json = const {
  '1': 'ButtonsResponseMessage',
  '2': const [
    const {'1': 'selectedButtonId', '3': 1, '4': 1, '5': 9, '9': 1, '10': 'selectedButtonId', '17': true},
    const {'1': 'contextInfo', '3': 3, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 2, '10': 'contextInfo', '17': true},
    const {'1': 'type', '3': 4, '4': 1, '5': 14, '6': '.proto.Message.ButtonsResponseMessage.Type', '9': 3, '10': 'type', '17': true},
    const {'1': 'selectedDisplayText', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'selectedDisplayText'},
  ],
  '4': const [Message_ButtonsResponseMessage_Type$json],
  '8': const [
    const {'1': 'response'},
    const {'1': '_selectedButtonId'},
    const {'1': '_contextInfo'},
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ButtonsResponseMessage_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'DISPLAY_TEXT', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_Call$json = const {
  '1': 'Call',
  '2': const [
    const {'1': 'callKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'callKey', '17': true},
    const {'1': 'conversionSource', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'conversionSource', '17': true},
    const {'1': 'conversionData', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'conversionData', '17': true},
    const {'1': 'conversionDelaySeconds', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'conversionDelaySeconds', '17': true},
    const {'1': 'ctwaSignals', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'ctwaSignals', '17': true},
    const {'1': 'ctwaPayload', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'ctwaPayload', '17': true},
    const {'1': 'contextInfo', '3': 7, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 6, '10': 'contextInfo', '17': true},
    const {'1': 'nativeFlowCallButtonPayload', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'nativeFlowCallButtonPayload', '17': true},
    const {'1': 'deeplinkPayload', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'deeplinkPayload', '17': true},
  ],
  '8': const [
    const {'1': '_callKey'},
    const {'1': '_conversionSource'},
    const {'1': '_conversionData'},
    const {'1': '_conversionDelaySeconds'},
    const {'1': '_ctwaSignals'},
    const {'1': '_ctwaPayload'},
    const {'1': '_contextInfo'},
    const {'1': '_nativeFlowCallButtonPayload'},
    const {'1': '_deeplinkPayload'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CallLogMessage$json = const {
  '1': 'CallLogMessage',
  '2': const [
    const {'1': 'isVideo', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isVideo', '17': true},
    const {'1': 'callOutcome', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.CallLogMessage.CallOutcome', '9': 1, '10': 'callOutcome', '17': true},
    const {'1': 'durationSecs', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'durationSecs', '17': true},
    const {'1': 'callType', '3': 4, '4': 1, '5': 14, '6': '.proto.Message.CallLogMessage.CallType', '9': 3, '10': 'callType', '17': true},
    const {'1': 'participants', '3': 5, '4': 3, '5': 11, '6': '.proto.Message.CallLogMessage.CallParticipant', '10': 'participants'},
  ],
  '3': const [Message_CallLogMessage_CallParticipant$json],
  '4': const [Message_CallLogMessage_CallOutcome$json, Message_CallLogMessage_CallType$json],
  '8': const [
    const {'1': '_isVideo'},
    const {'1': '_callOutcome'},
    const {'1': '_durationSecs'},
    const {'1': '_callType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CallLogMessage_CallParticipant$json = const {
  '1': 'CallParticipant',
  '2': const [
    const {'1': 'jid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'jid', '17': true},
    const {'1': 'callOutcome', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.CallLogMessage.CallOutcome', '9': 1, '10': 'callOutcome', '17': true},
  ],
  '8': const [
    const {'1': '_jid'},
    const {'1': '_callOutcome'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CallLogMessage_CallOutcome$json = const {
  '1': 'CallOutcome',
  '2': const [
    const {'1': 'CONNECTED', '2': 0},
    const {'1': 'MISSED', '2': 1},
    const {'1': 'FAILED', '2': 2},
    const {'1': 'REJECTED', '2': 3},
    const {'1': 'ACCEPTED_ELSEWHERE', '2': 4},
    const {'1': 'ONGOING', '2': 5},
    const {'1': 'SILENCED_BY_DND', '2': 6},
    const {'1': 'SILENCED_UNKNOWN_CALLER', '2': 7},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CallLogMessage_CallType$json = const {
  '1': 'CallType',
  '2': const [
    const {'1': 'REGULAR', '2': 0},
    const {'1': 'SCHEDULED_CALL', '2': 1},
    const {'1': 'VOICE_CHAT', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CancelPaymentRequestMessage$json = const {
  '1': 'CancelPaymentRequestMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_Chat$json = const {
  '1': 'Chat',
  '2': const [
    const {'1': 'displayName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayName', '17': true},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'id', '17': true},
  ],
  '8': const [
    const {'1': '_displayName'},
    const {'1': '_id'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CloudAPIThreadControlNotification$json = const {
  '1': 'CloudAPIThreadControlNotification',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.CloudAPIThreadControlNotification.CloudAPIThreadControl', '9': 0, '10': 'status', '17': true},
    const {'1': 'senderNotificationTimestampMs', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'senderNotificationTimestampMs', '17': true},
    const {'1': 'consumerLid', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'consumerLid', '17': true},
    const {'1': 'consumerPhoneNumber', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'consumerPhoneNumber', '17': true},
    const {'1': 'notificationContent', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.CloudAPIThreadControlNotification.CloudAPIThreadControlNotificationContent', '9': 4, '10': 'notificationContent', '17': true},
    const {'1': 'shouldSuppressNotification', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'shouldSuppressNotification', '17': true},
  ],
  '3': const [Message_CloudAPIThreadControlNotification_CloudAPIThreadControlNotificationContent$json],
  '4': const [Message_CloudAPIThreadControlNotification_CloudAPIThreadControl$json],
  '8': const [
    const {'1': '_status'},
    const {'1': '_senderNotificationTimestampMs'},
    const {'1': '_consumerLid'},
    const {'1': '_consumerPhoneNumber'},
    const {'1': '_notificationContent'},
    const {'1': '_shouldSuppressNotification'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CloudAPIThreadControlNotification_CloudAPIThreadControlNotificationContent$json = const {
  '1': 'CloudAPIThreadControlNotificationContent',
  '2': const [
    const {'1': 'handoffNotificationText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'handoffNotificationText', '17': true},
    const {'1': 'extraJson', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'extraJson', '17': true},
  ],
  '8': const [
    const {'1': '_handoffNotificationText'},
    const {'1': '_extraJson'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CloudAPIThreadControlNotification_CloudAPIThreadControl$json = const {
  '1': 'CloudAPIThreadControl',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CONTROL_PASSED', '2': 1},
    const {'1': 'CONTROL_TAKEN', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_CommentMessage$json = const {
  '1': 'CommentMessage',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.proto.Message', '9': 0, '10': 'message', '17': true},
    const {'1': 'targetMessageKey', '3': 2, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 1, '10': 'targetMessageKey', '17': true},
  ],
  '8': const [
    const {'1': '_message'},
    const {'1': '_targetMessageKey'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ContactMessage$json = const {
  '1': 'ContactMessage',
  '2': const [
    const {'1': 'displayName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayName', '17': true},
    const {'1': 'vcard', '3': 16, '4': 1, '5': 9, '9': 1, '10': 'vcard', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 2, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_displayName'},
    const {'1': '_vcard'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ContactsArrayMessage$json = const {
  '1': 'ContactsArrayMessage',
  '2': const [
    const {'1': 'displayName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayName', '17': true},
    const {'1': 'contacts', '3': 2, '4': 3, '5': 11, '6': '.proto.Message.ContactMessage', '10': 'contacts'},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 1, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_displayName'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_DeclinePaymentRequestMessage$json = const {
  '1': 'DeclinePaymentRequestMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_DeviceSentMessage$json = const {
  '1': 'DeviceSentMessage',
  '2': const [
    const {'1': 'destinationJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'destinationJid', '17': true},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 1, '10': 'message', '17': true},
    const {'1': 'phash', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'phash', '17': true},
  ],
  '8': const [
    const {'1': '_destinationJid'},
    const {'1': '_message'},
    const {'1': '_phash'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_DocumentMessage$json = const {
  '1': 'DocumentMessage',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'mimetype', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'mimetype', '17': true},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'title', '17': true},
    const {'1': 'fileSha256', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'fileSha256', '17': true},
    const {'1': 'fileLength', '3': 5, '4': 1, '5': 4, '9': 4, '10': 'fileLength', '17': true},
    const {'1': 'pageCount', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'pageCount', '17': true},
    const {'1': 'mediaKey', '3': 7, '4': 1, '5': 12, '9': 6, '10': 'mediaKey', '17': true},
    const {'1': 'fileName', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'fileName', '17': true},
    const {'1': 'fileEncSha256', '3': 9, '4': 1, '5': 12, '9': 8, '10': 'fileEncSha256', '17': true},
    const {'1': 'directPath', '3': 10, '4': 1, '5': 9, '9': 9, '10': 'directPath', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 11, '4': 1, '5': 3, '9': 10, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'contactVcard', '3': 12, '4': 1, '5': 8, '9': 11, '10': 'contactVcard', '17': true},
    const {'1': 'thumbnailDirectPath', '3': 13, '4': 1, '5': 9, '9': 12, '10': 'thumbnailDirectPath', '17': true},
    const {'1': 'thumbnailSha256', '3': 14, '4': 1, '5': 12, '9': 13, '10': 'thumbnailSha256', '17': true},
    const {'1': 'thumbnailEncSha256', '3': 15, '4': 1, '5': 12, '9': 14, '10': 'thumbnailEncSha256', '17': true},
    const {'1': 'jpegThumbnail', '3': 16, '4': 1, '5': 12, '9': 15, '10': 'jpegThumbnail', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 16, '10': 'contextInfo', '17': true},
    const {'1': 'thumbnailHeight', '3': 18, '4': 1, '5': 13, '9': 17, '10': 'thumbnailHeight', '17': true},
    const {'1': 'thumbnailWidth', '3': 19, '4': 1, '5': 13, '9': 18, '10': 'thumbnailWidth', '17': true},
    const {'1': 'caption', '3': 20, '4': 1, '5': 9, '9': 19, '10': 'caption', '17': true},
    const {'1': 'accessibilityLabel', '3': 21, '4': 1, '5': 9, '9': 20, '10': 'accessibilityLabel', '17': true},
    const {'1': 'mediaKeyDomain', '3': 22, '4': 1, '5': 14, '6': '.proto.Message.MediaKeyDomain', '9': 21, '10': 'mediaKeyDomain', '17': true},
  ],
  '8': const [
    const {'1': '_url'},
    const {'1': '_mimetype'},
    const {'1': '_title'},
    const {'1': '_fileSha256'},
    const {'1': '_fileLength'},
    const {'1': '_pageCount'},
    const {'1': '_mediaKey'},
    const {'1': '_fileName'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_contactVcard'},
    const {'1': '_thumbnailDirectPath'},
    const {'1': '_thumbnailSha256'},
    const {'1': '_thumbnailEncSha256'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_contextInfo'},
    const {'1': '_thumbnailHeight'},
    const {'1': '_thumbnailWidth'},
    const {'1': '_caption'},
    const {'1': '_accessibilityLabel'},
    const {'1': '_mediaKeyDomain'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_EncCommentMessage$json = const {
  '1': 'EncCommentMessage',
  '2': const [
    const {'1': 'targetMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'targetMessageKey', '17': true},
    const {'1': 'encPayload', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'encPayload', '17': true},
    const {'1': 'encIv', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'encIv', '17': true},
  ],
  '8': const [
    const {'1': '_targetMessageKey'},
    const {'1': '_encPayload'},
    const {'1': '_encIv'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_EncEventResponseMessage$json = const {
  '1': 'EncEventResponseMessage',
  '2': const [
    const {'1': 'eventCreationMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'eventCreationMessageKey', '17': true},
    const {'1': 'encPayload', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'encPayload', '17': true},
    const {'1': 'encIv', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'encIv', '17': true},
  ],
  '8': const [
    const {'1': '_eventCreationMessageKey'},
    const {'1': '_encPayload'},
    const {'1': '_encIv'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_EncReactionMessage$json = const {
  '1': 'EncReactionMessage',
  '2': const [
    const {'1': 'targetMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'targetMessageKey', '17': true},
    const {'1': 'encPayload', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'encPayload', '17': true},
    const {'1': 'encIv', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'encIv', '17': true},
  ],
  '8': const [
    const {'1': '_targetMessageKey'},
    const {'1': '_encPayload'},
    const {'1': '_encIv'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_EventMessage$json = const {
  '1': 'EventMessage',
  '2': const [
    const {'1': 'contextInfo', '3': 1, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 0, '10': 'contextInfo', '17': true},
    const {'1': 'isCanceled', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'isCanceled', '17': true},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'name', '17': true},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'description', '17': true},
    const {'1': 'location', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.LocationMessage', '9': 4, '10': 'location', '17': true},
    const {'1': 'joinLink', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'joinLink', '17': true},
    const {'1': 'startTime', '3': 7, '4': 1, '5': 3, '9': 6, '10': 'startTime', '17': true},
    const {'1': 'endTime', '3': 8, '4': 1, '5': 3, '9': 7, '10': 'endTime', '17': true},
    const {'1': 'extraGuestsAllowed', '3': 9, '4': 1, '5': 8, '9': 8, '10': 'extraGuestsAllowed', '17': true},
    const {'1': 'isScheduleCall', '3': 10, '4': 1, '5': 8, '9': 9, '10': 'isScheduleCall', '17': true},
    const {'1': 'hasReminder', '3': 11, '4': 1, '5': 8, '9': 10, '10': 'hasReminder', '17': true},
    const {'1': 'reminderOffsetSec', '3': 12, '4': 1, '5': 3, '9': 11, '10': 'reminderOffsetSec', '17': true},
  ],
  '8': const [
    const {'1': '_contextInfo'},
    const {'1': '_isCanceled'},
    const {'1': '_name'},
    const {'1': '_description'},
    const {'1': '_location'},
    const {'1': '_joinLink'},
    const {'1': '_startTime'},
    const {'1': '_endTime'},
    const {'1': '_extraGuestsAllowed'},
    const {'1': '_isScheduleCall'},
    const {'1': '_hasReminder'},
    const {'1': '_reminderOffsetSec'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_EventResponseMessage$json = const {
  '1': 'EventResponseMessage',
  '2': const [
    const {'1': 'response', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.EventResponseMessage.EventResponseType', '9': 0, '10': 'response', '17': true},
    const {'1': 'timestampMs', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'timestampMs', '17': true},
    const {'1': 'extraGuestCount', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'extraGuestCount', '17': true},
  ],
  '4': const [Message_EventResponseMessage_EventResponseType$json],
  '8': const [
    const {'1': '_response'},
    const {'1': '_timestampMs'},
    const {'1': '_extraGuestCount'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_EventResponseMessage_EventResponseType$json = const {
  '1': 'EventResponseType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'GOING', '2': 1},
    const {'1': 'NOT_GOING', '2': 2},
    const {'1': 'MAYBE', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ExtendedTextMessage$json = const {
  '1': 'ExtendedTextMessage',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'matchedText', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'matchedText', '17': true},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'description', '17': true},
    const {'1': 'title', '3': 6, '4': 1, '5': 9, '9': 3, '10': 'title', '17': true},
    const {'1': 'textArgb', '3': 7, '4': 1, '5': 7, '9': 4, '10': 'textArgb', '17': true},
    const {'1': 'backgroundArgb', '3': 8, '4': 1, '5': 7, '9': 5, '10': 'backgroundArgb', '17': true},
    const {'1': 'font', '3': 9, '4': 1, '5': 14, '6': '.proto.Message.ExtendedTextMessage.FontType', '9': 6, '10': 'font', '17': true},
    const {'1': 'previewType', '3': 10, '4': 1, '5': 14, '6': '.proto.Message.ExtendedTextMessage.PreviewType', '9': 7, '10': 'previewType', '17': true},
    const {'1': 'jpegThumbnail', '3': 16, '4': 1, '5': 12, '9': 8, '10': 'jpegThumbnail', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 9, '10': 'contextInfo', '17': true},
    const {'1': 'doNotPlayInline', '3': 18, '4': 1, '5': 8, '9': 10, '10': 'doNotPlayInline', '17': true},
    const {'1': 'thumbnailDirectPath', '3': 19, '4': 1, '5': 9, '9': 11, '10': 'thumbnailDirectPath', '17': true},
    const {'1': 'thumbnailSha256', '3': 20, '4': 1, '5': 12, '9': 12, '10': 'thumbnailSha256', '17': true},
    const {'1': 'thumbnailEncSha256', '3': 21, '4': 1, '5': 12, '9': 13, '10': 'thumbnailEncSha256', '17': true},
    const {'1': 'mediaKey', '3': 22, '4': 1, '5': 12, '9': 14, '10': 'mediaKey', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 23, '4': 1, '5': 3, '9': 15, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'thumbnailHeight', '3': 24, '4': 1, '5': 13, '9': 16, '10': 'thumbnailHeight', '17': true},
    const {'1': 'thumbnailWidth', '3': 25, '4': 1, '5': 13, '9': 17, '10': 'thumbnailWidth', '17': true},
    const {'1': 'inviteLinkGroupType', '3': 26, '4': 1, '5': 14, '6': '.proto.Message.ExtendedTextMessage.InviteLinkGroupType', '9': 18, '10': 'inviteLinkGroupType', '17': true},
    const {'1': 'inviteLinkParentGroupSubjectV2', '3': 27, '4': 1, '5': 9, '9': 19, '10': 'inviteLinkParentGroupSubjectV2', '17': true},
    const {'1': 'inviteLinkParentGroupThumbnailV2', '3': 28, '4': 1, '5': 12, '9': 20, '10': 'inviteLinkParentGroupThumbnailV2', '17': true},
    const {'1': 'inviteLinkGroupTypeV2', '3': 29, '4': 1, '5': 14, '6': '.proto.Message.ExtendedTextMessage.InviteLinkGroupType', '9': 21, '10': 'inviteLinkGroupTypeV2', '17': true},
    const {'1': 'viewOnce', '3': 30, '4': 1, '5': 8, '9': 22, '10': 'viewOnce', '17': true},
    const {'1': 'videoHeight', '3': 31, '4': 1, '5': 13, '9': 23, '10': 'videoHeight', '17': true},
    const {'1': 'videoWidth', '3': 32, '4': 1, '5': 13, '9': 24, '10': 'videoWidth', '17': true},
    const {'1': 'faviconMMSMetadata', '3': 33, '4': 1, '5': 11, '6': '.proto.Message.MMSThumbnailMetadata', '9': 25, '10': 'faviconMMSMetadata', '17': true},
    const {'1': 'linkPreviewMetadata', '3': 34, '4': 1, '5': 11, '6': '.proto.Message.LinkPreviewMetadata', '9': 26, '10': 'linkPreviewMetadata', '17': true},
    const {'1': 'paymentLinkMetadata', '3': 35, '4': 1, '5': 11, '6': '.proto.Message.PaymentLinkMetadata', '9': 27, '10': 'paymentLinkMetadata', '17': true},
    const {'1': 'endCardTiles', '3': 36, '4': 3, '5': 11, '6': '.proto.Message.VideoEndCard', '10': 'endCardTiles'},
    const {'1': 'videoContentUrl', '3': 37, '4': 1, '5': 9, '9': 28, '10': 'videoContentUrl', '17': true},
    const {'1': 'musicMetadata', '3': 38, '4': 1, '5': 11, '6': '.proto.EmbeddedMusic', '9': 29, '10': 'musicMetadata', '17': true},
    const {'1': 'paymentExtendedMetadata', '3': 39, '4': 1, '5': 11, '6': '.proto.Message.PaymentExtendedMetadata', '9': 30, '10': 'paymentExtendedMetadata', '17': true},
  ],
  '4': const [Message_ExtendedTextMessage_FontType$json, Message_ExtendedTextMessage_InviteLinkGroupType$json, Message_ExtendedTextMessage_PreviewType$json],
  '8': const [
    const {'1': '_text'},
    const {'1': '_matchedText'},
    const {'1': '_description'},
    const {'1': '_title'},
    const {'1': '_textArgb'},
    const {'1': '_backgroundArgb'},
    const {'1': '_font'},
    const {'1': '_previewType'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_contextInfo'},
    const {'1': '_doNotPlayInline'},
    const {'1': '_thumbnailDirectPath'},
    const {'1': '_thumbnailSha256'},
    const {'1': '_thumbnailEncSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_thumbnailHeight'},
    const {'1': '_thumbnailWidth'},
    const {'1': '_inviteLinkGroupType'},
    const {'1': '_inviteLinkParentGroupSubjectV2'},
    const {'1': '_inviteLinkParentGroupThumbnailV2'},
    const {'1': '_inviteLinkGroupTypeV2'},
    const {'1': '_viewOnce'},
    const {'1': '_videoHeight'},
    const {'1': '_videoWidth'},
    const {'1': '_faviconMMSMetadata'},
    const {'1': '_linkPreviewMetadata'},
    const {'1': '_paymentLinkMetadata'},
    const {'1': '_videoContentUrl'},
    const {'1': '_musicMetadata'},
    const {'1': '_paymentExtendedMetadata'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ExtendedTextMessage_FontType$json = const {
  '1': 'FontType',
  '2': const [
    const {'1': 'SYSTEM', '2': 0},
    const {'1': 'SYSTEM_TEXT', '2': 1},
    const {'1': 'FB_SCRIPT', '2': 2},
    const {'1': 'SYSTEM_BOLD', '2': 6},
    const {'1': 'MORNINGBREEZE_REGULAR', '2': 7},
    const {'1': 'CALISTOGA_REGULAR', '2': 8},
    const {'1': 'EXO2_EXTRABOLD', '2': 9},
    const {'1': 'COURIERPRIME_BOLD', '2': 10},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ExtendedTextMessage_InviteLinkGroupType$json = const {
  '1': 'InviteLinkGroupType',
  '2': const [
    const {'1': 'DEFAULT', '2': 0},
    const {'1': 'PARENT', '2': 1},
    const {'1': 'SUB', '2': 2},
    const {'1': 'DEFAULT_SUB', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ExtendedTextMessage_PreviewType$json = const {
  '1': 'PreviewType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'VIDEO', '2': 1},
    const {'1': 'PLACEHOLDER', '2': 4},
    const {'1': 'IMAGE', '2': 5},
    const {'1': 'PAYMENT_LINKS', '2': 6},
    const {'1': 'PROFILE', '2': 7},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_FullHistorySyncOnDemandRequestMetadata$json = const {
  '1': 'FullHistorySyncOnDemandRequestMetadata',
  '2': const [
    const {'1': 'requestId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'requestId', '17': true},
  ],
  '8': const [
    const {'1': '_requestId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_FutureProofMessage$json = const {
  '1': 'FutureProofMessage',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.proto.Message', '9': 0, '10': 'message', '17': true},
  ],
  '8': const [
    const {'1': '_message'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_GroupInviteMessage$json = const {
  '1': 'GroupInviteMessage',
  '2': const [
    const {'1': 'groupJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'groupJid', '17': true},
    const {'1': 'inviteCode', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'inviteCode', '17': true},
    const {'1': 'inviteExpiration', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'inviteExpiration', '17': true},
    const {'1': 'groupName', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'groupName', '17': true},
    const {'1': 'jpegThumbnail', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'jpegThumbnail', '17': true},
    const {'1': 'caption', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'caption', '17': true},
    const {'1': 'contextInfo', '3': 7, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 6, '10': 'contextInfo', '17': true},
    const {'1': 'groupType', '3': 8, '4': 1, '5': 14, '6': '.proto.Message.GroupInviteMessage.GroupType', '9': 7, '10': 'groupType', '17': true},
  ],
  '4': const [Message_GroupInviteMessage_GroupType$json],
  '8': const [
    const {'1': '_groupJid'},
    const {'1': '_inviteCode'},
    const {'1': '_inviteExpiration'},
    const {'1': '_groupName'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_caption'},
    const {'1': '_contextInfo'},
    const {'1': '_groupType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_GroupInviteMessage_GroupType$json = const {
  '1': 'GroupType',
  '2': const [
    const {'1': 'DEFAULT', '2': 0},
    const {'1': 'PARENT', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage$json = const {
  '1': 'HighlyStructuredMessage',
  '2': const [
    const {'1': 'namespace', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'namespace', '17': true},
    const {'1': 'elementName', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'elementName', '17': true},
    const {'1': 'params', '3': 3, '4': 3, '5': 9, '10': 'params'},
    const {'1': 'fallbackLg', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'fallbackLg', '17': true},
    const {'1': 'fallbackLc', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'fallbackLc', '17': true},
    const {'1': 'localizableParams', '3': 6, '4': 3, '5': 11, '6': '.proto.Message.HighlyStructuredMessage.HSMLocalizableParameter', '10': 'localizableParams'},
    const {'1': 'deterministicLg', '3': 7, '4': 1, '5': 9, '9': 4, '10': 'deterministicLg', '17': true},
    const {'1': 'deterministicLc', '3': 8, '4': 1, '5': 9, '9': 5, '10': 'deterministicLc', '17': true},
    const {'1': 'hydratedHsm', '3': 9, '4': 1, '5': 11, '6': '.proto.Message.TemplateMessage', '9': 6, '10': 'hydratedHsm', '17': true},
  ],
  '3': const [Message_HighlyStructuredMessage_HSMLocalizableParameter$json],
  '8': const [
    const {'1': '_namespace'},
    const {'1': '_elementName'},
    const {'1': '_fallbackLg'},
    const {'1': '_fallbackLc'},
    const {'1': '_deterministicLg'},
    const {'1': '_deterministicLc'},
    const {'1': '_hydratedHsm'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage_HSMLocalizableParameter$json = const {
  '1': 'HSMLocalizableParameter',
  '2': const [
    const {'1': 'default', '3': 1, '4': 1, '5': 9, '9': 1, '10': 'default', '17': true},
    const {'1': 'currency', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage.HSMLocalizableParameter.HSMCurrency', '9': 0, '10': 'currency'},
    const {'1': 'dateTime', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage.HSMLocalizableParameter.HSMDateTime', '9': 0, '10': 'dateTime'},
  ],
  '3': const [Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMCurrency$json, Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime$json],
  '8': const [
    const {'1': 'paramOneof'},
    const {'1': '_default'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMCurrency$json = const {
  '1': 'HSMCurrency',
  '2': const [
    const {'1': 'currencyCode', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'currencyCode', '17': true},
    const {'1': 'amount1000', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'amount1000', '17': true},
  ],
  '8': const [
    const {'1': '_currencyCode'},
    const {'1': '_amount1000'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime$json = const {
  '1': 'HSMDateTime',
  '2': const [
    const {'1': 'component', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage.HSMLocalizableParameter.HSMDateTime.HSMDateTimeComponent', '9': 0, '10': 'component'},
    const {'1': 'unixEpoch', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage.HSMLocalizableParameter.HSMDateTime.HSMDateTimeUnixEpoch', '9': 0, '10': 'unixEpoch'},
  ],
  '3': const [Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent$json, Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeUnixEpoch$json],
  '8': const [
    const {'1': 'datetimeOneof'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent$json = const {
  '1': 'HSMDateTimeComponent',
  '2': const [
    const {'1': 'dayOfWeek', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.HighlyStructuredMessage.HSMLocalizableParameter.HSMDateTime.HSMDateTimeComponent.DayOfWeekType', '9': 0, '10': 'dayOfWeek', '17': true},
    const {'1': 'year', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'year', '17': true},
    const {'1': 'month', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'month', '17': true},
    const {'1': 'dayOfMonth', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'dayOfMonth', '17': true},
    const {'1': 'hour', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'hour', '17': true},
    const {'1': 'minute', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'minute', '17': true},
    const {'1': 'calendar', '3': 7, '4': 1, '5': 14, '6': '.proto.Message.HighlyStructuredMessage.HSMLocalizableParameter.HSMDateTime.HSMDateTimeComponent.CalendarType', '9': 6, '10': 'calendar', '17': true},
  ],
  '4': const [Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType$json, Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType$json],
  '8': const [
    const {'1': '_dayOfWeek'},
    const {'1': '_year'},
    const {'1': '_month'},
    const {'1': '_dayOfMonth'},
    const {'1': '_hour'},
    const {'1': '_minute'},
    const {'1': '_calendar'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType$json = const {
  '1': 'CalendarType',
  '2': const [
    const {'1': 'UNKNOWN_CALENDARTYPE_ZERO', '2': 0},
    const {'1': 'GREGORIAN', '2': 1},
    const {'1': 'SOLAR_HIJRI', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType$json = const {
  '1': 'DayOfWeekType',
  '2': const [
    const {'1': 'UNKNOWN_DAYOFWEEKTYPE_ZERO', '2': 0},
    const {'1': 'MONDAY', '2': 1},
    const {'1': 'TUESDAY', '2': 2},
    const {'1': 'WEDNESDAY', '2': 3},
    const {'1': 'THURSDAY', '2': 4},
    const {'1': 'FRIDAY', '2': 5},
    const {'1': 'SATURDAY', '2': 6},
    const {'1': 'SUNDAY', '2': 7},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeUnixEpoch$json = const {
  '1': 'HSMDateTimeUnixEpoch',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_timestamp'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HistorySyncMessageAccessStatus$json = const {
  '1': 'HistorySyncMessageAccessStatus',
  '2': const [
    const {'1': 'completeAccessGranted', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'completeAccessGranted', '17': true},
  ],
  '8': const [
    const {'1': '_completeAccessGranted'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HistorySyncNotification$json = const {
  '1': 'HistorySyncNotification',
  '2': const [
    const {'1': 'fileSha256', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'fileSha256', '17': true},
    const {'1': 'fileLength', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'fileLength', '17': true},
    const {'1': 'mediaKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'mediaKey', '17': true},
    const {'1': 'fileEncSha256', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'fileEncSha256', '17': true},
    const {'1': 'directPath', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'directPath', '17': true},
    const {'1': 'syncType', '3': 6, '4': 1, '5': 14, '6': '.proto.Message.HistorySyncType', '9': 5, '10': 'syncType', '17': true},
    const {'1': 'chunkOrder', '3': 7, '4': 1, '5': 13, '9': 6, '10': 'chunkOrder', '17': true},
    const {'1': 'originalMessageId', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'originalMessageId', '17': true},
    const {'1': 'progress', '3': 9, '4': 1, '5': 13, '9': 8, '10': 'progress', '17': true},
    const {'1': 'oldestMsgInChunkTimestampSec', '3': 10, '4': 1, '5': 3, '9': 9, '10': 'oldestMsgInChunkTimestampSec', '17': true},
    const {'1': 'initialHistBootstrapInlinePayload', '3': 11, '4': 1, '5': 12, '9': 10, '10': 'initialHistBootstrapInlinePayload', '17': true},
    const {'1': 'peerDataRequestSessionId', '3': 12, '4': 1, '5': 9, '9': 11, '10': 'peerDataRequestSessionId', '17': true},
    const {'1': 'fullHistorySyncOnDemandRequestMetadata', '3': 13, '4': 1, '5': 11, '6': '.proto.Message.FullHistorySyncOnDemandRequestMetadata', '9': 12, '10': 'fullHistorySyncOnDemandRequestMetadata', '17': true},
    const {'1': 'encHandle', '3': 14, '4': 1, '5': 9, '9': 13, '10': 'encHandle', '17': true},
    const {'1': 'messageAccessStatus', '3': 15, '4': 1, '5': 11, '6': '.proto.Message.HistorySyncMessageAccessStatus', '9': 14, '10': 'messageAccessStatus', '17': true},
  ],
  '8': const [
    const {'1': '_fileSha256'},
    const {'1': '_fileLength'},
    const {'1': '_mediaKey'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
    const {'1': '_syncType'},
    const {'1': '_chunkOrder'},
    const {'1': '_originalMessageId'},
    const {'1': '_progress'},
    const {'1': '_oldestMsgInChunkTimestampSec'},
    const {'1': '_initialHistBootstrapInlinePayload'},
    const {'1': '_peerDataRequestSessionId'},
    const {'1': '_fullHistorySyncOnDemandRequestMetadata'},
    const {'1': '_encHandle'},
    const {'1': '_messageAccessStatus'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ImageMessage$json = const {
  '1': 'ImageMessage',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'mimetype', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'mimetype', '17': true},
    const {'1': 'caption', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'caption', '17': true},
    const {'1': 'fileSha256', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'fileSha256', '17': true},
    const {'1': 'fileLength', '3': 5, '4': 1, '5': 4, '9': 4, '10': 'fileLength', '17': true},
    const {'1': 'height', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'height', '17': true},
    const {'1': 'width', '3': 7, '4': 1, '5': 13, '9': 6, '10': 'width', '17': true},
    const {'1': 'mediaKey', '3': 8, '4': 1, '5': 12, '9': 7, '10': 'mediaKey', '17': true},
    const {'1': 'fileEncSha256', '3': 9, '4': 1, '5': 12, '9': 8, '10': 'fileEncSha256', '17': true},
    const {'1': 'interactiveAnnotations', '3': 10, '4': 3, '5': 11, '6': '.proto.InteractiveAnnotation', '10': 'interactiveAnnotations'},
    const {'1': 'directPath', '3': 11, '4': 1, '5': 9, '9': 9, '10': 'directPath', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 12, '4': 1, '5': 3, '9': 10, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'jpegThumbnail', '3': 16, '4': 1, '5': 12, '9': 11, '10': 'jpegThumbnail', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 12, '10': 'contextInfo', '17': true},
    const {'1': 'firstScanSidecar', '3': 18, '4': 1, '5': 12, '9': 13, '10': 'firstScanSidecar', '17': true},
    const {'1': 'firstScanLength', '3': 19, '4': 1, '5': 13, '9': 14, '10': 'firstScanLength', '17': true},
    const {'1': 'experimentGroupId', '3': 20, '4': 1, '5': 13, '9': 15, '10': 'experimentGroupId', '17': true},
    const {'1': 'scansSidecar', '3': 21, '4': 1, '5': 12, '9': 16, '10': 'scansSidecar', '17': true},
    const {'1': 'scanLengths', '3': 22, '4': 3, '5': 13, '10': 'scanLengths'},
    const {'1': 'midQualityFileSha256', '3': 23, '4': 1, '5': 12, '9': 17, '10': 'midQualityFileSha256', '17': true},
    const {'1': 'midQualityFileEncSha256', '3': 24, '4': 1, '5': 12, '9': 18, '10': 'midQualityFileEncSha256', '17': true},
    const {'1': 'viewOnce', '3': 25, '4': 1, '5': 8, '9': 19, '10': 'viewOnce', '17': true},
    const {'1': 'thumbnailDirectPath', '3': 26, '4': 1, '5': 9, '9': 20, '10': 'thumbnailDirectPath', '17': true},
    const {'1': 'thumbnailSha256', '3': 27, '4': 1, '5': 12, '9': 21, '10': 'thumbnailSha256', '17': true},
    const {'1': 'thumbnailEncSha256', '3': 28, '4': 1, '5': 12, '9': 22, '10': 'thumbnailEncSha256', '17': true},
    const {'1': 'staticUrl', '3': 29, '4': 1, '5': 9, '9': 23, '10': 'staticUrl', '17': true},
    const {'1': 'annotations', '3': 30, '4': 3, '5': 11, '6': '.proto.InteractiveAnnotation', '10': 'annotations'},
    const {'1': 'imageSourceType', '3': 31, '4': 1, '5': 14, '6': '.proto.Message.ImageMessage.ImageSourceType', '9': 24, '10': 'imageSourceType', '17': true},
    const {'1': 'accessibilityLabel', '3': 32, '4': 1, '5': 9, '9': 25, '10': 'accessibilityLabel', '17': true},
    const {'1': 'mediaKeyDomain', '3': 33, '4': 1, '5': 14, '6': '.proto.Message.MediaKeyDomain', '9': 26, '10': 'mediaKeyDomain', '17': true},
    const {'1': 'qrUrl', '3': 34, '4': 1, '5': 9, '9': 27, '10': 'qrUrl', '17': true},
  ],
  '4': const [Message_ImageMessage_ImageSourceType$json],
  '8': const [
    const {'1': '_url'},
    const {'1': '_mimetype'},
    const {'1': '_caption'},
    const {'1': '_fileSha256'},
    const {'1': '_fileLength'},
    const {'1': '_height'},
    const {'1': '_width'},
    const {'1': '_mediaKey'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_contextInfo'},
    const {'1': '_firstScanSidecar'},
    const {'1': '_firstScanLength'},
    const {'1': '_experimentGroupId'},
    const {'1': '_scansSidecar'},
    const {'1': '_midQualityFileSha256'},
    const {'1': '_midQualityFileEncSha256'},
    const {'1': '_viewOnce'},
    const {'1': '_thumbnailDirectPath'},
    const {'1': '_thumbnailSha256'},
    const {'1': '_thumbnailEncSha256'},
    const {'1': '_staticUrl'},
    const {'1': '_imageSourceType'},
    const {'1': '_accessibilityLabel'},
    const {'1': '_mediaKeyDomain'},
    const {'1': '_qrUrl'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ImageMessage_ImageSourceType$json = const {
  '1': 'ImageSourceType',
  '2': const [
    const {'1': 'USER_IMAGE', '2': 0},
    const {'1': 'AI_GENERATED', '2': 1},
    const {'1': 'AI_MODIFIED', '2': 2},
    const {'1': 'RASTERIZED_TEXT_STATUS', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InitialSecurityNotificationSettingSync$json = const {
  '1': 'InitialSecurityNotificationSettingSync',
  '2': const [
    const {'1': 'securityNotificationEnabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'securityNotificationEnabled', '17': true},
  ],
  '8': const [
    const {'1': '_securityNotificationEnabled'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage$json = const {
  '1': 'InteractiveMessage',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage.Header', '9': 1, '10': 'header', '17': true},
    const {'1': 'body', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage.Body', '9': 2, '10': 'body', '17': true},
    const {'1': 'footer', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage.Footer', '9': 3, '10': 'footer', '17': true},
    const {'1': 'contextInfo', '3': 15, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 4, '10': 'contextInfo', '17': true},
    const {'1': 'urlTrackingMap', '3': 16, '4': 1, '5': 11, '6': '.proto.UrlTrackingMap', '9': 5, '10': 'urlTrackingMap', '17': true},
    const {'1': 'shopStorefrontMessage', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage.ShopMessage', '9': 0, '10': 'shopStorefrontMessage'},
    const {'1': 'collectionMessage', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage.CollectionMessage', '9': 0, '10': 'collectionMessage'},
    const {'1': 'nativeFlowMessage', '3': 6, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage.NativeFlowMessage', '9': 0, '10': 'nativeFlowMessage'},
    const {'1': 'carouselMessage', '3': 7, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage.CarouselMessage', '9': 0, '10': 'carouselMessage'},
  ],
  '3': const [Message_InteractiveMessage_Body$json, Message_InteractiveMessage_CarouselMessage$json, Message_InteractiveMessage_CollectionMessage$json, Message_InteractiveMessage_Footer$json, Message_InteractiveMessage_Header$json, Message_InteractiveMessage_NativeFlowMessage$json, Message_InteractiveMessage_ShopMessage$json],
  '8': const [
    const {'1': 'interactiveMessage'},
    const {'1': '_header'},
    const {'1': '_body'},
    const {'1': '_footer'},
    const {'1': '_contextInfo'},
    const {'1': '_urlTrackingMap'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_Body$json = const {
  '1': 'Body',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
  ],
  '8': const [
    const {'1': '_text'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_CarouselMessage$json = const {
  '1': 'CarouselMessage',
  '2': const [
    const {'1': 'cards', '3': 1, '4': 3, '5': 11, '6': '.proto.Message.InteractiveMessage', '10': 'cards'},
    const {'1': 'messageVersion', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'messageVersion', '17': true},
    const {'1': 'carouselCardType', '3': 3, '4': 1, '5': 14, '6': '.proto.Message.InteractiveMessage.CarouselMessage.CarouselCardType', '9': 1, '10': 'carouselCardType', '17': true},
  ],
  '4': const [Message_InteractiveMessage_CarouselMessage_CarouselCardType$json],
  '8': const [
    const {'1': '_messageVersion'},
    const {'1': '_carouselCardType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_CarouselMessage_CarouselCardType$json = const {
  '1': 'CarouselCardType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'HSCROLL_CARDS', '2': 1},
    const {'1': 'ALBUM_IMAGE', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_CollectionMessage$json = const {
  '1': 'CollectionMessage',
  '2': const [
    const {'1': 'bizJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'bizJid', '17': true},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'id', '17': true},
    const {'1': 'messageVersion', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'messageVersion', '17': true},
  ],
  '8': const [
    const {'1': '_bizJid'},
    const {'1': '_id'},
    const {'1': '_messageVersion'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_Footer$json = const {
  '1': 'Footer',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
    const {'1': 'hasMediaAttachment', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'hasMediaAttachment', '17': true},
    const {'1': 'audioMessage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.AudioMessage', '9': 0, '10': 'audioMessage'},
  ],
  '8': const [
    const {'1': 'media'},
    const {'1': '_text'},
    const {'1': '_hasMediaAttachment'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 1, '10': 'title', '17': true},
    const {'1': 'subtitle', '3': 2, '4': 1, '5': 9, '9': 2, '10': 'subtitle', '17': true},
    const {'1': 'hasMediaAttachment', '3': 5, '4': 1, '5': 8, '9': 3, '10': 'hasMediaAttachment', '17': true},
    const {'1': 'documentMessage', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.DocumentMessage', '9': 0, '10': 'documentMessage'},
    const {'1': 'imageMessage', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.ImageMessage', '9': 0, '10': 'imageMessage'},
    const {'1': 'jpegThumbnail', '3': 6, '4': 1, '5': 12, '9': 0, '10': 'jpegThumbnail'},
    const {'1': 'videoMessage', '3': 7, '4': 1, '5': 11, '6': '.proto.Message.VideoMessage', '9': 0, '10': 'videoMessage'},
    const {'1': 'locationMessage', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.LocationMessage', '9': 0, '10': 'locationMessage'},
    const {'1': 'productMessage', '3': 9, '4': 1, '5': 11, '6': '.proto.Message.ProductMessage', '9': 0, '10': 'productMessage'},
  ],
  '8': const [
    const {'1': 'media'},
    const {'1': '_title'},
    const {'1': '_subtitle'},
    const {'1': '_hasMediaAttachment'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_NativeFlowMessage$json = const {
  '1': 'NativeFlowMessage',
  '2': const [
    const {'1': 'buttons', '3': 1, '4': 3, '5': 11, '6': '.proto.Message.InteractiveMessage.NativeFlowMessage.NativeFlowButton', '10': 'buttons'},
    const {'1': 'messageParamsJson', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'messageParamsJson', '17': true},
    const {'1': 'messageVersion', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'messageVersion', '17': true},
  ],
  '3': const [Message_InteractiveMessage_NativeFlowMessage_NativeFlowButton$json],
  '8': const [
    const {'1': '_messageParamsJson'},
    const {'1': '_messageVersion'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_NativeFlowMessage_NativeFlowButton$json = const {
  '1': 'NativeFlowButton',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'buttonParamsJson', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'buttonParamsJson', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_buttonParamsJson'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_ShopMessage$json = const {
  '1': 'ShopMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
    const {'1': 'surface', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.InteractiveMessage.ShopMessage.Surface', '9': 1, '10': 'surface', '17': true},
    const {'1': 'messageVersion', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'messageVersion', '17': true},
  ],
  '4': const [Message_InteractiveMessage_ShopMessage_Surface$json],
  '8': const [
    const {'1': '_id'},
    const {'1': '_surface'},
    const {'1': '_messageVersion'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveMessage_ShopMessage_Surface$json = const {
  '1': 'Surface',
  '2': const [
    const {'1': 'UNKNOWN_SURFACE', '2': 0},
    const {'1': 'FB', '2': 1},
    const {'1': 'IG', '2': 2},
    const {'1': 'WA', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveResponseMessage$json = const {
  '1': 'InteractiveResponseMessage',
  '2': const [
    const {'1': 'body', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.InteractiveResponseMessage.Body', '9': 1, '10': 'body', '17': true},
    const {'1': 'contextInfo', '3': 15, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 2, '10': 'contextInfo', '17': true},
    const {'1': 'nativeFlowResponseMessage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.InteractiveResponseMessage.NativeFlowResponseMessage', '9': 0, '10': 'nativeFlowResponseMessage'},
  ],
  '3': const [Message_InteractiveResponseMessage_Body$json, Message_InteractiveResponseMessage_NativeFlowResponseMessage$json],
  '8': const [
    const {'1': 'interactiveResponseMessage'},
    const {'1': '_body'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveResponseMessage_Body$json = const {
  '1': 'Body',
  '2': const [
    const {'1': 'text', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'text', '17': true},
    const {'1': 'format', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.InteractiveResponseMessage.Body.Format', '9': 1, '10': 'format', '17': true},
  ],
  '4': const [Message_InteractiveResponseMessage_Body_Format$json],
  '8': const [
    const {'1': '_text'},
    const {'1': '_format'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveResponseMessage_Body_Format$json = const {
  '1': 'Format',
  '2': const [
    const {'1': 'DEFAULT', '2': 0},
    const {'1': 'EXTENSIONS_1', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InteractiveResponseMessage_NativeFlowResponseMessage$json = const {
  '1': 'NativeFlowResponseMessage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'paramsJson', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'paramsJson', '17': true},
    const {'1': 'version', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'version', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_paramsJson'},
    const {'1': '_version'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InvoiceMessage$json = const {
  '1': 'InvoiceMessage',
  '2': const [
    const {'1': 'note', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'note', '17': true},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'token', '17': true},
    const {'1': 'attachmentType', '3': 3, '4': 1, '5': 14, '6': '.proto.Message.InvoiceMessage.AttachmentType', '9': 2, '10': 'attachmentType', '17': true},
    const {'1': 'attachmentMimetype', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'attachmentMimetype', '17': true},
    const {'1': 'attachmentMediaKey', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'attachmentMediaKey', '17': true},
    const {'1': 'attachmentMediaKeyTimestamp', '3': 6, '4': 1, '5': 3, '9': 5, '10': 'attachmentMediaKeyTimestamp', '17': true},
    const {'1': 'attachmentFileSha256', '3': 7, '4': 1, '5': 12, '9': 6, '10': 'attachmentFileSha256', '17': true},
    const {'1': 'attachmentFileEncSha256', '3': 8, '4': 1, '5': 12, '9': 7, '10': 'attachmentFileEncSha256', '17': true},
    const {'1': 'attachmentDirectPath', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'attachmentDirectPath', '17': true},
    const {'1': 'attachmentJpegThumbnail', '3': 10, '4': 1, '5': 12, '9': 9, '10': 'attachmentJpegThumbnail', '17': true},
  ],
  '4': const [Message_InvoiceMessage_AttachmentType$json],
  '8': const [
    const {'1': '_note'},
    const {'1': '_token'},
    const {'1': '_attachmentType'},
    const {'1': '_attachmentMimetype'},
    const {'1': '_attachmentMediaKey'},
    const {'1': '_attachmentMediaKeyTimestamp'},
    const {'1': '_attachmentFileSha256'},
    const {'1': '_attachmentFileEncSha256'},
    const {'1': '_attachmentDirectPath'},
    const {'1': '_attachmentJpegThumbnail'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_InvoiceMessage_AttachmentType$json = const {
  '1': 'AttachmentType',
  '2': const [
    const {'1': 'IMAGE', '2': 0},
    const {'1': 'PDF', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_KeepInChatMessage$json = const {
  '1': 'KeepInChatMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'keepType', '3': 2, '4': 1, '5': 14, '6': '.proto.KeepType', '9': 1, '10': 'keepType', '17': true},
    const {'1': 'timestampMs', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'timestampMs', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_keepType'},
    const {'1': '_timestampMs'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_LinkPreviewMetadata$json = const {
  '1': 'LinkPreviewMetadata',
  '2': const [
    const {'1': 'paymentLinkMetadata', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.PaymentLinkMetadata', '9': 0, '10': 'paymentLinkMetadata', '17': true},
    const {'1': 'urlMetadata', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.URLMetadata', '9': 1, '10': 'urlMetadata', '17': true},
    const {'1': 'fbExperimentId', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'fbExperimentId', '17': true},
    const {'1': 'linkMediaDuration', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'linkMediaDuration', '17': true},
    const {'1': 'socialMediaPostType', '3': 5, '4': 1, '5': 14, '6': '.proto.Message.LinkPreviewMetadata.SocialMediaPostType', '9': 4, '10': 'socialMediaPostType', '17': true},
    const {'1': 'linkInlineVideoMuted', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'linkInlineVideoMuted', '17': true},
    const {'1': 'videoContentUrl', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'videoContentUrl', '17': true},
    const {'1': 'musicMetadata', '3': 8, '4': 1, '5': 11, '6': '.proto.EmbeddedMusic', '9': 7, '10': 'musicMetadata', '17': true},
    const {'1': 'videoContentCaption', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'videoContentCaption', '17': true},
  ],
  '4': const [Message_LinkPreviewMetadata_SocialMediaPostType$json],
  '8': const [
    const {'1': '_paymentLinkMetadata'},
    const {'1': '_urlMetadata'},
    const {'1': '_fbExperimentId'},
    const {'1': '_linkMediaDuration'},
    const {'1': '_socialMediaPostType'},
    const {'1': '_linkInlineVideoMuted'},
    const {'1': '_videoContentUrl'},
    const {'1': '_musicMetadata'},
    const {'1': '_videoContentCaption'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_LinkPreviewMetadata_SocialMediaPostType$json = const {
  '1': 'SocialMediaPostType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'REEL', '2': 1},
    const {'1': 'LIVE_VIDEO', '2': 2},
    const {'1': 'LONG_VIDEO', '2': 3},
    const {'1': 'SINGLE_IMAGE', '2': 4},
    const {'1': 'CAROUSEL', '2': 5},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage$json = const {
  '1': 'ListMessage',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    const {'1': 'buttonText', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'buttonText', '17': true},
    const {'1': 'listType', '3': 4, '4': 1, '5': 14, '6': '.proto.Message.ListMessage.ListType', '9': 3, '10': 'listType', '17': true},
    const {'1': 'sections', '3': 5, '4': 3, '5': 11, '6': '.proto.Message.ListMessage.Section', '10': 'sections'},
    const {'1': 'productListInfo', '3': 6, '4': 1, '5': 11, '6': '.proto.Message.ListMessage.ProductListInfo', '9': 4, '10': 'productListInfo', '17': true},
    const {'1': 'footerText', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'footerText', '17': true},
    const {'1': 'contextInfo', '3': 8, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 6, '10': 'contextInfo', '17': true},
  ],
  '3': const [Message_ListMessage_Product$json, Message_ListMessage_ProductListHeaderImage$json, Message_ListMessage_ProductListInfo$json, Message_ListMessage_ProductSection$json, Message_ListMessage_Row$json, Message_ListMessage_Section$json],
  '4': const [Message_ListMessage_ListType$json],
  '8': const [
    const {'1': '_title'},
    const {'1': '_description'},
    const {'1': '_buttonText'},
    const {'1': '_listType'},
    const {'1': '_productListInfo'},
    const {'1': '_footerText'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage_Product$json = const {
  '1': 'Product',
  '2': const [
    const {'1': 'productId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'productId', '17': true},
  ],
  '8': const [
    const {'1': '_productId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage_ProductListHeaderImage$json = const {
  '1': 'ProductListHeaderImage',
  '2': const [
    const {'1': 'productId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'productId', '17': true},
    const {'1': 'jpegThumbnail', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'jpegThumbnail', '17': true},
  ],
  '8': const [
    const {'1': '_productId'},
    const {'1': '_jpegThumbnail'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage_ProductListInfo$json = const {
  '1': 'ProductListInfo',
  '2': const [
    const {'1': 'productSections', '3': 1, '4': 3, '5': 11, '6': '.proto.Message.ListMessage.ProductSection', '10': 'productSections'},
    const {'1': 'headerImage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.ListMessage.ProductListHeaderImage', '9': 0, '10': 'headerImage', '17': true},
    const {'1': 'businessOwnerJid', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'businessOwnerJid', '17': true},
  ],
  '8': const [
    const {'1': '_headerImage'},
    const {'1': '_businessOwnerJid'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage_ProductSection$json = const {
  '1': 'ProductSection',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'products', '3': 2, '4': 3, '5': 11, '6': '.proto.Message.ListMessage.Product', '10': 'products'},
  ],
  '8': const [
    const {'1': '_title'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage_Row$json = const {
  '1': 'Row',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'description', '17': true},
    const {'1': 'rowId', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'rowId', '17': true},
  ],
  '8': const [
    const {'1': '_title'},
    const {'1': '_description'},
    const {'1': '_rowId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage_Section$json = const {
  '1': 'Section',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'rows', '3': 2, '4': 3, '5': 11, '6': '.proto.Message.ListMessage.Row', '10': 'rows'},
  ],
  '8': const [
    const {'1': '_title'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListMessage_ListType$json = const {
  '1': 'ListType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'SINGLE_SELECT', '2': 1},
    const {'1': 'PRODUCT_LIST', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListResponseMessage$json = const {
  '1': 'ListResponseMessage',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'listType', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.ListResponseMessage.ListType', '9': 1, '10': 'listType', '17': true},
    const {'1': 'singleSelectReply', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.ListResponseMessage.SingleSelectReply', '9': 2, '10': 'singleSelectReply', '17': true},
    const {'1': 'contextInfo', '3': 4, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 3, '10': 'contextInfo', '17': true},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'description', '17': true},
  ],
  '3': const [Message_ListResponseMessage_SingleSelectReply$json],
  '4': const [Message_ListResponseMessage_ListType$json],
  '8': const [
    const {'1': '_title'},
    const {'1': '_listType'},
    const {'1': '_singleSelectReply'},
    const {'1': '_contextInfo'},
    const {'1': '_description'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListResponseMessage_SingleSelectReply$json = const {
  '1': 'SingleSelectReply',
  '2': const [
    const {'1': 'selectedRowId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'selectedRowId', '17': true},
  ],
  '8': const [
    const {'1': '_selectedRowId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ListResponseMessage_ListType$json = const {
  '1': 'ListType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'SINGLE_SELECT', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_LiveLocationMessage$json = const {
  '1': 'LiveLocationMessage',
  '2': const [
    const {'1': 'degreesLatitude', '3': 1, '4': 1, '5': 1, '9': 0, '10': 'degreesLatitude', '17': true},
    const {'1': 'degreesLongitude', '3': 2, '4': 1, '5': 1, '9': 1, '10': 'degreesLongitude', '17': true},
    const {'1': 'accuracyInMeters', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'accuracyInMeters', '17': true},
    const {'1': 'speedInMps', '3': 4, '4': 1, '5': 2, '9': 3, '10': 'speedInMps', '17': true},
    const {'1': 'degreesClockwiseFromMagneticNorth', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'degreesClockwiseFromMagneticNorth', '17': true},
    const {'1': 'caption', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'caption', '17': true},
    const {'1': 'sequenceNumber', '3': 7, '4': 1, '5': 3, '9': 6, '10': 'sequenceNumber', '17': true},
    const {'1': 'timeOffset', '3': 8, '4': 1, '5': 13, '9': 7, '10': 'timeOffset', '17': true},
    const {'1': 'jpegThumbnail', '3': 16, '4': 1, '5': 12, '9': 8, '10': 'jpegThumbnail', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 9, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_degreesLatitude'},
    const {'1': '_degreesLongitude'},
    const {'1': '_accuracyInMeters'},
    const {'1': '_speedInMps'},
    const {'1': '_degreesClockwiseFromMagneticNorth'},
    const {'1': '_caption'},
    const {'1': '_sequenceNumber'},
    const {'1': '_timeOffset'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_LocationMessage$json = const {
  '1': 'LocationMessage',
  '2': const [
    const {'1': 'degreesLatitude', '3': 1, '4': 1, '5': 1, '9': 0, '10': 'degreesLatitude', '17': true},
    const {'1': 'degreesLongitude', '3': 2, '4': 1, '5': 1, '9': 1, '10': 'degreesLongitude', '17': true},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'name', '17': true},
    const {'1': 'address', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'address', '17': true},
    const {'1': 'url', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'url', '17': true},
    const {'1': 'isLive', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'isLive', '17': true},
    const {'1': 'accuracyInMeters', '3': 7, '4': 1, '5': 13, '9': 6, '10': 'accuracyInMeters', '17': true},
    const {'1': 'speedInMps', '3': 8, '4': 1, '5': 2, '9': 7, '10': 'speedInMps', '17': true},
    const {'1': 'degreesClockwiseFromMagneticNorth', '3': 9, '4': 1, '5': 13, '9': 8, '10': 'degreesClockwiseFromMagneticNorth', '17': true},
    const {'1': 'comment', '3': 11, '4': 1, '5': 9, '9': 9, '10': 'comment', '17': true},
    const {'1': 'jpegThumbnail', '3': 16, '4': 1, '5': 12, '9': 10, '10': 'jpegThumbnail', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 11, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_degreesLatitude'},
    const {'1': '_degreesLongitude'},
    const {'1': '_name'},
    const {'1': '_address'},
    const {'1': '_url'},
    const {'1': '_isLive'},
    const {'1': '_accuracyInMeters'},
    const {'1': '_speedInMps'},
    const {'1': '_degreesClockwiseFromMagneticNorth'},
    const {'1': '_comment'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MMSThumbnailMetadata$json = const {
  '1': 'MMSThumbnailMetadata',
  '2': const [
    const {'1': 'thumbnailDirectPath', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'thumbnailDirectPath', '17': true},
    const {'1': 'thumbnailSha256', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'thumbnailSha256', '17': true},
    const {'1': 'thumbnailEncSha256', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'thumbnailEncSha256', '17': true},
    const {'1': 'mediaKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'mediaKey', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'thumbnailHeight', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'thumbnailHeight', '17': true},
    const {'1': 'thumbnailWidth', '3': 7, '4': 1, '5': 13, '9': 6, '10': 'thumbnailWidth', '17': true},
    const {'1': 'mediaKeyDomain', '3': 8, '4': 1, '5': 14, '6': '.proto.Message.MediaKeyDomain', '9': 7, '10': 'mediaKeyDomain', '17': true},
  ],
  '8': const [
    const {'1': '_thumbnailDirectPath'},
    const {'1': '_thumbnailSha256'},
    const {'1': '_thumbnailEncSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_thumbnailHeight'},
    const {'1': '_thumbnailWidth'},
    const {'1': '_mediaKeyDomain'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MessageHistoryBundle$json = const {
  '1': 'MessageHistoryBundle',
  '2': const [
    const {'1': 'mimetype', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'mimetype', '17': true},
    const {'1': 'fileSha256', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'fileSha256', '17': true},
    const {'1': 'mediaKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'mediaKey', '17': true},
    const {'1': 'fileEncSha256', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'fileEncSha256', '17': true},
    const {'1': 'directPath', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'directPath', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 6, '4': 1, '5': 3, '9': 5, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'contextInfo', '3': 7, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 6, '10': 'contextInfo', '17': true},
    const {'1': 'messageHistoryMetadata', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.MessageHistoryMetadata', '9': 7, '10': 'messageHistoryMetadata', '17': true},
  ],
  '8': const [
    const {'1': '_mimetype'},
    const {'1': '_fileSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_contextInfo'},
    const {'1': '_messageHistoryMetadata'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MessageHistoryMetadata$json = const {
  '1': 'MessageHistoryMetadata',
  '2': const [
    const {'1': 'historyReceivers', '3': 1, '4': 3, '5': 9, '10': 'historyReceivers'},
    const {'1': 'oldestMessageTimestamp', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'oldestMessageTimestamp', '17': true},
    const {'1': 'messageCount', '3': 3, '4': 1, '5': 3, '9': 1, '10': 'messageCount', '17': true},
  ],
  '8': const [
    const {'1': '_oldestMessageTimestamp'},
    const {'1': '_messageCount'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MessageHistoryNotice$json = const {
  '1': 'MessageHistoryNotice',
  '2': const [
    const {'1': 'contextInfo', '3': 1, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 0, '10': 'contextInfo', '17': true},
    const {'1': 'messageHistoryMetadata', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.MessageHistoryMetadata', '9': 1, '10': 'messageHistoryMetadata', '17': true},
  ],
  '8': const [
    const {'1': '_contextInfo'},
    const {'1': '_messageHistoryMetadata'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_NewsletterAdminInviteMessage$json = const {
  '1': 'NewsletterAdminInviteMessage',
  '2': const [
    const {'1': 'newsletterJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'newsletterJid', '17': true},
    const {'1': 'newsletterName', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'newsletterName', '17': true},
    const {'1': 'jpegThumbnail', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'jpegThumbnail', '17': true},
    const {'1': 'caption', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'caption', '17': true},
    const {'1': 'inviteExpiration', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'inviteExpiration', '17': true},
    const {'1': 'contextInfo', '3': 6, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 5, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_newsletterJid'},
    const {'1': '_newsletterName'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_caption'},
    const {'1': '_inviteExpiration'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_NewsletterFollowerInviteMessage$json = const {
  '1': 'NewsletterFollowerInviteMessage',
  '2': const [
    const {'1': 'newsletterJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'newsletterJid', '17': true},
    const {'1': 'newsletterName', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'newsletterName', '17': true},
    const {'1': 'jpegThumbnail', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'jpegThumbnail', '17': true},
    const {'1': 'caption', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'caption', '17': true},
    const {'1': 'contextInfo', '3': 5, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 4, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_newsletterJid'},
    const {'1': '_newsletterName'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_caption'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_OrderMessage$json = const {
  '1': 'OrderMessage',
  '2': const [
    const {'1': 'orderId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'orderId', '17': true},
    const {'1': 'thumbnail', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'thumbnail', '17': true},
    const {'1': 'itemCount', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'itemCount', '17': true},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.proto.Message.OrderMessage.OrderStatus', '9': 3, '10': 'status', '17': true},
    const {'1': 'surface', '3': 5, '4': 1, '5': 14, '6': '.proto.Message.OrderMessage.OrderSurface', '9': 4, '10': 'surface', '17': true},
    const {'1': 'message', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'message', '17': true},
    const {'1': 'orderTitle', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'orderTitle', '17': true},
    const {'1': 'sellerJid', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'sellerJid', '17': true},
    const {'1': 'token', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'token', '17': true},
    const {'1': 'totalAmount1000', '3': 10, '4': 1, '5': 3, '9': 9, '10': 'totalAmount1000', '17': true},
    const {'1': 'totalCurrencyCode', '3': 11, '4': 1, '5': 9, '9': 10, '10': 'totalCurrencyCode', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 11, '10': 'contextInfo', '17': true},
    const {'1': 'messageVersion', '3': 12, '4': 1, '5': 5, '9': 12, '10': 'messageVersion', '17': true},
    const {'1': 'orderRequestMessageId', '3': 13, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 13, '10': 'orderRequestMessageId', '17': true},
    const {'1': 'catalogType', '3': 15, '4': 1, '5': 9, '9': 14, '10': 'catalogType', '17': true},
  ],
  '4': const [Message_OrderMessage_OrderStatus$json, Message_OrderMessage_OrderSurface$json],
  '8': const [
    const {'1': '_orderId'},
    const {'1': '_thumbnail'},
    const {'1': '_itemCount'},
    const {'1': '_status'},
    const {'1': '_surface'},
    const {'1': '_message'},
    const {'1': '_orderTitle'},
    const {'1': '_sellerJid'},
    const {'1': '_token'},
    const {'1': '_totalAmount1000'},
    const {'1': '_totalCurrencyCode'},
    const {'1': '_contextInfo'},
    const {'1': '_messageVersion'},
    const {'1': '_orderRequestMessageId'},
    const {'1': '_catalogType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_OrderMessage_OrderStatus$json = const {
  '1': 'OrderStatus',
  '2': const [
    const {'1': 'UNKNOWN_ORDERSTATUS_ZERO', '2': 0},
    const {'1': 'INQUIRY', '2': 1},
    const {'1': 'ACCEPTED', '2': 2},
    const {'1': 'DECLINED', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_OrderMessage_OrderSurface$json = const {
  '1': 'OrderSurface',
  '2': const [
    const {'1': 'UNKNOWN_ORDERSURFACE_ZERO', '2': 0},
    const {'1': 'CATALOG', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentExtendedMetadata$json = const {
  '1': 'PaymentExtendedMetadata',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'type', '17': true},
    const {'1': 'platform', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'platform', '17': true},
    const {'1': 'messageParamsJson', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'messageParamsJson', '17': true},
  ],
  '8': const [
    const {'1': '_type'},
    const {'1': '_platform'},
    const {'1': '_messageParamsJson'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentInviteMessage$json = const {
  '1': 'PaymentInviteMessage',
  '2': const [
    const {'1': 'serviceType', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.PaymentInviteMessage.ServiceType', '9': 0, '10': 'serviceType', '17': true},
    const {'1': 'expiryTimestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'expiryTimestamp', '17': true},
  ],
  '4': const [Message_PaymentInviteMessage_ServiceType$json],
  '8': const [
    const {'1': '_serviceType'},
    const {'1': '_expiryTimestamp'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentInviteMessage_ServiceType$json = const {
  '1': 'ServiceType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'FBPAY', '2': 1},
    const {'1': 'NOVI', '2': 2},
    const {'1': 'UPI', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentLinkMetadata$json = const {
  '1': 'PaymentLinkMetadata',
  '2': const [
    const {'1': 'button', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.PaymentLinkMetadata.PaymentLinkButton', '9': 0, '10': 'button', '17': true},
    const {'1': 'header', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.PaymentLinkMetadata.PaymentLinkHeader', '9': 1, '10': 'header', '17': true},
    const {'1': 'provider', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.PaymentLinkMetadata.PaymentLinkProvider', '9': 2, '10': 'provider', '17': true},
  ],
  '3': const [Message_PaymentLinkMetadata_PaymentLinkButton$json, Message_PaymentLinkMetadata_PaymentLinkHeader$json, Message_PaymentLinkMetadata_PaymentLinkProvider$json],
  '8': const [
    const {'1': '_button'},
    const {'1': '_header'},
    const {'1': '_provider'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentLinkMetadata_PaymentLinkButton$json = const {
  '1': 'PaymentLinkButton',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayText', '17': true},
  ],
  '8': const [
    const {'1': '_displayText'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentLinkMetadata_PaymentLinkHeader$json = const {
  '1': 'PaymentLinkHeader',
  '2': const [
    const {'1': 'headerType', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.PaymentLinkMetadata.PaymentLinkHeader.PaymentLinkHeaderType', '9': 0, '10': 'headerType', '17': true},
  ],
  '4': const [Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType$json],
  '8': const [
    const {'1': '_headerType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType$json = const {
  '1': 'PaymentLinkHeaderType',
  '2': const [
    const {'1': 'LINK_PREVIEW', '2': 0},
    const {'1': 'ORDER', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PaymentLinkMetadata_PaymentLinkProvider$json = const {
  '1': 'PaymentLinkProvider',
  '2': const [
    const {'1': 'paramsJson', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'paramsJson', '17': true},
  ],
  '8': const [
    const {'1': '_paramsJson'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage$json = const {
  '1': 'PeerDataOperationRequestMessage',
  '2': const [
    const {'1': 'peerDataOperationRequestType', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.PeerDataOperationRequestType', '9': 0, '10': 'peerDataOperationRequestType', '17': true},
    const {'1': 'requestStickerReupload', '3': 2, '4': 3, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.RequestStickerReupload', '10': 'requestStickerReupload'},
    const {'1': 'requestUrlPreview', '3': 3, '4': 3, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.RequestUrlPreview', '10': 'requestUrlPreview'},
    const {'1': 'historySyncOnDemandRequest', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.HistorySyncOnDemandRequest', '9': 1, '10': 'historySyncOnDemandRequest', '17': true},
    const {'1': 'placeholderMessageResendRequest', '3': 5, '4': 3, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.PlaceholderMessageResendRequest', '10': 'placeholderMessageResendRequest'},
    const {'1': 'fullHistorySyncOnDemandRequest', '3': 6, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.FullHistorySyncOnDemandRequest', '9': 2, '10': 'fullHistorySyncOnDemandRequest', '17': true},
    const {'1': 'syncdCollectionFatalRecoveryRequest', '3': 7, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.SyncDCollectionFatalRecoveryRequest', '9': 3, '10': 'syncdCollectionFatalRecoveryRequest', '17': true},
    const {'1': 'historySyncChunkRetryRequest', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.HistorySyncChunkRetryRequest', '9': 4, '10': 'historySyncChunkRetryRequest', '17': true},
    const {'1': 'galaxyFlowAction', '3': 9, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage.GalaxyFlowAction', '9': 5, '10': 'galaxyFlowAction', '17': true},
  ],
  '3': const [Message_PeerDataOperationRequestMessage_FullHistorySyncOnDemandRequest$json, Message_PeerDataOperationRequestMessage_GalaxyFlowAction$json, Message_PeerDataOperationRequestMessage_HistorySyncChunkRetryRequest$json, Message_PeerDataOperationRequestMessage_HistorySyncOnDemandRequest$json, Message_PeerDataOperationRequestMessage_PlaceholderMessageResendRequest$json, Message_PeerDataOperationRequestMessage_RequestStickerReupload$json, Message_PeerDataOperationRequestMessage_RequestUrlPreview$json, Message_PeerDataOperationRequestMessage_SyncDCollectionFatalRecoveryRequest$json],
  '8': const [
    const {'1': '_peerDataOperationRequestType'},
    const {'1': '_historySyncOnDemandRequest'},
    const {'1': '_fullHistorySyncOnDemandRequest'},
    const {'1': '_syncdCollectionFatalRecoveryRequest'},
    const {'1': '_historySyncChunkRetryRequest'},
    const {'1': '_galaxyFlowAction'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_FullHistorySyncOnDemandRequest$json = const {
  '1': 'FullHistorySyncOnDemandRequest',
  '2': const [
    const {'1': 'requestMetadata', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.FullHistorySyncOnDemandRequestMetadata', '9': 0, '10': 'requestMetadata', '17': true},
    const {'1': 'historySyncConfig', '3': 2, '4': 1, '5': 11, '6': '.proto.DeviceProps.HistorySyncConfig', '9': 1, '10': 'historySyncConfig', '17': true},
  ],
  '8': const [
    const {'1': '_requestMetadata'},
    const {'1': '_historySyncConfig'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_GalaxyFlowAction$json = const {
  '1': 'GalaxyFlowAction',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.PeerDataOperationRequestMessage.GalaxyFlowAction.GalaxyFlowActionType', '9': 0, '10': 'type', '17': true},
    const {'1': 'flowId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'flowId', '17': true},
    const {'1': 'stanzaId', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'stanzaId', '17': true},
  ],
  '4': const [Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType$json],
  '8': const [
    const {'1': '_type'},
    const {'1': '_flowId'},
    const {'1': '_stanzaId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType$json = const {
  '1': 'GalaxyFlowActionType',
  '2': const [
    const {'1': 'UNKNOWN_GALAXYFLOWACTIONTYPE_ZERO', '2': 0},
    const {'1': 'NOTIFY_LAUNCH', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_HistorySyncChunkRetryRequest$json = const {
  '1': 'HistorySyncChunkRetryRequest',
  '2': const [
    const {'1': 'syncType', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.HistorySyncType', '9': 0, '10': 'syncType', '17': true},
    const {'1': 'chunkOrder', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'chunkOrder', '17': true},
    const {'1': 'chunkNotificationId', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'chunkNotificationId', '17': true},
    const {'1': 'regenerateChunk', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'regenerateChunk', '17': true},
  ],
  '8': const [
    const {'1': '_syncType'},
    const {'1': '_chunkOrder'},
    const {'1': '_chunkNotificationId'},
    const {'1': '_regenerateChunk'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_HistorySyncOnDemandRequest$json = const {
  '1': 'HistorySyncOnDemandRequest',
  '2': const [
    const {'1': 'chatJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'chatJid', '17': true},
    const {'1': 'oldestMsgId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'oldestMsgId', '17': true},
    const {'1': 'oldestMsgFromMe', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'oldestMsgFromMe', '17': true},
    const {'1': 'onDemandMsgCount', '3': 4, '4': 1, '5': 5, '9': 3, '10': 'onDemandMsgCount', '17': true},
    const {'1': 'oldestMsgTimestampMs', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'oldestMsgTimestampMs', '17': true},
    const {'1': 'accountLid', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'accountLid', '17': true},
  ],
  '8': const [
    const {'1': '_chatJid'},
    const {'1': '_oldestMsgId'},
    const {'1': '_oldestMsgFromMe'},
    const {'1': '_onDemandMsgCount'},
    const {'1': '_oldestMsgTimestampMs'},
    const {'1': '_accountLid'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_PlaceholderMessageResendRequest$json = const {
  '1': 'PlaceholderMessageResendRequest',
  '2': const [
    const {'1': 'messageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'messageKey', '17': true},
  ],
  '8': const [
    const {'1': '_messageKey'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_RequestStickerReupload$json = const {
  '1': 'RequestStickerReupload',
  '2': const [
    const {'1': 'fileSha256', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'fileSha256', '17': true},
  ],
  '8': const [
    const {'1': '_fileSha256'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_RequestUrlPreview$json = const {
  '1': 'RequestUrlPreview',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'includeHqThumbnail', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'includeHqThumbnail', '17': true},
  ],
  '8': const [
    const {'1': '_url'},
    const {'1': '_includeHqThumbnail'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestMessage_SyncDCollectionFatalRecoveryRequest$json = const {
  '1': 'SyncDCollectionFatalRecoveryRequest',
  '2': const [
    const {'1': 'collectionName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'collectionName', '17': true},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_collectionName'},
    const {'1': '_timestamp'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage$json = const {
  '1': 'PeerDataOperationRequestResponseMessage',
  '2': const [
    const {'1': 'peerDataOperationRequestType', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.PeerDataOperationRequestType', '9': 0, '10': 'peerDataOperationRequestType', '17': true},
    const {'1': 'stanzaId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'stanzaId', '17': true},
    const {'1': 'peerDataOperationResult', '3': 3, '4': 3, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult', '10': 'peerDataOperationResult'},
  ],
  '3': const [Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult$json],
  '8': const [
    const {'1': '_peerDataOperationRequestType'},
    const {'1': '_stanzaId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult$json = const {
  '1': 'PeerDataOperationResult',
  '2': const [
    const {'1': 'mediaUploadResult', '3': 1, '4': 1, '5': 14, '6': '.proto.MediaRetryNotification.ResultType', '9': 0, '10': 'mediaUploadResult', '17': true},
    const {'1': 'stickerMessage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.StickerMessage', '9': 1, '10': 'stickerMessage', '17': true},
    const {'1': 'linkPreviewResponse', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.LinkPreviewResponse', '9': 2, '10': 'linkPreviewResponse', '17': true},
    const {'1': 'placeholderMessageResendResponse', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.PlaceholderMessageResendResponse', '9': 3, '10': 'placeholderMessageResendResponse', '17': true},
    const {'1': 'waffleNonceFetchRequestResponse', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.WaffleNonceFetchResponse', '9': 4, '10': 'waffleNonceFetchRequestResponse', '17': true},
    const {'1': 'fullHistorySyncOnDemandRequestResponse', '3': 6, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.FullHistorySyncOnDemandRequestResponse', '9': 5, '10': 'fullHistorySyncOnDemandRequestResponse', '17': true},
    const {'1': 'companionMetaNonceFetchRequestResponse', '3': 7, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.CompanionMetaNonceFetchResponse', '9': 6, '10': 'companionMetaNonceFetchRequestResponse', '17': true},
    const {'1': 'syncdSnapshotFatalRecoveryResponse', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.SyncDSnapshotFatalRecoveryResponse', '9': 7, '10': 'syncdSnapshotFatalRecoveryResponse', '17': true},
    const {'1': 'companionCanonicalUserNonceFetchRequestResponse', '3': 9, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.CompanionCanonicalUserNonceFetchResponse', '9': 8, '10': 'companionCanonicalUserNonceFetchRequestResponse', '17': true},
    const {'1': 'historySyncChunkRetryResponse', '3': 10, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.HistorySyncChunkRetryResponse', '9': 9, '10': 'historySyncChunkRetryResponse', '17': true},
  ],
  '3': const [Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_CompanionCanonicalUserNonceFetchResponse$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_CompanionMetaNonceFetchResponse$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandRequestResponse$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponse$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_LinkPreviewResponse$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_PlaceholderMessageResendResponse$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_SyncDSnapshotFatalRecoveryResponse$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_WaffleNonceFetchResponse$json],
  '4': const [Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode$json],
  '8': const [
    const {'1': '_mediaUploadResult'},
    const {'1': '_stickerMessage'},
    const {'1': '_linkPreviewResponse'},
    const {'1': '_placeholderMessageResendResponse'},
    const {'1': '_waffleNonceFetchRequestResponse'},
    const {'1': '_fullHistorySyncOnDemandRequestResponse'},
    const {'1': '_companionMetaNonceFetchRequestResponse'},
    const {'1': '_syncdSnapshotFatalRecoveryResponse'},
    const {'1': '_companionCanonicalUserNonceFetchRequestResponse'},
    const {'1': '_historySyncChunkRetryResponse'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_CompanionCanonicalUserNonceFetchResponse$json = const {
  '1': 'CompanionCanonicalUserNonceFetchResponse',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'nonce', '17': true},
    const {'1': 'waFbid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'waFbid', '17': true},
    const {'1': 'forceRefresh', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'forceRefresh', '17': true},
  ],
  '8': const [
    const {'1': '_nonce'},
    const {'1': '_waFbid'},
    const {'1': '_forceRefresh'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_CompanionMetaNonceFetchResponse$json = const {
  '1': 'CompanionMetaNonceFetchResponse',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'nonce', '17': true},
  ],
  '8': const [
    const {'1': '_nonce'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandRequestResponse$json = const {
  '1': 'FullHistorySyncOnDemandRequestResponse',
  '2': const [
    const {'1': 'requestMetadata', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.FullHistorySyncOnDemandRequestMetadata', '9': 0, '10': 'requestMetadata', '17': true},
    const {'1': 'responseCode', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.FullHistorySyncOnDemandResponseCode', '9': 1, '10': 'responseCode', '17': true},
  ],
  '8': const [
    const {'1': '_requestMetadata'},
    const {'1': '_responseCode'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponse$json = const {
  '1': 'HistorySyncChunkRetryResponse',
  '2': const [
    const {'1': 'syncType', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.HistorySyncType', '9': 0, '10': 'syncType', '17': true},
    const {'1': 'chunkOrder', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'chunkOrder', '17': true},
    const {'1': 'requestId', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'requestId', '17': true},
    const {'1': 'responseCode', '3': 4, '4': 1, '5': 14, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.HistorySyncChunkRetryResponseCode', '9': 3, '10': 'responseCode', '17': true},
    const {'1': 'canRecover', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'canRecover', '17': true},
  ],
  '8': const [
    const {'1': '_syncType'},
    const {'1': '_chunkOrder'},
    const {'1': '_requestId'},
    const {'1': '_responseCode'},
    const {'1': '_canRecover'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_LinkPreviewResponse$json = const {
  '1': 'LinkPreviewResponse',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'title', '17': true},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'description', '17': true},
    const {'1': 'thumbData', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'thumbData', '17': true},
    const {'1': 'matchText', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'matchText', '17': true},
    const {'1': 'previewType', '3': 7, '4': 1, '5': 9, '9': 5, '10': 'previewType', '17': true},
    const {'1': 'hqThumbnail', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.LinkPreviewResponse.LinkPreviewHighQualityThumbnail', '9': 6, '10': 'hqThumbnail', '17': true},
    const {'1': 'previewMetadata', '3': 9, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage.PeerDataOperationResult.LinkPreviewResponse.PaymentLinkPreviewMetadata', '9': 7, '10': 'previewMetadata', '17': true},
  ],
  '3': const [Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_LinkPreviewResponse_LinkPreviewHighQualityThumbnail$json, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_LinkPreviewResponse_PaymentLinkPreviewMetadata$json],
  '8': const [
    const {'1': '_url'},
    const {'1': '_title'},
    const {'1': '_description'},
    const {'1': '_thumbData'},
    const {'1': '_matchText'},
    const {'1': '_previewType'},
    const {'1': '_hqThumbnail'},
    const {'1': '_previewMetadata'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_LinkPreviewResponse_LinkPreviewHighQualityThumbnail$json = const {
  '1': 'LinkPreviewHighQualityThumbnail',
  '2': const [
    const {'1': 'directPath', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'directPath', '17': true},
    const {'1': 'thumbHash', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'thumbHash', '17': true},
    const {'1': 'encThumbHash', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'encThumbHash', '17': true},
    const {'1': 'mediaKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'mediaKey', '17': true},
    const {'1': 'mediaKeyTimestampMs', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'mediaKeyTimestampMs', '17': true},
    const {'1': 'thumbWidth', '3': 6, '4': 1, '5': 5, '9': 5, '10': 'thumbWidth', '17': true},
    const {'1': 'thumbHeight', '3': 7, '4': 1, '5': 5, '9': 6, '10': 'thumbHeight', '17': true},
  ],
  '8': const [
    const {'1': '_directPath'},
    const {'1': '_thumbHash'},
    const {'1': '_encThumbHash'},
    const {'1': '_mediaKey'},
    const {'1': '_mediaKeyTimestampMs'},
    const {'1': '_thumbWidth'},
    const {'1': '_thumbHeight'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_LinkPreviewResponse_PaymentLinkPreviewMetadata$json = const {
  '1': 'PaymentLinkPreviewMetadata',
  '2': const [
    const {'1': 'isBusinessVerified', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isBusinessVerified', '17': true},
    const {'1': 'providerName', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'providerName', '17': true},
  ],
  '8': const [
    const {'1': '_isBusinessVerified'},
    const {'1': '_providerName'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_PlaceholderMessageResendResponse$json = const {
  '1': 'PlaceholderMessageResendResponse',
  '2': const [
    const {'1': 'webMessageInfoBytes', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'webMessageInfoBytes', '17': true},
  ],
  '8': const [
    const {'1': '_webMessageInfoBytes'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_SyncDSnapshotFatalRecoveryResponse$json = const {
  '1': 'SyncDSnapshotFatalRecoveryResponse',
  '2': const [
    const {'1': 'collectionSnapshot', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'collectionSnapshot', '17': true},
    const {'1': 'isCompressed', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'isCompressed', '17': true},
  ],
  '8': const [
    const {'1': '_collectionSnapshot'},
    const {'1': '_isCompressed'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_WaffleNonceFetchResponse$json = const {
  '1': 'WaffleNonceFetchResponse',
  '2': const [
    const {'1': 'nonce', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'nonce', '17': true},
    const {'1': 'waEntFbid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'waEntFbid', '17': true},
  ],
  '8': const [
    const {'1': '_nonce'},
    const {'1': '_waEntFbid'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode$json = const {
  '1': 'FullHistorySyncOnDemandResponseCode',
  '2': const [
    const {'1': 'REQUEST_SUCCESS', '2': 0},
    const {'1': 'REQUEST_TIME_EXPIRED', '2': 1},
    const {'1': 'DECLINED_SHARING_HISTORY', '2': 2},
    const {'1': 'GENERIC_ERROR', '2': 3},
    const {'1': 'ERROR_REQUEST_ON_NON_SMB_PRIMARY', '2': 4},
    const {'1': 'ERROR_HOSTED_DEVICE_NOT_CONNECTED', '2': 5},
    const {'1': 'ERROR_HOSTED_DEVICE_LOGIN_TIME_NOT_SET', '2': 6},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode$json = const {
  '1': 'HistorySyncChunkRetryResponseCode',
  '2': const [
    const {'1': 'UNKNOWN_HISTORYSYNCCHUNKRETRYRESPONSECODE_ZERO', '2': 0},
    const {'1': 'GENERATION_ERROR', '2': 1},
    const {'1': 'CHUNK_CONSUMED', '2': 2},
    const {'1': 'TIMEOUT', '2': 3},
    const {'1': 'SESSION_EXHAUSTED', '2': 4},
    const {'1': 'CHUNK_EXHAUSTED', '2': 5},
    const {'1': 'DUPLICATED_REQUEST', '2': 6},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PinInChatMessage$json = const {
  '1': 'PinInChatMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.PinInChatMessage.Type', '9': 1, '10': 'type', '17': true},
    const {'1': 'senderTimestampMs', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'senderTimestampMs', '17': true},
  ],
  '4': const [Message_PinInChatMessage_Type$json],
  '8': const [
    const {'1': '_key'},
    const {'1': '_type'},
    const {'1': '_senderTimestampMs'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PinInChatMessage_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN_TYPE', '2': 0},
    const {'1': 'PIN_FOR_ALL', '2': 1},
    const {'1': 'UNPIN_FOR_ALL', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PlaceholderMessage$json = const {
  '1': 'PlaceholderMessage',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.PlaceholderMessage.PlaceholderType', '9': 0, '10': 'type', '17': true},
  ],
  '4': const [Message_PlaceholderMessage_PlaceholderType$json],
  '8': const [
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PlaceholderMessage_PlaceholderType$json = const {
  '1': 'PlaceholderType',
  '2': const [
    const {'1': 'MASK_LINKED_DEVICES', '2': 0},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollCreationMessage$json = const {
  '1': 'PollCreationMessage',
  '2': const [
    const {'1': 'encKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'encKey', '17': true},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'name', '17': true},
    const {'1': 'options', '3': 3, '4': 3, '5': 11, '6': '.proto.Message.PollCreationMessage.Option', '10': 'options'},
    const {'1': 'selectableOptionsCount', '3': 4, '4': 1, '5': 13, '9': 2, '10': 'selectableOptionsCount', '17': true},
    const {'1': 'contextInfo', '3': 5, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 3, '10': 'contextInfo', '17': true},
    const {'1': 'pollContentType', '3': 6, '4': 1, '5': 14, '6': '.proto.Message.PollContentType', '9': 4, '10': 'pollContentType', '17': true},
    const {'1': 'pollType', '3': 7, '4': 1, '5': 14, '6': '.proto.Message.PollType', '9': 5, '10': 'pollType', '17': true},
    const {'1': 'correctAnswer', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.PollCreationMessage.Option', '9': 6, '10': 'correctAnswer', '17': true},
  ],
  '3': const [Message_PollCreationMessage_Option$json],
  '8': const [
    const {'1': '_encKey'},
    const {'1': '_name'},
    const {'1': '_selectableOptionsCount'},
    const {'1': '_contextInfo'},
    const {'1': '_pollContentType'},
    const {'1': '_pollType'},
    const {'1': '_correctAnswer'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollCreationMessage_Option$json = const {
  '1': 'Option',
  '2': const [
    const {'1': 'optionName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'optionName', '17': true},
    const {'1': 'optionHash', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'optionHash', '17': true},
  ],
  '8': const [
    const {'1': '_optionName'},
    const {'1': '_optionHash'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollEncValue$json = const {
  '1': 'PollEncValue',
  '2': const [
    const {'1': 'encPayload', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'encPayload', '17': true},
    const {'1': 'encIv', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'encIv', '17': true},
  ],
  '8': const [
    const {'1': '_encPayload'},
    const {'1': '_encIv'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollResultSnapshotMessage$json = const {
  '1': 'PollResultSnapshotMessage',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'pollVotes', '3': 2, '4': 3, '5': 11, '6': '.proto.Message.PollResultSnapshotMessage.PollVote', '10': 'pollVotes'},
    const {'1': 'contextInfo', '3': 3, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 1, '10': 'contextInfo', '17': true},
    const {'1': 'pollType', '3': 4, '4': 1, '5': 14, '6': '.proto.Message.PollType', '9': 2, '10': 'pollType', '17': true},
  ],
  '3': const [Message_PollResultSnapshotMessage_PollVote$json],
  '8': const [
    const {'1': '_name'},
    const {'1': '_contextInfo'},
    const {'1': '_pollType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollResultSnapshotMessage_PollVote$json = const {
  '1': 'PollVote',
  '2': const [
    const {'1': 'optionName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'optionName', '17': true},
    const {'1': 'optionVoteCount', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'optionVoteCount', '17': true},
  ],
  '8': const [
    const {'1': '_optionName'},
    const {'1': '_optionVoteCount'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollUpdateMessage$json = const {
  '1': 'PollUpdateMessage',
  '2': const [
    const {'1': 'pollCreationMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'pollCreationMessageKey', '17': true},
    const {'1': 'vote', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.PollEncValue', '9': 1, '10': 'vote', '17': true},
    const {'1': 'metadata', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.PollUpdateMessageMetadata', '9': 2, '10': 'metadata', '17': true},
    const {'1': 'senderTimestampMs', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'senderTimestampMs', '17': true},
  ],
  '8': const [
    const {'1': '_pollCreationMessageKey'},
    const {'1': '_vote'},
    const {'1': '_metadata'},
    const {'1': '_senderTimestampMs'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollUpdateMessageMetadata$json = const {
  '1': 'PollUpdateMessageMetadata',
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollVoteMessage$json = const {
  '1': 'PollVoteMessage',
  '2': const [
    const {'1': 'selectedOptions', '3': 1, '4': 3, '5': 12, '10': 'selectedOptions'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ProductMessage$json = const {
  '1': 'ProductMessage',
  '2': const [
    const {'1': 'product', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.ProductMessage.ProductSnapshot', '9': 0, '10': 'product', '17': true},
    const {'1': 'businessOwnerJid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'businessOwnerJid', '17': true},
    const {'1': 'catalog', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.ProductMessage.CatalogSnapshot', '9': 2, '10': 'catalog', '17': true},
    const {'1': 'body', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'body', '17': true},
    const {'1': 'footer', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'footer', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 5, '10': 'contextInfo', '17': true},
  ],
  '3': const [Message_ProductMessage_CatalogSnapshot$json, Message_ProductMessage_ProductSnapshot$json],
  '8': const [
    const {'1': '_product'},
    const {'1': '_businessOwnerJid'},
    const {'1': '_catalog'},
    const {'1': '_body'},
    const {'1': '_footer'},
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ProductMessage_CatalogSnapshot$json = const {
  '1': 'CatalogSnapshot',
  '2': const [
    const {'1': 'catalogImage', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.ImageMessage', '9': 0, '10': 'catalogImage', '17': true},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'title', '17': true},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'description', '17': true},
  ],
  '8': const [
    const {'1': '_catalogImage'},
    const {'1': '_title'},
    const {'1': '_description'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ProductMessage_ProductSnapshot$json = const {
  '1': 'ProductSnapshot',
  '2': const [
    const {'1': 'productImage', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.ImageMessage', '9': 0, '10': 'productImage', '17': true},
    const {'1': 'productId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'productId', '17': true},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'title', '17': true},
    const {'1': 'description', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'description', '17': true},
    const {'1': 'currencyCode', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'currencyCode', '17': true},
    const {'1': 'priceAmount1000', '3': 6, '4': 1, '5': 3, '9': 5, '10': 'priceAmount1000', '17': true},
    const {'1': 'retailerId', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'retailerId', '17': true},
    const {'1': 'url', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'url', '17': true},
    const {'1': 'productImageCount', '3': 9, '4': 1, '5': 13, '9': 8, '10': 'productImageCount', '17': true},
    const {'1': 'firstImageId', '3': 11, '4': 1, '5': 9, '9': 9, '10': 'firstImageId', '17': true},
    const {'1': 'salePriceAmount1000', '3': 12, '4': 1, '5': 3, '9': 10, '10': 'salePriceAmount1000', '17': true},
    const {'1': 'signedUrl', '3': 13, '4': 1, '5': 9, '9': 11, '10': 'signedUrl', '17': true},
  ],
  '8': const [
    const {'1': '_productImage'},
    const {'1': '_productId'},
    const {'1': '_title'},
    const {'1': '_description'},
    const {'1': '_currencyCode'},
    const {'1': '_priceAmount1000'},
    const {'1': '_retailerId'},
    const {'1': '_url'},
    const {'1': '_productImageCount'},
    const {'1': '_firstImageId'},
    const {'1': '_salePriceAmount1000'},
    const {'1': '_signedUrl'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ProtocolMessage$json = const {
  '1': 'ProtocolMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.ProtocolMessage.Type', '9': 1, '10': 'type', '17': true},
    const {'1': 'ephemeralExpiration', '3': 4, '4': 1, '5': 13, '9': 2, '10': 'ephemeralExpiration', '17': true},
    const {'1': 'ephemeralSettingTimestamp', '3': 5, '4': 1, '5': 3, '9': 3, '10': 'ephemeralSettingTimestamp', '17': true},
    const {'1': 'historySyncNotification', '3': 6, '4': 1, '5': 11, '6': '.proto.Message.HistorySyncNotification', '9': 4, '10': 'historySyncNotification', '17': true},
    const {'1': 'appStateSyncKeyShare', '3': 7, '4': 1, '5': 11, '6': '.proto.Message.AppStateSyncKeyShare', '9': 5, '10': 'appStateSyncKeyShare', '17': true},
    const {'1': 'appStateSyncKeyRequest', '3': 8, '4': 1, '5': 11, '6': '.proto.Message.AppStateSyncKeyRequest', '9': 6, '10': 'appStateSyncKeyRequest', '17': true},
    const {'1': 'initialSecurityNotificationSettingSync', '3': 9, '4': 1, '5': 11, '6': '.proto.Message.InitialSecurityNotificationSettingSync', '9': 7, '10': 'initialSecurityNotificationSettingSync', '17': true},
    const {'1': 'appStateFatalExceptionNotification', '3': 10, '4': 1, '5': 11, '6': '.proto.Message.AppStateFatalExceptionNotification', '9': 8, '10': 'appStateFatalExceptionNotification', '17': true},
    const {'1': 'disappearingMode', '3': 11, '4': 1, '5': 11, '6': '.proto.DisappearingMode', '9': 9, '10': 'disappearingMode', '17': true},
    const {'1': 'editedMessage', '3': 14, '4': 1, '5': 11, '6': '.proto.Message', '9': 10, '10': 'editedMessage', '17': true},
    const {'1': 'timestampMs', '3': 15, '4': 1, '5': 3, '9': 11, '10': 'timestampMs', '17': true},
    const {'1': 'peerDataOperationRequestMessage', '3': 16, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestMessage', '9': 12, '10': 'peerDataOperationRequestMessage', '17': true},
    const {'1': 'peerDataOperationRequestResponseMessage', '3': 17, '4': 1, '5': 11, '6': '.proto.Message.PeerDataOperationRequestResponseMessage', '9': 13, '10': 'peerDataOperationRequestResponseMessage', '17': true},
    const {'1': 'botFeedbackMessage', '3': 18, '4': 1, '5': 11, '6': '.proto.BotFeedbackMessage', '9': 14, '10': 'botFeedbackMessage', '17': true},
    const {'1': 'invokerJid', '3': 19, '4': 1, '5': 9, '9': 15, '10': 'invokerJid', '17': true},
    const {'1': 'requestWelcomeMessageMetadata', '3': 20, '4': 1, '5': 11, '6': '.proto.Message.RequestWelcomeMessageMetadata', '9': 16, '10': 'requestWelcomeMessageMetadata', '17': true},
    const {'1': 'mediaNotifyMessage', '3': 21, '4': 1, '5': 11, '6': '.proto.MediaNotifyMessage', '9': 17, '10': 'mediaNotifyMessage', '17': true},
    const {'1': 'cloudApiThreadControlNotification', '3': 22, '4': 1, '5': 11, '6': '.proto.Message.CloudAPIThreadControlNotification', '9': 18, '10': 'cloudApiThreadControlNotification', '17': true},
    const {'1': 'lidMigrationMappingSyncMessage', '3': 23, '4': 1, '5': 11, '6': '.proto.LIDMigrationMappingSyncMessage', '9': 19, '10': 'lidMigrationMappingSyncMessage', '17': true},
    const {'1': 'limitSharing', '3': 24, '4': 1, '5': 11, '6': '.proto.LimitSharing', '9': 20, '10': 'limitSharing', '17': true},
    const {'1': 'aiPsiMetadata', '3': 25, '4': 1, '5': 12, '9': 21, '10': 'aiPsiMetadata', '17': true},
    const {'1': 'aiQueryFanout', '3': 26, '4': 1, '5': 11, '6': '.proto.AIQueryFanout', '9': 22, '10': 'aiQueryFanout', '17': true},
    const {'1': 'memberLabel', '3': 27, '4': 1, '5': 11, '6': '.proto.MemberLabel', '9': 23, '10': 'memberLabel', '17': true},
  ],
  '4': const [Message_ProtocolMessage_Type$json],
  '8': const [
    const {'1': '_key'},
    const {'1': '_type'},
    const {'1': '_ephemeralExpiration'},
    const {'1': '_ephemeralSettingTimestamp'},
    const {'1': '_historySyncNotification'},
    const {'1': '_appStateSyncKeyShare'},
    const {'1': '_appStateSyncKeyRequest'},
    const {'1': '_initialSecurityNotificationSettingSync'},
    const {'1': '_appStateFatalExceptionNotification'},
    const {'1': '_disappearingMode'},
    const {'1': '_editedMessage'},
    const {'1': '_timestampMs'},
    const {'1': '_peerDataOperationRequestMessage'},
    const {'1': '_peerDataOperationRequestResponseMessage'},
    const {'1': '_botFeedbackMessage'},
    const {'1': '_invokerJid'},
    const {'1': '_requestWelcomeMessageMetadata'},
    const {'1': '_mediaNotifyMessage'},
    const {'1': '_cloudApiThreadControlNotification'},
    const {'1': '_lidMigrationMappingSyncMessage'},
    const {'1': '_limitSharing'},
    const {'1': '_aiPsiMetadata'},
    const {'1': '_aiQueryFanout'},
    const {'1': '_memberLabel'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ProtocolMessage_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'REVOKE', '2': 0},
    const {'1': 'EPHEMERAL_SETTING', '2': 3},
    const {'1': 'EPHEMERAL_SYNC_RESPONSE', '2': 4},
    const {'1': 'HISTORY_SYNC_NOTIFICATION', '2': 5},
    const {'1': 'APP_STATE_SYNC_KEY_SHARE', '2': 6},
    const {'1': 'APP_STATE_SYNC_KEY_REQUEST', '2': 7},
    const {'1': 'MSG_FANOUT_BACKFILL_REQUEST', '2': 8},
    const {'1': 'INITIAL_SECURITY_NOTIFICATION_SETTING_SYNC', '2': 9},
    const {'1': 'APP_STATE_FATAL_EXCEPTION_NOTIFICATION', '2': 10},
    const {'1': 'SHARE_PHONE_NUMBER', '2': 11},
    const {'1': 'MESSAGE_EDIT', '2': 14},
    const {'1': 'PEER_DATA_OPERATION_REQUEST_MESSAGE', '2': 16},
    const {'1': 'PEER_DATA_OPERATION_REQUEST_RESPONSE_MESSAGE', '2': 17},
    const {'1': 'REQUEST_WELCOME_MESSAGE', '2': 18},
    const {'1': 'BOT_FEEDBACK_MESSAGE', '2': 19},
    const {'1': 'MEDIA_NOTIFY_MESSAGE', '2': 20},
    const {'1': 'CLOUD_API_THREAD_CONTROL_NOTIFICATION', '2': 21},
    const {'1': 'LID_MIGRATION_MAPPING_SYNC', '2': 22},
    const {'1': 'REMINDER_MESSAGE', '2': 23},
    const {'1': 'BOT_MEMU_ONBOARDING_MESSAGE', '2': 24},
    const {'1': 'STATUS_MENTION_MESSAGE', '2': 25},
    const {'1': 'STOP_GENERATION_MESSAGE', '2': 26},
    const {'1': 'LIMIT_SHARING', '2': 27},
    const {'1': 'AI_PSI_METADATA', '2': 28},
    const {'1': 'AI_QUERY_FANOUT', '2': 29},
    const {'1': 'GROUP_MEMBER_LABEL_CHANGE', '2': 30},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_QuestionResponseMessage$json = const {
  '1': 'QuestionResponseMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_text'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ReactionMessage$json = const {
  '1': 'ReactionMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
    const {'1': 'groupingKey', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'groupingKey', '17': true},
    const {'1': 'senderTimestampMs', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'senderTimestampMs', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_text'},
    const {'1': '_groupingKey'},
    const {'1': '_senderTimestampMs'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_RequestPaymentMessage$json = const {
  '1': 'RequestPaymentMessage',
  '2': const [
    const {'1': 'noteMessage', '3': 4, '4': 1, '5': 11, '6': '.proto.Message', '9': 0, '10': 'noteMessage', '17': true},
    const {'1': 'currencyCodeIso4217', '3': 1, '4': 1, '5': 9, '9': 1, '10': 'currencyCodeIso4217', '17': true},
    const {'1': 'amount1000', '3': 2, '4': 1, '5': 4, '9': 2, '10': 'amount1000', '17': true},
    const {'1': 'requestFrom', '3': 3, '4': 1, '5': 9, '9': 3, '10': 'requestFrom', '17': true},
    const {'1': 'expiryTimestamp', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'expiryTimestamp', '17': true},
    const {'1': 'amount', '3': 6, '4': 1, '5': 11, '6': '.proto.Money', '9': 5, '10': 'amount', '17': true},
    const {'1': 'background', '3': 7, '4': 1, '5': 11, '6': '.proto.PaymentBackground', '9': 6, '10': 'background', '17': true},
  ],
  '8': const [
    const {'1': '_noteMessage'},
    const {'1': '_currencyCodeIso4217'},
    const {'1': '_amount1000'},
    const {'1': '_requestFrom'},
    const {'1': '_expiryTimestamp'},
    const {'1': '_amount'},
    const {'1': '_background'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_RequestPhoneNumberMessage$json = const {
  '1': 'RequestPhoneNumberMessage',
  '2': const [
    const {'1': 'contextInfo', '3': 1, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 0, '10': 'contextInfo', '17': true},
  ],
  '8': const [
    const {'1': '_contextInfo'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_RequestWelcomeMessageMetadata$json = const {
  '1': 'RequestWelcomeMessageMetadata',
  '2': const [
    const {'1': 'localChatState', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.RequestWelcomeMessageMetadata.LocalChatState', '9': 0, '10': 'localChatState', '17': true},
  ],
  '4': const [Message_RequestWelcomeMessageMetadata_LocalChatState$json],
  '8': const [
    const {'1': '_localChatState'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_RequestWelcomeMessageMetadata_LocalChatState$json = const {
  '1': 'LocalChatState',
  '2': const [
    const {'1': 'EMPTY', '2': 0},
    const {'1': 'NON_EMPTY', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ScheduledCallCreationMessage$json = const {
  '1': 'ScheduledCallCreationMessage',
  '2': const [
    const {'1': 'scheduledTimestampMs', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'scheduledTimestampMs', '17': true},
    const {'1': 'callType', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.ScheduledCallCreationMessage.CallType', '9': 1, '10': 'callType', '17': true},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'title', '17': true},
  ],
  '4': const [Message_ScheduledCallCreationMessage_CallType$json],
  '8': const [
    const {'1': '_scheduledTimestampMs'},
    const {'1': '_callType'},
    const {'1': '_title'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ScheduledCallCreationMessage_CallType$json = const {
  '1': 'CallType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'VOICE', '2': 1},
    const {'1': 'VIDEO', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ScheduledCallEditMessage$json = const {
  '1': 'ScheduledCallEditMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'editType', '3': 2, '4': 1, '5': 14, '6': '.proto.Message.ScheduledCallEditMessage.EditType', '9': 1, '10': 'editType', '17': true},
  ],
  '4': const [Message_ScheduledCallEditMessage_EditType$json],
  '8': const [
    const {'1': '_key'},
    const {'1': '_editType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_ScheduledCallEditMessage_EditType$json = const {
  '1': 'EditType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'CANCEL', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_SecretEncryptedMessage$json = const {
  '1': 'SecretEncryptedMessage',
  '2': const [
    const {'1': 'targetMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'targetMessageKey', '17': true},
    const {'1': 'encPayload', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'encPayload', '17': true},
    const {'1': 'encIv', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'encIv', '17': true},
    const {'1': 'secretEncType', '3': 4, '4': 1, '5': 14, '6': '.proto.Message.SecretEncryptedMessage.SecretEncType', '9': 3, '10': 'secretEncType', '17': true},
  ],
  '4': const [Message_SecretEncryptedMessage_SecretEncType$json],
  '8': const [
    const {'1': '_targetMessageKey'},
    const {'1': '_encPayload'},
    const {'1': '_encIv'},
    const {'1': '_secretEncType'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_SecretEncryptedMessage_SecretEncType$json = const {
  '1': 'SecretEncType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'EVENT_EDIT', '2': 1},
    const {'1': 'MESSAGE_EDIT', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_SendPaymentMessage$json = const {
  '1': 'SendPaymentMessage',
  '2': const [
    const {'1': 'noteMessage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 0, '10': 'noteMessage', '17': true},
    const {'1': 'requestMessageKey', '3': 3, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 1, '10': 'requestMessageKey', '17': true},
    const {'1': 'background', '3': 4, '4': 1, '5': 11, '6': '.proto.PaymentBackground', '9': 2, '10': 'background', '17': true},
    const {'1': 'transactionData', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'transactionData', '17': true},
  ],
  '8': const [
    const {'1': '_noteMessage'},
    const {'1': '_requestMessageKey'},
    const {'1': '_background'},
    const {'1': '_transactionData'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_SenderKeyDistributionMessage$json = const {
  '1': 'SenderKeyDistributionMessage',
  '2': const [
    const {'1': 'groupId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'groupId', '17': true},
    const {'1': 'axolotlSenderKeyDistributionMessage', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'axolotlSenderKeyDistributionMessage', '17': true},
  ],
  '8': const [
    const {'1': '_groupId'},
    const {'1': '_axolotlSenderKeyDistributionMessage'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StatusNotificationMessage$json = const {
  '1': 'StatusNotificationMessage',
  '2': const [
    const {'1': 'responseMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'responseMessageKey', '17': true},
    const {'1': 'originalMessageKey', '3': 2, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 1, '10': 'originalMessageKey', '17': true},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.proto.Message.StatusNotificationMessage.StatusNotificationType', '9': 2, '10': 'type', '17': true},
  ],
  '4': const [Message_StatusNotificationMessage_StatusNotificationType$json],
  '8': const [
    const {'1': '_responseMessageKey'},
    const {'1': '_originalMessageKey'},
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StatusNotificationMessage_StatusNotificationType$json = const {
  '1': 'StatusNotificationType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'STATUS_ADD_YOURS', '2': 1},
    const {'1': 'STATUS_RESHARE', '2': 2},
    const {'1': 'STATUS_QUESTION_ANSWER_RESHARE', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StatusQuestionAnswerMessage$json = const {
  '1': 'StatusQuestionAnswerMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_text'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StatusQuotedMessage$json = const {
  '1': 'StatusQuotedMessage',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.Message.StatusQuotedMessage.StatusQuotedMessageType', '9': 0, '10': 'type', '17': true},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
    const {'1': 'thumbnail', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'thumbnail', '17': true},
    const {'1': 'originalStatusId', '3': 4, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 3, '10': 'originalStatusId', '17': true},
  ],
  '4': const [Message_StatusQuotedMessage_StatusQuotedMessageType$json],
  '8': const [
    const {'1': '_type'},
    const {'1': '_text'},
    const {'1': '_thumbnail'},
    const {'1': '_originalStatusId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StatusQuotedMessage_StatusQuotedMessageType$json = const {
  '1': 'StatusQuotedMessageType',
  '2': const [
    const {'1': 'UNKNOWN_STATUSQUOTEDMESSAGETYPE_ZERO', '2': 0},
    const {'1': 'QUESTION_ANSWER', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StatusStickerInteractionMessage$json = const {
  '1': 'StatusStickerInteractionMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'stickerKey', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'stickerKey', '17': true},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.proto.Message.StatusStickerInteractionMessage.StatusStickerType', '9': 2, '10': 'type', '17': true},
  ],
  '4': const [Message_StatusStickerInteractionMessage_StatusStickerType$json],
  '8': const [
    const {'1': '_key'},
    const {'1': '_stickerKey'},
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StatusStickerInteractionMessage_StatusStickerType$json = const {
  '1': 'StatusStickerType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'REACTION', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StickerMessage$json = const {
  '1': 'StickerMessage',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'fileSha256', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'fileSha256', '17': true},
    const {'1': 'fileEncSha256', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'fileEncSha256', '17': true},
    const {'1': 'mediaKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'mediaKey', '17': true},
    const {'1': 'mimetype', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'mimetype', '17': true},
    const {'1': 'height', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'height', '17': true},
    const {'1': 'width', '3': 7, '4': 1, '5': 13, '9': 6, '10': 'width', '17': true},
    const {'1': 'directPath', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'directPath', '17': true},
    const {'1': 'fileLength', '3': 9, '4': 1, '5': 4, '9': 8, '10': 'fileLength', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 10, '4': 1, '5': 3, '9': 9, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'firstFrameLength', '3': 11, '4': 1, '5': 13, '9': 10, '10': 'firstFrameLength', '17': true},
    const {'1': 'firstFrameSidecar', '3': 12, '4': 1, '5': 12, '9': 11, '10': 'firstFrameSidecar', '17': true},
    const {'1': 'isAnimated', '3': 13, '4': 1, '5': 8, '9': 12, '10': 'isAnimated', '17': true},
    const {'1': 'pngThumbnail', '3': 16, '4': 1, '5': 12, '9': 13, '10': 'pngThumbnail', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 14, '10': 'contextInfo', '17': true},
    const {'1': 'stickerSentTs', '3': 18, '4': 1, '5': 3, '9': 15, '10': 'stickerSentTs', '17': true},
    const {'1': 'isAvatar', '3': 19, '4': 1, '5': 8, '9': 16, '10': 'isAvatar', '17': true},
    const {'1': 'isAiSticker', '3': 20, '4': 1, '5': 8, '9': 17, '10': 'isAiSticker', '17': true},
    const {'1': 'isLottie', '3': 21, '4': 1, '5': 8, '9': 18, '10': 'isLottie', '17': true},
    const {'1': 'accessibilityLabel', '3': 22, '4': 1, '5': 9, '9': 19, '10': 'accessibilityLabel', '17': true},
    const {'1': 'mediaKeyDomain', '3': 23, '4': 1, '5': 14, '6': '.proto.Message.MediaKeyDomain', '9': 20, '10': 'mediaKeyDomain', '17': true},
  ],
  '8': const [
    const {'1': '_url'},
    const {'1': '_fileSha256'},
    const {'1': '_fileEncSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_mimetype'},
    const {'1': '_height'},
    const {'1': '_width'},
    const {'1': '_directPath'},
    const {'1': '_fileLength'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_firstFrameLength'},
    const {'1': '_firstFrameSidecar'},
    const {'1': '_isAnimated'},
    const {'1': '_pngThumbnail'},
    const {'1': '_contextInfo'},
    const {'1': '_stickerSentTs'},
    const {'1': '_isAvatar'},
    const {'1': '_isAiSticker'},
    const {'1': '_isLottie'},
    const {'1': '_accessibilityLabel'},
    const {'1': '_mediaKeyDomain'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StickerPackMessage$json = const {
  '1': 'StickerPackMessage',
  '2': const [
    const {'1': 'stickerPackId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stickerPackId', '17': true},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'name', '17': true},
    const {'1': 'publisher', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'publisher', '17': true},
    const {'1': 'stickers', '3': 4, '4': 3, '5': 11, '6': '.proto.Message.StickerPackMessage.Sticker', '10': 'stickers'},
    const {'1': 'fileLength', '3': 5, '4': 1, '5': 4, '9': 3, '10': 'fileLength', '17': true},
    const {'1': 'fileSha256', '3': 6, '4': 1, '5': 12, '9': 4, '10': 'fileSha256', '17': true},
    const {'1': 'fileEncSha256', '3': 7, '4': 1, '5': 12, '9': 5, '10': 'fileEncSha256', '17': true},
    const {'1': 'mediaKey', '3': 8, '4': 1, '5': 12, '9': 6, '10': 'mediaKey', '17': true},
    const {'1': 'directPath', '3': 9, '4': 1, '5': 9, '9': 7, '10': 'directPath', '17': true},
    const {'1': 'caption', '3': 10, '4': 1, '5': 9, '9': 8, '10': 'caption', '17': true},
    const {'1': 'contextInfo', '3': 11, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 9, '10': 'contextInfo', '17': true},
    const {'1': 'packDescription', '3': 12, '4': 1, '5': 9, '9': 10, '10': 'packDescription', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 13, '4': 1, '5': 3, '9': 11, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'trayIconFileName', '3': 14, '4': 1, '5': 9, '9': 12, '10': 'trayIconFileName', '17': true},
    const {'1': 'thumbnailDirectPath', '3': 15, '4': 1, '5': 9, '9': 13, '10': 'thumbnailDirectPath', '17': true},
    const {'1': 'thumbnailSha256', '3': 16, '4': 1, '5': 12, '9': 14, '10': 'thumbnailSha256', '17': true},
    const {'1': 'thumbnailEncSha256', '3': 17, '4': 1, '5': 12, '9': 15, '10': 'thumbnailEncSha256', '17': true},
    const {'1': 'thumbnailHeight', '3': 18, '4': 1, '5': 13, '9': 16, '10': 'thumbnailHeight', '17': true},
    const {'1': 'thumbnailWidth', '3': 19, '4': 1, '5': 13, '9': 17, '10': 'thumbnailWidth', '17': true},
    const {'1': 'imageDataHash', '3': 20, '4': 1, '5': 9, '9': 18, '10': 'imageDataHash', '17': true},
    const {'1': 'stickerPackSize', '3': 21, '4': 1, '5': 4, '9': 19, '10': 'stickerPackSize', '17': true},
    const {'1': 'stickerPackOrigin', '3': 22, '4': 1, '5': 14, '6': '.proto.Message.StickerPackMessage.StickerPackOrigin', '9': 20, '10': 'stickerPackOrigin', '17': true},
  ],
  '3': const [Message_StickerPackMessage_Sticker$json],
  '4': const [Message_StickerPackMessage_StickerPackOrigin$json],
  '8': const [
    const {'1': '_stickerPackId'},
    const {'1': '_name'},
    const {'1': '_publisher'},
    const {'1': '_fileLength'},
    const {'1': '_fileSha256'},
    const {'1': '_fileEncSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_directPath'},
    const {'1': '_caption'},
    const {'1': '_contextInfo'},
    const {'1': '_packDescription'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_trayIconFileName'},
    const {'1': '_thumbnailDirectPath'},
    const {'1': '_thumbnailSha256'},
    const {'1': '_thumbnailEncSha256'},
    const {'1': '_thumbnailHeight'},
    const {'1': '_thumbnailWidth'},
    const {'1': '_imageDataHash'},
    const {'1': '_stickerPackSize'},
    const {'1': '_stickerPackOrigin'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StickerPackMessage_Sticker$json = const {
  '1': 'Sticker',
  '2': const [
    const {'1': 'fileName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'fileName', '17': true},
    const {'1': 'isAnimated', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'isAnimated', '17': true},
    const {'1': 'emojis', '3': 3, '4': 3, '5': 9, '10': 'emojis'},
    const {'1': 'accessibilityLabel', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'accessibilityLabel', '17': true},
    const {'1': 'isLottie', '3': 5, '4': 1, '5': 8, '9': 3, '10': 'isLottie', '17': true},
    const {'1': 'mimetype', '3': 6, '4': 1, '5': 9, '9': 4, '10': 'mimetype', '17': true},
  ],
  '8': const [
    const {'1': '_fileName'},
    const {'1': '_isAnimated'},
    const {'1': '_accessibilityLabel'},
    const {'1': '_isLottie'},
    const {'1': '_mimetype'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StickerPackMessage_StickerPackOrigin$json = const {
  '1': 'StickerPackOrigin',
  '2': const [
    const {'1': 'FIRST_PARTY', '2': 0},
    const {'1': 'THIRD_PARTY', '2': 1},
    const {'1': 'USER_CREATED', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_StickerSyncRMRMessage$json = const {
  '1': 'StickerSyncRMRMessage',
  '2': const [
    const {'1': 'filehash', '3': 1, '4': 3, '5': 9, '10': 'filehash'},
    const {'1': 'rmrSource', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'rmrSource', '17': true},
    const {'1': 'requestTimestamp', '3': 3, '4': 1, '5': 3, '9': 1, '10': 'requestTimestamp', '17': true},
  ],
  '8': const [
    const {'1': '_rmrSource'},
    const {'1': '_requestTimestamp'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_TemplateButtonReplyMessage$json = const {
  '1': 'TemplateButtonReplyMessage',
  '2': const [
    const {'1': 'selectedId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'selectedId', '17': true},
    const {'1': 'selectedDisplayText', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'selectedDisplayText', '17': true},
    const {'1': 'contextInfo', '3': 3, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 2, '10': 'contextInfo', '17': true},
    const {'1': 'selectedIndex', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'selectedIndex', '17': true},
    const {'1': 'selectedCarouselCardIndex', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'selectedCarouselCardIndex', '17': true},
  ],
  '8': const [
    const {'1': '_selectedId'},
    const {'1': '_selectedDisplayText'},
    const {'1': '_contextInfo'},
    const {'1': '_selectedIndex'},
    const {'1': '_selectedCarouselCardIndex'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_TemplateMessage$json = const {
  '1': 'TemplateMessage',
  '2': const [
    const {'1': 'contextInfo', '3': 3, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 1, '10': 'contextInfo', '17': true},
    const {'1': 'hydratedTemplate', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.TemplateMessage.HydratedFourRowTemplate', '9': 2, '10': 'hydratedTemplate', '17': true},
    const {'1': 'templateId', '3': 9, '4': 1, '5': 9, '9': 3, '10': 'templateId', '17': true},
    const {'1': 'fourRowTemplate', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.TemplateMessage.FourRowTemplate', '9': 0, '10': 'fourRowTemplate'},
    const {'1': 'hydratedFourRowTemplate', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.TemplateMessage.HydratedFourRowTemplate', '9': 0, '10': 'hydratedFourRowTemplate'},
    const {'1': 'interactiveMessageTemplate', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.InteractiveMessage', '9': 0, '10': 'interactiveMessageTemplate'},
  ],
  '3': const [Message_TemplateMessage_FourRowTemplate$json, Message_TemplateMessage_HydratedFourRowTemplate$json],
  '8': const [
    const {'1': 'format'},
    const {'1': '_contextInfo'},
    const {'1': '_hydratedTemplate'},
    const {'1': '_templateId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_TemplateMessage_FourRowTemplate$json = const {
  '1': 'FourRowTemplate',
  '2': const [
    const {'1': 'content', '3': 6, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 1, '10': 'content', '17': true},
    const {'1': 'footer', '3': 7, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 2, '10': 'footer', '17': true},
    const {'1': 'buttons', '3': 8, '4': 3, '5': 11, '6': '.proto.TemplateButton', '10': 'buttons'},
    const {'1': 'documentMessage', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.DocumentMessage', '9': 0, '10': 'documentMessage'},
    const {'1': 'highlyStructuredMessage', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 0, '10': 'highlyStructuredMessage'},
    const {'1': 'imageMessage', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.ImageMessage', '9': 0, '10': 'imageMessage'},
    const {'1': 'videoMessage', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.VideoMessage', '9': 0, '10': 'videoMessage'},
    const {'1': 'locationMessage', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.LocationMessage', '9': 0, '10': 'locationMessage'},
  ],
  '8': const [
    const {'1': 'title'},
    const {'1': '_content'},
    const {'1': '_footer'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_TemplateMessage_HydratedFourRowTemplate$json = const {
  '1': 'HydratedFourRowTemplate',
  '2': const [
    const {'1': 'hydratedContentText', '3': 6, '4': 1, '5': 9, '9': 1, '10': 'hydratedContentText', '17': true},
    const {'1': 'hydratedFooterText', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'hydratedFooterText', '17': true},
    const {'1': 'hydratedButtons', '3': 8, '4': 3, '5': 11, '6': '.proto.HydratedTemplateButton', '10': 'hydratedButtons'},
    const {'1': 'templateId', '3': 9, '4': 1, '5': 9, '9': 3, '10': 'templateId', '17': true},
    const {'1': 'maskLinkedDevices', '3': 10, '4': 1, '5': 8, '9': 4, '10': 'maskLinkedDevices', '17': true},
    const {'1': 'documentMessage', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.DocumentMessage', '9': 0, '10': 'documentMessage'},
    const {'1': 'hydratedTitleText', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'hydratedTitleText'},
    const {'1': 'imageMessage', '3': 3, '4': 1, '5': 11, '6': '.proto.Message.ImageMessage', '9': 0, '10': 'imageMessage'},
    const {'1': 'videoMessage', '3': 4, '4': 1, '5': 11, '6': '.proto.Message.VideoMessage', '9': 0, '10': 'videoMessage'},
    const {'1': 'locationMessage', '3': 5, '4': 1, '5': 11, '6': '.proto.Message.LocationMessage', '9': 0, '10': 'locationMessage'},
  ],
  '8': const [
    const {'1': 'title'},
    const {'1': '_hydratedContentText'},
    const {'1': '_hydratedFooterText'},
    const {'1': '_templateId'},
    const {'1': '_maskLinkedDevices'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_URLMetadata$json = const {
  '1': 'URLMetadata',
  '2': const [
    const {'1': 'fbExperimentId', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'fbExperimentId', '17': true},
  ],
  '8': const [
    const {'1': '_fbExperimentId'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_VideoEndCard$json = const {
  '1': 'VideoEndCard',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'caption', '3': 2, '4': 1, '5': 9, '10': 'caption'},
    const {'1': 'thumbnailImageUrl', '3': 3, '4': 1, '5': 9, '10': 'thumbnailImageUrl'},
    const {'1': 'profilePictureUrl', '3': 4, '4': 1, '5': 9, '10': 'profilePictureUrl'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_VideoMessage$json = const {
  '1': 'VideoMessage',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'mimetype', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'mimetype', '17': true},
    const {'1': 'fileSha256', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'fileSha256', '17': true},
    const {'1': 'fileLength', '3': 4, '4': 1, '5': 4, '9': 3, '10': 'fileLength', '17': true},
    const {'1': 'seconds', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'seconds', '17': true},
    const {'1': 'mediaKey', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'mediaKey', '17': true},
    const {'1': 'caption', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'caption', '17': true},
    const {'1': 'gifPlayback', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'gifPlayback', '17': true},
    const {'1': 'height', '3': 9, '4': 1, '5': 13, '9': 8, '10': 'height', '17': true},
    const {'1': 'width', '3': 10, '4': 1, '5': 13, '9': 9, '10': 'width', '17': true},
    const {'1': 'fileEncSha256', '3': 11, '4': 1, '5': 12, '9': 10, '10': 'fileEncSha256', '17': true},
    const {'1': 'interactiveAnnotations', '3': 12, '4': 3, '5': 11, '6': '.proto.InteractiveAnnotation', '10': 'interactiveAnnotations'},
    const {'1': 'directPath', '3': 13, '4': 1, '5': 9, '9': 11, '10': 'directPath', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 14, '4': 1, '5': 3, '9': 12, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'jpegThumbnail', '3': 16, '4': 1, '5': 12, '9': 13, '10': 'jpegThumbnail', '17': true},
    const {'1': 'contextInfo', '3': 17, '4': 1, '5': 11, '6': '.proto.ContextInfo', '9': 14, '10': 'contextInfo', '17': true},
    const {'1': 'streamingSidecar', '3': 18, '4': 1, '5': 12, '9': 15, '10': 'streamingSidecar', '17': true},
    const {'1': 'gifAttribution', '3': 19, '4': 1, '5': 14, '6': '.proto.Message.VideoMessage.Attribution', '9': 16, '10': 'gifAttribution', '17': true},
    const {'1': 'viewOnce', '3': 20, '4': 1, '5': 8, '9': 17, '10': 'viewOnce', '17': true},
    const {'1': 'thumbnailDirectPath', '3': 21, '4': 1, '5': 9, '9': 18, '10': 'thumbnailDirectPath', '17': true},
    const {'1': 'thumbnailSha256', '3': 22, '4': 1, '5': 12, '9': 19, '10': 'thumbnailSha256', '17': true},
    const {'1': 'thumbnailEncSha256', '3': 23, '4': 1, '5': 12, '9': 20, '10': 'thumbnailEncSha256', '17': true},
    const {'1': 'staticUrl', '3': 24, '4': 1, '5': 9, '9': 21, '10': 'staticUrl', '17': true},
    const {'1': 'annotations', '3': 25, '4': 3, '5': 11, '6': '.proto.InteractiveAnnotation', '10': 'annotations'},
    const {'1': 'accessibilityLabel', '3': 26, '4': 1, '5': 9, '9': 22, '10': 'accessibilityLabel', '17': true},
    const {'1': 'processedVideos', '3': 27, '4': 3, '5': 11, '6': '.proto.ProcessedVideo', '10': 'processedVideos'},
    const {'1': 'externalShareFullVideoDurationInSeconds', '3': 28, '4': 1, '5': 13, '9': 23, '10': 'externalShareFullVideoDurationInSeconds', '17': true},
    const {'1': 'motionPhotoPresentationOffsetMs', '3': 29, '4': 1, '5': 4, '9': 24, '10': 'motionPhotoPresentationOffsetMs', '17': true},
    const {'1': 'metadataUrl', '3': 30, '4': 1, '5': 9, '9': 25, '10': 'metadataUrl', '17': true},
    const {'1': 'videoSourceType', '3': 31, '4': 1, '5': 14, '6': '.proto.Message.VideoMessage.VideoSourceType', '9': 26, '10': 'videoSourceType', '17': true},
    const {'1': 'mediaKeyDomain', '3': 32, '4': 1, '5': 14, '6': '.proto.Message.MediaKeyDomain', '9': 27, '10': 'mediaKeyDomain', '17': true},
  ],
  '4': const [Message_VideoMessage_Attribution$json, Message_VideoMessage_VideoSourceType$json],
  '8': const [
    const {'1': '_url'},
    const {'1': '_mimetype'},
    const {'1': '_fileSha256'},
    const {'1': '_fileLength'},
    const {'1': '_seconds'},
    const {'1': '_mediaKey'},
    const {'1': '_caption'},
    const {'1': '_gifPlayback'},
    const {'1': '_height'},
    const {'1': '_width'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_jpegThumbnail'},
    const {'1': '_contextInfo'},
    const {'1': '_streamingSidecar'},
    const {'1': '_gifAttribution'},
    const {'1': '_viewOnce'},
    const {'1': '_thumbnailDirectPath'},
    const {'1': '_thumbnailSha256'},
    const {'1': '_thumbnailEncSha256'},
    const {'1': '_staticUrl'},
    const {'1': '_accessibilityLabel'},
    const {'1': '_externalShareFullVideoDurationInSeconds'},
    const {'1': '_motionPhotoPresentationOffsetMs'},
    const {'1': '_metadataUrl'},
    const {'1': '_videoSourceType'},
    const {'1': '_mediaKeyDomain'},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_VideoMessage_Attribution$json = const {
  '1': 'Attribution',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'GIPHY', '2': 1},
    const {'1': 'TENOR', '2': 2},
    const {'1': 'KLIPY', '2': 3},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_VideoMessage_VideoSourceType$json = const {
  '1': 'VideoSourceType',
  '2': const [
    const {'1': 'USER_VIDEO', '2': 0},
    const {'1': 'AI_GENERATED', '2': 1},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_HistorySyncType$json = const {
  '1': 'HistorySyncType',
  '2': const [
    const {'1': 'INITIAL_BOOTSTRAP', '2': 0},
    const {'1': 'INITIAL_STATUS_V3', '2': 1},
    const {'1': 'FULL', '2': 2},
    const {'1': 'RECENT', '2': 3},
    const {'1': 'PUSH_NAME', '2': 4},
    const {'1': 'NON_BLOCKING_DATA', '2': 5},
    const {'1': 'ON_DEMAND', '2': 6},
    const {'1': 'NO_HISTORY', '2': 7},
    const {'1': 'MESSAGE_ACCESS_STATUS', '2': 8},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_MediaKeyDomain$json = const {
  '1': 'MediaKeyDomain',
  '2': const [
    const {'1': 'UNSET', '2': 0},
    const {'1': 'E2EE_CHAT', '2': 1},
    const {'1': 'STATUS', '2': 2},
    const {'1': 'CAPI', '2': 3},
    const {'1': 'BOT', '2': 4},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PeerDataOperationRequestType$json = const {
  '1': 'PeerDataOperationRequestType',
  '2': const [
    const {'1': 'UPLOAD_STICKER', '2': 0},
    const {'1': 'SEND_RECENT_STICKER_BOOTSTRAP', '2': 1},
    const {'1': 'GENERATE_LINK_PREVIEW', '2': 2},
    const {'1': 'HISTORY_SYNC_ON_DEMAND', '2': 3},
    const {'1': 'PLACEHOLDER_MESSAGE_RESEND', '2': 4},
    const {'1': 'WAFFLE_LINKING_NONCE_FETCH', '2': 5},
    const {'1': 'FULL_HISTORY_SYNC_ON_DEMAND', '2': 6},
    const {'1': 'COMPANION_META_NONCE_FETCH', '2': 7},
    const {'1': 'COMPANION_SYNCD_SNAPSHOT_FATAL_RECOVERY', '2': 8},
    const {'1': 'COMPANION_CANONICAL_USER_NONCE_FETCH', '2': 9},
    const {'1': 'HISTORY_SYNC_CHUNK_RETRY', '2': 10},
    const {'1': 'GALAXY_FLOW_ACTION', '2': 11},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollContentType$json = const {
  '1': 'PollContentType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'TEXT', '2': 1},
    const {'1': 'IMAGE', '2': 2},
  ],
};

@$core.Deprecated('Use messageDescriptor instead')
const Message_PollType$json = const {
  '1': 'PollType',
  '2': const [
    const {'1': 'POLL', '2': 0},
    const {'1': 'QUIZ', '2': 1},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode('CgdNZXNzYWdlEicKDGNvbnZlcnNhdGlvbhgBIAEoCUgAUgxjb252ZXJzYXRpb26IAQESdAocc2VuZGVyS2V5RGlzdHJpYnV0aW9uTWVzc2FnZRgCIAEoCzIrLnByb3RvLk1lc3NhZ2UuU2VuZGVyS2V5RGlzdHJpYnV0aW9uTWVzc2FnZUgBUhxzZW5kZXJLZXlEaXN0cmlidXRpb25NZXNzYWdliAEBEkQKDGltYWdlTWVzc2FnZRgDIAEoCzIbLnByb3RvLk1lc3NhZ2UuSW1hZ2VNZXNzYWdlSAJSDGltYWdlTWVzc2FnZYgBARJKCg5jb250YWN0TWVzc2FnZRgEIAEoCzIdLnByb3RvLk1lc3NhZ2UuQ29udGFjdE1lc3NhZ2VIA1IOY29udGFjdE1lc3NhZ2WIAQESTQoPbG9jYXRpb25NZXNzYWdlGAUgASgLMh4ucHJvdG8uTWVzc2FnZS5Mb2NhdGlvbk1lc3NhZ2VIBFIPbG9jYXRpb25NZXNzYWdliAEBElkKE2V4dGVuZGVkVGV4dE1lc3NhZ2UYBiABKAsyIi5wcm90by5NZXNzYWdlLkV4dGVuZGVkVGV4dE1lc3NhZ2VIBVITZXh0ZW5kZWRUZXh0TWVzc2FnZYgBARJNCg9kb2N1bWVudE1lc3NhZ2UYByABKAsyHi5wcm90by5NZXNzYWdlLkRvY3VtZW50TWVzc2FnZUgGUg9kb2N1bWVudE1lc3NhZ2WIAQESRAoMYXVkaW9NZXNzYWdlGAggASgLMhsucHJvdG8uTWVzc2FnZS5BdWRpb01lc3NhZ2VIB1IMYXVkaW9NZXNzYWdliAEBEkQKDHZpZGVvTWVzc2FnZRgJIAEoCzIbLnByb3RvLk1lc3NhZ2UuVmlkZW9NZXNzYWdlSAhSDHZpZGVvTWVzc2FnZYgBARIsCgRjYWxsGAogASgLMhMucHJvdG8uTWVzc2FnZS5DYWxsSAlSBGNhbGyIAQESLAoEY2hhdBgLIAEoCzITLnByb3RvLk1lc3NhZ2UuQ2hhdEgKUgRjaGF0iAEBEk0KD3Byb3RvY29sTWVzc2FnZRgMIAEoCzIeLnByb3RvLk1lc3NhZ2UuUHJvdG9jb2xNZXNzYWdlSAtSD3Byb3RvY29sTWVzc2FnZYgBARJcChRjb250YWN0c0FycmF5TWVzc2FnZRgNIAEoCzIjLnByb3RvLk1lc3NhZ2UuQ29udGFjdHNBcnJheU1lc3NhZ2VIDFIUY29udGFjdHNBcnJheU1lc3NhZ2WIAQESZQoXaGlnaGx5U3RydWN0dXJlZE1lc3NhZ2UYDiABKAsyJi5wcm90by5NZXNzYWdlLkhpZ2hseVN0cnVjdHVyZWRNZXNzYWdlSA1SF2hpZ2hseVN0cnVjdHVyZWRNZXNzYWdliAEBEpABCipmYXN0UmF0Y2hldEtleVNlbmRlcktleURpc3RyaWJ1dGlvbk1lc3NhZ2UYDyABKAsyKy5wcm90by5NZXNzYWdlLlNlbmRlcktleURpc3RyaWJ1dGlvbk1lc3NhZ2VIDlIqZmFzdFJhdGNoZXRLZXlTZW5kZXJLZXlEaXN0cmlidXRpb25NZXNzYWdliAEBElYKEnNlbmRQYXltZW50TWVzc2FnZRgQIAEoCzIhLnByb3RvLk1lc3NhZ2UuU2VuZFBheW1lbnRNZXNzYWdlSA9SEnNlbmRQYXltZW50TWVzc2FnZYgBARJZChNsaXZlTG9jYXRpb25NZXNzYWdlGBIgASgLMiIucHJvdG8uTWVzc2FnZS5MaXZlTG9jYXRpb25NZXNzYWdlSBBSE2xpdmVMb2NhdGlvbk1lc3NhZ2WIAQESXwoVcmVxdWVzdFBheW1lbnRNZXNzYWdlGBYgASgLMiQucHJvdG8uTWVzc2FnZS5SZXF1ZXN0UGF5bWVudE1lc3NhZ2VIEVIVcmVxdWVzdFBheW1lbnRNZXNzYWdliAEBEnQKHGRlY2xpbmVQYXltZW50UmVxdWVzdE1lc3NhZ2UYFyABKAsyKy5wcm90by5NZXNzYWdlLkRlY2xpbmVQYXltZW50UmVxdWVzdE1lc3NhZ2VIElIcZGVjbGluZVBheW1lbnRSZXF1ZXN0TWVzc2FnZYgBARJxChtjYW5jZWxQYXltZW50UmVxdWVzdE1lc3NhZ2UYGCABKAsyKi5wcm90by5NZXNzYWdlLkNhbmNlbFBheW1lbnRSZXF1ZXN0TWVzc2FnZUgTUhtjYW5jZWxQYXltZW50UmVxdWVzdE1lc3NhZ2WIAQESTQoPdGVtcGxhdGVNZXNzYWdlGBkgASgLMh4ucHJvdG8uTWVzc2FnZS5UZW1wbGF0ZU1lc3NhZ2VIFFIPdGVtcGxhdGVNZXNzYWdliAEBEkoKDnN0aWNrZXJNZXNzYWdlGBogASgLMh0ucHJvdG8uTWVzc2FnZS5TdGlja2VyTWVzc2FnZUgVUg5zdGlja2VyTWVzc2FnZYgBARJWChJncm91cEludml0ZU1lc3NhZ2UYHCABKAsyIS5wcm90by5NZXNzYWdlLkdyb3VwSW52aXRlTWVzc2FnZUgWUhJncm91cEludml0ZU1lc3NhZ2WIAQESbgoadGVtcGxhdGVCdXR0b25SZXBseU1lc3NhZ2UYHSABKAsyKS5wcm90by5NZXNzYWdlLlRlbXBsYXRlQnV0dG9uUmVwbHlNZXNzYWdlSBdSGnRlbXBsYXRlQnV0dG9uUmVwbHlNZXNzYWdliAEBEkoKDnByb2R1Y3RNZXNzYWdlGB4gASgLMh0ucHJvdG8uTWVzc2FnZS5Qcm9kdWN0TWVzc2FnZUgYUg5wcm9kdWN0TWVzc2FnZYgBARJTChFkZXZpY2VTZW50TWVzc2FnZRgfIAEoCzIgLnByb3RvLk1lc3NhZ2UuRGV2aWNlU2VudE1lc3NhZ2VIGVIRZGV2aWNlU2VudE1lc3NhZ2WIAQESTgoSbWVzc2FnZUNvbnRleHRJbmZvGCMgASgLMhkucHJvdG8uTWVzc2FnZUNvbnRleHRJbmZvSBpSEm1lc3NhZ2VDb250ZXh0SW5mb4gBARJBCgtsaXN0TWVzc2FnZRgkIAEoCzIaLnByb3RvLk1lc3NhZ2UuTGlzdE1lc3NhZ2VIG1ILbGlzdE1lc3NhZ2WIAQESUAoPdmlld09uY2VNZXNzYWdlGCUgASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VIHFIPdmlld09uY2VNZXNzYWdliAEBEkQKDG9yZGVyTWVzc2FnZRgmIAEoCzIbLnByb3RvLk1lc3NhZ2UuT3JkZXJNZXNzYWdlSB1SDG9yZGVyTWVzc2FnZYgBARJZChNsaXN0UmVzcG9uc2VNZXNzYWdlGCcgASgLMiIucHJvdG8uTWVzc2FnZS5MaXN0UmVzcG9uc2VNZXNzYWdlSB5SE2xpc3RSZXNwb25zZU1lc3NhZ2WIAQESUgoQZXBoZW1lcmFsTWVzc2FnZRgoIAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSB9SEGVwaGVtZXJhbE1lc3NhZ2WIAQESSgoOaW52b2ljZU1lc3NhZ2UYKSABKAsyHS5wcm90by5NZXNzYWdlLkludm9pY2VNZXNzYWdlSCBSDmludm9pY2VNZXNzYWdliAEBEkoKDmJ1dHRvbnNNZXNzYWdlGCogASgLMh0ucHJvdG8uTWVzc2FnZS5CdXR0b25zTWVzc2FnZUghUg5idXR0b25zTWVzc2FnZYgBARJiChZidXR0b25zUmVzcG9uc2VNZXNzYWdlGCsgASgLMiUucHJvdG8uTWVzc2FnZS5CdXR0b25zUmVzcG9uc2VNZXNzYWdlSCJSFmJ1dHRvbnNSZXNwb25zZU1lc3NhZ2WIAQESXAoUcGF5bWVudEludml0ZU1lc3NhZ2UYLCABKAsyIy5wcm90by5NZXNzYWdlLlBheW1lbnRJbnZpdGVNZXNzYWdlSCNSFHBheW1lbnRJbnZpdGVNZXNzYWdliAEBElYKEmludGVyYWN0aXZlTWVzc2FnZRgtIAEoCzIhLnByb3RvLk1lc3NhZ2UuSW50ZXJhY3RpdmVNZXNzYWdlSCRSEmludGVyYWN0aXZlTWVzc2FnZYgBARJNCg9yZWFjdGlvbk1lc3NhZ2UYLiABKAsyHi5wcm90by5NZXNzYWdlLlJlYWN0aW9uTWVzc2FnZUglUg9yZWFjdGlvbk1lc3NhZ2WIAQESXwoVc3RpY2tlclN5bmNSbXJNZXNzYWdlGC8gASgLMiQucHJvdG8uTWVzc2FnZS5TdGlja2VyU3luY1JNUk1lc3NhZ2VIJlIVc3RpY2tlclN5bmNSbXJNZXNzYWdliAEBEm4KGmludGVyYWN0aXZlUmVzcG9uc2VNZXNzYWdlGDAgASgLMikucHJvdG8uTWVzc2FnZS5JbnRlcmFjdGl2ZVJlc3BvbnNlTWVzc2FnZUgnUhppbnRlcmFjdGl2ZVJlc3BvbnNlTWVzc2FnZYgBARJZChNwb2xsQ3JlYXRpb25NZXNzYWdlGDEgASgLMiIucHJvdG8uTWVzc2FnZS5Qb2xsQ3JlYXRpb25NZXNzYWdlSChSE3BvbGxDcmVhdGlvbk1lc3NhZ2WIAQESUwoRcG9sbFVwZGF0ZU1lc3NhZ2UYMiABKAsyIC5wcm90by5NZXNzYWdlLlBvbGxVcGRhdGVNZXNzYWdlSClSEXBvbGxVcGRhdGVNZXNzYWdliAEBElMKEWtlZXBJbkNoYXRNZXNzYWdlGDMgASgLMiAucHJvdG8uTWVzc2FnZS5LZWVwSW5DaGF0TWVzc2FnZUgqUhFrZWVwSW5DaGF0TWVzc2FnZYgBARJmChpkb2N1bWVudFdpdGhDYXB0aW9uTWVzc2FnZRg1IAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSCtSGmRvY3VtZW50V2l0aENhcHRpb25NZXNzYWdliAEBEmsKGXJlcXVlc3RQaG9uZU51bWJlck1lc3NhZ2UYNiABKAsyKC5wcm90by5NZXNzYWdlLlJlcXVlc3RQaG9uZU51bWJlck1lc3NhZ2VILFIZcmVxdWVzdFBob25lTnVtYmVyTWVzc2FnZYgBARJUChF2aWV3T25jZU1lc3NhZ2VWMhg3IAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSC1SEXZpZXdPbmNlTWVzc2FnZVYyiAEBElYKEmVuY1JlYWN0aW9uTWVzc2FnZRg4IAEoCzIhLnByb3RvLk1lc3NhZ2UuRW5jUmVhY3Rpb25NZXNzYWdlSC5SEmVuY1JlYWN0aW9uTWVzc2FnZYgBARJMCg1lZGl0ZWRNZXNzYWdlGDogASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VIL1INZWRpdGVkTWVzc2FnZYgBARJmChp2aWV3T25jZU1lc3NhZ2VWMkV4dGVuc2lvbhg7IAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSDBSGnZpZXdPbmNlTWVzc2FnZVYyRXh0ZW5zaW9uiAEBEl0KFXBvbGxDcmVhdGlvbk1lc3NhZ2VWMhg8IAEoCzIiLnByb3RvLk1lc3NhZ2UuUG9sbENyZWF0aW9uTWVzc2FnZUgxUhVwb2xsQ3JlYXRpb25NZXNzYWdlVjKIAQESdAocc2NoZWR1bGVkQ2FsbENyZWF0aW9uTWVzc2FnZRg9IAEoCzIrLnByb3RvLk1lc3NhZ2UuU2NoZWR1bGVkQ2FsbENyZWF0aW9uTWVzc2FnZUgyUhxzY2hlZHVsZWRDYWxsQ3JlYXRpb25NZXNzYWdliAEBElwKFWdyb3VwTWVudGlvbmVkTWVzc2FnZRg+IAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSDNSFWdyb3VwTWVudGlvbmVkTWVzc2FnZYgBARJQChBwaW5JbkNoYXRNZXNzYWdlGD8gASgLMh8ucHJvdG8uTWVzc2FnZS5QaW5JbkNoYXRNZXNzYWdlSDRSEHBpbkluQ2hhdE1lc3NhZ2WIAQESXQoVcG9sbENyZWF0aW9uTWVzc2FnZVYzGEAgASgLMiIucHJvdG8uTWVzc2FnZS5Qb2xsQ3JlYXRpb25NZXNzYWdlSDVSFXBvbGxDcmVhdGlvbk1lc3NhZ2VWM4gBARJoChhzY2hlZHVsZWRDYWxsRWRpdE1lc3NhZ2UYQSABKAsyJy5wcm90by5NZXNzYWdlLlNjaGVkdWxlZENhbGxFZGl0TWVzc2FnZUg2UhhzY2hlZHVsZWRDYWxsRWRpdE1lc3NhZ2WIAQESQAoKcHR2TWVzc2FnZRhCIAEoCzIbLnByb3RvLk1lc3NhZ2UuVmlkZW9NZXNzYWdlSDdSCnB0dk1lc3NhZ2WIAQESUgoQYm90SW52b2tlTWVzc2FnZRhDIAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSDhSEGJvdEludm9rZU1lc3NhZ2WIAQESTAoPY2FsbExvZ01lc3NzYWdlGEUgASgLMh0ucHJvdG8uTWVzc2FnZS5DYWxsTG9nTWVzc2FnZUg5Ug9jYWxsTG9nTWVzc3NhZ2WIAQESXAoUbWVzc2FnZUhpc3RvcnlCdW5kbGUYRiABKAsyIy5wcm90by5NZXNzYWdlLk1lc3NhZ2VIaXN0b3J5QnVuZGxlSDpSFG1lc3NhZ2VIaXN0b3J5QnVuZGxliAEBElMKEWVuY0NvbW1lbnRNZXNzYWdlGEcgASgLMiAucHJvdG8uTWVzc2FnZS5FbmNDb21tZW50TWVzc2FnZUg7UhFlbmNDb21tZW50TWVzc2FnZYgBARJECgxiY2FsbE1lc3NhZ2UYSCABKAsyGy5wcm90by5NZXNzYWdlLkJDYWxsTWVzc2FnZUg8UgxiY2FsbE1lc3NhZ2WIAQESWgoUbG90dGllU3RpY2tlck1lc3NhZ2UYSiABKAsyIS5wcm90by5NZXNzYWdlLkZ1dHVyZVByb29mTWVzc2FnZUg9UhRsb3R0aWVTdGlja2VyTWVzc2FnZYgBARJECgxldmVudE1lc3NhZ2UYSyABKAsyGy5wcm90by5NZXNzYWdlLkV2ZW50TWVzc2FnZUg+UgxldmVudE1lc3NhZ2WIAQESZQoXZW5jRXZlbnRSZXNwb25zZU1lc3NhZ2UYTCABKAsyJi5wcm90by5NZXNzYWdlLkVuY0V2ZW50UmVzcG9uc2VNZXNzYWdlSD9SF2VuY0V2ZW50UmVzcG9uc2VNZXNzYWdliAEBEkoKDmNvbW1lbnRNZXNzYWdlGE0gASgLMh0ucHJvdG8uTWVzc2FnZS5Db21tZW50TWVzc2FnZUhAUg5jb21tZW50TWVzc2FnZYgBARJ0ChxuZXdzbGV0dGVyQWRtaW5JbnZpdGVNZXNzYWdlGE4gASgLMisucHJvdG8uTWVzc2FnZS5OZXdzbGV0dGVyQWRtaW5JbnZpdGVNZXNzYWdlSEFSHG5ld3NsZXR0ZXJBZG1pbkludml0ZU1lc3NhZ2WIAQESVgoScGxhY2Vob2xkZXJNZXNzYWdlGFAgASgLMiEucHJvdG8uTWVzc2FnZS5QbGFjZWhvbGRlck1lc3NhZ2VIQlIScGxhY2Vob2xkZXJNZXNzYWdliAEBEmIKFnNlY3JldEVuY3J5cHRlZE1lc3NhZ2UYUiABKAsyJS5wcm90by5NZXNzYWdlLlNlY3JldEVuY3J5cHRlZE1lc3NhZ2VIQ1IWc2VjcmV0RW5jcnlwdGVkTWVzc2FnZYgBARJECgxhbGJ1bU1lc3NhZ2UYUyABKAsyGy5wcm90by5NZXNzYWdlLkFsYnVtTWVzc2FnZUhEUgxhbGJ1bU1lc3NhZ2WIAQESUAoPZXZlbnRDb3ZlckltYWdlGFUgASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VIRVIPZXZlbnRDb3ZlckltYWdliAEBElYKEnN0aWNrZXJQYWNrTWVzc2FnZRhWIAEoCzIhLnByb3RvLk1lc3NhZ2UuU3RpY2tlclBhY2tNZXNzYWdlSEZSEnN0aWNrZXJQYWNrTWVzc2FnZYgBARJaChRzdGF0dXNNZW50aW9uTWVzc2FnZRhXIAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSEdSFHN0YXR1c01lbnRpb25NZXNzYWdliAEBEmsKGXBvbGxSZXN1bHRTbmFwc2hvdE1lc3NhZ2UYWCABKAsyKC5wcm90by5NZXNzYWdlLlBvbGxSZXN1bHRTbmFwc2hvdE1lc3NhZ2VISFIZcG9sbFJlc3VsdFNuYXBzaG90TWVzc2FnZYgBARJuCh5wb2xsQ3JlYXRpb25PcHRpb25JbWFnZU1lc3NhZ2UYWiABKAsyIS5wcm90by5NZXNzYWdlLkZ1dHVyZVByb29mTWVzc2FnZUhJUh5wb2xsQ3JlYXRpb25PcHRpb25JbWFnZU1lc3NhZ2WIAQESXgoWYXNzb2NpYXRlZENoaWxkTWVzc2FnZRhbIAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSEpSFmFzc29jaWF0ZWRDaGlsZE1lc3NhZ2WIAQESZAoZZ3JvdXBTdGF0dXNNZW50aW9uTWVzc2FnZRhcIAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSEtSGWdyb3VwU3RhdHVzTWVudGlvbk1lc3NhZ2WIAQESXAoVcG9sbENyZWF0aW9uTWVzc2FnZVY0GF0gASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VITFIVcG9sbENyZWF0aW9uTWVzc2FnZVY0iAEBEk4KDnN0YXR1c0FkZFlvdXJzGF8gASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VITVIOc3RhdHVzQWRkWW91cnOIAQESVgoSZ3JvdXBTdGF0dXNNZXNzYWdlGGAgASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VITlISZ3JvdXBTdGF0dXNNZXNzYWdliAEBElMKE3JpY2hSZXNwb25zZU1lc3NhZ2UYYSABKAsyHC5wcm90by5BSVJpY2hSZXNwb25zZU1lc3NhZ2VIT1ITcmljaFJlc3BvbnNlTWVzc2FnZYgBARJrChlzdGF0dXNOb3RpZmljYXRpb25NZXNzYWdlGGIgASgLMigucHJvdG8uTWVzc2FnZS5TdGF0dXNOb3RpZmljYXRpb25NZXNzYWdlSFBSGXN0YXR1c05vdGlmaWNhdGlvbk1lc3NhZ2WIAQESWAoTbGltaXRTaGFyaW5nTWVzc2FnZRhjIAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSFFSE2xpbWl0U2hhcmluZ01lc3NhZ2WIAQESTgoOYm90VGFza01lc3NhZ2UYZCABKAsyIS5wcm90by5NZXNzYWdlLkZ1dHVyZVByb29mTWVzc2FnZUhSUg5ib3RUYXNrTWVzc2FnZYgBARJQCg9xdWVzdGlvbk1lc3NhZ2UYZSABKAsyIS5wcm90by5NZXNzYWdlLkZ1dHVyZVByb29mTWVzc2FnZUhTUg9xdWVzdGlvbk1lc3NhZ2WIAQESXAoUbWVzc2FnZUhpc3RvcnlOb3RpY2UYZiABKAsyIy5wcm90by5NZXNzYWdlLk1lc3NhZ2VIaXN0b3J5Tm90aWNlSFRSFG1lc3NhZ2VIaXN0b3J5Tm90aWNliAEBEloKFGdyb3VwU3RhdHVzTWVzc2FnZVYyGGcgASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VIVVIUZ3JvdXBTdGF0dXNNZXNzYWdlVjKIAQESWAoTYm90Rm9yd2FyZGVkTWVzc2FnZRhoIAEoCzIhLnByb3RvLk1lc3NhZ2UuRnV0dXJlUHJvb2ZNZXNzYWdlSFZSE2JvdEZvcndhcmRlZE1lc3NhZ2WIAQEScQobc3RhdHVzUXVlc3Rpb25BbnN3ZXJNZXNzYWdlGGkgASgLMioucHJvdG8uTWVzc2FnZS5TdGF0dXNRdWVzdGlvbkFuc3dlck1lc3NhZ2VIV1Ibc3RhdHVzUXVlc3Rpb25BbnN3ZXJNZXNzYWdliAEBEloKFHF1ZXN0aW9uUmVwbHlNZXNzYWdlGGogASgLMiEucHJvdG8uTWVzc2FnZS5GdXR1cmVQcm9vZk1lc3NhZ2VIWFIUcXVlc3Rpb25SZXBseU1lc3NhZ2WIAQESZQoXcXVlc3Rpb25SZXNwb25zZU1lc3NhZ2UYayABKAsyJi5wcm90by5NZXNzYWdlLlF1ZXN0aW9uUmVzcG9uc2VNZXNzYWdlSFlSF3F1ZXN0aW9uUmVzcG9uc2VNZXNzYWdliAEBElkKE3N0YXR1c1F1b3RlZE1lc3NhZ2UYbSABKAsyIi5wcm90by5NZXNzYWdlLlN0YXR1c1F1b3RlZE1lc3NhZ2VIWlITc3RhdHVzUXVvdGVkTWVzc2FnZYgBARJ9Ch9zdGF0dXNTdGlja2VySW50ZXJhY3Rpb25NZXNzYWdlGG4gASgLMi4ucHJvdG8uTWVzc2FnZS5TdGF0dXNTdGlja2VySW50ZXJhY3Rpb25NZXNzYWdlSFtSH3N0YXR1c1N0aWNrZXJJbnRlcmFjdGlvbk1lc3NhZ2WIAQESXQoVcG9sbENyZWF0aW9uTWVzc2FnZVY1GG8gASgLMiIucHJvdG8uTWVzc2FnZS5Qb2xsQ3JlYXRpb25NZXNzYWdlSFxSFXBvbGxDcmVhdGlvbk1lc3NhZ2VWNYgBARKBAQohbmV3c2xldHRlckZvbGxvd2VySW52aXRlTWVzc2FnZVYyGHEgASgLMi4ucHJvdG8uTWVzc2FnZS5OZXdzbGV0dGVyRm9sbG93ZXJJbnZpdGVNZXNzYWdlSF1SIW5ld3NsZXR0ZXJGb2xsb3dlckludml0ZU1lc3NhZ2VWMogBARJvChtwb2xsUmVzdWx0U25hcHNob3RNZXNzYWdlVjMYciABKAsyKC5wcm90by5NZXNzYWdlLlBvbGxSZXN1bHRTbmFwc2hvdE1lc3NhZ2VIXlIbcG9sbFJlc3VsdFNuYXBzaG90TWVzc2FnZVYziAEBGvEBCgxBbGJ1bU1lc3NhZ2USMwoSZXhwZWN0ZWRJbWFnZUNvdW50GAIgASgNSABSEmV4cGVjdGVkSW1hZ2VDb3VudIgBARIzChJleHBlY3RlZFZpZGVvQ291bnQYAyABKA1IAVISZXhwZWN0ZWRWaWRlb0NvdW50iAEBEjkKC2NvbnRleHRJbmZvGBEgASgLMhIucHJvdG8uQ29udGV4dEluZm9IAlILY29udGV4dEluZm+IAQFCFQoTX2V4cGVjdGVkSW1hZ2VDb3VudEIVChNfZXhwZWN0ZWRWaWRlb0NvdW50Qg4KDF9jb250ZXh0SW5mbxp/CiJBcHBTdGF0ZUZhdGFsRXhjZXB0aW9uTm90aWZpY2F0aW9uEigKD2NvbGxlY3Rpb25OYW1lcxgBIAMoCVIPY29sbGVjdGlvbk5hbWVzEiEKCXRpbWVzdGFtcBgCIAEoA0gAUgl0aW1lc3RhbXCIAQFCDAoKX3RpbWVzdGFtcBqnAQoPQXBwU3RhdGVTeW5jS2V5EjsKBWtleUlkGAEgASgLMiAucHJvdG8uTWVzc2FnZS5BcHBTdGF0ZVN5bmNLZXlJZEgAUgVrZXlJZIgBARJBCgdrZXlEYXRhGAIgASgLMiIucHJvdG8uTWVzc2FnZS5BcHBTdGF0ZVN5bmNLZXlEYXRhSAFSB2tleURhdGGIAQFCCAoGX2tleUlkQgoKCF9rZXlEYXRhGtMBChNBcHBTdGF0ZVN5bmNLZXlEYXRhEh0KB2tleURhdGEYASABKAxIAFIHa2V5RGF0YYgBARJQCgtmaW5nZXJwcmludBgCIAEoCzIpLnByb3RvLk1lc3NhZ2UuQXBwU3RhdGVTeW5jS2V5RmluZ2VycHJpbnRIAVILZmluZ2VycHJpbnSIAQESIQoJdGltZXN0YW1wGAMgASgDSAJSCXRpbWVzdGFtcIgBAUIKCghfa2V5RGF0YUIOCgxfZmluZ2VycHJpbnRCDAoKX3RpbWVzdGFtcBqlAQoaQXBwU3RhdGVTeW5jS2V5RmluZ2VycHJpbnQSGQoFcmF3SWQYASABKA1IAFIFcmF3SWSIAQESJwoMY3VycmVudEluZGV4GAIgASgNSAFSDGN1cnJlbnRJbmRleIgBARIoCg1kZXZpY2VJbmRleGVzGAMgAygNQgIQAVINZGV2aWNlSW5kZXhlc0IICgZfcmF3SWRCDwoNX2N1cnJlbnRJbmRleBo4ChFBcHBTdGF0ZVN5bmNLZXlJZBIZCgVrZXlJZBgBIAEoDEgAUgVrZXlJZIgBAUIICgZfa2V5SWQaUgoWQXBwU3RhdGVTeW5jS2V5UmVxdWVzdBI4CgZrZXlJZHMYASADKAsyIC5wcm90by5NZXNzYWdlLkFwcFN0YXRlU3luY0tleUlkUgZrZXlJZHMaSgoUQXBwU3RhdGVTeW5jS2V5U2hhcmUSMgoEa2V5cxgBIAMoCzIeLnByb3RvLk1lc3NhZ2UuQXBwU3RhdGVTeW5jS2V5UgRrZXlzGs0HCgxBdWRpb01lc3NhZ2USFQoDdXJsGAEgASgJSABSA3VybIgBARIfCghtaW1ldHlwZRgCIAEoCUgBUghtaW1ldHlwZYgBARIjCgpmaWxlU2hhMjU2GAMgASgMSAJSCmZpbGVTaGEyNTaIAQESIwoKZmlsZUxlbmd0aBgEIAEoBEgDUgpmaWxlTGVuZ3RoiAEBEh0KB3NlY29uZHMYBSABKA1IBFIHc2Vjb25kc4gBARIVCgNwdHQYBiABKAhIBVIDcHR0iAEBEh8KCG1lZGlhS2V5GAcgASgMSAZSCG1lZGlhS2V5iAEBEikKDWZpbGVFbmNTaGEyNTYYCCABKAxIB1INZmlsZUVuY1NoYTI1NogBARIjCgpkaXJlY3RQYXRoGAkgASgJSAhSCmRpcmVjdFBhdGiIAQESMQoRbWVkaWFLZXlUaW1lc3RhbXAYCiABKANICVIRbWVkaWFLZXlUaW1lc3RhbXCIAQESOQoLY29udGV4dEluZm8YESABKAsyEi5wcm90by5Db250ZXh0SW5mb0gKUgtjb250ZXh0SW5mb4gBARIvChBzdHJlYW1pbmdTaWRlY2FyGBIgASgMSAtSEHN0cmVhbWluZ1NpZGVjYXKIAQESHwoId2F2ZWZvcm0YEyABKAxIDFIId2F2ZWZvcm2IAQESKwoOYmFja2dyb3VuZEFyZ2IYFCABKAdIDVIOYmFja2dyb3VuZEFyZ2KIAQESHwoIdmlld09uY2UYFSABKAhIDlIIdmlld09uY2WIAQESMwoSYWNjZXNzaWJpbGl0eUxhYmVsGBYgASgJSA9SEmFjY2Vzc2liaWxpdHlMYWJlbIgBARJKCg5tZWRpYUtleURvbWFpbhgXIAEoDjIdLnByb3RvLk1lc3NhZ2UuTWVkaWFLZXlEb21haW5IEFIObWVkaWFLZXlEb21haW6IAQFCBgoEX3VybEILCglfbWltZXR5cGVCDQoLX2ZpbGVTaGEyNTZCDQoLX2ZpbGVMZW5ndGhCCgoIX3NlY29uZHNCBgoEX3B0dEILCglfbWVkaWFLZXlCEAoOX2ZpbGVFbmNTaGEyNTZCDQoLX2RpcmVjdFBhdGhCFAoSX21lZGlhS2V5VGltZXN0YW1wQg4KDF9jb250ZXh0SW5mb0ITChFfc3RyZWFtaW5nU2lkZWNhckILCglfd2F2ZWZvcm1CEQoPX2JhY2tncm91bmRBcmdiQgsKCV92aWV3T25jZUIVChNfYWNjZXNzaWJpbGl0eUxhYmVsQhEKD19tZWRpYUtleURvbWFpbhqjAgoMQkNhbGxNZXNzYWdlEiEKCXNlc3Npb25JZBgBIAEoCUgAUglzZXNzaW9uSWSIAQESSAoJbWVkaWFUeXBlGAIgASgOMiUucHJvdG8uTWVzc2FnZS5CQ2FsbE1lc3NhZ2UuTWVkaWFUeXBlSAFSCW1lZGlhVHlwZYgBARIhCgltYXN0ZXJLZXkYAyABKAxIAlIJbWFzdGVyS2V5iAEBEh0KB2NhcHRpb24YBCABKAlIA1IHY2FwdGlvbogBASIuCglNZWRpYVR5cGUSCwoHVU5LTk9XThAAEgkKBUFVRElPEAESCQoFVklERU8QAkIMCgpfc2Vzc2lvbklkQgwKCl9tZWRpYVR5cGVCDAoKX21hc3RlcktleUIKCghfY2FwdGlvbhrFCgoOQnV0dG9uc01lc3NhZ2USJQoLY29udGVudFRleHQYBiABKAlIAVILY29udGVudFRleHSIAQESIwoKZm9vdGVyVGV4dBgHIAEoCUgCUgpmb290ZXJUZXh0iAEBEjkKC2NvbnRleHRJbmZvGAggASgLMhIucHJvdG8uQ29udGV4dEluZm9IA1ILY29udGV4dEluZm+IAQESPgoHYnV0dG9ucxgJIAMoCzIkLnByb3RvLk1lc3NhZ2UuQnV0dG9uc01lc3NhZ2UuQnV0dG9uUgdidXR0b25zEk0KCmhlYWRlclR5cGUYCiABKA4yKC5wcm90by5NZXNzYWdlLkJ1dHRvbnNNZXNzYWdlLkhlYWRlclR5cGVIBFIKaGVhZGVyVHlwZYgBARIUCgR0ZXh0GAEgASgJSABSBHRleHQSSgoPZG9jdW1lbnRNZXNzYWdlGAIgASgLMh4ucHJvdG8uTWVzc2FnZS5Eb2N1bWVudE1lc3NhZ2VIAFIPZG9jdW1lbnRNZXNzYWdlEkEKDGltYWdlTWVzc2FnZRgDIAEoCzIbLnByb3RvLk1lc3NhZ2UuSW1hZ2VNZXNzYWdlSABSDGltYWdlTWVzc2FnZRJBCgx2aWRlb01lc3NhZ2UYBCABKAsyGy5wcm90by5NZXNzYWdlLlZpZGVvTWVzc2FnZUgAUgx2aWRlb01lc3NhZ2USSgoPbG9jYXRpb25NZXNzYWdlGAUgASgLMh4ucHJvdG8uTWVzc2FnZS5Mb2NhdGlvbk1lc3NhZ2VIAFIPbG9jYXRpb25NZXNzYWdlGr4ECgZCdXR0b24SHwoIYnV0dG9uSWQYASABKAlIAFIIYnV0dG9uSWSIAQESVAoKYnV0dG9uVGV4dBgCIAEoCzIvLnByb3RvLk1lc3NhZ2UuQnV0dG9uc01lc3NhZ2UuQnV0dG9uLkJ1dHRvblRleHRIAVIKYnV0dG9uVGV4dIgBARJCCgR0eXBlGAMgASgOMikucHJvdG8uTWVzc2FnZS5CdXR0b25zTWVzc2FnZS5CdXR0b24uVHlwZUgCUgR0eXBliAEBEmAKDm5hdGl2ZUZsb3dJbmZvGAQgASgLMjMucHJvdG8uTWVzc2FnZS5CdXR0b25zTWVzc2FnZS5CdXR0b24uTmF0aXZlRmxvd0luZm9IA1IObmF0aXZlRmxvd0luZm+IAQEaQwoKQnV0dG9uVGV4dBIlCgtkaXNwbGF5VGV4dBgBIAEoCUgAUgtkaXNwbGF5VGV4dIgBAUIOCgxfZGlzcGxheVRleHQaZgoOTmF0aXZlRmxvd0luZm8SFwoEbmFtZRgBIAEoCUgAUgRuYW1liAEBEiMKCnBhcmFtc0pzb24YAiABKAlIAVIKcGFyYW1zSnNvbogBAUIHCgVfbmFtZUINCgtfcGFyYW1zSnNvbiIyCgRUeXBlEgsKB1VOS05PV04QABIMCghSRVNQT05TRRABEg8KC05BVElWRV9GTE9XEAJCCwoJX2J1dHRvbklkQg0KC19idXR0b25UZXh0QgcKBV90eXBlQhEKD19uYXRpdmVGbG93SW5mbyJgCgpIZWFkZXJUeXBlEgsKB1VOS05PV04QABIJCgVFTVBUWRABEggKBFRFWFQQAhIMCghET0NVTUVOVBADEgkKBUlNQUdFEAQSCQoFVklERU8QBRIMCghMT0NBVElPThAGQggKBmhlYWRlckIOCgxfY29udGVudFRleHRCDQoLX2Zvb3RlclRleHRCDgoMX2NvbnRleHRJbmZvQg0KC19oZWFkZXJUeXBlGt4CChZCdXR0b25zUmVzcG9uc2VNZXNzYWdlEi8KEHNlbGVjdGVkQnV0dG9uSWQYASABKAlIAVIQc2VsZWN0ZWRCdXR0b25JZIgBARI5Cgtjb250ZXh0SW5mbxgDIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSAJSC2NvbnRleHRJbmZviAEBEkMKBHR5cGUYBCABKA4yKi5wcm90by5NZXNzYWdlLkJ1dHRvbnNSZXNwb25zZU1lc3NhZ2UuVHlwZUgDUgR0eXBliAEBEjIKE3NlbGVjdGVkRGlzcGxheVRleHQYAiABKAlIAFITc2VsZWN0ZWREaXNwbGF5VGV4dCIlCgRUeXBlEgsKB1VOS05PV04QABIQCgxESVNQTEFZX1RFWFQQAUIKCghyZXNwb25zZUITChFfc2VsZWN0ZWRCdXR0b25JZEIOCgxfY29udGV4dEluZm9CBwoFX3R5cGUa8gQKBENhbGwSHQoHY2FsbEtleRgBIAEoDEgAUgdjYWxsS2V5iAEBEi8KEGNvbnZlcnNpb25Tb3VyY2UYAiABKAlIAVIQY29udmVyc2lvblNvdXJjZYgBARIrCg5jb252ZXJzaW9uRGF0YRgDIAEoDEgCUg5jb252ZXJzaW9uRGF0YYgBARI7ChZjb252ZXJzaW9uRGVsYXlTZWNvbmRzGAQgASgNSANSFmNvbnZlcnNpb25EZWxheVNlY29uZHOIAQESJQoLY3R3YVNpZ25hbHMYBSABKAlIBFILY3R3YVNpZ25hbHOIAQESJQoLY3R3YVBheWxvYWQYBiABKAxIBVILY3R3YVBheWxvYWSIAQESOQoLY29udGV4dEluZm8YByABKAsyEi5wcm90by5Db250ZXh0SW5mb0gGUgtjb250ZXh0SW5mb4gBARJFChtuYXRpdmVGbG93Q2FsbEJ1dHRvblBheWxvYWQYCCABKAlIB1IbbmF0aXZlRmxvd0NhbGxCdXR0b25QYXlsb2FkiAEBEi0KD2RlZXBsaW5rUGF5bG9hZBgJIAEoCUgIUg9kZWVwbGlua1BheWxvYWSIAQFCCgoIX2NhbGxLZXlCEwoRX2NvbnZlcnNpb25Tb3VyY2VCEQoPX2NvbnZlcnNpb25EYXRhQhkKF19jb252ZXJzaW9uRGVsYXlTZWNvbmRzQg4KDF9jdHdhU2lnbmFsc0IOCgxfY3R3YVBheWxvYWRCDgoMX2NvbnRleHRJbmZvQh4KHF9uYXRpdmVGbG93Q2FsbEJ1dHRvblBheWxvYWRCEgoQX2RlZXBsaW5rUGF5bG9hZBruBQoOQ2FsbExvZ01lc3NhZ2USHQoHaXNWaWRlbxgBIAEoCEgAUgdpc1ZpZGVviAEBElAKC2NhbGxPdXRjb21lGAIgASgOMikucHJvdG8uTWVzc2FnZS5DYWxsTG9nTWVzc2FnZS5DYWxsT3V0Y29tZUgBUgtjYWxsT3V0Y29tZYgBARInCgxkdXJhdGlvblNlY3MYAyABKANIAlIMZHVyYXRpb25TZWNziAEBEkcKCGNhbGxUeXBlGAQgASgOMiYucHJvdG8uTWVzc2FnZS5DYWxsTG9nTWVzc2FnZS5DYWxsVHlwZUgDUghjYWxsVHlwZYgBARJRCgxwYXJ0aWNpcGFudHMYBSADKAsyLS5wcm90by5NZXNzYWdlLkNhbGxMb2dNZXNzYWdlLkNhbGxQYXJ0aWNpcGFudFIMcGFydGljaXBhbnRzGpIBCg9DYWxsUGFydGljaXBhbnQSFQoDamlkGAEgASgJSABSA2ppZIgBARJQCgtjYWxsT3V0Y29tZRgCIAEoDjIpLnByb3RvLk1lc3NhZ2UuQ2FsbExvZ01lc3NhZ2UuQ2FsbE91dGNvbWVIAVILY2FsbE91dGNvbWWIAQFCBgoEX2ppZEIOCgxfY2FsbE91dGNvbWUimQEKC0NhbGxPdXRjb21lEg0KCUNPTk5FQ1RFRBAAEgoKBk1JU1NFRBABEgoKBkZBSUxFRBACEgwKCFJFSkVDVEVEEAMSFgoSQUNDRVBURURfRUxTRVdIRVJFEAQSCwoHT05HT0lORxAFEhMKD1NJTEVOQ0VEX0JZX0RORBAGEhsKF1NJTEVOQ0VEX1VOS05PV05fQ0FMTEVSEAciOwoIQ2FsbFR5cGUSCwoHUkVHVUxBUhAAEhIKDlNDSEVEVUxFRF9DQUxMEAESDgoKVk9JQ0VfQ0hBVBACQgoKCF9pc1ZpZGVvQg4KDF9jYWxsT3V0Y29tZUIPCg1fZHVyYXRpb25TZWNzQgsKCV9jYWxsVHlwZRpPChtDYW5jZWxQYXltZW50UmVxdWVzdE1lc3NhZ2USKAoDa2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUgNrZXmIAQFCBgoEX2tleRpZCgRDaGF0EiUKC2Rpc3BsYXlOYW1lGAEgASgJSABSC2Rpc3BsYXlOYW1liAEBEhMKAmlkGAIgASgJSAFSAmlkiAEBQg4KDF9kaXNwbGF5TmFtZUIFCgNfaWQamwcKIUNsb3VkQVBJVGhyZWFkQ29udHJvbE5vdGlmaWNhdGlvbhJjCgZzdGF0dXMYASABKA4yRi5wcm90by5NZXNzYWdlLkNsb3VkQVBJVGhyZWFkQ29udHJvbE5vdGlmaWNhdGlvbi5DbG91ZEFQSVRocmVhZENvbnRyb2xIAFIGc3RhdHVziAEBEkkKHXNlbmRlck5vdGlmaWNhdGlvblRpbWVzdGFtcE1zGAIgASgDSAFSHXNlbmRlck5vdGlmaWNhdGlvblRpbWVzdGFtcE1ziAEBEiUKC2NvbnN1bWVyTGlkGAMgASgJSAJSC2NvbnN1bWVyTGlkiAEBEjUKE2NvbnN1bWVyUGhvbmVOdW1iZXIYBCABKAlIA1ITY29uc3VtZXJQaG9uZU51bWJlcogBARKQAQoTbm90aWZpY2F0aW9uQ29udGVudBgFIAEoCzJZLnByb3RvLk1lc3NhZ2UuQ2xvdWRBUElUaHJlYWRDb250cm9sTm90aWZpY2F0aW9uLkNsb3VkQVBJVGhyZWFkQ29udHJvbE5vdGlmaWNhdGlvbkNvbnRlbnRIBFITbm90aWZpY2F0aW9uQ29udGVudIgBARJDChpzaG91bGRTdXBwcmVzc05vdGlmaWNhdGlvbhgGIAEoCEgFUhpzaG91bGRTdXBwcmVzc05vdGlmaWNhdGlvbogBARq2AQooQ2xvdWRBUElUaHJlYWRDb250cm9sTm90aWZpY2F0aW9uQ29udGVudBI9ChdoYW5kb2ZmTm90aWZpY2F0aW9uVGV4dBgBIAEoCUgAUhdoYW5kb2ZmTm90aWZpY2F0aW9uVGV4dIgBARIhCglleHRyYUpzb24YAiABKAlIAVIJZXh0cmFKc29uiAEBQhoKGF9oYW5kb2ZmTm90aWZpY2F0aW9uVGV4dEIMCgpfZXh0cmFKc29uIksKFUNsb3VkQVBJVGhyZWFkQ29udHJvbBILCgdVTktOT1dOEAASEgoOQ09OVFJPTF9QQVNTRUQQARIRCg1DT05UUk9MX1RBS0VOEAJCCQoHX3N0YXR1c0IgCh5fc2VuZGVyTm90aWZpY2F0aW9uVGltZXN0YW1wTXNCDgoMX2NvbnN1bWVyTGlkQhYKFF9jb25zdW1lclBob25lTnVtYmVyQhYKFF9ub3RpZmljYXRpb25Db250ZW50Qh0KG19zaG91bGRTdXBwcmVzc05vdGlmaWNhdGlvbhqkAQoOQ29tbWVudE1lc3NhZ2USLQoHbWVzc2FnZRgBIAEoCzIOLnByb3RvLk1lc3NhZ2VIAFIHbWVzc2FnZYgBARJCChB0YXJnZXRNZXNzYWdlS2V5GAIgASgLMhEucHJvdG8uTWVzc2FnZUtleUgBUhB0YXJnZXRNZXNzYWdlS2V5iAEBQgoKCF9tZXNzYWdlQhMKEV90YXJnZXRNZXNzYWdlS2V5GrcBCg5Db250YWN0TWVzc2FnZRIlCgtkaXNwbGF5TmFtZRgBIAEoCUgAUgtkaXNwbGF5TmFtZYgBARIZCgV2Y2FyZBgQIAEoCUgBUgV2Y2FyZIgBARI5Cgtjb250ZXh0SW5mbxgRIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSAJSC2NvbnRleHRJbmZviAEBQg4KDF9kaXNwbGF5TmFtZUIICgZfdmNhcmRCDgoMX2NvbnRleHRJbmZvGtMBChRDb250YWN0c0FycmF5TWVzc2FnZRIlCgtkaXNwbGF5TmFtZRgBIAEoCUgAUgtkaXNwbGF5TmFtZYgBARI5Cghjb250YWN0cxgCIAMoCzIdLnByb3RvLk1lc3NhZ2UuQ29udGFjdE1lc3NhZ2VSCGNvbnRhY3RzEjkKC2NvbnRleHRJbmZvGBEgASgLMhIucHJvdG8uQ29udGV4dEluZm9IAVILY29udGV4dEluZm+IAQFCDgoMX2Rpc3BsYXlOYW1lQg4KDF9jb250ZXh0SW5mbxpQChxEZWNsaW5lUGF5bWVudFJlcXVlc3RNZXNzYWdlEigKA2tleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIDa2V5iAEBQgYKBF9rZXkaswEKEURldmljZVNlbnRNZXNzYWdlEisKDmRlc3RpbmF0aW9uSmlkGAEgASgJSABSDmRlc3RpbmF0aW9uSmlkiAEBEi0KB21lc3NhZ2UYAiABKAsyDi5wcm90by5NZXNzYWdlSAFSB21lc3NhZ2WIAQESGQoFcGhhc2gYAyABKAlIAlIFcGhhc2iIAQFCEQoPX2Rlc3RpbmF0aW9uSmlkQgoKCF9tZXNzYWdlQggKBl9waGFzaBqrCgoPRG9jdW1lbnRNZXNzYWdlEhUKA3VybBgBIAEoCUgAUgN1cmyIAQESHwoIbWltZXR5cGUYAiABKAlIAVIIbWltZXR5cGWIAQESGQoFdGl0bGUYAyABKAlIAlIFdGl0bGWIAQESIwoKZmlsZVNoYTI1NhgEIAEoDEgDUgpmaWxlU2hhMjU2iAEBEiMKCmZpbGVMZW5ndGgYBSABKARIBFIKZmlsZUxlbmd0aIgBARIhCglwYWdlQ291bnQYBiABKA1IBVIJcGFnZUNvdW50iAEBEh8KCG1lZGlhS2V5GAcgASgMSAZSCG1lZGlhS2V5iAEBEh8KCGZpbGVOYW1lGAggASgJSAdSCGZpbGVOYW1liAEBEikKDWZpbGVFbmNTaGEyNTYYCSABKAxICFINZmlsZUVuY1NoYTI1NogBARIjCgpkaXJlY3RQYXRoGAogASgJSAlSCmRpcmVjdFBhdGiIAQESMQoRbWVkaWFLZXlUaW1lc3RhbXAYCyABKANIClIRbWVkaWFLZXlUaW1lc3RhbXCIAQESJwoMY29udGFjdFZjYXJkGAwgASgISAtSDGNvbnRhY3RWY2FyZIgBARI1ChN0aHVtYm5haWxEaXJlY3RQYXRoGA0gASgJSAxSE3RodW1ibmFpbERpcmVjdFBhdGiIAQESLQoPdGh1bWJuYWlsU2hhMjU2GA4gASgMSA1SD3RodW1ibmFpbFNoYTI1NogBARIzChJ0aHVtYm5haWxFbmNTaGEyNTYYDyABKAxIDlISdGh1bWJuYWlsRW5jU2hhMjU2iAEBEikKDWpwZWdUaHVtYm5haWwYECABKAxID1INanBlZ1RodW1ibmFpbIgBARI5Cgtjb250ZXh0SW5mbxgRIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSBBSC2NvbnRleHRJbmZviAEBEi0KD3RodW1ibmFpbEhlaWdodBgSIAEoDUgRUg90aHVtYm5haWxIZWlnaHSIAQESKwoOdGh1bWJuYWlsV2lkdGgYEyABKA1IElIOdGh1bWJuYWlsV2lkdGiIAQESHQoHY2FwdGlvbhgUIAEoCUgTUgdjYXB0aW9uiAEBEjMKEmFjY2Vzc2liaWxpdHlMYWJlbBgVIAEoCUgUUhJhY2Nlc3NpYmlsaXR5TGFiZWyIAQESSgoObWVkaWFLZXlEb21haW4YFiABKA4yHS5wcm90by5NZXNzYWdlLk1lZGlhS2V5RG9tYWluSBVSDm1lZGlhS2V5RG9tYWluiAEBQgYKBF91cmxCCwoJX21pbWV0eXBlQggKBl90aXRsZUINCgtfZmlsZVNoYTI1NkINCgtfZmlsZUxlbmd0aEIMCgpfcGFnZUNvdW50QgsKCV9tZWRpYUtleUILCglfZmlsZU5hbWVCEAoOX2ZpbGVFbmNTaGEyNTZCDQoLX2RpcmVjdFBhdGhCFAoSX21lZGlhS2V5VGltZXN0YW1wQg8KDV9jb250YWN0VmNhcmRCFgoUX3RodW1ibmFpbERpcmVjdFBhdGhCEgoQX3RodW1ibmFpbFNoYTI1NkIVChNfdGh1bWJuYWlsRW5jU2hhMjU2QhAKDl9qcGVnVGh1bWJuYWlsQg4KDF9jb250ZXh0SW5mb0ISChBfdGh1bWJuYWlsSGVpZ2h0QhEKD190aHVtYm5haWxXaWR0aEIKCghfY2FwdGlvbkIVChNfYWNjZXNzaWJpbGl0eUxhYmVsQhEKD19tZWRpYUtleURvbWFpbhrFAQoRRW5jQ29tbWVudE1lc3NhZ2USQgoQdGFyZ2V0TWVzc2FnZUtleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIQdGFyZ2V0TWVzc2FnZUtleYgBARIjCgplbmNQYXlsb2FkGAIgASgMSAFSCmVuY1BheWxvYWSIAQESGQoFZW5jSXYYAyABKAxIAlIFZW5jSXaIAQFCEwoRX3RhcmdldE1lc3NhZ2VLZXlCDQoLX2VuY1BheWxvYWRCCAoGX2VuY0l2GuABChdFbmNFdmVudFJlc3BvbnNlTWVzc2FnZRJQChdldmVudENyZWF0aW9uTWVzc2FnZUtleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIXZXZlbnRDcmVhdGlvbk1lc3NhZ2VLZXmIAQESIwoKZW5jUGF5bG9hZBgCIAEoDEgBUgplbmNQYXlsb2FkiAEBEhkKBWVuY0l2GAMgASgMSAJSBWVuY0l2iAEBQhoKGF9ldmVudENyZWF0aW9uTWVzc2FnZUtleUINCgtfZW5jUGF5bG9hZEIICgZfZW5jSXYaxgEKEkVuY1JlYWN0aW9uTWVzc2FnZRJCChB0YXJnZXRNZXNzYWdlS2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUhB0YXJnZXRNZXNzYWdlS2V5iAEBEiMKCmVuY1BheWxvYWQYAiABKAxIAVIKZW5jUGF5bG9hZIgBARIZCgVlbmNJdhgDIAEoDEgCUgVlbmNJdogBAUITChFfdGFyZ2V0TWVzc2FnZUtleUINCgtfZW5jUGF5bG9hZEIICgZfZW5jSXYaygUKDEV2ZW50TWVzc2FnZRI5Cgtjb250ZXh0SW5mbxgBIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSABSC2NvbnRleHRJbmZviAEBEiMKCmlzQ2FuY2VsZWQYAiABKAhIAVIKaXNDYW5jZWxlZIgBARIXCgRuYW1lGAMgASgJSAJSBG5hbWWIAQESJQoLZGVzY3JpcHRpb24YBCABKAlIA1ILZGVzY3JpcHRpb26IAQESPwoIbG9jYXRpb24YBSABKAsyHi5wcm90by5NZXNzYWdlLkxvY2F0aW9uTWVzc2FnZUgEUghsb2NhdGlvbogBARIfCghqb2luTGluaxgGIAEoCUgFUghqb2luTGlua4gBARIhCglzdGFydFRpbWUYByABKANIBlIJc3RhcnRUaW1liAEBEh0KB2VuZFRpbWUYCCABKANIB1IHZW5kVGltZYgBARIzChJleHRyYUd1ZXN0c0FsbG93ZWQYCSABKAhICFISZXh0cmFHdWVzdHNBbGxvd2VkiAEBEisKDmlzU2NoZWR1bGVDYWxsGAogASgISAlSDmlzU2NoZWR1bGVDYWxsiAEBEiUKC2hhc1JlbWluZGVyGAsgASgISApSC2hhc1JlbWluZGVyiAEBEjEKEXJlbWluZGVyT2Zmc2V0U2VjGAwgASgDSAtSEXJlbWluZGVyT2Zmc2V0U2VjiAEBQg4KDF9jb250ZXh0SW5mb0INCgtfaXNDYW5jZWxlZEIHCgVfbmFtZUIOCgxfZGVzY3JpcHRpb25CCwoJX2xvY2F0aW9uQgsKCV9qb2luTGlua0IMCgpfc3RhcnRUaW1lQgoKCF9lbmRUaW1lQhUKE19leHRyYUd1ZXN0c0FsbG93ZWRCEQoPX2lzU2NoZWR1bGVDYWxsQg4KDF9oYXNSZW1pbmRlckIUChJfcmVtaW5kZXJPZmZzZXRTZWMavAIKFEV2ZW50UmVzcG9uc2VNZXNzYWdlElYKCHJlc3BvbnNlGAEgASgOMjUucHJvdG8uTWVzc2FnZS5FdmVudFJlc3BvbnNlTWVzc2FnZS5FdmVudFJlc3BvbnNlVHlwZUgAUghyZXNwb25zZYgBARIlCgt0aW1lc3RhbXBNcxgCIAEoA0gBUgt0aW1lc3RhbXBNc4gBARItCg9leHRyYUd1ZXN0Q291bnQYAyABKAVIAlIPZXh0cmFHdWVzdENvdW50iAEBIkUKEUV2ZW50UmVzcG9uc2VUeXBlEgsKB1VOS05PV04QABIJCgVHT0lORxABEg0KCU5PVF9HT0lORxACEgkKBU1BWUJFEANCCwoJX3Jlc3BvbnNlQg4KDF90aW1lc3RhbXBNc0ISChBfZXh0cmFHdWVzdENvdW50GqYWChNFeHRlbmRlZFRleHRNZXNzYWdlEhcKBHRleHQYASABKAlIAFIEdGV4dIgBARIlCgttYXRjaGVkVGV4dBgCIAEoCUgBUgttYXRjaGVkVGV4dIgBARIlCgtkZXNjcmlwdGlvbhgFIAEoCUgCUgtkZXNjcmlwdGlvbogBARIZCgV0aXRsZRgGIAEoCUgDUgV0aXRsZYgBARIfCgh0ZXh0QXJnYhgHIAEoB0gEUgh0ZXh0QXJnYogBARIrCg5iYWNrZ3JvdW5kQXJnYhgIIAEoB0gFUg5iYWNrZ3JvdW5kQXJnYogBARJECgRmb250GAkgASgOMisucHJvdG8uTWVzc2FnZS5FeHRlbmRlZFRleHRNZXNzYWdlLkZvbnRUeXBlSAZSBGZvbnSIAQESVQoLcHJldmlld1R5cGUYCiABKA4yLi5wcm90by5NZXNzYWdlLkV4dGVuZGVkVGV4dE1lc3NhZ2UuUHJldmlld1R5cGVIB1ILcHJldmlld1R5cGWIAQESKQoNanBlZ1RodW1ibmFpbBgQIAEoDEgIUg1qcGVnVGh1bWJuYWlsiAEBEjkKC2NvbnRleHRJbmZvGBEgASgLMhIucHJvdG8uQ29udGV4dEluZm9ICVILY29udGV4dEluZm+IAQESLQoPZG9Ob3RQbGF5SW5saW5lGBIgASgISApSD2RvTm90UGxheUlubGluZYgBARI1ChN0aHVtYm5haWxEaXJlY3RQYXRoGBMgASgJSAtSE3RodW1ibmFpbERpcmVjdFBhdGiIAQESLQoPdGh1bWJuYWlsU2hhMjU2GBQgASgMSAxSD3RodW1ibmFpbFNoYTI1NogBARIzChJ0aHVtYm5haWxFbmNTaGEyNTYYFSABKAxIDVISdGh1bWJuYWlsRW5jU2hhMjU2iAEBEh8KCG1lZGlhS2V5GBYgASgMSA5SCG1lZGlhS2V5iAEBEjEKEW1lZGlhS2V5VGltZXN0YW1wGBcgASgDSA9SEW1lZGlhS2V5VGltZXN0YW1wiAEBEi0KD3RodW1ibmFpbEhlaWdodBgYIAEoDUgQUg90aHVtYm5haWxIZWlnaHSIAQESKwoOdGh1bWJuYWlsV2lkdGgYGSABKA1IEVIOdGh1bWJuYWlsV2lkdGiIAQESbQoTaW52aXRlTGlua0dyb3VwVHlwZRgaIAEoDjI2LnByb3RvLk1lc3NhZ2UuRXh0ZW5kZWRUZXh0TWVzc2FnZS5JbnZpdGVMaW5rR3JvdXBUeXBlSBJSE2ludml0ZUxpbmtHcm91cFR5cGWIAQESSwoeaW52aXRlTGlua1BhcmVudEdyb3VwU3ViamVjdFYyGBsgASgJSBNSHmludml0ZUxpbmtQYXJlbnRHcm91cFN1YmplY3RWMogBARJPCiBpbnZpdGVMaW5rUGFyZW50R3JvdXBUaHVtYm5haWxWMhgcIAEoDEgUUiBpbnZpdGVMaW5rUGFyZW50R3JvdXBUaHVtYm5haWxWMogBARJxChVpbnZpdGVMaW5rR3JvdXBUeXBlVjIYHSABKA4yNi5wcm90by5NZXNzYWdlLkV4dGVuZGVkVGV4dE1lc3NhZ2UuSW52aXRlTGlua0dyb3VwVHlwZUgVUhVpbnZpdGVMaW5rR3JvdXBUeXBlVjKIAQESHwoIdmlld09uY2UYHiABKAhIFlIIdmlld09uY2WIAQESJQoLdmlkZW9IZWlnaHQYHyABKA1IF1ILdmlkZW9IZWlnaHSIAQESIwoKdmlkZW9XaWR0aBggIAEoDUgYUgp2aWRlb1dpZHRoiAEBElgKEmZhdmljb25NTVNNZXRhZGF0YRghIAEoCzIjLnByb3RvLk1lc3NhZ2UuTU1TVGh1bWJuYWlsTWV0YWRhdGFIGVISZmF2aWNvbk1NU01ldGFkYXRhiAEBElkKE2xpbmtQcmV2aWV3TWV0YWRhdGEYIiABKAsyIi5wcm90by5NZXNzYWdlLkxpbmtQcmV2aWV3TWV0YWRhdGFIGlITbGlua1ByZXZpZXdNZXRhZGF0YYgBARJZChNwYXltZW50TGlua01ldGFkYXRhGCMgASgLMiIucHJvdG8uTWVzc2FnZS5QYXltZW50TGlua01ldGFkYXRhSBtSE3BheW1lbnRMaW5rTWV0YWRhdGGIAQESPwoMZW5kQ2FyZFRpbGVzGCQgAygLMhsucHJvdG8uTWVzc2FnZS5WaWRlb0VuZENhcmRSDGVuZENhcmRUaWxlcxItCg92aWRlb0NvbnRlbnRVcmwYJSABKAlIHFIPdmlkZW9Db250ZW50VXJsiAEBEj8KDW11c2ljTWV0YWRhdGEYJiABKAsyFC5wcm90by5FbWJlZGRlZE11c2ljSB1SDW11c2ljTWV0YWRhdGGIAQESZQoXcGF5bWVudEV4dGVuZGVkTWV0YWRhdGEYJyABKAsyJi5wcm90by5NZXNzYWdlLlBheW1lbnRFeHRlbmRlZE1ldGFkYXRhSB5SF3BheW1lbnRFeHRlbmRlZE1ldGFkYXRhiAEBIqQBCghGb250VHlwZRIKCgZTWVNURU0QABIPCgtTWVNURU1fVEVYVBABEg0KCUZCX1NDUklQVBACEg8KC1NZU1RFTV9CT0xEEAYSGQoVTU9STklOR0JSRUVaRV9SRUdVTEFSEAcSFQoRQ0FMSVNUT0dBX1JFR1VMQVIQCBISCg5FWE8yX0VYVFJBQk9MRBAJEhUKEUNPVVJJRVJQUklNRV9CT0xEEAoiSAoTSW52aXRlTGlua0dyb3VwVHlwZRILCgdERUZBVUxUEAASCgoGUEFSRU5UEAESBwoDU1VCEAISDwoLREVGQVVMVF9TVUIQAyJeCgtQcmV2aWV3VHlwZRIICgROT05FEAASCQoFVklERU8QARIPCgtQTEFDRUhPTERFUhAEEgkKBUlNQUdFEAUSEQoNUEFZTUVOVF9MSU5LUxAGEgsKB1BST0ZJTEUQB0IHCgVfdGV4dEIOCgxfbWF0Y2hlZFRleHRCDgoMX2Rlc2NyaXB0aW9uQggKBl90aXRsZUILCglfdGV4dEFyZ2JCEQoPX2JhY2tncm91bmRBcmdiQgcKBV9mb250Qg4KDF9wcmV2aWV3VHlwZUIQCg5fanBlZ1RodW1ibmFpbEIOCgxfY29udGV4dEluZm9CEgoQX2RvTm90UGxheUlubGluZUIWChRfdGh1bWJuYWlsRGlyZWN0UGF0aEISChBfdGh1bWJuYWlsU2hhMjU2QhUKE190aHVtYm5haWxFbmNTaGEyNTZCCwoJX21lZGlhS2V5QhQKEl9tZWRpYUtleVRpbWVzdGFtcEISChBfdGh1bWJuYWlsSGVpZ2h0QhEKD190aHVtYm5haWxXaWR0aEIWChRfaW52aXRlTGlua0dyb3VwVHlwZUIhCh9faW52aXRlTGlua1BhcmVudEdyb3VwU3ViamVjdFYyQiMKIV9pbnZpdGVMaW5rUGFyZW50R3JvdXBUaHVtYm5haWxWMkIYChZfaW52aXRlTGlua0dyb3VwVHlwZVYyQgsKCV92aWV3T25jZUIOCgxfdmlkZW9IZWlnaHRCDQoLX3ZpZGVvV2lkdGhCFQoTX2Zhdmljb25NTVNNZXRhZGF0YUIWChRfbGlua1ByZXZpZXdNZXRhZGF0YUIWChRfcGF5bWVudExpbmtNZXRhZGF0YUISChBfdmlkZW9Db250ZW50VXJsQhAKDl9tdXNpY01ldGFkYXRhQhoKGF9wYXltZW50RXh0ZW5kZWRNZXRhZGF0YRpZCiZGdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RNZXRhZGF0YRIhCglyZXF1ZXN0SWQYASABKAlIAFIJcmVxdWVzdElkiAEBQgwKCl9yZXF1ZXN0SWQaTwoSRnV0dXJlUHJvb2ZNZXNzYWdlEi0KB21lc3NhZ2UYASABKAsyDi5wcm90by5NZXNzYWdlSABSB21lc3NhZ2WIAQFCCgoIX21lc3NhZ2UapAQKEkdyb3VwSW52aXRlTWVzc2FnZRIfCghncm91cEppZBgBIAEoCUgAUghncm91cEppZIgBARIjCgppbnZpdGVDb2RlGAIgASgJSAFSCmludml0ZUNvZGWIAQESLwoQaW52aXRlRXhwaXJhdGlvbhgDIAEoA0gCUhBpbnZpdGVFeHBpcmF0aW9uiAEBEiEKCWdyb3VwTmFtZRgEIAEoCUgDUglncm91cE5hbWWIAQESKQoNanBlZ1RodW1ibmFpbBgFIAEoDEgEUg1qcGVnVGh1bWJuYWlsiAEBEh0KB2NhcHRpb24YBiABKAlIBVIHY2FwdGlvbogBARI5Cgtjb250ZXh0SW5mbxgHIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSAZSC2NvbnRleHRJbmZviAEBEk4KCWdyb3VwVHlwZRgIIAEoDjIrLnByb3RvLk1lc3NhZ2UuR3JvdXBJbnZpdGVNZXNzYWdlLkdyb3VwVHlwZUgHUglncm91cFR5cGWIAQEiJAoJR3JvdXBUeXBlEgsKB0RFRkFVTFQQABIKCgZQQVJFTlQQAUILCglfZ3JvdXBKaWRCDQoLX2ludml0ZUNvZGVCEwoRX2ludml0ZUV4cGlyYXRpb25CDAoKX2dyb3VwTmFtZUIQCg5fanBlZ1RodW1ibmFpbEIKCghfY2FwdGlvbkIOCgxfY29udGV4dEluZm9CDAoKX2dyb3VwVHlwZRrXEAoXSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2USIQoJbmFtZXNwYWNlGAEgASgJSABSCW5hbWVzcGFjZYgBARIlCgtlbGVtZW50TmFtZRgCIAEoCUgBUgtlbGVtZW50TmFtZYgBARIWCgZwYXJhbXMYAyADKAlSBnBhcmFtcxIjCgpmYWxsYmFja0xnGAQgASgJSAJSCmZhbGxiYWNrTGeIAQESIwoKZmFsbGJhY2tMYxgFIAEoCUgDUgpmYWxsYmFja0xjiAEBEmwKEWxvY2FsaXphYmxlUGFyYW1zGAYgAygLMj4ucHJvdG8uTWVzc2FnZS5IaWdobHlTdHJ1Y3R1cmVkTWVzc2FnZS5IU01Mb2NhbGl6YWJsZVBhcmFtZXRlclIRbG9jYWxpemFibGVQYXJhbXMSLQoPZGV0ZXJtaW5pc3RpY0xnGAcgASgJSARSD2RldGVybWluaXN0aWNMZ4gBARItCg9kZXRlcm1pbmlzdGljTGMYCCABKAlIBVIPZGV0ZXJtaW5pc3RpY0xjiAEBEkUKC2h5ZHJhdGVkSHNtGAkgASgLMh4ucHJvdG8uTWVzc2FnZS5UZW1wbGF0ZU1lc3NhZ2VIBlILaHlkcmF0ZWRIc22IAQEaiAwKF0hTTUxvY2FsaXphYmxlUGFyYW1ldGVyEh0KB2RlZmF1bHQYASABKAlIAVIHZGVmYXVsdIgBARJoCghjdXJyZW5jeRgCIAEoCzJKLnByb3RvLk1lc3NhZ2UuSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2UuSFNNTG9jYWxpemFibGVQYXJhbWV0ZXIuSFNNQ3VycmVuY3lIAFIIY3VycmVuY3kSaAoIZGF0ZVRpbWUYAyABKAsySi5wcm90by5NZXNzYWdlLkhpZ2hseVN0cnVjdHVyZWRNZXNzYWdlLkhTTUxvY2FsaXphYmxlUGFyYW1ldGVyLkhTTURhdGVUaW1lSABSCGRhdGVUaW1lGnsKC0hTTUN1cnJlbmN5EicKDGN1cnJlbmN5Q29kZRgBIAEoCUgAUgxjdXJyZW5jeUNvZGWIAQESIwoKYW1vdW50MTAwMBgCIAEoA0gBUgphbW91bnQxMDAwiAEBQg8KDV9jdXJyZW5jeUNvZGVCDQoLX2Ftb3VudDEwMDAa4ggKC0hTTURhdGVUaW1lEn8KCWNvbXBvbmVudBgBIAEoCzJfLnByb3RvLk1lc3NhZ2UuSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2UuSFNNTG9jYWxpemFibGVQYXJhbWV0ZXIuSFNNRGF0ZVRpbWUuSFNNRGF0ZVRpbWVDb21wb25lbnRIAFIJY29tcG9uZW50En8KCXVuaXhFcG9jaBgCIAEoCzJfLnByb3RvLk1lc3NhZ2UuSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2UuSFNNTG9jYWxpemFibGVQYXJhbWV0ZXIuSFNNRGF0ZVRpbWUuSFNNRGF0ZVRpbWVVbml4RXBvY2hIAFIJdW5peEVwb2NoGvYFChRIU01EYXRlVGltZUNvbXBvbmVudBKQAQoJZGF5T2ZXZWVrGAEgASgOMm0ucHJvdG8uTWVzc2FnZS5IaWdobHlTdHJ1Y3R1cmVkTWVzc2FnZS5IU01Mb2NhbGl6YWJsZVBhcmFtZXRlci5IU01EYXRlVGltZS5IU01EYXRlVGltZUNvbXBvbmVudC5EYXlPZldlZWtUeXBlSABSCWRheU9mV2Vla4gBARIXCgR5ZWFyGAIgASgNSAFSBHllYXKIAQESGQoFbW9udGgYAyABKA1IAlIFbW9udGiIAQESIwoKZGF5T2ZNb250aBgEIAEoDUgDUgpkYXlPZk1vbnRoiAEBEhcKBGhvdXIYBSABKA1IBFIEaG91cogBARIbCgZtaW51dGUYBiABKA1IBVIGbWludXRliAEBEo0BCghjYWxlbmRhchgHIAEoDjJsLnByb3RvLk1lc3NhZ2UuSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2UuSFNNTG9jYWxpemFibGVQYXJhbWV0ZXIuSFNNRGF0ZVRpbWUuSFNNRGF0ZVRpbWVDb21wb25lbnQuQ2FsZW5kYXJUeXBlSAZSCGNhbGVuZGFyiAEBIk0KDENhbGVuZGFyVHlwZRIdChlVTktOT1dOX0NBTEVOREFSVFlQRV9aRVJPEAASDQoJR1JFR09SSUFOEAESDwoLU09MQVJfSElKUkkQAiKLAQoNRGF5T2ZXZWVrVHlwZRIeChpVTktOT1dOX0RBWU9GV0VFS1RZUEVfWkVSTxAAEgoKBk1PTkRBWRABEgsKB1RVRVNEQVkQAhINCglXRURORVNEQVkQAxIMCghUSFVSU0RBWRAEEgoKBkZSSURBWRAFEgwKCFNBVFVSREFZEAYSCgoGU1VOREFZEAdCDAoKX2RheU9mV2Vla0IHCgVfeWVhckIICgZfbW9udGhCDQoLX2RheU9mTW9udGhCBwoFX2hvdXJCCQoHX21pbnV0ZUILCglfY2FsZW5kYXIaRwoUSFNNRGF0ZVRpbWVVbml4RXBvY2gSIQoJdGltZXN0YW1wGAEgASgDSABSCXRpbWVzdGFtcIgBAUIMCgpfdGltZXN0YW1wQg8KDWRhdGV0aW1lT25lb2ZCDAoKcGFyYW1PbmVvZkIKCghfZGVmYXVsdEIMCgpfbmFtZXNwYWNlQg4KDF9lbGVtZW50TmFtZUINCgtfZmFsbGJhY2tMZ0INCgtfZmFsbGJhY2tMY0ISChBfZGV0ZXJtaW5pc3RpY0xnQhIKEF9kZXRlcm1pbmlzdGljTGNCDgoMX2h5ZHJhdGVkSHNtGnUKHkhpc3RvcnlTeW5jTWVzc2FnZUFjY2Vzc1N0YXR1cxI5ChVjb21wbGV0ZUFjY2Vzc0dyYW50ZWQYASABKAhIAFIVY29tcGxldGVBY2Nlc3NHcmFudGVkiAEBQhgKFl9jb21wbGV0ZUFjY2Vzc0dyYW50ZWQayQkKF0hpc3RvcnlTeW5jTm90aWZpY2F0aW9uEiMKCmZpbGVTaGEyNTYYASABKAxIAFIKZmlsZVNoYTI1NogBARIjCgpmaWxlTGVuZ3RoGAIgASgESAFSCmZpbGVMZW5ndGiIAQESHwoIbWVkaWFLZXkYAyABKAxIAlIIbWVkaWFLZXmIAQESKQoNZmlsZUVuY1NoYTI1NhgEIAEoDEgDUg1maWxlRW5jU2hhMjU2iAEBEiMKCmRpcmVjdFBhdGgYBSABKAlIBFIKZGlyZWN0UGF0aIgBARI/CghzeW5jVHlwZRgGIAEoDjIeLnByb3RvLk1lc3NhZ2UuSGlzdG9yeVN5bmNUeXBlSAVSCHN5bmNUeXBliAEBEiMKCmNodW5rT3JkZXIYByABKA1IBlIKY2h1bmtPcmRlcogBARIxChFvcmlnaW5hbE1lc3NhZ2VJZBgIIAEoCUgHUhFvcmlnaW5hbE1lc3NhZ2VJZIgBARIfCghwcm9ncmVzcxgJIAEoDUgIUghwcm9ncmVzc4gBARJHChxvbGRlc3RNc2dJbkNodW5rVGltZXN0YW1wU2VjGAogASgDSAlSHG9sZGVzdE1zZ0luQ2h1bmtUaW1lc3RhbXBTZWOIAQESUQohaW5pdGlhbEhpc3RCb290c3RyYXBJbmxpbmVQYXlsb2FkGAsgASgMSApSIWluaXRpYWxIaXN0Qm9vdHN0cmFwSW5saW5lUGF5bG9hZIgBARI/ChhwZWVyRGF0YVJlcXVlc3RTZXNzaW9uSWQYDCABKAlIC1IYcGVlckRhdGFSZXF1ZXN0U2Vzc2lvbklkiAEBEpIBCiZmdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RNZXRhZGF0YRgNIAEoCzI1LnByb3RvLk1lc3NhZ2UuRnVsbEhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0TWV0YWRhdGFIDFImZnVsbEhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0TWV0YWRhdGGIAQESIQoJZW5jSGFuZGxlGA4gASgJSA1SCWVuY0hhbmRsZYgBARJkChNtZXNzYWdlQWNjZXNzU3RhdHVzGA8gASgLMi0ucHJvdG8uTWVzc2FnZS5IaXN0b3J5U3luY01lc3NhZ2VBY2Nlc3NTdGF0dXNIDlITbWVzc2FnZUFjY2Vzc1N0YXR1c4gBAUINCgtfZmlsZVNoYTI1NkINCgtfZmlsZUxlbmd0aEILCglfbWVkaWFLZXlCEAoOX2ZpbGVFbmNTaGEyNTZCDQoLX2RpcmVjdFBhdGhCCwoJX3N5bmNUeXBlQg0KC19jaHVua09yZGVyQhQKEl9vcmlnaW5hbE1lc3NhZ2VJZEILCglfcHJvZ3Jlc3NCHwodX29sZGVzdE1zZ0luQ2h1bmtUaW1lc3RhbXBTZWNCJAoiX2luaXRpYWxIaXN0Qm9vdHN0cmFwSW5saW5lUGF5bG9hZEIbChlfcGVlckRhdGFSZXF1ZXN0U2Vzc2lvbklkQikKJ19mdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RNZXRhZGF0YUIMCgpfZW5jSGFuZGxlQhYKFF9tZXNzYWdlQWNjZXNzU3RhdHVzGvsPCgxJbWFnZU1lc3NhZ2USFQoDdXJsGAEgASgJSABSA3VybIgBARIfCghtaW1ldHlwZRgCIAEoCUgBUghtaW1ldHlwZYgBARIdCgdjYXB0aW9uGAMgASgJSAJSB2NhcHRpb26IAQESIwoKZmlsZVNoYTI1NhgEIAEoDEgDUgpmaWxlU2hhMjU2iAEBEiMKCmZpbGVMZW5ndGgYBSABKARIBFIKZmlsZUxlbmd0aIgBARIbCgZoZWlnaHQYBiABKA1IBVIGaGVpZ2h0iAEBEhkKBXdpZHRoGAcgASgNSAZSBXdpZHRoiAEBEh8KCG1lZGlhS2V5GAggASgMSAdSCG1lZGlhS2V5iAEBEikKDWZpbGVFbmNTaGEyNTYYCSABKAxICFINZmlsZUVuY1NoYTI1NogBARJUChZpbnRlcmFjdGl2ZUFubm90YXRpb25zGAogAygLMhwucHJvdG8uSW50ZXJhY3RpdmVBbm5vdGF0aW9uUhZpbnRlcmFjdGl2ZUFubm90YXRpb25zEiMKCmRpcmVjdFBhdGgYCyABKAlICVIKZGlyZWN0UGF0aIgBARIxChFtZWRpYUtleVRpbWVzdGFtcBgMIAEoA0gKUhFtZWRpYUtleVRpbWVzdGFtcIgBARIpCg1qcGVnVGh1bWJuYWlsGBAgASgMSAtSDWpwZWdUaHVtYm5haWyIAQESOQoLY29udGV4dEluZm8YESABKAsyEi5wcm90by5Db250ZXh0SW5mb0gMUgtjb250ZXh0SW5mb4gBARIvChBmaXJzdFNjYW5TaWRlY2FyGBIgASgMSA1SEGZpcnN0U2NhblNpZGVjYXKIAQESLQoPZmlyc3RTY2FuTGVuZ3RoGBMgASgNSA5SD2ZpcnN0U2Nhbkxlbmd0aIgBARIxChFleHBlcmltZW50R3JvdXBJZBgUIAEoDUgPUhFleHBlcmltZW50R3JvdXBJZIgBARInCgxzY2Fuc1NpZGVjYXIYFSABKAxIEFIMc2NhbnNTaWRlY2FyiAEBEiAKC3NjYW5MZW5ndGhzGBYgAygNUgtzY2FuTGVuZ3RocxI3ChRtaWRRdWFsaXR5RmlsZVNoYTI1NhgXIAEoDEgRUhRtaWRRdWFsaXR5RmlsZVNoYTI1NogBARI9ChdtaWRRdWFsaXR5RmlsZUVuY1NoYTI1NhgYIAEoDEgSUhdtaWRRdWFsaXR5RmlsZUVuY1NoYTI1NogBARIfCgh2aWV3T25jZRgZIAEoCEgTUgh2aWV3T25jZYgBARI1ChN0aHVtYm5haWxEaXJlY3RQYXRoGBogASgJSBRSE3RodW1ibmFpbERpcmVjdFBhdGiIAQESLQoPdGh1bWJuYWlsU2hhMjU2GBsgASgMSBVSD3RodW1ibmFpbFNoYTI1NogBARIzChJ0aHVtYm5haWxFbmNTaGEyNTYYHCABKAxIFlISdGh1bWJuYWlsRW5jU2hhMjU2iAEBEiEKCXN0YXRpY1VybBgdIAEoCUgXUglzdGF0aWNVcmyIAQESPgoLYW5ub3RhdGlvbnMYHiADKAsyHC5wcm90by5JbnRlcmFjdGl2ZUFubm90YXRpb25SC2Fubm90YXRpb25zEloKD2ltYWdlU291cmNlVHlwZRgfIAEoDjIrLnByb3RvLk1lc3NhZ2UuSW1hZ2VNZXNzYWdlLkltYWdlU291cmNlVHlwZUgYUg9pbWFnZVNvdXJjZVR5cGWIAQESMwoSYWNjZXNzaWJpbGl0eUxhYmVsGCAgASgJSBlSEmFjY2Vzc2liaWxpdHlMYWJlbIgBARJKCg5tZWRpYUtleURvbWFpbhghIAEoDjIdLnByb3RvLk1lc3NhZ2UuTWVkaWFLZXlEb21haW5IGlIObWVkaWFLZXlEb21haW6IAQESGQoFcXJVcmwYIiABKAlIG1IFcXJVcmyIAQEiYAoPSW1hZ2VTb3VyY2VUeXBlEg4KClVTRVJfSU1BR0UQABIQCgxBSV9HRU5FUkFURUQQARIPCgtBSV9NT0RJRklFRBACEhoKFlJBU1RFUklaRURfVEVYVF9TVEFUVVMQA0IGCgRfdXJsQgsKCV9taW1ldHlwZUIKCghfY2FwdGlvbkINCgtfZmlsZVNoYTI1NkINCgtfZmlsZUxlbmd0aEIJCgdfaGVpZ2h0QggKBl93aWR0aEILCglfbWVkaWFLZXlCEAoOX2ZpbGVFbmNTaGEyNTZCDQoLX2RpcmVjdFBhdGhCFAoSX21lZGlhS2V5VGltZXN0YW1wQhAKDl9qcGVnVGh1bWJuYWlsQg4KDF9jb250ZXh0SW5mb0ITChFfZmlyc3RTY2FuU2lkZWNhckISChBfZmlyc3RTY2FuTGVuZ3RoQhQKEl9leHBlcmltZW50R3JvdXBJZEIPCg1fc2NhbnNTaWRlY2FyQhcKFV9taWRRdWFsaXR5RmlsZVNoYTI1NkIaChhfbWlkUXVhbGl0eUZpbGVFbmNTaGEyNTZCCwoJX3ZpZXdPbmNlQhYKFF90aHVtYm5haWxEaXJlY3RQYXRoQhIKEF90aHVtYm5haWxTaGEyNTZCFQoTX3RodW1ibmFpbEVuY1NoYTI1NkIMCgpfc3RhdGljVXJsQhIKEF9pbWFnZVNvdXJjZVR5cGVCFQoTX2FjY2Vzc2liaWxpdHlMYWJlbEIRCg9fbWVkaWFLZXlEb21haW5CCAoGX3FyVXJsGo8BCiZJbml0aWFsU2VjdXJpdHlOb3RpZmljYXRpb25TZXR0aW5nU3luYxJFChtzZWN1cml0eU5vdGlmaWNhdGlvbkVuYWJsZWQYASABKAhIAFIbc2VjdXJpdHlOb3RpZmljYXRpb25FbmFibGVkiAEBQh4KHF9zZWN1cml0eU5vdGlmaWNhdGlvbkVuYWJsZWQa8hUKEkludGVyYWN0aXZlTWVzc2FnZRJFCgZoZWFkZXIYASABKAsyKC5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlTWVzc2FnZS5IZWFkZXJIAVIGaGVhZGVyiAEBEj8KBGJvZHkYAiABKAsyJi5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlTWVzc2FnZS5Cb2R5SAJSBGJvZHmIAQESRQoGZm9vdGVyGAMgASgLMigucHJvdG8uTWVzc2FnZS5JbnRlcmFjdGl2ZU1lc3NhZ2UuRm9vdGVySANSBmZvb3RlcogBARI5Cgtjb250ZXh0SW5mbxgPIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSARSC2NvbnRleHRJbmZviAEBEkIKDnVybFRyYWNraW5nTWFwGBAgASgLMhUucHJvdG8uVXJsVHJhY2tpbmdNYXBIBVIOdXJsVHJhY2tpbmdNYXCIAQESZQoVc2hvcFN0b3JlZnJvbnRNZXNzYWdlGAQgASgLMi0ucHJvdG8uTWVzc2FnZS5JbnRlcmFjdGl2ZU1lc3NhZ2UuU2hvcE1lc3NhZ2VIAFIVc2hvcFN0b3JlZnJvbnRNZXNzYWdlEmMKEWNvbGxlY3Rpb25NZXNzYWdlGAUgASgLMjMucHJvdG8uTWVzc2FnZS5JbnRlcmFjdGl2ZU1lc3NhZ2UuQ29sbGVjdGlvbk1lc3NhZ2VIAFIRY29sbGVjdGlvbk1lc3NhZ2USYwoRbmF0aXZlRmxvd01lc3NhZ2UYBiABKAsyMy5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlTWVzc2FnZS5OYXRpdmVGbG93TWVzc2FnZUgAUhFuYXRpdmVGbG93TWVzc2FnZRJdCg9jYXJvdXNlbE1lc3NhZ2UYByABKAsyMS5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlTWVzc2FnZS5DYXJvdXNlbE1lc3NhZ2VIAFIPY2Fyb3VzZWxNZXNzYWdlGigKBEJvZHkSFwoEdGV4dBgBIAEoCUgAUgR0ZXh0iAEBQgcKBV90ZXh0GtkCCg9DYXJvdXNlbE1lc3NhZ2USNwoFY2FyZHMYASADKAsyIS5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlTWVzc2FnZVIFY2FyZHMSKwoObWVzc2FnZVZlcnNpb24YAiABKAVIAFIObWVzc2FnZVZlcnNpb26IAQEScwoQY2Fyb3VzZWxDYXJkVHlwZRgDIAEoDjJCLnByb3RvLk1lc3NhZ2UuSW50ZXJhY3RpdmVNZXNzYWdlLkNhcm91c2VsTWVzc2FnZS5DYXJvdXNlbENhcmRUeXBlSAFSEGNhcm91c2VsQ2FyZFR5cGWIAQEiQwoQQ2Fyb3VzZWxDYXJkVHlwZRILCgdVTktOT1dOEAASEQoNSFNDUk9MTF9DQVJEUxABEg8KC0FMQlVNX0lNQUdFEAJCEQoPX21lc3NhZ2VWZXJzaW9uQhMKEV9jYXJvdXNlbENhcmRUeXBlGpcBChFDb2xsZWN0aW9uTWVzc2FnZRIbCgZiaXpKaWQYASABKAlIAFIGYml6SmlkiAEBEhMKAmlkGAIgASgJSAFSAmlkiAEBEisKDm1lc3NhZ2VWZXJzaW9uGAMgASgFSAJSDm1lc3NhZ2VWZXJzaW9uiAEBQgkKB19iaXpKaWRCBQoDX2lkQhEKD19tZXNzYWdlVmVyc2lvbhrCAQoGRm9vdGVyEhcKBHRleHQYASABKAlIAVIEdGV4dIgBARIzChJoYXNNZWRpYUF0dGFjaG1lbnQYAyABKAhIAlISaGFzTWVkaWFBdHRhY2htZW50iAEBEkEKDGF1ZGlvTWVzc2FnZRgCIAEoCzIbLnByb3RvLk1lc3NhZ2UuQXVkaW9NZXNzYWdlSABSDGF1ZGlvTWVzc2FnZUIHCgVtZWRpYUIHCgVfdGV4dEIVChNfaGFzTWVkaWFBdHRhY2htZW50Gr8ECgZIZWFkZXISGQoFdGl0bGUYASABKAlIAVIFdGl0bGWIAQESHwoIc3VidGl0bGUYAiABKAlIAlIIc3VidGl0bGWIAQESMwoSaGFzTWVkaWFBdHRhY2htZW50GAUgASgISANSEmhhc01lZGlhQXR0YWNobWVudIgBARJKCg9kb2N1bWVudE1lc3NhZ2UYAyABKAsyHi5wcm90by5NZXNzYWdlLkRvY3VtZW50TWVzc2FnZUgAUg9kb2N1bWVudE1lc3NhZ2USQQoMaW1hZ2VNZXNzYWdlGAQgASgLMhsucHJvdG8uTWVzc2FnZS5JbWFnZU1lc3NhZ2VIAFIMaW1hZ2VNZXNzYWdlEiYKDWpwZWdUaHVtYm5haWwYBiABKAxIAFINanBlZ1RodW1ibmFpbBJBCgx2aWRlb01lc3NhZ2UYByABKAsyGy5wcm90by5NZXNzYWdlLlZpZGVvTWVzc2FnZUgAUgx2aWRlb01lc3NhZ2USSgoPbG9jYXRpb25NZXNzYWdlGAggASgLMh4ucHJvdG8uTWVzc2FnZS5Mb2NhdGlvbk1lc3NhZ2VIAFIPbG9jYXRpb25NZXNzYWdlEkcKDnByb2R1Y3RNZXNzYWdlGAkgASgLMh0ucHJvdG8uTWVzc2FnZS5Qcm9kdWN0TWVzc2FnZUgAUg5wcm9kdWN0TWVzc2FnZUIHCgVtZWRpYUIICgZfdGl0bGVCCwoJX3N1YnRpdGxlQhUKE19oYXNNZWRpYUF0dGFjaG1lbnQa+AIKEU5hdGl2ZUZsb3dNZXNzYWdlEl4KB2J1dHRvbnMYASADKAsyRC5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlTWVzc2FnZS5OYXRpdmVGbG93TWVzc2FnZS5OYXRpdmVGbG93QnV0dG9uUgdidXR0b25zEjEKEW1lc3NhZ2VQYXJhbXNKc29uGAIgASgJSABSEW1lc3NhZ2VQYXJhbXNKc29uiAEBEisKDm1lc3NhZ2VWZXJzaW9uGAMgASgFSAFSDm1lc3NhZ2VWZXJzaW9uiAEBGnoKEE5hdGl2ZUZsb3dCdXR0b24SFwoEbmFtZRgBIAEoCUgAUgRuYW1liAEBEi8KEGJ1dHRvblBhcmFtc0pzb24YAiABKAlIAVIQYnV0dG9uUGFyYW1zSnNvbogBAUIHCgVfbmFtZUITChFfYnV0dG9uUGFyYW1zSnNvbkIUChJfbWVzc2FnZVBhcmFtc0pzb25CEQoPX21lc3NhZ2VWZXJzaW9uGoMCCgtTaG9wTWVzc2FnZRITCgJpZBgBIAEoCUgAUgJpZIgBARJUCgdzdXJmYWNlGAIgASgOMjUucHJvdG8uTWVzc2FnZS5JbnRlcmFjdGl2ZU1lc3NhZ2UuU2hvcE1lc3NhZ2UuU3VyZmFjZUgBUgdzdXJmYWNliAEBEisKDm1lc3NhZ2VWZXJzaW9uGAMgASgFSAJSDm1lc3NhZ2VWZXJzaW9uiAEBIjYKB1N1cmZhY2USEwoPVU5LTk9XTl9TVVJGQUNFEAASBgoCRkIQARIGCgJJRxACEgYKAldBEANCBQoDX2lkQgoKCF9zdXJmYWNlQhEKD19tZXNzYWdlVmVyc2lvbkIUChJpbnRlcmFjdGl2ZU1lc3NhZ2VCCQoHX2hlYWRlckIHCgVfYm9keUIJCgdfZm9vdGVyQg4KDF9jb250ZXh0SW5mb0IRCg9fdXJsVHJhY2tpbmdNYXAarwUKGkludGVyYWN0aXZlUmVzcG9uc2VNZXNzYWdlEkcKBGJvZHkYASABKAsyLi5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlUmVzcG9uc2VNZXNzYWdlLkJvZHlIAVIEYm9keYgBARI5Cgtjb250ZXh0SW5mbxgPIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSAJSC2NvbnRleHRJbmZviAEBEoMBChluYXRpdmVGbG93UmVzcG9uc2VNZXNzYWdlGAIgASgLMkMucHJvdG8uTWVzc2FnZS5JbnRlcmFjdGl2ZVJlc3BvbnNlTWVzc2FnZS5OYXRpdmVGbG93UmVzcG9uc2VNZXNzYWdlSABSGW5hdGl2ZUZsb3dSZXNwb25zZU1lc3NhZ2UasAEKBEJvZHkSFwoEdGV4dBgBIAEoCUgAUgR0ZXh0iAEBElIKBmZvcm1hdBgCIAEoDjI1LnByb3RvLk1lc3NhZ2UuSW50ZXJhY3RpdmVSZXNwb25zZU1lc3NhZ2UuQm9keS5Gb3JtYXRIAVIGZm9ybWF0iAEBIicKBkZvcm1hdBILCgdERUZBVUxUEAASEAoMRVhURU5TSU9OU18xEAFCBwoFX3RleHRCCQoHX2Zvcm1hdBqcAQoZTmF0aXZlRmxvd1Jlc3BvbnNlTWVzc2FnZRIXCgRuYW1lGAEgASgJSABSBG5hbWWIAQESIwoKcGFyYW1zSnNvbhgCIAEoCUgBUgpwYXJhbXNKc29uiAEBEh0KB3ZlcnNpb24YAyABKAVIAlIHdmVyc2lvbogBAUIHCgVfbmFtZUINCgtfcGFyYW1zSnNvbkIKCghfdmVyc2lvbkIcChppbnRlcmFjdGl2ZVJlc3BvbnNlTWVzc2FnZUIHCgVfYm9keUIOCgxfY29udGV4dEluZm8axAYKDkludm9pY2VNZXNzYWdlEhcKBG5vdGUYASABKAlIAFIEbm90ZYgBARIZCgV0b2tlbhgCIAEoCUgBUgV0b2tlbogBARJZCg5hdHRhY2htZW50VHlwZRgDIAEoDjIsLnByb3RvLk1lc3NhZ2UuSW52b2ljZU1lc3NhZ2UuQXR0YWNobWVudFR5cGVIAlIOYXR0YWNobWVudFR5cGWIAQESMwoSYXR0YWNobWVudE1pbWV0eXBlGAQgASgJSANSEmF0dGFjaG1lbnRNaW1ldHlwZYgBARIzChJhdHRhY2htZW50TWVkaWFLZXkYBSABKAxIBFISYXR0YWNobWVudE1lZGlhS2V5iAEBEkUKG2F0dGFjaG1lbnRNZWRpYUtleVRpbWVzdGFtcBgGIAEoA0gFUhthdHRhY2htZW50TWVkaWFLZXlUaW1lc3RhbXCIAQESNwoUYXR0YWNobWVudEZpbGVTaGEyNTYYByABKAxIBlIUYXR0YWNobWVudEZpbGVTaGEyNTaIAQESPQoXYXR0YWNobWVudEZpbGVFbmNTaGEyNTYYCCABKAxIB1IXYXR0YWNobWVudEZpbGVFbmNTaGEyNTaIAQESNwoUYXR0YWNobWVudERpcmVjdFBhdGgYCSABKAlICFIUYXR0YWNobWVudERpcmVjdFBhdGiIAQESPQoXYXR0YWNobWVudEpwZWdUaHVtYm5haWwYCiABKAxICVIXYXR0YWNobWVudEpwZWdUaHVtYm5haWyIAQEiJAoOQXR0YWNobWVudFR5cGUSCQoFSU1BR0UQABIHCgNQREYQAUIHCgVfbm90ZUIICgZfdG9rZW5CEQoPX2F0dGFjaG1lbnRUeXBlQhUKE19hdHRhY2htZW50TWltZXR5cGVCFQoTX2F0dGFjaG1lbnRNZWRpYUtleUIeChxfYXR0YWNobWVudE1lZGlhS2V5VGltZXN0YW1wQhcKFV9hdHRhY2htZW50RmlsZVNoYTI1NkIaChhfYXR0YWNobWVudEZpbGVFbmNTaGEyNTZCFwoVX2F0dGFjaG1lbnREaXJlY3RQYXRoQhoKGF9hdHRhY2htZW50SnBlZ1RodW1ibmFpbBq7AQoRS2VlcEluQ2hhdE1lc3NhZ2USKAoDa2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUgNrZXmIAQESMAoIa2VlcFR5cGUYAiABKA4yDy5wcm90by5LZWVwVHlwZUgBUghrZWVwVHlwZYgBARIlCgt0aW1lc3RhbXBNcxgDIAEoA0gCUgt0aW1lc3RhbXBNc4gBAUIGCgRfa2V5QgsKCV9rZWVwVHlwZUIOCgxfdGltZXN0YW1wTXMajQcKE0xpbmtQcmV2aWV3TWV0YWRhdGESWQoTcGF5bWVudExpbmtNZXRhZGF0YRgBIAEoCzIiLnByb3RvLk1lc3NhZ2UuUGF5bWVudExpbmtNZXRhZGF0YUgAUhNwYXltZW50TGlua01ldGFkYXRhiAEBEkEKC3VybE1ldGFkYXRhGAIgASgLMhoucHJvdG8uTWVzc2FnZS5VUkxNZXRhZGF0YUgBUgt1cmxNZXRhZGF0YYgBARIrCg5mYkV4cGVyaW1lbnRJZBgDIAEoDUgCUg5mYkV4cGVyaW1lbnRJZIgBARIxChFsaW5rTWVkaWFEdXJhdGlvbhgEIAEoDUgDUhFsaW5rTWVkaWFEdXJhdGlvbogBARJtChNzb2NpYWxNZWRpYVBvc3RUeXBlGAUgASgOMjYucHJvdG8uTWVzc2FnZS5MaW5rUHJldmlld01ldGFkYXRhLlNvY2lhbE1lZGlhUG9zdFR5cGVIBFITc29jaWFsTWVkaWFQb3N0VHlwZYgBARI3ChRsaW5rSW5saW5lVmlkZW9NdXRlZBgGIAEoCEgFUhRsaW5rSW5saW5lVmlkZW9NdXRlZIgBARItCg92aWRlb0NvbnRlbnRVcmwYByABKAlIBlIPdmlkZW9Db250ZW50VXJsiAEBEj8KDW11c2ljTWV0YWRhdGEYCCABKAsyFC5wcm90by5FbWJlZGRlZE11c2ljSAdSDW11c2ljTWV0YWRhdGGIAQESNQoTdmlkZW9Db250ZW50Q2FwdGlvbhgJIAEoCUgIUhN2aWRlb0NvbnRlbnRDYXB0aW9uiAEBImkKE1NvY2lhbE1lZGlhUG9zdFR5cGUSCAoETk9ORRAAEggKBFJFRUwQARIOCgpMSVZFX1ZJREVPEAISDgoKTE9OR19WSURFTxADEhAKDFNJTkdMRV9JTUFHRRAEEgwKCENBUk9VU0VMEAVCFgoUX3BheW1lbnRMaW5rTWV0YWRhdGFCDgoMX3VybE1ldGFkYXRhQhEKD19mYkV4cGVyaW1lbnRJZEIUChJfbGlua01lZGlhRHVyYXRpb25CFgoUX3NvY2lhbE1lZGlhUG9zdFR5cGVCFwoVX2xpbmtJbmxpbmVWaWRlb011dGVkQhIKEF92aWRlb0NvbnRlbnRVcmxCEAoOX211c2ljTWV0YWRhdGFCFgoUX3ZpZGVvQ29udGVudENhcHRpb24angsKC0xpc3RNZXNzYWdlEhkKBXRpdGxlGAEgASgJSABSBXRpdGxliAEBEiUKC2Rlc2NyaXB0aW9uGAIgASgJSAFSC2Rlc2NyaXB0aW9uiAEBEiMKCmJ1dHRvblRleHQYAyABKAlIAlIKYnV0dG9uVGV4dIgBARJECghsaXN0VHlwZRgEIAEoDjIjLnByb3RvLk1lc3NhZ2UuTGlzdE1lc3NhZ2UuTGlzdFR5cGVIA1IIbGlzdFR5cGWIAQESPgoIc2VjdGlvbnMYBSADKAsyIi5wcm90by5NZXNzYWdlLkxpc3RNZXNzYWdlLlNlY3Rpb25SCHNlY3Rpb25zElkKD3Byb2R1Y3RMaXN0SW5mbxgGIAEoCzIqLnByb3RvLk1lc3NhZ2UuTGlzdE1lc3NhZ2UuUHJvZHVjdExpc3RJbmZvSARSD3Byb2R1Y3RMaXN0SW5mb4gBARIjCgpmb290ZXJUZXh0GAcgASgJSAVSCmZvb3RlclRleHSIAQESOQoLY29udGV4dEluZm8YCCABKAsyEi5wcm90by5Db250ZXh0SW5mb0gGUgtjb250ZXh0SW5mb4gBARo6CgdQcm9kdWN0EiEKCXByb2R1Y3RJZBgBIAEoCUgAUglwcm9kdWN0SWSIAQFCDAoKX3Byb2R1Y3RJZBqGAQoWUHJvZHVjdExpc3RIZWFkZXJJbWFnZRIhCglwcm9kdWN0SWQYASABKAlIAFIJcHJvZHVjdElkiAEBEikKDWpwZWdUaHVtYm5haWwYAiABKAxIAVINanBlZ1RodW1ibmFpbIgBAUIMCgpfcHJvZHVjdElkQhAKDl9qcGVnVGh1bWJuYWlsGpYCCg9Qcm9kdWN0TGlzdEluZm8SUwoPcHJvZHVjdFNlY3Rpb25zGAEgAygLMikucHJvdG8uTWVzc2FnZS5MaXN0TWVzc2FnZS5Qcm9kdWN0U2VjdGlvblIPcHJvZHVjdFNlY3Rpb25zElgKC2hlYWRlckltYWdlGAIgASgLMjEucHJvdG8uTWVzc2FnZS5MaXN0TWVzc2FnZS5Qcm9kdWN0TGlzdEhlYWRlckltYWdlSABSC2hlYWRlckltYWdliAEBEi8KEGJ1c2luZXNzT3duZXJKaWQYAyABKAlIAVIQYnVzaW5lc3NPd25lckppZIgBAUIOCgxfaGVhZGVySW1hZ2VCEwoRX2J1c2luZXNzT3duZXJKaWQadQoOUHJvZHVjdFNlY3Rpb24SGQoFdGl0bGUYASABKAlIAFIFdGl0bGWIAQESPgoIcHJvZHVjdHMYAiADKAsyIi5wcm90by5NZXNzYWdlLkxpc3RNZXNzYWdlLlByb2R1Y3RSCHByb2R1Y3RzQggKBl90aXRsZRqGAQoDUm93EhkKBXRpdGxlGAEgASgJSABSBXRpdGxliAEBEiUKC2Rlc2NyaXB0aW9uGAIgASgJSAFSC2Rlc2NyaXB0aW9uiAEBEhkKBXJvd0lkGAMgASgJSAJSBXJvd0lkiAEBQggKBl90aXRsZUIOCgxfZGVzY3JpcHRpb25CCAoGX3Jvd0lkGmIKB1NlY3Rpb24SGQoFdGl0bGUYASABKAlIAFIFdGl0bGWIAQESMgoEcm93cxgCIAMoCzIeLnByb3RvLk1lc3NhZ2UuTGlzdE1lc3NhZ2UuUm93UgRyb3dzQggKBl90aXRsZSI8CghMaXN0VHlwZRILCgdVTktOT1dOEAASEQoNU0lOR0xFX1NFTEVDVBABEhAKDFBST0RVQ1RfTElTVBACQggKBl90aXRsZUIOCgxfZGVzY3JpcHRpb25CDQoLX2J1dHRvblRleHRCCwoJX2xpc3RUeXBlQhIKEF9wcm9kdWN0TGlzdEluZm9CDQoLX2Zvb3RlclRleHRCDgoMX2NvbnRleHRJbmZvGpQEChNMaXN0UmVzcG9uc2VNZXNzYWdlEhkKBXRpdGxlGAEgASgJSABSBXRpdGxliAEBEkwKCGxpc3RUeXBlGAIgASgOMisucHJvdG8uTWVzc2FnZS5MaXN0UmVzcG9uc2VNZXNzYWdlLkxpc3RUeXBlSAFSCGxpc3RUeXBliAEBEmcKEXNpbmdsZVNlbGVjdFJlcGx5GAMgASgLMjQucHJvdG8uTWVzc2FnZS5MaXN0UmVzcG9uc2VNZXNzYWdlLlNpbmdsZVNlbGVjdFJlcGx5SAJSEXNpbmdsZVNlbGVjdFJlcGx5iAEBEjkKC2NvbnRleHRJbmZvGAQgASgLMhIucHJvdG8uQ29udGV4dEluZm9IA1ILY29udGV4dEluZm+IAQESJQoLZGVzY3JpcHRpb24YBSABKAlIBFILZGVzY3JpcHRpb26IAQEaUAoRU2luZ2xlU2VsZWN0UmVwbHkSKQoNc2VsZWN0ZWRSb3dJZBgBIAEoCUgAUg1zZWxlY3RlZFJvd0lkiAEBQhAKDl9zZWxlY3RlZFJvd0lkIioKCExpc3RUeXBlEgsKB1VOS05PV04QABIRCg1TSU5HTEVfU0VMRUNUEAFCCAoGX3RpdGxlQgsKCV9saXN0VHlwZUIUChJfc2luZ2xlU2VsZWN0UmVwbHlCDgoMX2NvbnRleHRJbmZvQg4KDF9kZXNjcmlwdGlvbhq4BQoTTGl2ZUxvY2F0aW9uTWVzc2FnZRItCg9kZWdyZWVzTGF0aXR1ZGUYASABKAFIAFIPZGVncmVlc0xhdGl0dWRliAEBEi8KEGRlZ3JlZXNMb25naXR1ZGUYAiABKAFIAVIQZGVncmVlc0xvbmdpdHVkZYgBARIvChBhY2N1cmFjeUluTWV0ZXJzGAMgASgNSAJSEGFjY3VyYWN5SW5NZXRlcnOIAQESIwoKc3BlZWRJbk1wcxgEIAEoAkgDUgpzcGVlZEluTXBziAEBElEKIWRlZ3JlZXNDbG9ja3dpc2VGcm9tTWFnbmV0aWNOb3J0aBgFIAEoDUgEUiFkZWdyZWVzQ2xvY2t3aXNlRnJvbU1hZ25ldGljTm9ydGiIAQESHQoHY2FwdGlvbhgGIAEoCUgFUgdjYXB0aW9uiAEBEisKDnNlcXVlbmNlTnVtYmVyGAcgASgDSAZSDnNlcXVlbmNlTnVtYmVyiAEBEiMKCnRpbWVPZmZzZXQYCCABKA1IB1IKdGltZU9mZnNldIgBARIpCg1qcGVnVGh1bWJuYWlsGBAgASgMSAhSDWpwZWdUaHVtYm5haWyIAQESOQoLY29udGV4dEluZm8YESABKAsyEi5wcm90by5Db250ZXh0SW5mb0gJUgtjb250ZXh0SW5mb4gBAUISChBfZGVncmVlc0xhdGl0dWRlQhMKEV9kZWdyZWVzTG9uZ2l0dWRlQhMKEV9hY2N1cmFjeUluTWV0ZXJzQg0KC19zcGVlZEluTXBzQiQKIl9kZWdyZWVzQ2xvY2t3aXNlRnJvbU1hZ25ldGljTm9ydGhCCgoIX2NhcHRpb25CEQoPX3NlcXVlbmNlTnVtYmVyQg0KC190aW1lT2Zmc2V0QhAKDl9qcGVnVGh1bWJuYWlsQg4KDF9jb250ZXh0SW5mbxrUBQoPTG9jYXRpb25NZXNzYWdlEi0KD2RlZ3JlZXNMYXRpdHVkZRgBIAEoAUgAUg9kZWdyZWVzTGF0aXR1ZGWIAQESLwoQZGVncmVlc0xvbmdpdHVkZRgCIAEoAUgBUhBkZWdyZWVzTG9uZ2l0dWRliAEBEhcKBG5hbWUYAyABKAlIAlIEbmFtZYgBARIdCgdhZGRyZXNzGAQgASgJSANSB2FkZHJlc3OIAQESFQoDdXJsGAUgASgJSARSA3VybIgBARIbCgZpc0xpdmUYBiABKAhIBVIGaXNMaXZliAEBEi8KEGFjY3VyYWN5SW5NZXRlcnMYByABKA1IBlIQYWNjdXJhY3lJbk1ldGVyc4gBARIjCgpzcGVlZEluTXBzGAggASgCSAdSCnNwZWVkSW5NcHOIAQESUQohZGVncmVlc0Nsb2Nrd2lzZUZyb21NYWduZXRpY05vcnRoGAkgASgNSAhSIWRlZ3JlZXNDbG9ja3dpc2VGcm9tTWFnbmV0aWNOb3J0aIgBARIdCgdjb21tZW50GAsgASgJSAlSB2NvbW1lbnSIAQESKQoNanBlZ1RodW1ibmFpbBgQIAEoDEgKUg1qcGVnVGh1bWJuYWlsiAEBEjkKC2NvbnRleHRJbmZvGBEgASgLMhIucHJvdG8uQ29udGV4dEluZm9IC1ILY29udGV4dEluZm+IAQFCEgoQX2RlZ3JlZXNMYXRpdHVkZUITChFfZGVncmVlc0xvbmdpdHVkZUIHCgVfbmFtZUIKCghfYWRkcmVzc0IGCgRfdXJsQgkKB19pc0xpdmVCEwoRX2FjY3VyYWN5SW5NZXRlcnNCDQoLX3NwZWVkSW5NcHNCJAoiX2RlZ3JlZXNDbG9ja3dpc2VGcm9tTWFnbmV0aWNOb3J0aEIKCghfY29tbWVudEIQCg5fanBlZ1RodW1ibmFpbEIOCgxfY29udGV4dEluZm8azQQKFE1NU1RodW1ibmFpbE1ldGFkYXRhEjUKE3RodW1ibmFpbERpcmVjdFBhdGgYASABKAlIAFITdGh1bWJuYWlsRGlyZWN0UGF0aIgBARItCg90aHVtYm5haWxTaGEyNTYYAiABKAxIAVIPdGh1bWJuYWlsU2hhMjU2iAEBEjMKEnRodW1ibmFpbEVuY1NoYTI1NhgDIAEoDEgCUhJ0aHVtYm5haWxFbmNTaGEyNTaIAQESHwoIbWVkaWFLZXkYBCABKAxIA1IIbWVkaWFLZXmIAQESMQoRbWVkaWFLZXlUaW1lc3RhbXAYBSABKANIBFIRbWVkaWFLZXlUaW1lc3RhbXCIAQESLQoPdGh1bWJuYWlsSGVpZ2h0GAYgASgNSAVSD3RodW1ibmFpbEhlaWdodIgBARIrCg50aHVtYm5haWxXaWR0aBgHIAEoDUgGUg50aHVtYm5haWxXaWR0aIgBARJKCg5tZWRpYUtleURvbWFpbhgIIAEoDjIdLnByb3RvLk1lc3NhZ2UuTWVkaWFLZXlEb21haW5IB1IObWVkaWFLZXlEb21haW6IAQFCFgoUX3RodW1ibmFpbERpcmVjdFBhdGhCEgoQX3RodW1ibmFpbFNoYTI1NkIVChNfdGh1bWJuYWlsRW5jU2hhMjU2QgsKCV9tZWRpYUtleUIUChJfbWVkaWFLZXlUaW1lc3RhbXBCEgoQX3RodW1ibmFpbEhlaWdodEIRCg9fdGh1bWJuYWlsV2lkdGhCEQoPX21lZGlhS2V5RG9tYWluGqoEChRNZXNzYWdlSGlzdG9yeUJ1bmRsZRIfCghtaW1ldHlwZRgBIAEoCUgAUghtaW1ldHlwZYgBARIjCgpmaWxlU2hhMjU2GAIgASgMSAFSCmZpbGVTaGEyNTaIAQESHwoIbWVkaWFLZXkYAyABKAxIAlIIbWVkaWFLZXmIAQESKQoNZmlsZUVuY1NoYTI1NhgEIAEoDEgDUg1maWxlRW5jU2hhMjU2iAEBEiMKCmRpcmVjdFBhdGgYBSABKAlIBFIKZGlyZWN0UGF0aIgBARIxChFtZWRpYUtleVRpbWVzdGFtcBgGIAEoA0gFUhFtZWRpYUtleVRpbWVzdGFtcIgBARI5Cgtjb250ZXh0SW5mbxgHIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSAZSC2NvbnRleHRJbmZviAEBEmIKFm1lc3NhZ2VIaXN0b3J5TWV0YWRhdGEYCCABKAsyJS5wcm90by5NZXNzYWdlLk1lc3NhZ2VIaXN0b3J5TWV0YWRhdGFIB1IWbWVzc2FnZUhpc3RvcnlNZXRhZGF0YYgBAUILCglfbWltZXR5cGVCDQoLX2ZpbGVTaGEyNTZCCwoJX21lZGlhS2V5QhAKDl9maWxlRW5jU2hhMjU2Qg0KC19kaXJlY3RQYXRoQhQKEl9tZWRpYUtleVRpbWVzdGFtcEIOCgxfY29udGV4dEluZm9CGQoXX21lc3NhZ2VIaXN0b3J5TWV0YWRhdGEa1gEKFk1lc3NhZ2VIaXN0b3J5TWV0YWRhdGESKgoQaGlzdG9yeVJlY2VpdmVycxgBIAMoCVIQaGlzdG9yeVJlY2VpdmVycxI7ChZvbGRlc3RNZXNzYWdlVGltZXN0YW1wGAIgASgDSABSFm9sZGVzdE1lc3NhZ2VUaW1lc3RhbXCIAQESJwoMbWVzc2FnZUNvdW50GAMgASgDSAFSDG1lc3NhZ2VDb3VudIgBAUIZChdfb2xkZXN0TWVzc2FnZVRpbWVzdGFtcEIPCg1fbWVzc2FnZUNvdW50GuABChRNZXNzYWdlSGlzdG9yeU5vdGljZRI5Cgtjb250ZXh0SW5mbxgBIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSABSC2NvbnRleHRJbmZviAEBEmIKFm1lc3NhZ2VIaXN0b3J5TWV0YWRhdGEYAiABKAsyJS5wcm90by5NZXNzYWdlLk1lc3NhZ2VIaXN0b3J5TWV0YWRhdGFIAVIWbWVzc2FnZUhpc3RvcnlNZXRhZGF0YYgBAUIOCgxfY29udGV4dEluZm9CGQoXX21lc3NhZ2VIaXN0b3J5TWV0YWRhdGEalAMKHE5ld3NsZXR0ZXJBZG1pbkludml0ZU1lc3NhZ2USKQoNbmV3c2xldHRlckppZBgBIAEoCUgAUg1uZXdzbGV0dGVySmlkiAEBEisKDm5ld3NsZXR0ZXJOYW1lGAIgASgJSAFSDm5ld3NsZXR0ZXJOYW1liAEBEikKDWpwZWdUaHVtYm5haWwYAyABKAxIAlINanBlZ1RodW1ibmFpbIgBARIdCgdjYXB0aW9uGAQgASgJSANSB2NhcHRpb26IAQESLwoQaW52aXRlRXhwaXJhdGlvbhgFIAEoA0gEUhBpbnZpdGVFeHBpcmF0aW9uiAEBEjkKC2NvbnRleHRJbmZvGAYgASgLMhIucHJvdG8uQ29udGV4dEluZm9IBVILY29udGV4dEluZm+IAQFCEAoOX25ld3NsZXR0ZXJKaWRCEQoPX25ld3NsZXR0ZXJOYW1lQhAKDl9qcGVnVGh1bWJuYWlsQgoKCF9jYXB0aW9uQhMKEV9pbnZpdGVFeHBpcmF0aW9uQg4KDF9jb250ZXh0SW5mbxrRAgofTmV3c2xldHRlckZvbGxvd2VySW52aXRlTWVzc2FnZRIpCg1uZXdzbGV0dGVySmlkGAEgASgJSABSDW5ld3NsZXR0ZXJKaWSIAQESKwoObmV3c2xldHRlck5hbWUYAiABKAlIAVIObmV3c2xldHRlck5hbWWIAQESKQoNanBlZ1RodW1ibmFpbBgDIAEoDEgCUg1qcGVnVGh1bWJuYWlsiAEBEh0KB2NhcHRpb24YBCABKAlIA1IHY2FwdGlvbogBARI5Cgtjb250ZXh0SW5mbxgFIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSARSC2NvbnRleHRJbmZviAEBQhAKDl9uZXdzbGV0dGVySmlkQhEKD19uZXdzbGV0dGVyTmFtZUIQCg5fanBlZ1RodW1ibmFpbEIKCghfY2FwdGlvbkIOCgxfY29udGV4dEluZm8avggKDE9yZGVyTWVzc2FnZRIdCgdvcmRlcklkGAEgASgJSABSB29yZGVySWSIAQESIQoJdGh1bWJuYWlsGAIgASgMSAFSCXRodW1ibmFpbIgBARIhCglpdGVtQ291bnQYAyABKAVIAlIJaXRlbUNvdW50iAEBEkQKBnN0YXR1cxgEIAEoDjInLnByb3RvLk1lc3NhZ2UuT3JkZXJNZXNzYWdlLk9yZGVyU3RhdHVzSANSBnN0YXR1c4gBARJHCgdzdXJmYWNlGAUgASgOMigucHJvdG8uTWVzc2FnZS5PcmRlck1lc3NhZ2UuT3JkZXJTdXJmYWNlSARSB3N1cmZhY2WIAQESHQoHbWVzc2FnZRgGIAEoCUgFUgdtZXNzYWdliAEBEiMKCm9yZGVyVGl0bGUYByABKAlIBlIKb3JkZXJUaXRsZYgBARIhCglzZWxsZXJKaWQYCCABKAlIB1IJc2VsbGVySmlkiAEBEhkKBXRva2VuGAkgASgJSAhSBXRva2VuiAEBEi0KD3RvdGFsQW1vdW50MTAwMBgKIAEoA0gJUg90b3RhbEFtb3VudDEwMDCIAQESMQoRdG90YWxDdXJyZW5jeUNvZGUYCyABKAlIClIRdG90YWxDdXJyZW5jeUNvZGWIAQESOQoLY29udGV4dEluZm8YESABKAsyEi5wcm90by5Db250ZXh0SW5mb0gLUgtjb250ZXh0SW5mb4gBARIrCg5tZXNzYWdlVmVyc2lvbhgMIAEoBUgMUg5tZXNzYWdlVmVyc2lvbogBARJMChVvcmRlclJlcXVlc3RNZXNzYWdlSWQYDSABKAsyES5wcm90by5NZXNzYWdlS2V5SA1SFW9yZGVyUmVxdWVzdE1lc3NhZ2VJZIgBARIlCgtjYXRhbG9nVHlwZRgPIAEoCUgOUgtjYXRhbG9nVHlwZYgBASJUCgtPcmRlclN0YXR1cxIcChhVTktOT1dOX09SREVSU1RBVFVTX1pFUk8QABILCgdJTlFVSVJZEAESDAoIQUNDRVBURUQQAhIMCghERUNMSU5FRBADIjoKDE9yZGVyU3VyZmFjZRIdChlVTktOT1dOX09SREVSU1VSRkFDRV9aRVJPEAASCwoHQ0FUQUxPRxABQgoKCF9vcmRlcklkQgwKCl90aHVtYm5haWxCDAoKX2l0ZW1Db3VudEIJCgdfc3RhdHVzQgoKCF9zdXJmYWNlQgoKCF9tZXNzYWdlQg0KC19vcmRlclRpdGxlQgwKCl9zZWxsZXJKaWRCCAoGX3Rva2VuQhIKEF90b3RhbEFtb3VudDEwMDBCFAoSX3RvdGFsQ3VycmVuY3lDb2RlQg4KDF9jb250ZXh0SW5mb0IRCg9fbWVzc2FnZVZlcnNpb25CGAoWX29yZGVyUmVxdWVzdE1lc3NhZ2VJZEIOCgxfY2F0YWxvZ1R5cGUasgEKF1BheW1lbnRFeHRlbmRlZE1ldGFkYXRhEhcKBHR5cGUYASABKA1IAFIEdHlwZYgBARIfCghwbGF0Zm9ybRgCIAEoCUgBUghwbGF0Zm9ybYgBARIxChFtZXNzYWdlUGFyYW1zSnNvbhgDIAEoCUgCUhFtZXNzYWdlUGFyYW1zSnNvbogBAUIHCgVfdHlwZUILCglfcGxhdGZvcm1CFAoSX21lc3NhZ2VQYXJhbXNKc29uGvsBChRQYXltZW50SW52aXRlTWVzc2FnZRJWCgtzZXJ2aWNlVHlwZRgBIAEoDjIvLnByb3RvLk1lc3NhZ2UuUGF5bWVudEludml0ZU1lc3NhZ2UuU2VydmljZVR5cGVIAFILc2VydmljZVR5cGWIAQESLQoPZXhwaXJ5VGltZXN0YW1wGAIgASgDSAFSD2V4cGlyeVRpbWVzdGFtcIgBASI4CgtTZXJ2aWNlVHlwZRILCgdVTktOT1dOEAASCQoFRkJQQVkQARIICgROT1ZJEAISBwoDVVBJEANCDgoMX3NlcnZpY2VUeXBlQhIKEF9leHBpcnlUaW1lc3RhbXAamgUKE1BheW1lbnRMaW5rTWV0YWRhdGESUQoGYnV0dG9uGAEgASgLMjQucHJvdG8uTWVzc2FnZS5QYXltZW50TGlua01ldGFkYXRhLlBheW1lbnRMaW5rQnV0dG9uSABSBmJ1dHRvbogBARJRCgZoZWFkZXIYAiABKAsyNC5wcm90by5NZXNzYWdlLlBheW1lbnRMaW5rTWV0YWRhdGEuUGF5bWVudExpbmtIZWFkZXJIAVIGaGVhZGVyiAEBElcKCHByb3ZpZGVyGAMgASgLMjYucHJvdG8uTWVzc2FnZS5QYXltZW50TGlua01ldGFkYXRhLlBheW1lbnRMaW5rUHJvdmlkZXJIAlIIcHJvdmlkZXKIAQEaSgoRUGF5bWVudExpbmtCdXR0b24SJQoLZGlzcGxheVRleHQYASABKAlIAFILZGlzcGxheVRleHSIAQFCDgoMX2Rpc3BsYXlUZXh0GskBChFQYXltZW50TGlua0hlYWRlchJvCgpoZWFkZXJUeXBlGAEgASgOMkoucHJvdG8uTWVzc2FnZS5QYXltZW50TGlua01ldGFkYXRhLlBheW1lbnRMaW5rSGVhZGVyLlBheW1lbnRMaW5rSGVhZGVyVHlwZUgAUgpoZWFkZXJUeXBliAEBIjQKFVBheW1lbnRMaW5rSGVhZGVyVHlwZRIQCgxMSU5LX1BSRVZJRVcQABIJCgVPUkRFUhABQg0KC19oZWFkZXJUeXBlGkkKE1BheW1lbnRMaW5rUHJvdmlkZXISIwoKcGFyYW1zSnNvbhgBIAEoCUgAUgpwYXJhbXNKc29uiAEBQg0KC19wYXJhbXNKc29uQgkKB19idXR0b25CCQoHX2hlYWRlckILCglfcHJvdmlkZXIanBkKH1BlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdE1lc3NhZ2USdAoccGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0VHlwZRgBIAEoDjIrLnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0VHlwZUgAUhxwZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RUeXBliAEBEn0KFnJlcXVlc3RTdGlja2VyUmV1cGxvYWQYAiADKAsyRS5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdE1lc3NhZ2UuUmVxdWVzdFN0aWNrZXJSZXVwbG9hZFIWcmVxdWVzdFN0aWNrZXJSZXVwbG9hZBJuChFyZXF1ZXN0VXJsUHJldmlldxgDIAMoCzJALnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0TWVzc2FnZS5SZXF1ZXN0VXJsUHJldmlld1IRcmVxdWVzdFVybFByZXZpZXcSjgEKGmhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0GAQgASgLMkkucHJvdG8uTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RNZXNzYWdlLkhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0SAFSGmhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0iAEBEpgBCh9wbGFjZWhvbGRlck1lc3NhZ2VSZXNlbmRSZXF1ZXN0GAUgAygLMk4ucHJvdG8uTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RNZXNzYWdlLlBsYWNlaG9sZGVyTWVzc2FnZVJlc2VuZFJlcXVlc3RSH3BsYWNlaG9sZGVyTWVzc2FnZVJlc2VuZFJlcXVlc3QSmgEKHmZ1bGxIaXN0b3J5U3luY09uRGVtYW5kUmVxdWVzdBgGIAEoCzJNLnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0TWVzc2FnZS5GdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RIAlIeZnVsbEhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0iAEBEqkBCiNzeW5jZENvbGxlY3Rpb25GYXRhbFJlY292ZXJ5UmVxdWVzdBgHIAEoCzJSLnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0TWVzc2FnZS5TeW5jRENvbGxlY3Rpb25GYXRhbFJlY292ZXJ5UmVxdWVzdEgDUiNzeW5jZENvbGxlY3Rpb25GYXRhbFJlY292ZXJ5UmVxdWVzdIgBARKUAQocaGlzdG9yeVN5bmNDaHVua1JldHJ5UmVxdWVzdBgIIAEoCzJLLnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0TWVzc2FnZS5IaXN0b3J5U3luY0NodW5rUmV0cnlSZXF1ZXN0SARSHGhpc3RvcnlTeW5jQ2h1bmtSZXRyeVJlcXVlc3SIAQEScAoQZ2FsYXh5Rmxvd0FjdGlvbhgJIAEoCzI/LnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0TWVzc2FnZS5HYWxheHlGbG93QWN0aW9uSAVSEGdhbGF4eUZsb3dBY3Rpb26IAQEaiQIKHkZ1bGxIaXN0b3J5U3luY09uRGVtYW5kUmVxdWVzdBJkCg9yZXF1ZXN0TWV0YWRhdGEYASABKAsyNS5wcm90by5NZXNzYWdlLkZ1bGxIaXN0b3J5U3luY09uRGVtYW5kUmVxdWVzdE1ldGFkYXRhSABSD3JlcXVlc3RNZXRhZGF0YYgBARJXChFoaXN0b3J5U3luY0NvbmZpZxgCIAEoCzIkLnByb3RvLkRldmljZVByb3BzLkhpc3RvcnlTeW5jQ29uZmlnSAFSEWhpc3RvcnlTeW5jQ29uZmlniAEBQhIKEF9yZXF1ZXN0TWV0YWRhdGFCFAoSX2hpc3RvcnlTeW5jQ29uZmlnGrICChBHYWxheHlGbG93QWN0aW9uEm0KBHR5cGUYASABKA4yVC5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdE1lc3NhZ2UuR2FsYXh5Rmxvd0FjdGlvbi5HYWxheHlGbG93QWN0aW9uVHlwZUgAUgR0eXBliAEBEhsKBmZsb3dJZBgCIAEoCUgBUgZmbG93SWSIAQESHwoIc3RhbnphSWQYAyABKAlIAlIIc3RhbnphSWSIAQEiUAoUR2FsYXh5Rmxvd0FjdGlvblR5cGUSJQohVU5LTk9XTl9HQUxBWFlGTE9XQUNUSU9OVFlQRV9aRVJPEAASEQoNTk9USUZZX0xBVU5DSBABQgcKBV90eXBlQgkKB19mbG93SWRCCwoJX3N0YW56YUlkGrICChxIaXN0b3J5U3luY0NodW5rUmV0cnlSZXF1ZXN0Ej8KCHN5bmNUeXBlGAEgASgOMh4ucHJvdG8uTWVzc2FnZS5IaXN0b3J5U3luY1R5cGVIAFIIc3luY1R5cGWIAQESIwoKY2h1bmtPcmRlchgCIAEoDUgBUgpjaHVua09yZGVyiAEBEjUKE2NodW5rTm90aWZpY2F0aW9uSWQYAyABKAlIAlITY2h1bmtOb3RpZmljYXRpb25JZIgBARItCg9yZWdlbmVyYXRlQ2h1bmsYBCABKAhIA1IPcmVnZW5lcmF0ZUNodW5riAEBQgsKCV9zeW5jVHlwZUINCgtfY2h1bmtPcmRlckIWChRfY2h1bmtOb3RpZmljYXRpb25JZEISChBfcmVnZW5lcmF0ZUNodW5rGo0DChpIaXN0b3J5U3luY09uRGVtYW5kUmVxdWVzdBIdCgdjaGF0SmlkGAEgASgJSABSB2NoYXRKaWSIAQESJQoLb2xkZXN0TXNnSWQYAiABKAlIAVILb2xkZXN0TXNnSWSIAQESLQoPb2xkZXN0TXNnRnJvbU1lGAMgASgISAJSD29sZGVzdE1zZ0Zyb21NZYgBARIvChBvbkRlbWFuZE1zZ0NvdW50GAQgASgFSANSEG9uRGVtYW5kTXNnQ291bnSIAQESNwoUb2xkZXN0TXNnVGltZXN0YW1wTXMYBSABKANIBFIUb2xkZXN0TXNnVGltZXN0YW1wTXOIAQESIwoKYWNjb3VudExpZBgGIAEoCUgFUgphY2NvdW50TGlkiAEBQgoKCF9jaGF0SmlkQg4KDF9vbGRlc3RNc2dJZEISChBfb2xkZXN0TXNnRnJvbU1lQhMKEV9vbkRlbWFuZE1zZ0NvdW50QhcKFV9vbGRlc3RNc2dUaW1lc3RhbXBNc0INCgtfYWNjb3VudExpZBpoCh9QbGFjZWhvbGRlck1lc3NhZ2VSZXNlbmRSZXF1ZXN0EjYKCm1lc3NhZ2VLZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5SABSCm1lc3NhZ2VLZXmIAQFCDQoLX21lc3NhZ2VLZXkaTAoWUmVxdWVzdFN0aWNrZXJSZXVwbG9hZBIjCgpmaWxlU2hhMjU2GAEgASgJSABSCmZpbGVTaGEyNTaIAQFCDQoLX2ZpbGVTaGEyNTYafgoRUmVxdWVzdFVybFByZXZpZXcSFQoDdXJsGAEgASgJSABSA3VybIgBARIzChJpbmNsdWRlSHFUaHVtYm5haWwYAiABKAhIAVISaW5jbHVkZUhxVGh1bWJuYWlsiAEBQgYKBF91cmxCFQoTX2luY2x1ZGVIcVRodW1ibmFpbBqWAQojU3luY0RDb2xsZWN0aW9uRmF0YWxSZWNvdmVyeVJlcXVlc3QSKwoOY29sbGVjdGlvbk5hbWUYASABKAlIAFIOY29sbGVjdGlvbk5hbWWIAQESIQoJdGltZXN0YW1wGAIgASgDSAFSCXRpbWVzdGFtcIgBAUIRCg9fY29sbGVjdGlvbk5hbWVCDAoKX3RpbWVzdGFtcEIfCh1fcGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0VHlwZUIdChtfaGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RCIQofX2Z1bGxIaXN0b3J5U3luY09uRGVtYW5kUmVxdWVzdEImCiRfc3luY2RDb2xsZWN0aW9uRmF0YWxSZWNvdmVyeVJlcXVlc3RCHwodX2hpc3RvcnlTeW5jQ2h1bmtSZXRyeVJlcXVlc3RCEwoRX2dhbGF4eUZsb3dBY3Rpb24arCwKJ1BlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZRJ0ChxwZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RUeXBlGAEgASgOMisucHJvdG8uTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RUeXBlSABSHHBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFR5cGWIAQESHwoIc3RhbnphSWQYAiABKAlIAVIIc3RhbnphSWSIAQESiAEKF3BlZXJEYXRhT3BlcmF0aW9uUmVzdWx0GAMgAygLMk4ucHJvdG8uTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RSZXNwb25zZU1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXN1bHRSF3BlZXJEYXRhT3BlcmF0aW9uUmVzdWx0GrApChdQZWVyRGF0YU9wZXJhdGlvblJlc3VsdBJbChFtZWRpYVVwbG9hZFJlc3VsdBgBIAEoDjIoLnByb3RvLk1lZGlhUmV0cnlOb3RpZmljYXRpb24uUmVzdWx0VHlwZUgAUhFtZWRpYVVwbG9hZFJlc3VsdIgBARJKCg5zdGlja2VyTWVzc2FnZRgCIAEoCzIdLnByb3RvLk1lc3NhZ2UuU3RpY2tlck1lc3NhZ2VIAVIOc3RpY2tlck1lc3NhZ2WIAQESmQEKE2xpbmtQcmV2aWV3UmVzcG9uc2UYAyABKAsyYi5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlc3VsdC5MaW5rUHJldmlld1Jlc3BvbnNlSAJSE2xpbmtQcmV2aWV3UmVzcG9uc2WIAQESwAEKIHBsYWNlaG9sZGVyTWVzc2FnZVJlc2VuZFJlc3BvbnNlGAQgASgLMm8ucHJvdG8uTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RSZXNwb25zZU1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXN1bHQuUGxhY2Vob2xkZXJNZXNzYWdlUmVzZW5kUmVzcG9uc2VIA1IgcGxhY2Vob2xkZXJNZXNzYWdlUmVzZW5kUmVzcG9uc2WIAQEStgEKH3dhZmZsZU5vbmNlRmV0Y2hSZXF1ZXN0UmVzcG9uc2UYBSABKAsyZy5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlc3VsdC5XYWZmbGVOb25jZUZldGNoUmVzcG9uc2VIBFIfd2FmZmxlTm9uY2VGZXRjaFJlcXVlc3RSZXNwb25zZYgBARLSAQomZnVsbEhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0UmVzcG9uc2UYBiABKAsydS5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlc3VsdC5GdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RSZXNwb25zZUgFUiZmdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RSZXNwb25zZYgBARLLAQomY29tcGFuaW9uTWV0YU5vbmNlRmV0Y2hSZXF1ZXN0UmVzcG9uc2UYByABKAsybi5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlc3VsdC5Db21wYW5pb25NZXRhTm9uY2VGZXRjaFJlc3BvbnNlSAZSJmNvbXBhbmlvbk1ldGFOb25jZUZldGNoUmVxdWVzdFJlc3BvbnNliAEBEsYBCiJzeW5jZFNuYXBzaG90RmF0YWxSZWNvdmVyeVJlc3BvbnNlGAggASgLMnEucHJvdG8uTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RSZXNwb25zZU1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXN1bHQuU3luY0RTbmFwc2hvdEZhdGFsUmVjb3ZlcnlSZXNwb25zZUgHUiJzeW5jZFNuYXBzaG90RmF0YWxSZWNvdmVyeVJlc3BvbnNliAEBEuYBCi9jb21wYW5pb25DYW5vbmljYWxVc2VyTm9uY2VGZXRjaFJlcXVlc3RSZXNwb25zZRgJIAEoCzJ3LnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0UmVzcG9uc2VNZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVzdWx0LkNvbXBhbmlvbkNhbm9uaWNhbFVzZXJOb25jZUZldGNoUmVzcG9uc2VICFIvY29tcGFuaW9uQ2Fub25pY2FsVXNlck5vbmNlRmV0Y2hSZXF1ZXN0UmVzcG9uc2WIAQEStwEKHWhpc3RvcnlTeW5jQ2h1bmtSZXRyeVJlc3BvbnNlGAogASgLMmwucHJvdG8uTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RSZXNwb25zZU1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXN1bHQuSGlzdG9yeVN5bmNDaHVua1JldHJ5UmVzcG9uc2VICVIdaGlzdG9yeVN5bmNDaHVua1JldHJ5UmVzcG9uc2WIAQEasQEKKENvbXBhbmlvbkNhbm9uaWNhbFVzZXJOb25jZUZldGNoUmVzcG9uc2USGQoFbm9uY2UYASABKAlIAFIFbm9uY2WIAQESGwoGd2FGYmlkGAIgASgJSAFSBndhRmJpZIgBARInCgxmb3JjZVJlZnJlc2gYAyABKAhIAlIMZm9yY2VSZWZyZXNoiAEBQggKBl9ub25jZUIJCgdfd2FGYmlkQg8KDV9mb3JjZVJlZnJlc2gaRgofQ29tcGFuaW9uTWV0YU5vbmNlRmV0Y2hSZXNwb25zZRIZCgVub25jZRgBIAEoCUgAUgVub25jZYgBAUIICgZfbm9uY2Ua0QIKJkZ1bGxIaXN0b3J5U3luY09uRGVtYW5kUmVxdWVzdFJlc3BvbnNlEmQKD3JlcXVlc3RNZXRhZGF0YRgBIAEoCzI1LnByb3RvLk1lc3NhZ2UuRnVsbEhpc3RvcnlTeW5jT25EZW1hbmRSZXF1ZXN0TWV0YWRhdGFIAFIPcmVxdWVzdE1ldGFkYXRhiAEBEpsBCgxyZXNwb25zZUNvZGUYAiABKA4yci5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlc3VsdC5GdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlc3BvbnNlQ29kZUgBUgxyZXNwb25zZUNvZGWIAQFCEgoQX3JlcXVlc3RNZXRhZGF0YUIPCg1fcmVzcG9uc2VDb2RlGrMDCh1IaXN0b3J5U3luY0NodW5rUmV0cnlSZXNwb25zZRI/CghzeW5jVHlwZRgBIAEoDjIeLnByb3RvLk1lc3NhZ2UuSGlzdG9yeVN5bmNUeXBlSABSCHN5bmNUeXBliAEBEiMKCmNodW5rT3JkZXIYAiABKA1IAVIKY2h1bmtPcmRlcogBARIhCglyZXF1ZXN0SWQYAyABKAlIAlIJcmVxdWVzdElkiAEBEpkBCgxyZXNwb25zZUNvZGUYBCABKA4ycC5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlc3VsdC5IaXN0b3J5U3luY0NodW5rUmV0cnlSZXNwb25zZUNvZGVIA1IMcmVzcG9uc2VDb2RliAEBEiMKCmNhblJlY292ZXIYBSABKAhIBFIKY2FuUmVjb3ZlcogBAUILCglfc3luY1R5cGVCDQoLX2NodW5rT3JkZXJCDAoKX3JlcXVlc3RJZEIPCg1fcmVzcG9uc2VDb2RlQg0KC19jYW5SZWNvdmVyGvkJChNMaW5rUHJldmlld1Jlc3BvbnNlEhUKA3VybBgBIAEoCUgAUgN1cmyIAQESGQoFdGl0bGUYAiABKAlIAVIFdGl0bGWIAQESJQoLZGVzY3JpcHRpb24YAyABKAlIAlILZGVzY3JpcHRpb26IAQESIQoJdGh1bWJEYXRhGAQgASgMSANSCXRodW1iRGF0YYgBARIhCgltYXRjaFRleHQYBiABKAlIBFIJbWF0Y2hUZXh0iAEBEiUKC3ByZXZpZXdUeXBlGAcgASgJSAVSC3ByZXZpZXdUeXBliAEBEqoBCgtocVRodW1ibmFpbBgIIAEoCzKCAS5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZS5QZWVyRGF0YU9wZXJhdGlvblJlc3VsdC5MaW5rUHJldmlld1Jlc3BvbnNlLkxpbmtQcmV2aWV3SGlnaFF1YWxpdHlUaHVtYm5haWxIBlILaHFUaHVtYm5haWyIAQESrAEKD3ByZXZpZXdNZXRhZGF0YRgJIAEoCzJ9LnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0UmVzcG9uc2VNZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVzdWx0LkxpbmtQcmV2aWV3UmVzcG9uc2UuUGF5bWVudExpbmtQcmV2aWV3TWV0YWRhdGFIB1IPcHJldmlld01ldGFkYXRhiAEBGqgDCh9MaW5rUHJldmlld0hpZ2hRdWFsaXR5VGh1bWJuYWlsEiMKCmRpcmVjdFBhdGgYASABKAlIAFIKZGlyZWN0UGF0aIgBARIhCgl0aHVtYkhhc2gYAiABKAlIAVIJdGh1bWJIYXNoiAEBEicKDGVuY1RodW1iSGFzaBgDIAEoCUgCUgxlbmNUaHVtYkhhc2iIAQESHwoIbWVkaWFLZXkYBCABKAxIA1IIbWVkaWFLZXmIAQESNQoTbWVkaWFLZXlUaW1lc3RhbXBNcxgFIAEoA0gEUhNtZWRpYUtleVRpbWVzdGFtcE1ziAEBEiMKCnRodW1iV2lkdGgYBiABKAVIBVIKdGh1bWJXaWR0aIgBARIlCgt0aHVtYkhlaWdodBgHIAEoBUgGUgt0aHVtYkhlaWdodIgBAUINCgtfZGlyZWN0UGF0aEIMCgpfdGh1bWJIYXNoQg8KDV9lbmNUaHVtYkhhc2hCCwoJX21lZGlhS2V5QhYKFF9tZWRpYUtleVRpbWVzdGFtcE1zQg0KC190aHVtYldpZHRoQg4KDF90aHVtYkhlaWdodBqiAQoaUGF5bWVudExpbmtQcmV2aWV3TWV0YWRhdGESMwoSaXNCdXNpbmVzc1ZlcmlmaWVkGAEgASgISABSEmlzQnVzaW5lc3NWZXJpZmllZIgBARInCgxwcm92aWRlck5hbWUYAiABKAlIAVIMcHJvdmlkZXJOYW1liAEBQhUKE19pc0J1c2luZXNzVmVyaWZpZWRCDwoNX3Byb3ZpZGVyTmFtZUIGCgRfdXJsQggKBl90aXRsZUIOCgxfZGVzY3JpcHRpb25CDAoKX3RodW1iRGF0YUIMCgpfbWF0Y2hUZXh0Qg4KDF9wcmV2aWV3VHlwZUIOCgxfaHFUaHVtYm5haWxCEgoQX3ByZXZpZXdNZXRhZGF0YRpxCiBQbGFjZWhvbGRlck1lc3NhZ2VSZXNlbmRSZXNwb25zZRI1ChN3ZWJNZXNzYWdlSW5mb0J5dGVzGAEgASgMSABSE3dlYk1lc3NhZ2VJbmZvQnl0ZXOIAQFCFgoUX3dlYk1lc3NhZ2VJbmZvQnl0ZXMaqgEKIlN5bmNEU25hcHNob3RGYXRhbFJlY292ZXJ5UmVzcG9uc2USMwoSY29sbGVjdGlvblNuYXBzaG90GAEgASgMSABSEmNvbGxlY3Rpb25TbmFwc2hvdIgBARInCgxpc0NvbXByZXNzZWQYAiABKAhIAVIMaXNDb21wcmVzc2VkiAEBQhUKE19jb2xsZWN0aW9uU25hcHNob3RCDwoNX2lzQ29tcHJlc3NlZBpwChhXYWZmbGVOb25jZUZldGNoUmVzcG9uc2USGQoFbm9uY2UYASABKAlIAFIFbm9uY2WIAQESIQoJd2FFbnRGYmlkGAIgASgJSAFSCXdhRW50RmJpZIgBAUIICgZfbm9uY2VCDAoKX3dhRW50RmJpZCL+AQojRnVsbEhpc3RvcnlTeW5jT25EZW1hbmRSZXNwb25zZUNvZGUSEwoPUkVRVUVTVF9TVUNDRVNTEAASGAoUUkVRVUVTVF9USU1FX0VYUElSRUQQARIcChhERUNMSU5FRF9TSEFSSU5HX0hJU1RPUlkQAhIRCg1HRU5FUklDX0VSUk9SEAMSJAogRVJST1JfUkVRVUVTVF9PTl9OT05fU01CX1BSSU1BUlkQBBIlCiFFUlJPUl9IT1NURURfREVWSUNFX05PVF9DT05ORUNURUQQBRIqCiZFUlJPUl9IT1NURURfREVWSUNFX0xPR0lOX1RJTUVfTk9UX1NFVBAGItIBCiFIaXN0b3J5U3luY0NodW5rUmV0cnlSZXNwb25zZUNvZGUSMgouVU5LTk9XTl9ISVNUT1JZU1lOQ0NIVU5LUkVUUllSRVNQT05TRUNPREVfWkVSTxAAEhQKEEdFTkVSQVRJT05fRVJST1IQARISCg5DSFVOS19DT05TVU1FRBACEgsKB1RJTUVPVVQQAxIVChFTRVNTSU9OX0VYSEFVU1RFRBAEEhMKD0NIVU5LX0VYSEFVU1RFRBAFEhYKEkRVUExJQ0FURURfUkVRVUVTVBAGQhQKEl9tZWRpYVVwbG9hZFJlc3VsdEIRCg9fc3RpY2tlck1lc3NhZ2VCFgoUX2xpbmtQcmV2aWV3UmVzcG9uc2VCIwohX3BsYWNlaG9sZGVyTWVzc2FnZVJlc2VuZFJlc3BvbnNlQiIKIF93YWZmbGVOb25jZUZldGNoUmVxdWVzdFJlc3BvbnNlQikKJ19mdWxsSGlzdG9yeVN5bmNPbkRlbWFuZFJlcXVlc3RSZXNwb25zZUIpCidfY29tcGFuaW9uTWV0YU5vbmNlRmV0Y2hSZXF1ZXN0UmVzcG9uc2VCJQojX3N5bmNkU25hcHNob3RGYXRhbFJlY292ZXJ5UmVzcG9uc2VCMgowX2NvbXBhbmlvbkNhbm9uaWNhbFVzZXJOb25jZUZldGNoUmVxdWVzdFJlc3BvbnNlQiAKHl9oaXN0b3J5U3luY0NodW5rUmV0cnlSZXNwb25zZUIfCh1fcGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0VHlwZUILCglfc3RhbnphSWQakwIKEFBpbkluQ2hhdE1lc3NhZ2USKAoDa2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUgNrZXmIAQESPQoEdHlwZRgCIAEoDjIkLnByb3RvLk1lc3NhZ2UuUGluSW5DaGF0TWVzc2FnZS5UeXBlSAFSBHR5cGWIAQESMQoRc2VuZGVyVGltZXN0YW1wTXMYAyABKANIAlIRc2VuZGVyVGltZXN0YW1wTXOIAQEiPAoEVHlwZRIQCgxVTktOT1dOX1RZUEUQABIPCgtQSU5fRk9SX0FMTBABEhEKDVVOUElOX0ZPUl9BTEwQAkIGCgRfa2V5QgcKBV90eXBlQhQKEl9zZW5kZXJUaW1lc3RhbXBNcxqVAQoSUGxhY2Vob2xkZXJNZXNzYWdlEkoKBHR5cGUYASABKA4yMS5wcm90by5NZXNzYWdlLlBsYWNlaG9sZGVyTWVzc2FnZS5QbGFjZWhvbGRlclR5cGVIAFIEdHlwZYgBASIqCg9QbGFjZWhvbGRlclR5cGUSFwoTTUFTS19MSU5LRURfREVWSUNFUxAAQgcKBV90eXBlGssFChNQb2xsQ3JlYXRpb25NZXNzYWdlEhsKBmVuY0tleRgBIAEoDEgAUgZlbmNLZXmIAQESFwoEbmFtZRgCIAEoCUgBUgRuYW1liAEBEkMKB29wdGlvbnMYAyADKAsyKS5wcm90by5NZXNzYWdlLlBvbGxDcmVhdGlvbk1lc3NhZ2UuT3B0aW9uUgdvcHRpb25zEjsKFnNlbGVjdGFibGVPcHRpb25zQ291bnQYBCABKA1IAlIWc2VsZWN0YWJsZU9wdGlvbnNDb3VudIgBARI5Cgtjb250ZXh0SW5mbxgFIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSANSC2NvbnRleHRJbmZviAEBEk0KD3BvbGxDb250ZW50VHlwZRgGIAEoDjIeLnByb3RvLk1lc3NhZ2UuUG9sbENvbnRlbnRUeXBlSARSD3BvbGxDb250ZW50VHlwZYgBARI4Cghwb2xsVHlwZRgHIAEoDjIXLnByb3RvLk1lc3NhZ2UuUG9sbFR5cGVIBVIIcG9sbFR5cGWIAQESVAoNY29ycmVjdEFuc3dlchgIIAEoCzIpLnByb3RvLk1lc3NhZ2UuUG9sbENyZWF0aW9uTWVzc2FnZS5PcHRpb25IBlINY29ycmVjdEFuc3dlcogBARpwCgZPcHRpb24SIwoKb3B0aW9uTmFtZRgBIAEoCUgAUgpvcHRpb25OYW1liAEBEiMKCm9wdGlvbkhhc2gYAiABKAlIAVIKb3B0aW9uSGFzaIgBAUINCgtfb3B0aW9uTmFtZUINCgtfb3B0aW9uSGFzaEIJCgdfZW5jS2V5QgcKBV9uYW1lQhkKF19zZWxlY3RhYmxlT3B0aW9uc0NvdW50Qg4KDF9jb250ZXh0SW5mb0ISChBfcG9sbENvbnRlbnRUeXBlQgsKCV9wb2xsVHlwZUIQCg5fY29ycmVjdEFuc3dlchpnCgxQb2xsRW5jVmFsdWUSIwoKZW5jUGF5bG9hZBgBIAEoDEgAUgplbmNQYXlsb2FkiAEBEhkKBWVuY0l2GAIgASgMSAFSBWVuY0l2iAEBQg0KC19lbmNQYXlsb2FkQggKBl9lbmNJdhqkAwoZUG9sbFJlc3VsdFNuYXBzaG90TWVzc2FnZRIXCgRuYW1lGAEgASgJSABSBG5hbWWIAQESTwoJcG9sbFZvdGVzGAIgAygLMjEucHJvdG8uTWVzc2FnZS5Qb2xsUmVzdWx0U25hcHNob3RNZXNzYWdlLlBvbGxWb3RlUglwb2xsVm90ZXMSOQoLY29udGV4dEluZm8YAyABKAsyEi5wcm90by5Db250ZXh0SW5mb0gBUgtjb250ZXh0SW5mb4gBARI4Cghwb2xsVHlwZRgEIAEoDjIXLnByb3RvLk1lc3NhZ2UuUG9sbFR5cGVIAlIIcG9sbFR5cGWIAQEagQEKCFBvbGxWb3RlEiMKCm9wdGlvbk5hbWUYASABKAlIAFIKb3B0aW9uTmFtZYgBARItCg9vcHRpb25Wb3RlQ291bnQYAiABKANIAVIPb3B0aW9uVm90ZUNvdW50iAEBQg0KC19vcHRpb25OYW1lQhIKEF9vcHRpb25Wb3RlQ291bnRCBwoFX25hbWVCDgoMX2NvbnRleHRJbmZvQgsKCV9wb2xsVHlwZRreAgoRUG9sbFVwZGF0ZU1lc3NhZ2USTgoWcG9sbENyZWF0aW9uTWVzc2FnZUtleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIWcG9sbENyZWF0aW9uTWVzc2FnZUtleYgBARI0CgR2b3RlGAIgASgLMhsucHJvdG8uTWVzc2FnZS5Qb2xsRW5jVmFsdWVIAVIEdm90ZYgBARJJCghtZXRhZGF0YRgDIAEoCzIoLnByb3RvLk1lc3NhZ2UuUG9sbFVwZGF0ZU1lc3NhZ2VNZXRhZGF0YUgCUghtZXRhZGF0YYgBARIxChFzZW5kZXJUaW1lc3RhbXBNcxgEIAEoA0gDUhFzZW5kZXJUaW1lc3RhbXBNc4gBAUIZChdfcG9sbENyZWF0aW9uTWVzc2FnZUtleUIHCgVfdm90ZUILCglfbWV0YWRhdGFCFAoSX3NlbmRlclRpbWVzdGFtcE1zGhsKGVBvbGxVcGRhdGVNZXNzYWdlTWV0YWRhdGEaOwoPUG9sbFZvdGVNZXNzYWdlEigKD3NlbGVjdGVkT3B0aW9ucxgBIAMoDFIPc2VsZWN0ZWRPcHRpb25zGrEKCg5Qcm9kdWN0TWVzc2FnZRJMCgdwcm9kdWN0GAEgASgLMi0ucHJvdG8uTWVzc2FnZS5Qcm9kdWN0TWVzc2FnZS5Qcm9kdWN0U25hcHNob3RIAFIHcHJvZHVjdIgBARIvChBidXNpbmVzc093bmVySmlkGAIgASgJSAFSEGJ1c2luZXNzT3duZXJKaWSIAQESTAoHY2F0YWxvZxgEIAEoCzItLnByb3RvLk1lc3NhZ2UuUHJvZHVjdE1lc3NhZ2UuQ2F0YWxvZ1NuYXBzaG90SAJSB2NhdGFsb2eIAQESFwoEYm9keRgFIAEoCUgDUgRib2R5iAEBEhsKBmZvb3RlchgGIAEoCUgEUgZmb290ZXKIAQESOQoLY29udGV4dEluZm8YESABKAsyEi5wcm90by5Db250ZXh0SW5mb0gFUgtjb250ZXh0SW5mb4gBARrEAQoPQ2F0YWxvZ1NuYXBzaG90EkQKDGNhdGFsb2dJbWFnZRgBIAEoCzIbLnByb3RvLk1lc3NhZ2UuSW1hZ2VNZXNzYWdlSABSDGNhdGFsb2dJbWFnZYgBARIZCgV0aXRsZRgCIAEoCUgBUgV0aXRsZYgBARIlCgtkZXNjcmlwdGlvbhgDIAEoCUgCUgtkZXNjcmlwdGlvbogBAUIPCg1fY2F0YWxvZ0ltYWdlQggKBl90aXRsZUIOCgxfZGVzY3JpcHRpb24ayAUKD1Byb2R1Y3RTbmFwc2hvdBJECgxwcm9kdWN0SW1hZ2UYASABKAsyGy5wcm90by5NZXNzYWdlLkltYWdlTWVzc2FnZUgAUgxwcm9kdWN0SW1hZ2WIAQESIQoJcHJvZHVjdElkGAIgASgJSAFSCXByb2R1Y3RJZIgBARIZCgV0aXRsZRgDIAEoCUgCUgV0aXRsZYgBARIlCgtkZXNjcmlwdGlvbhgEIAEoCUgDUgtkZXNjcmlwdGlvbogBARInCgxjdXJyZW5jeUNvZGUYBSABKAlIBFIMY3VycmVuY3lDb2RliAEBEi0KD3ByaWNlQW1vdW50MTAwMBgGIAEoA0gFUg9wcmljZUFtb3VudDEwMDCIAQESIwoKcmV0YWlsZXJJZBgHIAEoCUgGUgpyZXRhaWxlcklkiAEBEhUKA3VybBgIIAEoCUgHUgN1cmyIAQESMQoRcHJvZHVjdEltYWdlQ291bnQYCSABKA1ICFIRcHJvZHVjdEltYWdlQ291bnSIAQESJwoMZmlyc3RJbWFnZUlkGAsgASgJSAlSDGZpcnN0SW1hZ2VJZIgBARI1ChNzYWxlUHJpY2VBbW91bnQxMDAwGAwgASgDSApSE3NhbGVQcmljZUFtb3VudDEwMDCIAQESIQoJc2lnbmVkVXJsGA0gASgJSAtSCXNpZ25lZFVybIgBAUIPCg1fcHJvZHVjdEltYWdlQgwKCl9wcm9kdWN0SWRCCAoGX3RpdGxlQg4KDF9kZXNjcmlwdGlvbkIPCg1fY3VycmVuY3lDb2RlQhIKEF9wcmljZUFtb3VudDEwMDBCDQoLX3JldGFpbGVySWRCBgoEX3VybEIUChJfcHJvZHVjdEltYWdlQ291bnRCDwoNX2ZpcnN0SW1hZ2VJZEIWChRfc2FsZVByaWNlQW1vdW50MTAwMEIMCgpfc2lnbmVkVXJsQgoKCF9wcm9kdWN0QhMKEV9idXNpbmVzc093bmVySmlkQgoKCF9jYXRhbG9nQgcKBV9ib2R5QgkKB19mb290ZXJCDgoMX2NvbnRleHRJbmZvGocbCg9Qcm90b2NvbE1lc3NhZ2USKAoDa2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUgNrZXmIAQESPAoEdHlwZRgCIAEoDjIjLnByb3RvLk1lc3NhZ2UuUHJvdG9jb2xNZXNzYWdlLlR5cGVIAVIEdHlwZYgBARI1ChNlcGhlbWVyYWxFeHBpcmF0aW9uGAQgASgNSAJSE2VwaGVtZXJhbEV4cGlyYXRpb26IAQESQQoZZXBoZW1lcmFsU2V0dGluZ1RpbWVzdGFtcBgFIAEoA0gDUhllcGhlbWVyYWxTZXR0aW5nVGltZXN0YW1wiAEBEmUKF2hpc3RvcnlTeW5jTm90aWZpY2F0aW9uGAYgASgLMiYucHJvdG8uTWVzc2FnZS5IaXN0b3J5U3luY05vdGlmaWNhdGlvbkgEUhdoaXN0b3J5U3luY05vdGlmaWNhdGlvbogBARJcChRhcHBTdGF0ZVN5bmNLZXlTaGFyZRgHIAEoCzIjLnByb3RvLk1lc3NhZ2UuQXBwU3RhdGVTeW5jS2V5U2hhcmVIBVIUYXBwU3RhdGVTeW5jS2V5U2hhcmWIAQESYgoWYXBwU3RhdGVTeW5jS2V5UmVxdWVzdBgIIAEoCzIlLnByb3RvLk1lc3NhZ2UuQXBwU3RhdGVTeW5jS2V5UmVxdWVzdEgGUhZhcHBTdGF0ZVN5bmNLZXlSZXF1ZXN0iAEBEpIBCiZpbml0aWFsU2VjdXJpdHlOb3RpZmljYXRpb25TZXR0aW5nU3luYxgJIAEoCzI1LnByb3RvLk1lc3NhZ2UuSW5pdGlhbFNlY3VyaXR5Tm90aWZpY2F0aW9uU2V0dGluZ1N5bmNIB1ImaW5pdGlhbFNlY3VyaXR5Tm90aWZpY2F0aW9uU2V0dGluZ1N5bmOIAQEShgEKImFwcFN0YXRlRmF0YWxFeGNlcHRpb25Ob3RpZmljYXRpb24YCiABKAsyMS5wcm90by5NZXNzYWdlLkFwcFN0YXRlRmF0YWxFeGNlcHRpb25Ob3RpZmljYXRpb25ICFIiYXBwU3RhdGVGYXRhbEV4Y2VwdGlvbk5vdGlmaWNhdGlvbogBARJIChBkaXNhcHBlYXJpbmdNb2RlGAsgASgLMhcucHJvdG8uRGlzYXBwZWFyaW5nTW9kZUgJUhBkaXNhcHBlYXJpbmdNb2RliAEBEjkKDWVkaXRlZE1lc3NhZ2UYDiABKAsyDi5wcm90by5NZXNzYWdlSApSDWVkaXRlZE1lc3NhZ2WIAQESJQoLdGltZXN0YW1wTXMYDyABKANIC1ILdGltZXN0YW1wTXOIAQESfQofcGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0TWVzc2FnZRgQIAEoCzIuLnByb3RvLk1lc3NhZ2UuUGVlckRhdGFPcGVyYXRpb25SZXF1ZXN0TWVzc2FnZUgMUh9wZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RNZXNzYWdliAEBEpUBCidwZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RSZXNwb25zZU1lc3NhZ2UYESABKAsyNi5wcm90by5NZXNzYWdlLlBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZUgNUidwZWVyRGF0YU9wZXJhdGlvblJlcXVlc3RSZXNwb25zZU1lc3NhZ2WIAQESTgoSYm90RmVlZGJhY2tNZXNzYWdlGBIgASgLMhkucHJvdG8uQm90RmVlZGJhY2tNZXNzYWdlSA5SEmJvdEZlZWRiYWNrTWVzc2FnZYgBARIjCgppbnZva2VySmlkGBMgASgJSA9SCmludm9rZXJKaWSIAQESdwodcmVxdWVzdFdlbGNvbWVNZXNzYWdlTWV0YWRhdGEYFCABKAsyLC5wcm90by5NZXNzYWdlLlJlcXVlc3RXZWxjb21lTWVzc2FnZU1ldGFkYXRhSBBSHXJlcXVlc3RXZWxjb21lTWVzc2FnZU1ldGFkYXRhiAEBEk4KEm1lZGlhTm90aWZ5TWVzc2FnZRgVIAEoCzIZLnByb3RvLk1lZGlhTm90aWZ5TWVzc2FnZUgRUhJtZWRpYU5vdGlmeU1lc3NhZ2WIAQESgwEKIWNsb3VkQXBpVGhyZWFkQ29udHJvbE5vdGlmaWNhdGlvbhgWIAEoCzIwLnByb3RvLk1lc3NhZ2UuQ2xvdWRBUElUaHJlYWRDb250cm9sTm90aWZpY2F0aW9uSBJSIWNsb3VkQXBpVGhyZWFkQ29udHJvbE5vdGlmaWNhdGlvbogBARJyCh5saWRNaWdyYXRpb25NYXBwaW5nU3luY01lc3NhZ2UYFyABKAsyJS5wcm90by5MSURNaWdyYXRpb25NYXBwaW5nU3luY01lc3NhZ2VIE1IebGlkTWlncmF0aW9uTWFwcGluZ1N5bmNNZXNzYWdliAEBEjwKDGxpbWl0U2hhcmluZxgYIAEoCzITLnByb3RvLkxpbWl0U2hhcmluZ0gUUgxsaW1pdFNoYXJpbmeIAQESKQoNYWlQc2lNZXRhZGF0YRgZIAEoDEgVUg1haVBzaU1ldGFkYXRhiAEBEj8KDWFpUXVlcnlGYW5vdXQYGiABKAsyFC5wcm90by5BSVF1ZXJ5RmFub3V0SBZSDWFpUXVlcnlGYW5vdXSIAQESOQoLbWVtYmVyTGFiZWwYGyABKAsyEi5wcm90by5NZW1iZXJMYWJlbEgXUgttZW1iZXJMYWJlbIgBASKNBgoEVHlwZRIKCgZSRVZPS0UQABIVChFFUEhFTUVSQUxfU0VUVElORxADEhsKF0VQSEVNRVJBTF9TWU5DX1JFU1BPTlNFEAQSHQoZSElTVE9SWV9TWU5DX05PVElGSUNBVElPThAFEhwKGEFQUF9TVEFURV9TWU5DX0tFWV9TSEFSRRAGEh4KGkFQUF9TVEFURV9TWU5DX0tFWV9SRVFVRVNUEAcSHwobTVNHX0ZBTk9VVF9CQUNLRklMTF9SRVFVRVNUEAgSLgoqSU5JVElBTF9TRUNVUklUWV9OT1RJRklDQVRJT05fU0VUVElOR19TWU5DEAkSKgomQVBQX1NUQVRFX0ZBVEFMX0VYQ0VQVElPTl9OT1RJRklDQVRJT04QChIWChJTSEFSRV9QSE9ORV9OVU1CRVIQCxIQCgxNRVNTQUdFX0VESVQQDhInCiNQRUVSX0RBVEFfT1BFUkFUSU9OX1JFUVVFU1RfTUVTU0FHRRAQEjAKLFBFRVJfREFUQV9PUEVSQVRJT05fUkVRVUVTVF9SRVNQT05TRV9NRVNTQUdFEBESGwoXUkVRVUVTVF9XRUxDT01FX01FU1NBR0UQEhIYChRCT1RfRkVFREJBQ0tfTUVTU0FHRRATEhgKFE1FRElBX05PVElGWV9NRVNTQUdFEBQSKQolQ0xPVURfQVBJX1RIUkVBRF9DT05UUk9MX05PVElGSUNBVElPThAVEh4KGkxJRF9NSUdSQVRJT05fTUFQUElOR19TWU5DEBYSFAoQUkVNSU5ERVJfTUVTU0FHRRAXEh8KG0JPVF9NRU1VX09OQk9BUkRJTkdfTUVTU0FHRRAYEhoKFlNUQVRVU19NRU5USU9OX01FU1NBR0UQGRIbChdTVE9QX0dFTkVSQVRJT05fTUVTU0FHRRAaEhEKDUxJTUlUX1NIQVJJTkcQGxITCg9BSV9QU0lfTUVUQURBVEEQHBITCg9BSV9RVUVSWV9GQU5PVVQQHRIdChlHUk9VUF9NRU1CRVJfTEFCRUxfQ0hBTkdFEB5CBgoEX2tleUIHCgVfdHlwZUIWChRfZXBoZW1lcmFsRXhwaXJhdGlvbkIcChpfZXBoZW1lcmFsU2V0dGluZ1RpbWVzdGFtcEIaChhfaGlzdG9yeVN5bmNOb3RpZmljYXRpb25CFwoVX2FwcFN0YXRlU3luY0tleVNoYXJlQhkKF19hcHBTdGF0ZVN5bmNLZXlSZXF1ZXN0QikKJ19pbml0aWFsU2VjdXJpdHlOb3RpZmljYXRpb25TZXR0aW5nU3luY0IlCiNfYXBwU3RhdGVGYXRhbEV4Y2VwdGlvbk5vdGlmaWNhdGlvbkITChFfZGlzYXBwZWFyaW5nTW9kZUIQCg5fZWRpdGVkTWVzc2FnZUIOCgxfdGltZXN0YW1wTXNCIgogX3BlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdE1lc3NhZ2VCKgooX3BlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFJlc3BvbnNlTWVzc2FnZUIVChNfYm90RmVlZGJhY2tNZXNzYWdlQg0KC19pbnZva2VySmlkQiAKHl9yZXF1ZXN0V2VsY29tZU1lc3NhZ2VNZXRhZGF0YUIVChNfbWVkaWFOb3RpZnlNZXNzYWdlQiQKIl9jbG91ZEFwaVRocmVhZENvbnRyb2xOb3RpZmljYXRpb25CIQofX2xpZE1pZ3JhdGlvbk1hcHBpbmdTeW5jTWVzc2FnZUIPCg1fbGltaXRTaGFyaW5nQhAKDl9haVBzaU1ldGFkYXRhQhAKDl9haVF1ZXJ5RmFub3V0Qg4KDF9tZW1iZXJMYWJlbBptChdRdWVzdGlvblJlc3BvbnNlTWVzc2FnZRIoCgNrZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5SABSA2tleYgBARIXCgR0ZXh0GAIgASgJSAFSBHRleHSIAQFCBgoEX2tleUIHCgVfdGV4dBrlAQoPUmVhY3Rpb25NZXNzYWdlEigKA2tleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIDa2V5iAEBEhcKBHRleHQYAiABKAlIAVIEdGV4dIgBARIlCgtncm91cGluZ0tleRgDIAEoCUgCUgtncm91cGluZ0tleYgBARIxChFzZW5kZXJUaW1lc3RhbXBNcxgEIAEoA0gDUhFzZW5kZXJUaW1lc3RhbXBNc4gBAUIGCgRfa2V5QgcKBV90ZXh0Qg4KDF9ncm91cGluZ0tleUIUChJfc2VuZGVyVGltZXN0YW1wTXMa3wMKFVJlcXVlc3RQYXltZW50TWVzc2FnZRI1Cgtub3RlTWVzc2FnZRgEIAEoCzIOLnByb3RvLk1lc3NhZ2VIAFILbm90ZU1lc3NhZ2WIAQESNQoTY3VycmVuY3lDb2RlSXNvNDIxNxgBIAEoCUgBUhNjdXJyZW5jeUNvZGVJc280MjE3iAEBEiMKCmFtb3VudDEwMDAYAiABKARIAlIKYW1vdW50MTAwMIgBARIlCgtyZXF1ZXN0RnJvbRgDIAEoCUgDUgtyZXF1ZXN0RnJvbYgBARItCg9leHBpcnlUaW1lc3RhbXAYBSABKANIBFIPZXhwaXJ5VGltZXN0YW1wiAEBEikKBmFtb3VudBgGIAEoCzIMLnByb3RvLk1vbmV5SAVSBmFtb3VudIgBARI9CgpiYWNrZ3JvdW5kGAcgASgLMhgucHJvdG8uUGF5bWVudEJhY2tncm91bmRIBlIKYmFja2dyb3VuZIgBAUIOCgxfbm90ZU1lc3NhZ2VCFgoUX2N1cnJlbmN5Q29kZUlzbzQyMTdCDQoLX2Ftb3VudDEwMDBCDgoMX3JlcXVlc3RGcm9tQhIKEF9leHBpcnlUaW1lc3RhbXBCCQoHX2Ftb3VudEINCgtfYmFja2dyb3VuZBpmChlSZXF1ZXN0UGhvbmVOdW1iZXJNZXNzYWdlEjkKC2NvbnRleHRJbmZvGAEgASgLMhIucHJvdG8uQ29udGV4dEluZm9IAFILY29udGV4dEluZm+IAQFCDgoMX2NvbnRleHRJbmZvGsgBCh1SZXF1ZXN0V2VsY29tZU1lc3NhZ2VNZXRhZGF0YRJoCg5sb2NhbENoYXRTdGF0ZRgBIAEoDjI7LnByb3RvLk1lc3NhZ2UuUmVxdWVzdFdlbGNvbWVNZXNzYWdlTWV0YWRhdGEuTG9jYWxDaGF0U3RhdGVIAFIObG9jYWxDaGF0U3RhdGWIAQEiKgoOTG9jYWxDaGF0U3RhdGUSCQoFRU1QVFkQABINCglOT05fRU1QVFkQAUIRCg9fbG9jYWxDaGF0U3RhdGUaqAIKHFNjaGVkdWxlZENhbGxDcmVhdGlvbk1lc3NhZ2USNwoUc2NoZWR1bGVkVGltZXN0YW1wTXMYASABKANIAFIUc2NoZWR1bGVkVGltZXN0YW1wTXOIAQESVQoIY2FsbFR5cGUYAiABKA4yNC5wcm90by5NZXNzYWdlLlNjaGVkdWxlZENhbGxDcmVhdGlvbk1lc3NhZ2UuQ2FsbFR5cGVIAVIIY2FsbFR5cGWIAQESGQoFdGl0bGUYAyABKAlIAlIFdGl0bGWIAQEiLQoIQ2FsbFR5cGUSCwoHVU5LTk9XThAAEgkKBVZPSUNFEAESCQoFVklERU8QAkIXChVfc2NoZWR1bGVkVGltZXN0YW1wTXNCCwoJX2NhbGxUeXBlQggKBl90aXRsZRrRAQoYU2NoZWR1bGVkQ2FsbEVkaXRNZXNzYWdlEigKA2tleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIDa2V5iAEBElEKCGVkaXRUeXBlGAIgASgOMjAucHJvdG8uTWVzc2FnZS5TY2hlZHVsZWRDYWxsRWRpdE1lc3NhZ2UuRWRpdFR5cGVIAVIIZWRpdFR5cGWIAQEiIwoIRWRpdFR5cGUSCwoHVU5LTk9XThAAEgoKBkNBTkNFTBABQgYKBF9rZXlCCwoJX2VkaXRUeXBlGvwCChZTZWNyZXRFbmNyeXB0ZWRNZXNzYWdlEkIKEHRhcmdldE1lc3NhZ2VLZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5SABSEHRhcmdldE1lc3NhZ2VLZXmIAQESIwoKZW5jUGF5bG9hZBgCIAEoDEgBUgplbmNQYXlsb2FkiAEBEhkKBWVuY0l2GAMgASgMSAJSBWVuY0l2iAEBEl4KDXNlY3JldEVuY1R5cGUYBCABKA4yMy5wcm90by5NZXNzYWdlLlNlY3JldEVuY3J5cHRlZE1lc3NhZ2UuU2VjcmV0RW5jVHlwZUgDUg1zZWNyZXRFbmNUeXBliAEBIj4KDVNlY3JldEVuY1R5cGUSCwoHVU5LTk9XThAAEg4KCkVWRU5UX0VESVQQARIQCgxNRVNTQUdFX0VESVQQAkITChFfdGFyZ2V0TWVzc2FnZUtleUINCgtfZW5jUGF5bG9hZEIICgZfZW5jSXZCEAoOX3NlY3JldEVuY1R5cGUayAIKElNlbmRQYXltZW50TWVzc2FnZRI1Cgtub3RlTWVzc2FnZRgCIAEoCzIOLnByb3RvLk1lc3NhZ2VIAFILbm90ZU1lc3NhZ2WIAQESRAoRcmVxdWVzdE1lc3NhZ2VLZXkYAyABKAsyES5wcm90by5NZXNzYWdlS2V5SAFSEXJlcXVlc3RNZXNzYWdlS2V5iAEBEj0KCmJhY2tncm91bmQYBCABKAsyGC5wcm90by5QYXltZW50QmFja2dyb3VuZEgCUgpiYWNrZ3JvdW5kiAEBEi0KD3RyYW5zYWN0aW9uRGF0YRgFIAEoCUgDUg90cmFuc2FjdGlvbkRhdGGIAQFCDgoMX25vdGVNZXNzYWdlQhQKEl9yZXF1ZXN0TWVzc2FnZUtleUINCgtfYmFja2dyb3VuZEISChBfdHJhbnNhY3Rpb25EYXRhGsgBChxTZW5kZXJLZXlEaXN0cmlidXRpb25NZXNzYWdlEh0KB2dyb3VwSWQYASABKAlIAFIHZ3JvdXBJZIgBARJVCiNheG9sb3RsU2VuZGVyS2V5RGlzdHJpYnV0aW9uTWVzc2FnZRgCIAEoDEgBUiNheG9sb3RsU2VuZGVyS2V5RGlzdHJpYnV0aW9uTWVzc2FnZYgBAUIKCghfZ3JvdXBJZEImCiRfYXhvbG90bFNlbmRlcktleURpc3RyaWJ1dGlvbk1lc3NhZ2UasQMKGVN0YXR1c05vdGlmaWNhdGlvbk1lc3NhZ2USRgoScmVzcG9uc2VNZXNzYWdlS2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUhJyZXNwb25zZU1lc3NhZ2VLZXmIAQESRgoSb3JpZ2luYWxNZXNzYWdlS2V5GAIgASgLMhEucHJvdG8uTWVzc2FnZUtleUgBUhJvcmlnaW5hbE1lc3NhZ2VLZXmIAQESWAoEdHlwZRgDIAEoDjI/LnByb3RvLk1lc3NhZ2UuU3RhdHVzTm90aWZpY2F0aW9uTWVzc2FnZS5TdGF0dXNOb3RpZmljYXRpb25UeXBlSAJSBHR5cGWIAQEicwoWU3RhdHVzTm90aWZpY2F0aW9uVHlwZRILCgdVTktOT1dOEAASFAoQU1RBVFVTX0FERF9ZT1VSUxABEhIKDlNUQVRVU19SRVNIQVJFEAISIgoeU1RBVFVTX1FVRVNUSU9OX0FOU1dFUl9SRVNIQVJFEANCFQoTX3Jlc3BvbnNlTWVzc2FnZUtleUIVChNfb3JpZ2luYWxNZXNzYWdlS2V5QgcKBV90eXBlGnEKG1N0YXR1c1F1ZXN0aW9uQW5zd2VyTWVzc2FnZRIoCgNrZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5SABSA2tleYgBARIXCgR0ZXh0GAIgASgJSAFSBHRleHSIAQFCBgoEX2tleUIHCgVfdGV4dBr5AgoTU3RhdHVzUXVvdGVkTWVzc2FnZRJTCgR0eXBlGAEgASgOMjoucHJvdG8uTWVzc2FnZS5TdGF0dXNRdW90ZWRNZXNzYWdlLlN0YXR1c1F1b3RlZE1lc3NhZ2VUeXBlSABSBHR5cGWIAQESFwoEdGV4dBgCIAEoCUgBUgR0ZXh0iAEBEiEKCXRodW1ibmFpbBgDIAEoDEgCUgl0aHVtYm5haWyIAQESQgoQb3JpZ2luYWxTdGF0dXNJZBgEIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIA1IQb3JpZ2luYWxTdGF0dXNJZIgBASJYChdTdGF0dXNRdW90ZWRNZXNzYWdlVHlwZRIoCiRVTktOT1dOX1NUQVRVU1FVT1RFRE1FU1NBR0VUWVBFX1pFUk8QABITCg9RVUVTVElPTl9BTlNXRVIQAUIHCgVfdHlwZUIHCgVfdGV4dEIMCgpfdGh1bWJuYWlsQhMKEV9vcmlnaW5hbFN0YXR1c0lkGpsCCh9TdGF0dXNTdGlja2VySW50ZXJhY3Rpb25NZXNzYWdlEigKA2tleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIDa2V5iAEBEiMKCnN0aWNrZXJLZXkYAiABKAlIAVIKc3RpY2tlcktleYgBARJZCgR0eXBlGAMgASgOMkAucHJvdG8uTWVzc2FnZS5TdGF0dXNTdGlja2VySW50ZXJhY3Rpb25NZXNzYWdlLlN0YXR1c1N0aWNrZXJUeXBlSAJSBHR5cGWIAQEiLgoRU3RhdHVzU3RpY2tlclR5cGUSCwoHVU5LTk9XThAAEgwKCFJFQUNUSU9OEAFCBgoEX2tleUINCgtfc3RpY2tlcktleUIHCgVfdHlwZRq9CQoOU3RpY2tlck1lc3NhZ2USFQoDdXJsGAEgASgJSABSA3VybIgBARIjCgpmaWxlU2hhMjU2GAIgASgMSAFSCmZpbGVTaGEyNTaIAQESKQoNZmlsZUVuY1NoYTI1NhgDIAEoDEgCUg1maWxlRW5jU2hhMjU2iAEBEh8KCG1lZGlhS2V5GAQgASgMSANSCG1lZGlhS2V5iAEBEh8KCG1pbWV0eXBlGAUgASgJSARSCG1pbWV0eXBliAEBEhsKBmhlaWdodBgGIAEoDUgFUgZoZWlnaHSIAQESGQoFd2lkdGgYByABKA1IBlIFd2lkdGiIAQESIwoKZGlyZWN0UGF0aBgIIAEoCUgHUgpkaXJlY3RQYXRoiAEBEiMKCmZpbGVMZW5ndGgYCSABKARICFIKZmlsZUxlbmd0aIgBARIxChFtZWRpYUtleVRpbWVzdGFtcBgKIAEoA0gJUhFtZWRpYUtleVRpbWVzdGFtcIgBARIvChBmaXJzdEZyYW1lTGVuZ3RoGAsgASgNSApSEGZpcnN0RnJhbWVMZW5ndGiIAQESMQoRZmlyc3RGcmFtZVNpZGVjYXIYDCABKAxIC1IRZmlyc3RGcmFtZVNpZGVjYXKIAQESIwoKaXNBbmltYXRlZBgNIAEoCEgMUgppc0FuaW1hdGVkiAEBEicKDHBuZ1RodW1ibmFpbBgQIAEoDEgNUgxwbmdUaHVtYm5haWyIAQESOQoLY29udGV4dEluZm8YESABKAsyEi5wcm90by5Db250ZXh0SW5mb0gOUgtjb250ZXh0SW5mb4gBARIpCg1zdGlja2VyU2VudFRzGBIgASgDSA9SDXN0aWNrZXJTZW50VHOIAQESHwoIaXNBdmF0YXIYEyABKAhIEFIIaXNBdmF0YXKIAQESJQoLaXNBaVN0aWNrZXIYFCABKAhIEVILaXNBaVN0aWNrZXKIAQESHwoIaXNMb3R0aWUYFSABKAhIElIIaXNMb3R0aWWIAQESMwoSYWNjZXNzaWJpbGl0eUxhYmVsGBYgASgJSBNSEmFjY2Vzc2liaWxpdHlMYWJlbIgBARJKCg5tZWRpYUtleURvbWFpbhgXIAEoDjIdLnByb3RvLk1lc3NhZ2UuTWVkaWFLZXlEb21haW5IFFIObWVkaWFLZXlEb21haW6IAQFCBgoEX3VybEINCgtfZmlsZVNoYTI1NkIQCg5fZmlsZUVuY1NoYTI1NkILCglfbWVkaWFLZXlCCwoJX21pbWV0eXBlQgkKB19oZWlnaHRCCAoGX3dpZHRoQg0KC19kaXJlY3RQYXRoQg0KC19maWxlTGVuZ3RoQhQKEl9tZWRpYUtleVRpbWVzdGFtcEITChFfZmlyc3RGcmFtZUxlbmd0aEIUChJfZmlyc3RGcmFtZVNpZGVjYXJCDQoLX2lzQW5pbWF0ZWRCDwoNX3BuZ1RodW1ibmFpbEIOCgxfY29udGV4dEluZm9CEAoOX3N0aWNrZXJTZW50VHNCCwoJX2lzQXZhdGFyQg4KDF9pc0FpU3RpY2tlckILCglfaXNMb3R0aWVCFQoTX2FjY2Vzc2liaWxpdHlMYWJlbEIRCg9fbWVkaWFLZXlEb21haW4akA4KElN0aWNrZXJQYWNrTWVzc2FnZRIpCg1zdGlja2VyUGFja0lkGAEgASgJSABSDXN0aWNrZXJQYWNrSWSIAQESFwoEbmFtZRgCIAEoCUgBUgRuYW1liAEBEiEKCXB1Ymxpc2hlchgDIAEoCUgCUglwdWJsaXNoZXKIAQESRQoIc3RpY2tlcnMYBCADKAsyKS5wcm90by5NZXNzYWdlLlN0aWNrZXJQYWNrTWVzc2FnZS5TdGlja2VyUghzdGlja2VycxIjCgpmaWxlTGVuZ3RoGAUgASgESANSCmZpbGVMZW5ndGiIAQESIwoKZmlsZVNoYTI1NhgGIAEoDEgEUgpmaWxlU2hhMjU2iAEBEikKDWZpbGVFbmNTaGEyNTYYByABKAxIBVINZmlsZUVuY1NoYTI1NogBARIfCghtZWRpYUtleRgIIAEoDEgGUghtZWRpYUtleYgBARIjCgpkaXJlY3RQYXRoGAkgASgJSAdSCmRpcmVjdFBhdGiIAQESHQoHY2FwdGlvbhgKIAEoCUgIUgdjYXB0aW9uiAEBEjkKC2NvbnRleHRJbmZvGAsgASgLMhIucHJvdG8uQ29udGV4dEluZm9ICVILY29udGV4dEluZm+IAQESLQoPcGFja0Rlc2NyaXB0aW9uGAwgASgJSApSD3BhY2tEZXNjcmlwdGlvbogBARIxChFtZWRpYUtleVRpbWVzdGFtcBgNIAEoA0gLUhFtZWRpYUtleVRpbWVzdGFtcIgBARIvChB0cmF5SWNvbkZpbGVOYW1lGA4gASgJSAxSEHRyYXlJY29uRmlsZU5hbWWIAQESNQoTdGh1bWJuYWlsRGlyZWN0UGF0aBgPIAEoCUgNUhN0aHVtYm5haWxEaXJlY3RQYXRoiAEBEi0KD3RodW1ibmFpbFNoYTI1NhgQIAEoDEgOUg90aHVtYm5haWxTaGEyNTaIAQESMwoSdGh1bWJuYWlsRW5jU2hhMjU2GBEgASgMSA9SEnRodW1ibmFpbEVuY1NoYTI1NogBARItCg90aHVtYm5haWxIZWlnaHQYEiABKA1IEFIPdGh1bWJuYWlsSGVpZ2h0iAEBEisKDnRodW1ibmFpbFdpZHRoGBMgASgNSBFSDnRodW1ibmFpbFdpZHRoiAEBEikKDWltYWdlRGF0YUhhc2gYFCABKAlIElINaW1hZ2VEYXRhSGFzaIgBARItCg9zdGlja2VyUGFja1NpemUYFSABKARIE1IPc3RpY2tlclBhY2tTaXpliAEBEmYKEXN0aWNrZXJQYWNrT3JpZ2luGBYgASgOMjMucHJvdG8uTWVzc2FnZS5TdGlja2VyUGFja01lc3NhZ2UuU3RpY2tlclBhY2tPcmlnaW5IFFIRc3RpY2tlclBhY2tPcmlnaW6IAQEaqwIKB1N0aWNrZXISHwoIZmlsZU5hbWUYASABKAlIAFIIZmlsZU5hbWWIAQESIwoKaXNBbmltYXRlZBgCIAEoCEgBUgppc0FuaW1hdGVkiAEBEhYKBmVtb2ppcxgDIAMoCVIGZW1vamlzEjMKEmFjY2Vzc2liaWxpdHlMYWJlbBgEIAEoCUgCUhJhY2Nlc3NpYmlsaXR5TGFiZWyIAQESHwoIaXNMb3R0aWUYBSABKAhIA1IIaXNMb3R0aWWIAQESHwoIbWltZXR5cGUYBiABKAlIBFIIbWltZXR5cGWIAQFCCwoJX2ZpbGVOYW1lQg0KC19pc0FuaW1hdGVkQhUKE19hY2Nlc3NpYmlsaXR5TGFiZWxCCwoJX2lzTG90dGllQgsKCV9taW1ldHlwZSJHChFTdGlja2VyUGFja09yaWdpbhIPCgtGSVJTVF9QQVJUWRAAEg8KC1RISVJEX1BBUlRZEAESEAoMVVNFUl9DUkVBVEVEEAJCEAoOX3N0aWNrZXJQYWNrSWRCBwoFX25hbWVCDAoKX3B1Ymxpc2hlckINCgtfZmlsZUxlbmd0aEINCgtfZmlsZVNoYTI1NkIQCg5fZmlsZUVuY1NoYTI1NkILCglfbWVkaWFLZXlCDQoLX2RpcmVjdFBhdGhCCgoIX2NhcHRpb25CDgoMX2NvbnRleHRJbmZvQhIKEF9wYWNrRGVzY3JpcHRpb25CFAoSX21lZGlhS2V5VGltZXN0YW1wQhMKEV90cmF5SWNvbkZpbGVOYW1lQhYKFF90aHVtYm5haWxEaXJlY3RQYXRoQhIKEF90aHVtYm5haWxTaGEyNTZCFQoTX3RodW1ibmFpbEVuY1NoYTI1NkISChBfdGh1bWJuYWlsSGVpZ2h0QhEKD190aHVtYm5haWxXaWR0aEIQCg5faW1hZ2VEYXRhSGFzaEISChBfc3RpY2tlclBhY2tTaXplQhQKEl9zdGlja2VyUGFja09yaWdpbhqqAQoVU3RpY2tlclN5bmNSTVJNZXNzYWdlEhoKCGZpbGVoYXNoGAEgAygJUghmaWxlaGFzaBIhCglybXJTb3VyY2UYAiABKAlIAFIJcm1yU291cmNliAEBEi8KEHJlcXVlc3RUaW1lc3RhbXAYAyABKANIAVIQcmVxdWVzdFRpbWVzdGFtcIgBAUIMCgpfcm1yU291cmNlQhMKEV9yZXF1ZXN0VGltZXN0YW1wGogDChpUZW1wbGF0ZUJ1dHRvblJlcGx5TWVzc2FnZRIjCgpzZWxlY3RlZElkGAEgASgJSABSCnNlbGVjdGVkSWSIAQESNQoTc2VsZWN0ZWREaXNwbGF5VGV4dBgCIAEoCUgBUhNzZWxlY3RlZERpc3BsYXlUZXh0iAEBEjkKC2NvbnRleHRJbmZvGAMgASgLMhIucHJvdG8uQ29udGV4dEluZm9IAlILY29udGV4dEluZm+IAQESKQoNc2VsZWN0ZWRJbmRleBgEIAEoDUgDUg1zZWxlY3RlZEluZGV4iAEBEkEKGXNlbGVjdGVkQ2Fyb3VzZWxDYXJkSW5kZXgYBSABKA1IBFIZc2VsZWN0ZWRDYXJvdXNlbENhcmRJbmRleIgBAUINCgtfc2VsZWN0ZWRJZEIWChRfc2VsZWN0ZWREaXNwbGF5VGV4dEIOCgxfY29udGV4dEluZm9CEAoOX3NlbGVjdGVkSW5kZXhCHAoaX3NlbGVjdGVkQ2Fyb3VzZWxDYXJkSW5kZXgalA8KD1RlbXBsYXRlTWVzc2FnZRI5Cgtjb250ZXh0SW5mbxgDIAEoCzISLnByb3RvLkNvbnRleHRJbmZvSAFSC2NvbnRleHRJbmZviAEBEmcKEGh5ZHJhdGVkVGVtcGxhdGUYBCABKAsyNi5wcm90by5NZXNzYWdlLlRlbXBsYXRlTWVzc2FnZS5IeWRyYXRlZEZvdXJSb3dUZW1wbGF0ZUgCUhBoeWRyYXRlZFRlbXBsYXRliAEBEiMKCnRlbXBsYXRlSWQYCSABKAlIA1IKdGVtcGxhdGVJZIgBARJaCg9mb3VyUm93VGVtcGxhdGUYASABKAsyLi5wcm90by5NZXNzYWdlLlRlbXBsYXRlTWVzc2FnZS5Gb3VyUm93VGVtcGxhdGVIAFIPZm91clJvd1RlbXBsYXRlEnIKF2h5ZHJhdGVkRm91clJvd1RlbXBsYXRlGAIgASgLMjYucHJvdG8uTWVzc2FnZS5UZW1wbGF0ZU1lc3NhZ2UuSHlkcmF0ZWRGb3VyUm93VGVtcGxhdGVIAFIXaHlkcmF0ZWRGb3VyUm93VGVtcGxhdGUSYwoaaW50ZXJhY3RpdmVNZXNzYWdlVGVtcGxhdGUYBSABKAsyIS5wcm90by5NZXNzYWdlLkludGVyYWN0aXZlTWVzc2FnZUgAUhppbnRlcmFjdGl2ZU1lc3NhZ2VUZW1wbGF0ZRrwBAoPRm91clJvd1RlbXBsYXRlEkUKB2NvbnRlbnQYBiABKAsyJi5wcm90by5NZXNzYWdlLkhpZ2hseVN0cnVjdHVyZWRNZXNzYWdlSAFSB2NvbnRlbnSIAQESQwoGZm9vdGVyGAcgASgLMiYucHJvdG8uTWVzc2FnZS5IaWdobHlTdHJ1Y3R1cmVkTWVzc2FnZUgCUgZmb290ZXKIAQESLwoHYnV0dG9ucxgIIAMoCzIVLnByb3RvLlRlbXBsYXRlQnV0dG9uUgdidXR0b25zEkoKD2RvY3VtZW50TWVzc2FnZRgBIAEoCzIeLnByb3RvLk1lc3NhZ2UuRG9jdW1lbnRNZXNzYWdlSABSD2RvY3VtZW50TWVzc2FnZRJiChdoaWdobHlTdHJ1Y3R1cmVkTWVzc2FnZRgCIAEoCzImLnByb3RvLk1lc3NhZ2UuSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2VIAFIXaGlnaGx5U3RydWN0dXJlZE1lc3NhZ2USQQoMaW1hZ2VNZXNzYWdlGAMgASgLMhsucHJvdG8uTWVzc2FnZS5JbWFnZU1lc3NhZ2VIAFIMaW1hZ2VNZXNzYWdlEkEKDHZpZGVvTWVzc2FnZRgEIAEoCzIbLnByb3RvLk1lc3NhZ2UuVmlkZW9NZXNzYWdlSABSDHZpZGVvTWVzc2FnZRJKCg9sb2NhdGlvbk1lc3NhZ2UYBSABKAsyHi5wcm90by5NZXNzYWdlLkxvY2F0aW9uTWVzc2FnZUgAUg9sb2NhdGlvbk1lc3NhZ2VCBwoFdGl0bGVCCgoIX2NvbnRlbnRCCQoHX2Zvb3RlchrRBQoXSHlkcmF0ZWRGb3VyUm93VGVtcGxhdGUSNQoTaHlkcmF0ZWRDb250ZW50VGV4dBgGIAEoCUgBUhNoeWRyYXRlZENvbnRlbnRUZXh0iAEBEjMKEmh5ZHJhdGVkRm9vdGVyVGV4dBgHIAEoCUgCUhJoeWRyYXRlZEZvb3RlclRleHSIAQESRwoPaHlkcmF0ZWRCdXR0b25zGAggAygLMh0ucHJvdG8uSHlkcmF0ZWRUZW1wbGF0ZUJ1dHRvblIPaHlkcmF0ZWRCdXR0b25zEiMKCnRlbXBsYXRlSWQYCSABKAlIA1IKdGVtcGxhdGVJZIgBARIxChFtYXNrTGlua2VkRGV2aWNlcxgKIAEoCEgEUhFtYXNrTGlua2VkRGV2aWNlc4gBARJKCg9kb2N1bWVudE1lc3NhZ2UYASABKAsyHi5wcm90by5NZXNzYWdlLkRvY3VtZW50TWVzc2FnZUgAUg9kb2N1bWVudE1lc3NhZ2USLgoRaHlkcmF0ZWRUaXRsZVRleHQYAiABKAlIAFIRaHlkcmF0ZWRUaXRsZVRleHQSQQoMaW1hZ2VNZXNzYWdlGAMgASgLMhsucHJvdG8uTWVzc2FnZS5JbWFnZU1lc3NhZ2VIAFIMaW1hZ2VNZXNzYWdlEkEKDHZpZGVvTWVzc2FnZRgEIAEoCzIbLnByb3RvLk1lc3NhZ2UuVmlkZW9NZXNzYWdlSABSDHZpZGVvTWVzc2FnZRJKCg9sb2NhdGlvbk1lc3NhZ2UYBSABKAsyHi5wcm90by5NZXNzYWdlLkxvY2F0aW9uTWVzc2FnZUgAUg9sb2NhdGlvbk1lc3NhZ2VCBwoFdGl0bGVCFgoUX2h5ZHJhdGVkQ29udGVudFRleHRCFQoTX2h5ZHJhdGVkRm9vdGVyVGV4dEINCgtfdGVtcGxhdGVJZEIUChJfbWFza0xpbmtlZERldmljZXNCCAoGZm9ybWF0Qg4KDF9jb250ZXh0SW5mb0ITChFfaHlkcmF0ZWRUZW1wbGF0ZUINCgtfdGVtcGxhdGVJZBpNCgtVUkxNZXRhZGF0YRIrCg5mYkV4cGVyaW1lbnRJZBgBIAEoDUgAUg5mYkV4cGVyaW1lbnRJZIgBAUIRCg9fZmJFeHBlcmltZW50SWQaoAEKDFZpZGVvRW5kQ2FyZBIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSGAoHY2FwdGlvbhgCIAEoCVIHY2FwdGlvbhIsChF0aHVtYm5haWxJbWFnZVVybBgDIAEoCVIRdGh1bWJuYWlsSW1hZ2VVcmwSLAoRcHJvZmlsZVBpY3R1cmVVcmwYBCABKAlSEXByb2ZpbGVQaWN0dXJlVXJsGo8RCgxWaWRlb01lc3NhZ2USFQoDdXJsGAEgASgJSABSA3VybIgBARIfCghtaW1ldHlwZRgCIAEoCUgBUghtaW1ldHlwZYgBARIjCgpmaWxlU2hhMjU2GAMgASgMSAJSCmZpbGVTaGEyNTaIAQESIwoKZmlsZUxlbmd0aBgEIAEoBEgDUgpmaWxlTGVuZ3RoiAEBEh0KB3NlY29uZHMYBSABKA1IBFIHc2Vjb25kc4gBARIfCghtZWRpYUtleRgGIAEoDEgFUghtZWRpYUtleYgBARIdCgdjYXB0aW9uGAcgASgJSAZSB2NhcHRpb26IAQESJQoLZ2lmUGxheWJhY2sYCCABKAhIB1ILZ2lmUGxheWJhY2uIAQESGwoGaGVpZ2h0GAkgASgNSAhSBmhlaWdodIgBARIZCgV3aWR0aBgKIAEoDUgJUgV3aWR0aIgBARIpCg1maWxlRW5jU2hhMjU2GAsgASgMSApSDWZpbGVFbmNTaGEyNTaIAQESVAoWaW50ZXJhY3RpdmVBbm5vdGF0aW9ucxgMIAMoCzIcLnByb3RvLkludGVyYWN0aXZlQW5ub3RhdGlvblIWaW50ZXJhY3RpdmVBbm5vdGF0aW9ucxIjCgpkaXJlY3RQYXRoGA0gASgJSAtSCmRpcmVjdFBhdGiIAQESMQoRbWVkaWFLZXlUaW1lc3RhbXAYDiABKANIDFIRbWVkaWFLZXlUaW1lc3RhbXCIAQESKQoNanBlZ1RodW1ibmFpbBgQIAEoDEgNUg1qcGVnVGh1bWJuYWlsiAEBEjkKC2NvbnRleHRJbmZvGBEgASgLMhIucHJvdG8uQ29udGV4dEluZm9IDlILY29udGV4dEluZm+IAQESLwoQc3RyZWFtaW5nU2lkZWNhchgSIAEoDEgPUhBzdHJlYW1pbmdTaWRlY2FyiAEBElQKDmdpZkF0dHJpYnV0aW9uGBMgASgOMicucHJvdG8uTWVzc2FnZS5WaWRlb01lc3NhZ2UuQXR0cmlidXRpb25IEFIOZ2lmQXR0cmlidXRpb26IAQESHwoIdmlld09uY2UYFCABKAhIEVIIdmlld09uY2WIAQESNQoTdGh1bWJuYWlsRGlyZWN0UGF0aBgVIAEoCUgSUhN0aHVtYm5haWxEaXJlY3RQYXRoiAEBEi0KD3RodW1ibmFpbFNoYTI1NhgWIAEoDEgTUg90aHVtYm5haWxTaGEyNTaIAQESMwoSdGh1bWJuYWlsRW5jU2hhMjU2GBcgASgMSBRSEnRodW1ibmFpbEVuY1NoYTI1NogBARIhCglzdGF0aWNVcmwYGCABKAlIFVIJc3RhdGljVXJsiAEBEj4KC2Fubm90YXRpb25zGBkgAygLMhwucHJvdG8uSW50ZXJhY3RpdmVBbm5vdGF0aW9uUgthbm5vdGF0aW9ucxIzChJhY2Nlc3NpYmlsaXR5TGFiZWwYGiABKAlIFlISYWNjZXNzaWJpbGl0eUxhYmVsiAEBEj8KD3Byb2Nlc3NlZFZpZGVvcxgbIAMoCzIVLnByb3RvLlByb2Nlc3NlZFZpZGVvUg9wcm9jZXNzZWRWaWRlb3MSXQonZXh0ZXJuYWxTaGFyZUZ1bGxWaWRlb0R1cmF0aW9uSW5TZWNvbmRzGBwgASgNSBdSJ2V4dGVybmFsU2hhcmVGdWxsVmlkZW9EdXJhdGlvbkluU2Vjb25kc4gBARJNCh9tb3Rpb25QaG90b1ByZXNlbnRhdGlvbk9mZnNldE1zGB0gASgESBhSH21vdGlvblBob3RvUHJlc2VudGF0aW9uT2Zmc2V0TXOIAQESJQoLbWV0YWRhdGFVcmwYHiABKAlIGVILbWV0YWRhdGFVcmyIAQESWgoPdmlkZW9Tb3VyY2VUeXBlGB8gASgOMisucHJvdG8uTWVzc2FnZS5WaWRlb01lc3NhZ2UuVmlkZW9Tb3VyY2VUeXBlSBpSD3ZpZGVvU291cmNlVHlwZYgBARJKCg5tZWRpYUtleURvbWFpbhggIAEoDjIdLnByb3RvLk1lc3NhZ2UuTWVkaWFLZXlEb21haW5IG1IObWVkaWFLZXlEb21haW6IAQEiOAoLQXR0cmlidXRpb24SCAoETk9ORRAAEgkKBUdJUEhZEAESCQoFVEVOT1IQAhIJCgVLTElQWRADIjMKD1ZpZGVvU291cmNlVHlwZRIOCgpVU0VSX1ZJREVPEAASEAoMQUlfR0VORVJBVEVEEAFCBgoEX3VybEILCglfbWltZXR5cGVCDQoLX2ZpbGVTaGEyNTZCDQoLX2ZpbGVMZW5ndGhCCgoIX3NlY29uZHNCCwoJX21lZGlhS2V5QgoKCF9jYXB0aW9uQg4KDF9naWZQbGF5YmFja0IJCgdfaGVpZ2h0QggKBl93aWR0aEIQCg5fZmlsZUVuY1NoYTI1NkINCgtfZGlyZWN0UGF0aEIUChJfbWVkaWFLZXlUaW1lc3RhbXBCEAoOX2pwZWdUaHVtYm5haWxCDgoMX2NvbnRleHRJbmZvQhMKEV9zdHJlYW1pbmdTaWRlY2FyQhEKD19naWZBdHRyaWJ1dGlvbkILCglfdmlld09uY2VCFgoUX3RodW1ibmFpbERpcmVjdFBhdGhCEgoQX3RodW1ibmFpbFNoYTI1NkIVChNfdGh1bWJuYWlsRW5jU2hhMjU2QgwKCl9zdGF0aWNVcmxCFQoTX2FjY2Vzc2liaWxpdHlMYWJlbEIqCihfZXh0ZXJuYWxTaGFyZUZ1bGxWaWRlb0R1cmF0aW9uSW5TZWNvbmRzQiIKIF9tb3Rpb25QaG90b1ByZXNlbnRhdGlvbk9mZnNldE1zQg4KDF9tZXRhZGF0YVVybEISChBfdmlkZW9Tb3VyY2VUeXBlQhEKD19tZWRpYUtleURvbWFpbiK1AQoPSGlzdG9yeVN5bmNUeXBlEhUKEUlOSVRJQUxfQk9PVFNUUkFQEAASFQoRSU5JVElBTF9TVEFUVVNfVjMQARIICgRGVUxMEAISCgoGUkVDRU5UEAMSDQoJUFVTSF9OQU1FEAQSFQoRTk9OX0JMT0NLSU5HX0RBVEEQBRINCglPTl9ERU1BTkQQBhIOCgpOT19ISVNUT1JZEAcSGQoVTUVTU0FHRV9BQ0NFU1NfU1RBVFVTEAgiSQoOTWVkaWFLZXlEb21haW4SCQoFVU5TRVQQABINCglFMkVFX0NIQVQQARIKCgZTVEFUVVMQAhIICgRDQVBJEAMSBwoDQk9UEAQimgMKHFBlZXJEYXRhT3BlcmF0aW9uUmVxdWVzdFR5cGUSEgoOVVBMT0FEX1NUSUNLRVIQABIhCh1TRU5EX1JFQ0VOVF9TVElDS0VSX0JPT1RTVFJBUBABEhkKFUdFTkVSQVRFX0xJTktfUFJFVklFVxACEhoKFkhJU1RPUllfU1lOQ19PTl9ERU1BTkQQAxIeChpQTEFDRUhPTERFUl9NRVNTQUdFX1JFU0VORBAEEh4KGldBRkZMRV9MSU5LSU5HX05PTkNFX0ZFVENIEAUSHwobRlVMTF9ISVNUT1JZX1NZTkNfT05fREVNQU5EEAYSHgoaQ09NUEFOSU9OX01FVEFfTk9OQ0VfRkVUQ0gQBxIrCidDT01QQU5JT05fU1lOQ0RfU05BUFNIT1RfRkFUQUxfUkVDT1ZFUlkQCBIoCiRDT01QQU5JT05fQ0FOT05JQ0FMX1VTRVJfTk9OQ0VfRkVUQ0gQCRIcChhISVNUT1JZX1NZTkNfQ0hVTktfUkVUUlkQChIWChJHQUxBWFlfRkxPV19BQ1RJT04QCyIzCg9Qb2xsQ29udGVudFR5cGUSCwoHVU5LTk9XThAAEggKBFRFWFQQARIJCgVJTUFHRRACIh4KCFBvbGxUeXBlEggKBFBPTEwQABIICgRRVUlaEAFCDwoNX2NvbnZlcnNhdGlvbkIfCh1fc2VuZGVyS2V5RGlzdHJpYnV0aW9uTWVzc2FnZUIPCg1faW1hZ2VNZXNzYWdlQhEKD19jb250YWN0TWVzc2FnZUISChBfbG9jYXRpb25NZXNzYWdlQhYKFF9leHRlbmRlZFRleHRNZXNzYWdlQhIKEF9kb2N1bWVudE1lc3NhZ2VCDwoNX2F1ZGlvTWVzc2FnZUIPCg1fdmlkZW9NZXNzYWdlQgcKBV9jYWxsQgcKBV9jaGF0QhIKEF9wcm90b2NvbE1lc3NhZ2VCFwoVX2NvbnRhY3RzQXJyYXlNZXNzYWdlQhoKGF9oaWdobHlTdHJ1Y3R1cmVkTWVzc2FnZUItCitfZmFzdFJhdGNoZXRLZXlTZW5kZXJLZXlEaXN0cmlidXRpb25NZXNzYWdlQhUKE19zZW5kUGF5bWVudE1lc3NhZ2VCFgoUX2xpdmVMb2NhdGlvbk1lc3NhZ2VCGAoWX3JlcXVlc3RQYXltZW50TWVzc2FnZUIfCh1fZGVjbGluZVBheW1lbnRSZXF1ZXN0TWVzc2FnZUIeChxfY2FuY2VsUGF5bWVudFJlcXVlc3RNZXNzYWdlQhIKEF90ZW1wbGF0ZU1lc3NhZ2VCEQoPX3N0aWNrZXJNZXNzYWdlQhUKE19ncm91cEludml0ZU1lc3NhZ2VCHQobX3RlbXBsYXRlQnV0dG9uUmVwbHlNZXNzYWdlQhEKD19wcm9kdWN0TWVzc2FnZUIUChJfZGV2aWNlU2VudE1lc3NhZ2VCFQoTX21lc3NhZ2VDb250ZXh0SW5mb0IOCgxfbGlzdE1lc3NhZ2VCEgoQX3ZpZXdPbmNlTWVzc2FnZUIPCg1fb3JkZXJNZXNzYWdlQhYKFF9saXN0UmVzcG9uc2VNZXNzYWdlQhMKEV9lcGhlbWVyYWxNZXNzYWdlQhEKD19pbnZvaWNlTWVzc2FnZUIRCg9fYnV0dG9uc01lc3NhZ2VCGQoXX2J1dHRvbnNSZXNwb25zZU1lc3NhZ2VCFwoVX3BheW1lbnRJbnZpdGVNZXNzYWdlQhUKE19pbnRlcmFjdGl2ZU1lc3NhZ2VCEgoQX3JlYWN0aW9uTWVzc2FnZUIYChZfc3RpY2tlclN5bmNSbXJNZXNzYWdlQh0KG19pbnRlcmFjdGl2ZVJlc3BvbnNlTWVzc2FnZUIWChRfcG9sbENyZWF0aW9uTWVzc2FnZUIUChJfcG9sbFVwZGF0ZU1lc3NhZ2VCFAoSX2tlZXBJbkNoYXRNZXNzYWdlQh0KG19kb2N1bWVudFdpdGhDYXB0aW9uTWVzc2FnZUIcChpfcmVxdWVzdFBob25lTnVtYmVyTWVzc2FnZUIUChJfdmlld09uY2VNZXNzYWdlVjJCFQoTX2VuY1JlYWN0aW9uTWVzc2FnZUIQCg5fZWRpdGVkTWVzc2FnZUIdChtfdmlld09uY2VNZXNzYWdlVjJFeHRlbnNpb25CGAoWX3BvbGxDcmVhdGlvbk1lc3NhZ2VWMkIfCh1fc2NoZWR1bGVkQ2FsbENyZWF0aW9uTWVzc2FnZUIYChZfZ3JvdXBNZW50aW9uZWRNZXNzYWdlQhMKEV9waW5JbkNoYXRNZXNzYWdlQhgKFl9wb2xsQ3JlYXRpb25NZXNzYWdlVjNCGwoZX3NjaGVkdWxlZENhbGxFZGl0TWVzc2FnZUINCgtfcHR2TWVzc2FnZUITChFfYm90SW52b2tlTWVzc2FnZUISChBfY2FsbExvZ01lc3NzYWdlQhcKFV9tZXNzYWdlSGlzdG9yeUJ1bmRsZUIUChJfZW5jQ29tbWVudE1lc3NhZ2VCDwoNX2JjYWxsTWVzc2FnZUIXChVfbG90dGllU3RpY2tlck1lc3NhZ2VCDwoNX2V2ZW50TWVzc2FnZUIaChhfZW5jRXZlbnRSZXNwb25zZU1lc3NhZ2VCEQoPX2NvbW1lbnRNZXNzYWdlQh8KHV9uZXdzbGV0dGVyQWRtaW5JbnZpdGVNZXNzYWdlQhUKE19wbGFjZWhvbGRlck1lc3NhZ2VCGQoXX3NlY3JldEVuY3J5cHRlZE1lc3NhZ2VCDwoNX2FsYnVtTWVzc2FnZUISChBfZXZlbnRDb3ZlckltYWdlQhUKE19zdGlja2VyUGFja01lc3NhZ2VCFwoVX3N0YXR1c01lbnRpb25NZXNzYWdlQhwKGl9wb2xsUmVzdWx0U25hcHNob3RNZXNzYWdlQiEKH19wb2xsQ3JlYXRpb25PcHRpb25JbWFnZU1lc3NhZ2VCGQoXX2Fzc29jaWF0ZWRDaGlsZE1lc3NhZ2VCHAoaX2dyb3VwU3RhdHVzTWVudGlvbk1lc3NhZ2VCGAoWX3BvbGxDcmVhdGlvbk1lc3NhZ2VWNEIRCg9fc3RhdHVzQWRkWW91cnNCFQoTX2dyb3VwU3RhdHVzTWVzc2FnZUIWChRfcmljaFJlc3BvbnNlTWVzc2FnZUIcChpfc3RhdHVzTm90aWZpY2F0aW9uTWVzc2FnZUIWChRfbGltaXRTaGFyaW5nTWVzc2FnZUIRCg9fYm90VGFza01lc3NhZ2VCEgoQX3F1ZXN0aW9uTWVzc2FnZUIXChVfbWVzc2FnZUhpc3RvcnlOb3RpY2VCFwoVX2dyb3VwU3RhdHVzTWVzc2FnZVYyQhYKFF9ib3RGb3J3YXJkZWRNZXNzYWdlQh4KHF9zdGF0dXNRdWVzdGlvbkFuc3dlck1lc3NhZ2VCFwoVX3F1ZXN0aW9uUmVwbHlNZXNzYWdlQhoKGF9xdWVzdGlvblJlc3BvbnNlTWVzc2FnZUIWChRfc3RhdHVzUXVvdGVkTWVzc2FnZUIiCiBfc3RhdHVzU3RpY2tlckludGVyYWN0aW9uTWVzc2FnZUIYChZfcG9sbENyZWF0aW9uTWVzc2FnZVY1QiQKIl9uZXdzbGV0dGVyRm9sbG93ZXJJbnZpdGVNZXNzYWdlVjJCHgocX3BvbGxSZXN1bHRTbmFwc2hvdE1lc3NhZ2VWMw==');
@$core.Deprecated('Use messageAddOnDescriptor instead')
const MessageAddOn$json = const {
  '1': 'MessageAddOn',
  '2': const [
    const {'1': 'messageAddOnType', '3': 1, '4': 1, '5': 14, '6': '.proto.MessageAddOn.MessageAddOnType', '9': 0, '10': 'messageAddOnType', '17': true},
    const {'1': 'messageAddOn', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 1, '10': 'messageAddOn', '17': true},
    const {'1': 'senderTimestampMs', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'senderTimestampMs', '17': true},
    const {'1': 'serverTimestampMs', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'serverTimestampMs', '17': true},
    const {'1': 'status', '3': 5, '4': 1, '5': 14, '6': '.proto.WebMessageInfo.Status', '9': 4, '10': 'status', '17': true},
    const {'1': 'addOnContextInfo', '3': 6, '4': 1, '5': 11, '6': '.proto.MessageAddOnContextInfo', '9': 5, '10': 'addOnContextInfo', '17': true},
    const {'1': 'messageAddOnKey', '3': 7, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 6, '10': 'messageAddOnKey', '17': true},
    const {'1': 'legacyMessage', '3': 8, '4': 1, '5': 11, '6': '.proto.LegacyMessage', '9': 7, '10': 'legacyMessage', '17': true},
  ],
  '4': const [MessageAddOn_MessageAddOnType$json],
  '8': const [
    const {'1': '_messageAddOnType'},
    const {'1': '_messageAddOn'},
    const {'1': '_senderTimestampMs'},
    const {'1': '_serverTimestampMs'},
    const {'1': '_status'},
    const {'1': '_addOnContextInfo'},
    const {'1': '_messageAddOnKey'},
    const {'1': '_legacyMessage'},
  ],
};

@$core.Deprecated('Use messageAddOnDescriptor instead')
const MessageAddOn_MessageAddOnType$json = const {
  '1': 'MessageAddOnType',
  '2': const [
    const {'1': 'UNDEFINED', '2': 0},
    const {'1': 'REACTION', '2': 1},
    const {'1': 'EVENT_RESPONSE', '2': 2},
    const {'1': 'POLL_UPDATE', '2': 3},
    const {'1': 'PIN_IN_CHAT', '2': 4},
  ],
};

/// Descriptor for `MessageAddOn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageAddOnDescriptor = $convert.base64Decode('CgxNZXNzYWdlQWRkT24SVQoQbWVzc2FnZUFkZE9uVHlwZRgBIAEoDjIkLnByb3RvLk1lc3NhZ2VBZGRPbi5NZXNzYWdlQWRkT25UeXBlSABSEG1lc3NhZ2VBZGRPblR5cGWIAQESNwoMbWVzc2FnZUFkZE9uGAIgASgLMg4ucHJvdG8uTWVzc2FnZUgBUgxtZXNzYWdlQWRkT26IAQESMQoRc2VuZGVyVGltZXN0YW1wTXMYAyABKANIAlIRc2VuZGVyVGltZXN0YW1wTXOIAQESMQoRc2VydmVyVGltZXN0YW1wTXMYBCABKANIA1IRc2VydmVyVGltZXN0YW1wTXOIAQESOQoGc3RhdHVzGAUgASgOMhwucHJvdG8uV2ViTWVzc2FnZUluZm8uU3RhdHVzSARSBnN0YXR1c4gBARJPChBhZGRPbkNvbnRleHRJbmZvGAYgASgLMh4ucHJvdG8uTWVzc2FnZUFkZE9uQ29udGV4dEluZm9IBVIQYWRkT25Db250ZXh0SW5mb4gBARJACg9tZXNzYWdlQWRkT25LZXkYByABKAsyES5wcm90by5NZXNzYWdlS2V5SAZSD21lc3NhZ2VBZGRPbktleYgBARI/Cg1sZWdhY3lNZXNzYWdlGAggASgLMhQucHJvdG8uTGVnYWN5TWVzc2FnZUgHUg1sZWdhY3lNZXNzYWdliAEBImUKEE1lc3NhZ2VBZGRPblR5cGUSDQoJVU5ERUZJTkVEEAASDAoIUkVBQ1RJT04QARISCg5FVkVOVF9SRVNQT05TRRACEg8KC1BPTExfVVBEQVRFEAMSDwoLUElOX0lOX0NIQVQQBEITChFfbWVzc2FnZUFkZE9uVHlwZUIPCg1fbWVzc2FnZUFkZE9uQhQKEl9zZW5kZXJUaW1lc3RhbXBNc0IUChJfc2VydmVyVGltZXN0YW1wTXNCCQoHX3N0YXR1c0ITChFfYWRkT25Db250ZXh0SW5mb0ISChBfbWVzc2FnZUFkZE9uS2V5QhAKDl9sZWdhY3lNZXNzYWdl');
@$core.Deprecated('Use messageAddOnContextInfoDescriptor instead')
const MessageAddOnContextInfo$json = const {
  '1': 'MessageAddOnContextInfo',
  '2': const [
    const {'1': 'messageAddOnDurationInSecs', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'messageAddOnDurationInSecs', '17': true},
    const {'1': 'messageAddOnExpiryType', '3': 2, '4': 1, '5': 14, '6': '.proto.MessageContextInfo.MessageAddonExpiryType', '9': 1, '10': 'messageAddOnExpiryType', '17': true},
  ],
  '8': const [
    const {'1': '_messageAddOnDurationInSecs'},
    const {'1': '_messageAddOnExpiryType'},
  ],
};

/// Descriptor for `MessageAddOnContextInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageAddOnContextInfoDescriptor = $convert.base64Decode('ChdNZXNzYWdlQWRkT25Db250ZXh0SW5mbxJDChptZXNzYWdlQWRkT25EdXJhdGlvbkluU2VjcxgBIAEoDUgAUhptZXNzYWdlQWRkT25EdXJhdGlvbkluU2Vjc4gBARJtChZtZXNzYWdlQWRkT25FeHBpcnlUeXBlGAIgASgOMjAucHJvdG8uTWVzc2FnZUNvbnRleHRJbmZvLk1lc3NhZ2VBZGRvbkV4cGlyeVR5cGVIAVIWbWVzc2FnZUFkZE9uRXhwaXJ5VHlwZYgBAUIdChtfbWVzc2FnZUFkZE9uRHVyYXRpb25JblNlY3NCGQoXX21lc3NhZ2VBZGRPbkV4cGlyeVR5cGU=');
@$core.Deprecated('Use messageAssociationDescriptor instead')
const MessageAssociation$json = const {
  '1': 'MessageAssociation',
  '2': const [
    const {'1': 'associationType', '3': 1, '4': 1, '5': 14, '6': '.proto.MessageAssociation.AssociationType', '9': 0, '10': 'associationType', '17': true},
    const {'1': 'parentMessageKey', '3': 2, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 1, '10': 'parentMessageKey', '17': true},
    const {'1': 'messageIndex', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'messageIndex', '17': true},
  ],
  '4': const [MessageAssociation_AssociationType$json],
  '8': const [
    const {'1': '_associationType'},
    const {'1': '_parentMessageKey'},
    const {'1': '_messageIndex'},
  ],
};

@$core.Deprecated('Use messageAssociationDescriptor instead')
const MessageAssociation_AssociationType$json = const {
  '1': 'AssociationType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'MEDIA_ALBUM', '2': 1},
    const {'1': 'BOT_PLUGIN', '2': 2},
    const {'1': 'EVENT_COVER_IMAGE', '2': 3},
    const {'1': 'STATUS_POLL', '2': 4},
    const {'1': 'HD_VIDEO_DUAL_UPLOAD', '2': 5},
    const {'1': 'STATUS_EXTERNAL_RESHARE', '2': 6},
    const {'1': 'MEDIA_POLL', '2': 7},
    const {'1': 'STATUS_ADD_YOURS', '2': 8},
    const {'1': 'STATUS_NOTIFICATION', '2': 9},
    const {'1': 'HD_IMAGE_DUAL_UPLOAD', '2': 10},
    const {'1': 'STICKER_ANNOTATION', '2': 11},
    const {'1': 'MOTION_PHOTO', '2': 12},
    const {'1': 'STATUS_LINK_ACTION', '2': 13},
    const {'1': 'VIEW_ALL_REPLIES', '2': 14},
    const {'1': 'STATUS_ADD_YOURS_AI_IMAGINE', '2': 15},
    const {'1': 'STATUS_QUESTION', '2': 16},
    const {'1': 'STATUS_ADD_YOURS_DIWALI', '2': 17},
    const {'1': 'STATUS_REACTION', '2': 18},
    const {'1': 'HEVC_VIDEO_DUAL_UPLOAD', '2': 19},
  ],
};

/// Descriptor for `MessageAssociation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageAssociationDescriptor = $convert.base64Decode('ChJNZXNzYWdlQXNzb2NpYXRpb24SWAoPYXNzb2NpYXRpb25UeXBlGAEgASgOMikucHJvdG8uTWVzc2FnZUFzc29jaWF0aW9uLkFzc29jaWF0aW9uVHlwZUgAUg9hc3NvY2lhdGlvblR5cGWIAQESQgoQcGFyZW50TWVzc2FnZUtleRgCIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAVIQcGFyZW50TWVzc2FnZUtleYgBARInCgxtZXNzYWdlSW5kZXgYAyABKAVIAlIMbWVzc2FnZUluZGV4iAEBItMDCg9Bc3NvY2lhdGlvblR5cGUSCwoHVU5LTk9XThAAEg8KC01FRElBX0FMQlVNEAESDgoKQk9UX1BMVUdJThACEhUKEUVWRU5UX0NPVkVSX0lNQUdFEAMSDwoLU1RBVFVTX1BPTEwQBBIYChRIRF9WSURFT19EVUFMX1VQTE9BRBAFEhsKF1NUQVRVU19FWFRFUk5BTF9SRVNIQVJFEAYSDgoKTUVESUFfUE9MTBAHEhQKEFNUQVRVU19BRERfWU9VUlMQCBIXChNTVEFUVVNfTk9USUZJQ0FUSU9OEAkSGAoUSERfSU1BR0VfRFVBTF9VUExPQUQQChIWChJTVElDS0VSX0FOTk9UQVRJT04QCxIQCgxNT1RJT05fUEhPVE8QDBIWChJTVEFUVVNfTElOS19BQ1RJT04QDRIUChBWSUVXX0FMTF9SRVBMSUVTEA4SHwobU1RBVFVTX0FERF9ZT1VSU19BSV9JTUFHSU5FEA8SEwoPU1RBVFVTX1FVRVNUSU9OEBASGwoXU1RBVFVTX0FERF9ZT1VSU19ESVdBTEkQERITCg9TVEFUVVNfUkVBQ1RJT04QEhIaChZIRVZDX1ZJREVPX0RVQUxfVVBMT0FEEBNCEgoQX2Fzc29jaWF0aW9uVHlwZUITChFfcGFyZW50TWVzc2FnZUtleUIPCg1fbWVzc2FnZUluZGV4');
@$core.Deprecated('Use messageContextInfoDescriptor instead')
const MessageContextInfo$json = const {
  '1': 'MessageContextInfo',
  '2': const [
    const {'1': 'deviceListMetadata', '3': 1, '4': 1, '5': 11, '6': '.proto.DeviceListMetadata', '9': 0, '10': 'deviceListMetadata', '17': true},
    const {'1': 'deviceListMetadataVersion', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'deviceListMetadataVersion', '17': true},
    const {'1': 'messageSecret', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'messageSecret', '17': true},
    const {'1': 'paddingBytes', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'paddingBytes', '17': true},
    const {'1': 'messageAddOnDurationInSecs', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'messageAddOnDurationInSecs', '17': true},
    const {'1': 'botMessageSecret', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'botMessageSecret', '17': true},
    const {'1': 'botMetadata', '3': 7, '4': 1, '5': 11, '6': '.proto.BotMetadata', '9': 6, '10': 'botMetadata', '17': true},
    const {'1': 'reportingTokenVersion', '3': 8, '4': 1, '5': 5, '9': 7, '10': 'reportingTokenVersion', '17': true},
    const {'1': 'messageAddOnExpiryType', '3': 9, '4': 1, '5': 14, '6': '.proto.MessageContextInfo.MessageAddonExpiryType', '9': 8, '10': 'messageAddOnExpiryType', '17': true},
    const {'1': 'messageAssociation', '3': 10, '4': 1, '5': 11, '6': '.proto.MessageAssociation', '9': 9, '10': 'messageAssociation', '17': true},
    const {'1': 'capiCreatedGroup', '3': 11, '4': 1, '5': 8, '9': 10, '10': 'capiCreatedGroup', '17': true},
    const {'1': 'supportPayload', '3': 12, '4': 1, '5': 9, '9': 11, '10': 'supportPayload', '17': true},
    const {'1': 'limitSharing', '3': 13, '4': 1, '5': 11, '6': '.proto.LimitSharing', '9': 12, '10': 'limitSharing', '17': true},
    const {'1': 'limitSharingV2', '3': 14, '4': 1, '5': 11, '6': '.proto.LimitSharing', '9': 13, '10': 'limitSharingV2', '17': true},
    const {'1': 'threadId', '3': 15, '4': 3, '5': 11, '6': '.proto.ThreadID', '10': 'threadId'},
    const {'1': 'weblinkRenderConfig', '3': 16, '4': 1, '5': 14, '6': '.proto.WebLinkRenderConfig', '9': 14, '10': 'weblinkRenderConfig', '17': true},
  ],
  '4': const [MessageContextInfo_MessageAddonExpiryType$json],
  '8': const [
    const {'1': '_deviceListMetadata'},
    const {'1': '_deviceListMetadataVersion'},
    const {'1': '_messageSecret'},
    const {'1': '_paddingBytes'},
    const {'1': '_messageAddOnDurationInSecs'},
    const {'1': '_botMessageSecret'},
    const {'1': '_botMetadata'},
    const {'1': '_reportingTokenVersion'},
    const {'1': '_messageAddOnExpiryType'},
    const {'1': '_messageAssociation'},
    const {'1': '_capiCreatedGroup'},
    const {'1': '_supportPayload'},
    const {'1': '_limitSharing'},
    const {'1': '_limitSharingV2'},
    const {'1': '_weblinkRenderConfig'},
  ],
};

@$core.Deprecated('Use messageContextInfoDescriptor instead')
const MessageContextInfo_MessageAddonExpiryType$json = const {
  '1': 'MessageAddonExpiryType',
  '2': const [
    const {'1': 'UNKNOWN_MESSAGEADDONEXPIRYTYPE_ZERO', '2': 0},
    const {'1': 'STATIC', '2': 1},
    const {'1': 'DEPENDENT_ON_PARENT', '2': 2},
  ],
};

/// Descriptor for `MessageContextInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageContextInfoDescriptor = $convert.base64Decode('ChJNZXNzYWdlQ29udGV4dEluZm8STgoSZGV2aWNlTGlzdE1ldGFkYXRhGAEgASgLMhkucHJvdG8uRGV2aWNlTGlzdE1ldGFkYXRhSABSEmRldmljZUxpc3RNZXRhZGF0YYgBARJBChlkZXZpY2VMaXN0TWV0YWRhdGFWZXJzaW9uGAIgASgFSAFSGWRldmljZUxpc3RNZXRhZGF0YVZlcnNpb26IAQESKQoNbWVzc2FnZVNlY3JldBgDIAEoDEgCUg1tZXNzYWdlU2VjcmV0iAEBEicKDHBhZGRpbmdCeXRlcxgEIAEoDEgDUgxwYWRkaW5nQnl0ZXOIAQESQwoabWVzc2FnZUFkZE9uRHVyYXRpb25JblNlY3MYBSABKA1IBFIabWVzc2FnZUFkZE9uRHVyYXRpb25JblNlY3OIAQESLwoQYm90TWVzc2FnZVNlY3JldBgGIAEoDEgFUhBib3RNZXNzYWdlU2VjcmV0iAEBEjkKC2JvdE1ldGFkYXRhGAcgASgLMhIucHJvdG8uQm90TWV0YWRhdGFIBlILYm90TWV0YWRhdGGIAQESOQoVcmVwb3J0aW5nVG9rZW5WZXJzaW9uGAggASgFSAdSFXJlcG9ydGluZ1Rva2VuVmVyc2lvbogBARJtChZtZXNzYWdlQWRkT25FeHBpcnlUeXBlGAkgASgOMjAucHJvdG8uTWVzc2FnZUNvbnRleHRJbmZvLk1lc3NhZ2VBZGRvbkV4cGlyeVR5cGVICFIWbWVzc2FnZUFkZE9uRXhwaXJ5VHlwZYgBARJOChJtZXNzYWdlQXNzb2NpYXRpb24YCiABKAsyGS5wcm90by5NZXNzYWdlQXNzb2NpYXRpb25ICVISbWVzc2FnZUFzc29jaWF0aW9uiAEBEi8KEGNhcGlDcmVhdGVkR3JvdXAYCyABKAhIClIQY2FwaUNyZWF0ZWRHcm91cIgBARIrCg5zdXBwb3J0UGF5bG9hZBgMIAEoCUgLUg5zdXBwb3J0UGF5bG9hZIgBARI8CgxsaW1pdFNoYXJpbmcYDSABKAsyEy5wcm90by5MaW1pdFNoYXJpbmdIDFIMbGltaXRTaGFyaW5niAEBEkAKDmxpbWl0U2hhcmluZ1YyGA4gASgLMhMucHJvdG8uTGltaXRTaGFyaW5nSA1SDmxpbWl0U2hhcmluZ1YyiAEBEisKCHRocmVhZElkGA8gAygLMg8ucHJvdG8uVGhyZWFkSURSCHRocmVhZElkElEKE3dlYmxpbmtSZW5kZXJDb25maWcYECABKA4yGi5wcm90by5XZWJMaW5rUmVuZGVyQ29uZmlnSA5SE3dlYmxpbmtSZW5kZXJDb25maWeIAQEiZgoWTWVzc2FnZUFkZG9uRXhwaXJ5VHlwZRInCiNVTktOT1dOX01FU1NBR0VBRERPTkVYUElSWVRZUEVfWkVSTxAAEgoKBlNUQVRJQxABEhcKE0RFUEVOREVOVF9PTl9QQVJFTlQQAkIVChNfZGV2aWNlTGlzdE1ldGFkYXRhQhwKGl9kZXZpY2VMaXN0TWV0YWRhdGFWZXJzaW9uQhAKDl9tZXNzYWdlU2VjcmV0Qg8KDV9wYWRkaW5nQnl0ZXNCHQobX21lc3NhZ2VBZGRPbkR1cmF0aW9uSW5TZWNzQhMKEV9ib3RNZXNzYWdlU2VjcmV0Qg4KDF9ib3RNZXRhZGF0YUIYChZfcmVwb3J0aW5nVG9rZW5WZXJzaW9uQhkKF19tZXNzYWdlQWRkT25FeHBpcnlUeXBlQhUKE19tZXNzYWdlQXNzb2NpYXRpb25CEwoRX2NhcGlDcmVhdGVkR3JvdXBCEQoPX3N1cHBvcnRQYXlsb2FkQg8KDV9saW1pdFNoYXJpbmdCEQoPX2xpbWl0U2hhcmluZ1YyQhYKFF93ZWJsaW5rUmVuZGVyQ29uZmln');
@$core.Deprecated('Use messageKeyDescriptor instead')
const MessageKey$json = const {
  '1': 'MessageKey',
  '2': const [
    const {'1': 'remoteJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'remoteJid', '17': true},
    const {'1': 'fromMe', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'fromMe', '17': true},
    const {'1': 'id', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'id', '17': true},
    const {'1': 'participant', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'participant', '17': true},
  ],
  '8': const [
    const {'1': '_remoteJid'},
    const {'1': '_fromMe'},
    const {'1': '_id'},
    const {'1': '_participant'},
  ],
};

/// Descriptor for `MessageKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageKeyDescriptor = $convert.base64Decode('CgpNZXNzYWdlS2V5EiEKCXJlbW90ZUppZBgBIAEoCUgAUglyZW1vdGVKaWSIAQESGwoGZnJvbU1lGAIgASgISAFSBmZyb21NZYgBARITCgJpZBgDIAEoCUgCUgJpZIgBARIlCgtwYXJ0aWNpcGFudBgEIAEoCUgDUgtwYXJ0aWNpcGFudIgBAUIMCgpfcmVtb3RlSmlkQgkKB19mcm9tTWVCBQoDX2lkQg4KDF9wYXJ0aWNpcGFudA==');
@$core.Deprecated('Use messageSecretMessageDescriptor instead')
const MessageSecretMessage$json = const {
  '1': 'MessageSecretMessage',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 15, '9': 0, '10': 'version', '17': true},
    const {'1': 'encIv', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'encIv', '17': true},
    const {'1': 'encPayload', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'encPayload', '17': true},
  ],
  '8': const [
    const {'1': '_version'},
    const {'1': '_encIv'},
    const {'1': '_encPayload'},
  ],
};

/// Descriptor for `MessageSecretMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageSecretMessageDescriptor = $convert.base64Decode('ChRNZXNzYWdlU2VjcmV0TWVzc2FnZRIdCgd2ZXJzaW9uGAEgASgPSABSB3ZlcnNpb26IAQESGQoFZW5jSXYYAiABKAxIAVIFZW5jSXaIAQESIwoKZW5jUGF5bG9hZBgDIAEoDEgCUgplbmNQYXlsb2FkiAEBQgoKCF92ZXJzaW9uQggKBl9lbmNJdkINCgtfZW5jUGF5bG9hZA==');
@$core.Deprecated('Use moneyDescriptor instead')
const Money$json = const {
  '1': 'Money',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'value', '17': true},
    const {'1': 'offset', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'offset', '17': true},
    const {'1': 'currencyCode', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'currencyCode', '17': true},
  ],
  '8': const [
    const {'1': '_value'},
    const {'1': '_offset'},
    const {'1': '_currencyCode'},
  ],
};

/// Descriptor for `Money`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moneyDescriptor = $convert.base64Decode('CgVNb25leRIZCgV2YWx1ZRgBIAEoA0gAUgV2YWx1ZYgBARIbCgZvZmZzZXQYAiABKA1IAVIGb2Zmc2V0iAEBEicKDGN1cnJlbmN5Q29kZRgDIAEoCUgCUgxjdXJyZW5jeUNvZGWIAQFCCAoGX3ZhbHVlQgkKB19vZmZzZXRCDwoNX2N1cnJlbmN5Q29kZQ==');
@$core.Deprecated('Use msgOpaqueDataDescriptor instead')
const MsgOpaqueData$json = const {
  '1': 'MsgOpaqueData',
  '2': const [
    const {'1': 'body', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'body', '17': true},
    const {'1': 'caption', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'caption', '17': true},
    const {'1': 'lng', '3': 5, '4': 1, '5': 1, '9': 2, '10': 'lng', '17': true},
    const {'1': 'isLive', '3': 6, '4': 1, '5': 8, '9': 3, '10': 'isLive', '17': true},
    const {'1': 'lat', '3': 7, '4': 1, '5': 1, '9': 4, '10': 'lat', '17': true},
    const {'1': 'paymentAmount1000', '3': 8, '4': 1, '5': 5, '9': 5, '10': 'paymentAmount1000', '17': true},
    const {'1': 'paymentNoteMsgBody', '3': 9, '4': 1, '5': 9, '9': 6, '10': 'paymentNoteMsgBody', '17': true},
    const {'1': 'matchedText', '3': 11, '4': 1, '5': 9, '9': 7, '10': 'matchedText', '17': true},
    const {'1': 'title', '3': 12, '4': 1, '5': 9, '9': 8, '10': 'title', '17': true},
    const {'1': 'description', '3': 13, '4': 1, '5': 9, '9': 9, '10': 'description', '17': true},
    const {'1': 'futureproofBuffer', '3': 14, '4': 1, '5': 12, '9': 10, '10': 'futureproofBuffer', '17': true},
    const {'1': 'clientUrl', '3': 15, '4': 1, '5': 9, '9': 11, '10': 'clientUrl', '17': true},
    const {'1': 'loc', '3': 16, '4': 1, '5': 9, '9': 12, '10': 'loc', '17': true},
    const {'1': 'pollName', '3': 17, '4': 1, '5': 9, '9': 13, '10': 'pollName', '17': true},
    const {'1': 'pollOptions', '3': 18, '4': 3, '5': 11, '6': '.proto.MsgOpaqueData.PollOption', '10': 'pollOptions'},
    const {'1': 'pollSelectableOptionsCount', '3': 20, '4': 1, '5': 13, '9': 14, '10': 'pollSelectableOptionsCount', '17': true},
    const {'1': 'messageSecret', '3': 21, '4': 1, '5': 12, '9': 15, '10': 'messageSecret', '17': true},
    const {'1': 'originalSelfAuthor', '3': 51, '4': 1, '5': 9, '9': 16, '10': 'originalSelfAuthor', '17': true},
    const {'1': 'senderTimestampMs', '3': 22, '4': 1, '5': 3, '9': 17, '10': 'senderTimestampMs', '17': true},
    const {'1': 'pollUpdateParentKey', '3': 23, '4': 1, '5': 9, '9': 18, '10': 'pollUpdateParentKey', '17': true},
    const {'1': 'encPollVote', '3': 24, '4': 1, '5': 11, '6': '.proto.PollEncValue', '9': 19, '10': 'encPollVote', '17': true},
    const {'1': 'isSentCagPollCreation', '3': 28, '4': 1, '5': 8, '9': 20, '10': 'isSentCagPollCreation', '17': true},
    const {'1': 'pollContentType', '3': 42, '4': 1, '5': 14, '6': '.proto.MsgOpaqueData.PollContentType', '9': 21, '10': 'pollContentType', '17': true},
    const {'1': 'pollType', '3': 46, '4': 1, '5': 14, '6': '.proto.MsgOpaqueData.PollType', '9': 22, '10': 'pollType', '17': true},
    const {'1': 'correctOptionIndex', '3': 47, '4': 1, '5': 5, '9': 23, '10': 'correctOptionIndex', '17': true},
    const {'1': 'pollVotesSnapshot', '3': 41, '4': 1, '5': 11, '6': '.proto.MsgOpaqueData.PollVotesSnapshot', '9': 24, '10': 'pollVotesSnapshot', '17': true},
    const {'1': 'encReactionTargetMessageKey', '3': 25, '4': 1, '5': 9, '9': 25, '10': 'encReactionTargetMessageKey', '17': true},
    const {'1': 'encReactionEncPayload', '3': 26, '4': 1, '5': 12, '9': 26, '10': 'encReactionEncPayload', '17': true},
    const {'1': 'encReactionEncIv', '3': 27, '4': 1, '5': 12, '9': 27, '10': 'encReactionEncIv', '17': true},
    const {'1': 'botMessageSecret', '3': 29, '4': 1, '5': 12, '9': 28, '10': 'botMessageSecret', '17': true},
    const {'1': 'targetMessageKey', '3': 30, '4': 1, '5': 9, '9': 29, '10': 'targetMessageKey', '17': true},
    const {'1': 'encPayload', '3': 31, '4': 1, '5': 12, '9': 30, '10': 'encPayload', '17': true},
    const {'1': 'encIv', '3': 32, '4': 1, '5': 12, '9': 31, '10': 'encIv', '17': true},
    const {'1': 'eventName', '3': 33, '4': 1, '5': 9, '9': 32, '10': 'eventName', '17': true},
    const {'1': 'isEventCanceled', '3': 34, '4': 1, '5': 8, '9': 33, '10': 'isEventCanceled', '17': true},
    const {'1': 'eventDescription', '3': 35, '4': 1, '5': 9, '9': 34, '10': 'eventDescription', '17': true},
    const {'1': 'eventJoinLink', '3': 36, '4': 1, '5': 9, '9': 35, '10': 'eventJoinLink', '17': true},
    const {'1': 'eventStartTime', '3': 37, '4': 1, '5': 3, '9': 36, '10': 'eventStartTime', '17': true},
    const {'1': 'eventLocation', '3': 38, '4': 1, '5': 11, '6': '.proto.MsgOpaqueData.EventLocation', '9': 37, '10': 'eventLocation', '17': true},
    const {'1': 'eventEndTime', '3': 40, '4': 1, '5': 3, '9': 38, '10': 'eventEndTime', '17': true},
    const {'1': 'eventIsScheduledCall', '3': 44, '4': 1, '5': 8, '9': 39, '10': 'eventIsScheduledCall', '17': true},
    const {'1': 'eventExtraGuestsAllowed', '3': 45, '4': 1, '5': 8, '9': 40, '10': 'eventExtraGuestsAllowed', '17': true},
    const {'1': 'plainProtobufBytes', '3': 43, '4': 1, '5': 12, '9': 41, '10': 'plainProtobufBytes', '17': true},
  ],
  '3': const [MsgOpaqueData_EventLocation$json, MsgOpaqueData_PollOption$json, MsgOpaqueData_PollVoteSnapshot$json, MsgOpaqueData_PollVotesSnapshot$json],
  '4': const [MsgOpaqueData_PollContentType$json, MsgOpaqueData_PollType$json],
  '8': const [
    const {'1': '_body'},
    const {'1': '_caption'},
    const {'1': '_lng'},
    const {'1': '_isLive'},
    const {'1': '_lat'},
    const {'1': '_paymentAmount1000'},
    const {'1': '_paymentNoteMsgBody'},
    const {'1': '_matchedText'},
    const {'1': '_title'},
    const {'1': '_description'},
    const {'1': '_futureproofBuffer'},
    const {'1': '_clientUrl'},
    const {'1': '_loc'},
    const {'1': '_pollName'},
    const {'1': '_pollSelectableOptionsCount'},
    const {'1': '_messageSecret'},
    const {'1': '_originalSelfAuthor'},
    const {'1': '_senderTimestampMs'},
    const {'1': '_pollUpdateParentKey'},
    const {'1': '_encPollVote'},
    const {'1': '_isSentCagPollCreation'},
    const {'1': '_pollContentType'},
    const {'1': '_pollType'},
    const {'1': '_correctOptionIndex'},
    const {'1': '_pollVotesSnapshot'},
    const {'1': '_encReactionTargetMessageKey'},
    const {'1': '_encReactionEncPayload'},
    const {'1': '_encReactionEncIv'},
    const {'1': '_botMessageSecret'},
    const {'1': '_targetMessageKey'},
    const {'1': '_encPayload'},
    const {'1': '_encIv'},
    const {'1': '_eventName'},
    const {'1': '_isEventCanceled'},
    const {'1': '_eventDescription'},
    const {'1': '_eventJoinLink'},
    const {'1': '_eventStartTime'},
    const {'1': '_eventLocation'},
    const {'1': '_eventEndTime'},
    const {'1': '_eventIsScheduledCall'},
    const {'1': '_eventExtraGuestsAllowed'},
    const {'1': '_plainProtobufBytes'},
  ],
};

@$core.Deprecated('Use msgOpaqueDataDescriptor instead')
const MsgOpaqueData_EventLocation$json = const {
  '1': 'EventLocation',
  '2': const [
    const {'1': 'degreesLatitude', '3': 1, '4': 1, '5': 1, '9': 0, '10': 'degreesLatitude', '17': true},
    const {'1': 'degreesLongitude', '3': 2, '4': 1, '5': 1, '9': 1, '10': 'degreesLongitude', '17': true},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'name', '17': true},
    const {'1': 'address', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'address', '17': true},
    const {'1': 'url', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'url', '17': true},
    const {'1': 'jpegThumbnail', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'jpegThumbnail', '17': true},
  ],
  '8': const [
    const {'1': '_degreesLatitude'},
    const {'1': '_degreesLongitude'},
    const {'1': '_name'},
    const {'1': '_address'},
    const {'1': '_url'},
    const {'1': '_jpegThumbnail'},
  ],
};

@$core.Deprecated('Use msgOpaqueDataDescriptor instead')
const MsgOpaqueData_PollOption$json = const {
  '1': 'PollOption',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'hash', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'hash', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_hash'},
  ],
};

@$core.Deprecated('Use msgOpaqueDataDescriptor instead')
const MsgOpaqueData_PollVoteSnapshot$json = const {
  '1': 'PollVoteSnapshot',
  '2': const [
    const {'1': 'option', '3': 1, '4': 1, '5': 11, '6': '.proto.MsgOpaqueData.PollOption', '9': 0, '10': 'option', '17': true},
    const {'1': 'optionVoteCount', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'optionVoteCount', '17': true},
  ],
  '8': const [
    const {'1': '_option'},
    const {'1': '_optionVoteCount'},
  ],
};

@$core.Deprecated('Use msgOpaqueDataDescriptor instead')
const MsgOpaqueData_PollVotesSnapshot$json = const {
  '1': 'PollVotesSnapshot',
  '2': const [
    const {'1': 'pollVotes', '3': 1, '4': 3, '5': 11, '6': '.proto.MsgOpaqueData.PollVoteSnapshot', '10': 'pollVotes'},
  ],
};

@$core.Deprecated('Use msgOpaqueDataDescriptor instead')
const MsgOpaqueData_PollContentType$json = const {
  '1': 'PollContentType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'TEXT', '2': 1},
    const {'1': 'IMAGE', '2': 2},
  ],
};

@$core.Deprecated('Use msgOpaqueDataDescriptor instead')
const MsgOpaqueData_PollType$json = const {
  '1': 'PollType',
  '2': const [
    const {'1': 'POLL', '2': 0},
    const {'1': 'QUIZ', '2': 1},
  ],
};

/// Descriptor for `MsgOpaqueData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgOpaqueDataDescriptor = $convert.base64Decode('Cg1Nc2dPcGFxdWVEYXRhEhcKBGJvZHkYASABKAlIAFIEYm9keYgBARIdCgdjYXB0aW9uGAMgASgJSAFSB2NhcHRpb26IAQESFQoDbG5nGAUgASgBSAJSA2xuZ4gBARIbCgZpc0xpdmUYBiABKAhIA1IGaXNMaXZliAEBEhUKA2xhdBgHIAEoAUgEUgNsYXSIAQESMQoRcGF5bWVudEFtb3VudDEwMDAYCCABKAVIBVIRcGF5bWVudEFtb3VudDEwMDCIAQESMwoScGF5bWVudE5vdGVNc2dCb2R5GAkgASgJSAZSEnBheW1lbnROb3RlTXNnQm9keYgBARIlCgttYXRjaGVkVGV4dBgLIAEoCUgHUgttYXRjaGVkVGV4dIgBARIZCgV0aXRsZRgMIAEoCUgIUgV0aXRsZYgBARIlCgtkZXNjcmlwdGlvbhgNIAEoCUgJUgtkZXNjcmlwdGlvbogBARIxChFmdXR1cmVwcm9vZkJ1ZmZlchgOIAEoDEgKUhFmdXR1cmVwcm9vZkJ1ZmZlcogBARIhCgljbGllbnRVcmwYDyABKAlIC1IJY2xpZW50VXJsiAEBEhUKA2xvYxgQIAEoCUgMUgNsb2OIAQESHwoIcG9sbE5hbWUYESABKAlIDVIIcG9sbE5hbWWIAQESQQoLcG9sbE9wdGlvbnMYEiADKAsyHy5wcm90by5Nc2dPcGFxdWVEYXRhLlBvbGxPcHRpb25SC3BvbGxPcHRpb25zEkMKGnBvbGxTZWxlY3RhYmxlT3B0aW9uc0NvdW50GBQgASgNSA5SGnBvbGxTZWxlY3RhYmxlT3B0aW9uc0NvdW50iAEBEikKDW1lc3NhZ2VTZWNyZXQYFSABKAxID1INbWVzc2FnZVNlY3JldIgBARIzChJvcmlnaW5hbFNlbGZBdXRob3IYMyABKAlIEFISb3JpZ2luYWxTZWxmQXV0aG9yiAEBEjEKEXNlbmRlclRpbWVzdGFtcE1zGBYgASgDSBFSEXNlbmRlclRpbWVzdGFtcE1ziAEBEjUKE3BvbGxVcGRhdGVQYXJlbnRLZXkYFyABKAlIElITcG9sbFVwZGF0ZVBhcmVudEtleYgBARI6CgtlbmNQb2xsVm90ZRgYIAEoCzITLnByb3RvLlBvbGxFbmNWYWx1ZUgTUgtlbmNQb2xsVm90ZYgBARI5ChVpc1NlbnRDYWdQb2xsQ3JlYXRpb24YHCABKAhIFFIVaXNTZW50Q2FnUG9sbENyZWF0aW9uiAEBElMKD3BvbGxDb250ZW50VHlwZRgqIAEoDjIkLnByb3RvLk1zZ09wYXF1ZURhdGEuUG9sbENvbnRlbnRUeXBlSBVSD3BvbGxDb250ZW50VHlwZYgBARI+Cghwb2xsVHlwZRguIAEoDjIdLnByb3RvLk1zZ09wYXF1ZURhdGEuUG9sbFR5cGVIFlIIcG9sbFR5cGWIAQESMwoSY29ycmVjdE9wdGlvbkluZGV4GC8gASgFSBdSEmNvcnJlY3RPcHRpb25JbmRleIgBARJZChFwb2xsVm90ZXNTbmFwc2hvdBgpIAEoCzImLnByb3RvLk1zZ09wYXF1ZURhdGEuUG9sbFZvdGVzU25hcHNob3RIGFIRcG9sbFZvdGVzU25hcHNob3SIAQESRQobZW5jUmVhY3Rpb25UYXJnZXRNZXNzYWdlS2V5GBkgASgJSBlSG2VuY1JlYWN0aW9uVGFyZ2V0TWVzc2FnZUtleYgBARI5ChVlbmNSZWFjdGlvbkVuY1BheWxvYWQYGiABKAxIGlIVZW5jUmVhY3Rpb25FbmNQYXlsb2FkiAEBEi8KEGVuY1JlYWN0aW9uRW5jSXYYGyABKAxIG1IQZW5jUmVhY3Rpb25FbmNJdogBARIvChBib3RNZXNzYWdlU2VjcmV0GB0gASgMSBxSEGJvdE1lc3NhZ2VTZWNyZXSIAQESLwoQdGFyZ2V0TWVzc2FnZUtleRgeIAEoCUgdUhB0YXJnZXRNZXNzYWdlS2V5iAEBEiMKCmVuY1BheWxvYWQYHyABKAxIHlIKZW5jUGF5bG9hZIgBARIZCgVlbmNJdhggIAEoDEgfUgVlbmNJdogBARIhCglldmVudE5hbWUYISABKAlIIFIJZXZlbnROYW1liAEBEi0KD2lzRXZlbnRDYW5jZWxlZBgiIAEoCEghUg9pc0V2ZW50Q2FuY2VsZWSIAQESLwoQZXZlbnREZXNjcmlwdGlvbhgjIAEoCUgiUhBldmVudERlc2NyaXB0aW9uiAEBEikKDWV2ZW50Sm9pbkxpbmsYJCABKAlII1INZXZlbnRKb2luTGlua4gBARIrCg5ldmVudFN0YXJ0VGltZRglIAEoA0gkUg5ldmVudFN0YXJ0VGltZYgBARJNCg1ldmVudExvY2F0aW9uGCYgASgLMiIucHJvdG8uTXNnT3BhcXVlRGF0YS5FdmVudExvY2F0aW9uSCVSDWV2ZW50TG9jYXRpb26IAQESJwoMZXZlbnRFbmRUaW1lGCggASgDSCZSDGV2ZW50RW5kVGltZYgBARI3ChRldmVudElzU2NoZWR1bGVkQ2FsbBgsIAEoCEgnUhRldmVudElzU2NoZWR1bGVkQ2FsbIgBARI9ChdldmVudEV4dHJhR3Vlc3RzQWxsb3dlZBgtIAEoCEgoUhdldmVudEV4dHJhR3Vlc3RzQWxsb3dlZIgBARIzChJwbGFpblByb3RvYnVmQnl0ZXMYKyABKAxIKVIScGxhaW5Qcm90b2J1ZkJ5dGVziAEBGsECCg1FdmVudExvY2F0aW9uEi0KD2RlZ3JlZXNMYXRpdHVkZRgBIAEoAUgAUg9kZWdyZWVzTGF0aXR1ZGWIAQESLwoQZGVncmVlc0xvbmdpdHVkZRgCIAEoAUgBUhBkZWdyZWVzTG9uZ2l0dWRliAEBEhcKBG5hbWUYAyABKAlIAlIEbmFtZYgBARIdCgdhZGRyZXNzGAQgASgJSANSB2FkZHJlc3OIAQESFQoDdXJsGAUgASgJSARSA3VybIgBARIpCg1qcGVnVGh1bWJuYWlsGAYgASgMSAVSDWpwZWdUaHVtYm5haWyIAQFCEgoQX2RlZ3JlZXNMYXRpdHVkZUITChFfZGVncmVlc0xvbmdpdHVkZUIHCgVfbmFtZUIKCghfYWRkcmVzc0IGCgRfdXJsQhAKDl9qcGVnVGh1bWJuYWlsGlAKClBvbGxPcHRpb24SFwoEbmFtZRgBIAEoCUgAUgRuYW1liAEBEhcKBGhhc2gYAiABKAlIAVIEaGFzaIgBAUIHCgVfbmFtZUIHCgVfaGFzaBqeAQoQUG9sbFZvdGVTbmFwc2hvdBI8CgZvcHRpb24YASABKAsyHy5wcm90by5Nc2dPcGFxdWVEYXRhLlBvbGxPcHRpb25IAFIGb3B0aW9uiAEBEi0KD29wdGlvblZvdGVDb3VudBgCIAEoBUgBUg9vcHRpb25Wb3RlQ291bnSIAQFCCQoHX29wdGlvbkISChBfb3B0aW9uVm90ZUNvdW50GlgKEVBvbGxWb3Rlc1NuYXBzaG90EkMKCXBvbGxWb3RlcxgBIAMoCzIlLnByb3RvLk1zZ09wYXF1ZURhdGEuUG9sbFZvdGVTbmFwc2hvdFIJcG9sbFZvdGVzIjMKD1BvbGxDb250ZW50VHlwZRILCgdVTktOT1dOEAASCAoEVEVYVBABEgkKBUlNQUdFEAIiHgoIUG9sbFR5cGUSCAoEUE9MTBAAEggKBFFVSVoQAUIHCgVfYm9keUIKCghfY2FwdGlvbkIGCgRfbG5nQgkKB19pc0xpdmVCBgoEX2xhdEIUChJfcGF5bWVudEFtb3VudDEwMDBCFQoTX3BheW1lbnROb3RlTXNnQm9keUIOCgxfbWF0Y2hlZFRleHRCCAoGX3RpdGxlQg4KDF9kZXNjcmlwdGlvbkIUChJfZnV0dXJlcHJvb2ZCdWZmZXJCDAoKX2NsaWVudFVybEIGCgRfbG9jQgsKCV9wb2xsTmFtZUIdChtfcG9sbFNlbGVjdGFibGVPcHRpb25zQ291bnRCEAoOX21lc3NhZ2VTZWNyZXRCFQoTX29yaWdpbmFsU2VsZkF1dGhvckIUChJfc2VuZGVyVGltZXN0YW1wTXNCFgoUX3BvbGxVcGRhdGVQYXJlbnRLZXlCDgoMX2VuY1BvbGxWb3RlQhgKFl9pc1NlbnRDYWdQb2xsQ3JlYXRpb25CEgoQX3BvbGxDb250ZW50VHlwZUILCglfcG9sbFR5cGVCFQoTX2NvcnJlY3RPcHRpb25JbmRleEIUChJfcG9sbFZvdGVzU25hcHNob3RCHgocX2VuY1JlYWN0aW9uVGFyZ2V0TWVzc2FnZUtleUIYChZfZW5jUmVhY3Rpb25FbmNQYXlsb2FkQhMKEV9lbmNSZWFjdGlvbkVuY0l2QhMKEV9ib3RNZXNzYWdlU2VjcmV0QhMKEV90YXJnZXRNZXNzYWdlS2V5Qg0KC19lbmNQYXlsb2FkQggKBl9lbmNJdkIMCgpfZXZlbnROYW1lQhIKEF9pc0V2ZW50Q2FuY2VsZWRCEwoRX2V2ZW50RGVzY3JpcHRpb25CEAoOX2V2ZW50Sm9pbkxpbmtCEQoPX2V2ZW50U3RhcnRUaW1lQhAKDl9ldmVudExvY2F0aW9uQg8KDV9ldmVudEVuZFRpbWVCFwoVX2V2ZW50SXNTY2hlZHVsZWRDYWxsQhoKGF9ldmVudEV4dHJhR3Vlc3RzQWxsb3dlZEIVChNfcGxhaW5Qcm90b2J1ZkJ5dGVz');
@$core.Deprecated('Use msgRowOpaqueDataDescriptor instead')
const MsgRowOpaqueData$json = const {
  '1': 'MsgRowOpaqueData',
  '2': const [
    const {'1': 'currentMsg', '3': 1, '4': 1, '5': 11, '6': '.proto.MsgOpaqueData', '9': 0, '10': 'currentMsg', '17': true},
    const {'1': 'quotedMsg', '3': 2, '4': 1, '5': 11, '6': '.proto.MsgOpaqueData', '9': 1, '10': 'quotedMsg', '17': true},
  ],
  '8': const [
    const {'1': '_currentMsg'},
    const {'1': '_quotedMsg'},
  ],
};

/// Descriptor for `MsgRowOpaqueData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRowOpaqueDataDescriptor = $convert.base64Decode('ChBNc2dSb3dPcGFxdWVEYXRhEjkKCmN1cnJlbnRNc2cYASABKAsyFC5wcm90by5Nc2dPcGFxdWVEYXRhSABSCmN1cnJlbnRNc2eIAQESNwoJcXVvdGVkTXNnGAIgASgLMhQucHJvdG8uTXNnT3BhcXVlRGF0YUgBUglxdW90ZWRNc2eIAQFCDQoLX2N1cnJlbnRNc2dCDAoKX3F1b3RlZE1zZw==');
@$core.Deprecated('Use noiseCertificateDescriptor instead')
const NoiseCertificate$json = const {
  '1': 'NoiseCertificate',
  '2': const [
    const {'1': 'details', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'details', '17': true},
    const {'1': 'signature', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'signature', '17': true},
  ],
  '3': const [NoiseCertificate_Details$json],
  '8': const [
    const {'1': '_details'},
    const {'1': '_signature'},
  ],
};

@$core.Deprecated('Use noiseCertificateDescriptor instead')
const NoiseCertificate_Details$json = const {
  '1': 'Details',
  '2': const [
    const {'1': 'serial', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'serial', '17': true},
    const {'1': 'issuer', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'issuer', '17': true},
    const {'1': 'expires', '3': 3, '4': 1, '5': 4, '9': 2, '10': 'expires', '17': true},
    const {'1': 'subject', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'subject', '17': true},
    const {'1': 'key', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'key', '17': true},
  ],
  '8': const [
    const {'1': '_serial'},
    const {'1': '_issuer'},
    const {'1': '_expires'},
    const {'1': '_subject'},
    const {'1': '_key'},
  ],
};

/// Descriptor for `NoiseCertificate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noiseCertificateDescriptor = $convert.base64Decode('ChBOb2lzZUNlcnRpZmljYXRlEh0KB2RldGFpbHMYASABKAxIAFIHZGV0YWlsc4gBARIhCglzaWduYXR1cmUYAiABKAxIAVIJc2lnbmF0dXJliAEBGs4BCgdEZXRhaWxzEhsKBnNlcmlhbBgBIAEoDUgAUgZzZXJpYWyIAQESGwoGaXNzdWVyGAIgASgJSAFSBmlzc3VlcogBARIdCgdleHBpcmVzGAMgASgESAJSB2V4cGlyZXOIAQESHQoHc3ViamVjdBgEIAEoCUgDUgdzdWJqZWN0iAEBEhUKA2tleRgFIAEoDEgEUgNrZXmIAQFCCQoHX3NlcmlhbEIJCgdfaXNzdWVyQgoKCF9leHBpcmVzQgoKCF9zdWJqZWN0QgYKBF9rZXlCCgoIX2RldGFpbHNCDAoKX3NpZ25hdHVyZQ==');
@$core.Deprecated('Use notificationMessageInfoDescriptor instead')
const NotificationMessageInfo$json = const {
  '1': 'NotificationMessageInfo',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 1, '10': 'message', '17': true},
    const {'1': 'messageTimestamp', '3': 3, '4': 1, '5': 4, '9': 2, '10': 'messageTimestamp', '17': true},
    const {'1': 'participant', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'participant', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_message'},
    const {'1': '_messageTimestamp'},
    const {'1': '_participant'},
  ],
};

/// Descriptor for `NotificationMessageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationMessageInfoDescriptor = $convert.base64Decode('ChdOb3RpZmljYXRpb25NZXNzYWdlSW5mbxIoCgNrZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5SABSA2tleYgBARItCgdtZXNzYWdlGAIgASgLMg4ucHJvdG8uTWVzc2FnZUgBUgdtZXNzYWdliAEBEi8KEG1lc3NhZ2VUaW1lc3RhbXAYAyABKARIAlIQbWVzc2FnZVRpbWVzdGFtcIgBARIlCgtwYXJ0aWNpcGFudBgEIAEoCUgDUgtwYXJ0aWNpcGFudIgBAUIGCgRfa2V5QgoKCF9tZXNzYWdlQhMKEV9tZXNzYWdlVGltZXN0YW1wQg4KDF9wYXJ0aWNpcGFudA==');
@$core.Deprecated('Use notificationSettingsDescriptor instead')
const NotificationSettings$json = const {
  '1': 'NotificationSettings',
  '2': const [
    const {'1': 'messageVibrate', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'messageVibrate', '17': true},
    const {'1': 'messagePopup', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'messagePopup', '17': true},
    const {'1': 'messageLight', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'messageLight', '17': true},
    const {'1': 'lowPriorityNotifications', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'lowPriorityNotifications', '17': true},
    const {'1': 'reactionsMuted', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'reactionsMuted', '17': true},
    const {'1': 'callVibrate', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'callVibrate', '17': true},
  ],
  '8': const [
    const {'1': '_messageVibrate'},
    const {'1': '_messagePopup'},
    const {'1': '_messageLight'},
    const {'1': '_lowPriorityNotifications'},
    const {'1': '_reactionsMuted'},
    const {'1': '_callVibrate'},
  ],
};

/// Descriptor for `NotificationSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notificationSettingsDescriptor = $convert.base64Decode('ChROb3RpZmljYXRpb25TZXR0aW5ncxIrCg5tZXNzYWdlVmlicmF0ZRgBIAEoCUgAUg5tZXNzYWdlVmlicmF0ZYgBARInCgxtZXNzYWdlUG9wdXAYAiABKAlIAVIMbWVzc2FnZVBvcHVwiAEBEicKDG1lc3NhZ2VMaWdodBgDIAEoCUgCUgxtZXNzYWdlTGlnaHSIAQESPwoYbG93UHJpb3JpdHlOb3RpZmljYXRpb25zGAQgASgISANSGGxvd1ByaW9yaXR5Tm90aWZpY2F0aW9uc4gBARIrCg5yZWFjdGlvbnNNdXRlZBgFIAEoCEgEUg5yZWFjdGlvbnNNdXRlZIgBARIlCgtjYWxsVmlicmF0ZRgGIAEoCUgFUgtjYWxsVmlicmF0ZYgBAUIRCg9fbWVzc2FnZVZpYnJhdGVCDwoNX21lc3NhZ2VQb3B1cEIPCg1fbWVzc2FnZUxpZ2h0QhsKGV9sb3dQcmlvcml0eU5vdGlmaWNhdGlvbnNCEQoPX3JlYWN0aW9uc011dGVkQg4KDF9jYWxsVmlicmF0ZQ==');
@$core.Deprecated('Use pairingRequestDescriptor instead')
const PairingRequest$json = const {
  '1': 'PairingRequest',
  '2': const [
    const {'1': 'companionPublicKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'companionPublicKey', '17': true},
    const {'1': 'companionIdentityKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'companionIdentityKey', '17': true},
    const {'1': 'advSecret', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'advSecret', '17': true},
  ],
  '8': const [
    const {'1': '_companionPublicKey'},
    const {'1': '_companionIdentityKey'},
    const {'1': '_advSecret'},
  ],
};

/// Descriptor for `PairingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pairingRequestDescriptor = $convert.base64Decode('Cg5QYWlyaW5nUmVxdWVzdBIzChJjb21wYW5pb25QdWJsaWNLZXkYASABKAxIAFISY29tcGFuaW9uUHVibGljS2V5iAEBEjcKFGNvbXBhbmlvbklkZW50aXR5S2V5GAIgASgMSAFSFGNvbXBhbmlvbklkZW50aXR5S2V5iAEBEiEKCWFkdlNlY3JldBgDIAEoDEgCUglhZHZTZWNyZXSIAQFCFQoTX2NvbXBhbmlvblB1YmxpY0tleUIXChVfY29tcGFuaW9uSWRlbnRpdHlLZXlCDAoKX2FkdlNlY3JldA==');
@$core.Deprecated('Use pastParticipantDescriptor instead')
const PastParticipant$json = const {
  '1': 'PastParticipant',
  '2': const [
    const {'1': 'userJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'userJid', '17': true},
    const {'1': 'leaveReason', '3': 2, '4': 1, '5': 14, '6': '.proto.PastParticipant.LeaveReason', '9': 1, '10': 'leaveReason', '17': true},
    const {'1': 'leaveTs', '3': 3, '4': 1, '5': 4, '9': 2, '10': 'leaveTs', '17': true},
  ],
  '4': const [PastParticipant_LeaveReason$json],
  '8': const [
    const {'1': '_userJid'},
    const {'1': '_leaveReason'},
    const {'1': '_leaveTs'},
  ],
};

@$core.Deprecated('Use pastParticipantDescriptor instead')
const PastParticipant_LeaveReason$json = const {
  '1': 'LeaveReason',
  '2': const [
    const {'1': 'LEFT', '2': 0},
    const {'1': 'REMOVED', '2': 1},
  ],
};

/// Descriptor for `PastParticipant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pastParticipantDescriptor = $convert.base64Decode('Cg9QYXN0UGFydGljaXBhbnQSHQoHdXNlckppZBgBIAEoCUgAUgd1c2VySmlkiAEBEkkKC2xlYXZlUmVhc29uGAIgASgOMiIucHJvdG8uUGFzdFBhcnRpY2lwYW50LkxlYXZlUmVhc29uSAFSC2xlYXZlUmVhc29uiAEBEh0KB2xlYXZlVHMYAyABKARIAlIHbGVhdmVUc4gBASIkCgtMZWF2ZVJlYXNvbhIICgRMRUZUEAASCwoHUkVNT1ZFRBABQgoKCF91c2VySmlkQg4KDF9sZWF2ZVJlYXNvbkIKCghfbGVhdmVUcw==');
@$core.Deprecated('Use pastParticipantsDescriptor instead')
const PastParticipants$json = const {
  '1': 'PastParticipants',
  '2': const [
    const {'1': 'groupJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'groupJid', '17': true},
    const {'1': 'pastParticipants', '3': 2, '4': 3, '5': 11, '6': '.proto.PastParticipant', '10': 'pastParticipants'},
  ],
  '8': const [
    const {'1': '_groupJid'},
  ],
};

/// Descriptor for `PastParticipants`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pastParticipantsDescriptor = $convert.base64Decode('ChBQYXN0UGFydGljaXBhbnRzEh8KCGdyb3VwSmlkGAEgASgJSABSCGdyb3VwSmlkiAEBEkIKEHBhc3RQYXJ0aWNpcGFudHMYAiADKAsyFi5wcm90by5QYXN0UGFydGljaXBhbnRSEHBhc3RQYXJ0aWNpcGFudHNCCwoJX2dyb3VwSmlk');
@$core.Deprecated('Use patchDebugDataDescriptor instead')
const PatchDebugData$json = const {
  '1': 'PatchDebugData',
  '2': const [
    const {'1': 'currentLthash', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'currentLthash', '17': true},
    const {'1': 'newLthash', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'newLthash', '17': true},
    const {'1': 'patchVersion', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'patchVersion', '17': true},
    const {'1': 'collectionName', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'collectionName', '17': true},
    const {'1': 'firstFourBytesFromAHashOfSnapshotMacKey', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'firstFourBytesFromAHashOfSnapshotMacKey', '17': true},
    const {'1': 'newLthashSubtract', '3': 6, '4': 1, '5': 12, '9': 5, '10': 'newLthashSubtract', '17': true},
    const {'1': 'numberAdd', '3': 7, '4': 1, '5': 5, '9': 6, '10': 'numberAdd', '17': true},
    const {'1': 'numberRemove', '3': 8, '4': 1, '5': 5, '9': 7, '10': 'numberRemove', '17': true},
    const {'1': 'numberOverride', '3': 9, '4': 1, '5': 5, '9': 8, '10': 'numberOverride', '17': true},
    const {'1': 'senderPlatform', '3': 10, '4': 1, '5': 14, '6': '.proto.PatchDebugData.Platform', '9': 9, '10': 'senderPlatform', '17': true},
    const {'1': 'isSenderPrimary', '3': 11, '4': 1, '5': 8, '9': 10, '10': 'isSenderPrimary', '17': true},
  ],
  '4': const [PatchDebugData_Platform$json],
  '8': const [
    const {'1': '_currentLthash'},
    const {'1': '_newLthash'},
    const {'1': '_patchVersion'},
    const {'1': '_collectionName'},
    const {'1': '_firstFourBytesFromAHashOfSnapshotMacKey'},
    const {'1': '_newLthashSubtract'},
    const {'1': '_numberAdd'},
    const {'1': '_numberRemove'},
    const {'1': '_numberOverride'},
    const {'1': '_senderPlatform'},
    const {'1': '_isSenderPrimary'},
  ],
};

@$core.Deprecated('Use patchDebugDataDescriptor instead')
const PatchDebugData_Platform$json = const {
  '1': 'Platform',
  '2': const [
    const {'1': 'ANDROID', '2': 0},
    const {'1': 'SMBA', '2': 1},
    const {'1': 'IPHONE', '2': 2},
    const {'1': 'SMBI', '2': 3},
    const {'1': 'WEB', '2': 4},
    const {'1': 'UWP', '2': 5},
    const {'1': 'DARWIN', '2': 6},
    const {'1': 'IPAD', '2': 7},
    const {'1': 'WEAROS', '2': 8},
    const {'1': 'WASG', '2': 9},
    const {'1': 'WEARM', '2': 10},
    const {'1': 'CAPI', '2': 11},
  ],
};

/// Descriptor for `PatchDebugData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List patchDebugDataDescriptor = $convert.base64Decode('Cg5QYXRjaERlYnVnRGF0YRIpCg1jdXJyZW50THRoYXNoGAEgASgMSABSDWN1cnJlbnRMdGhhc2iIAQESIQoJbmV3THRoYXNoGAIgASgMSAFSCW5ld0x0aGFzaIgBARInCgxwYXRjaFZlcnNpb24YAyABKAxIAlIMcGF0Y2hWZXJzaW9uiAEBEisKDmNvbGxlY3Rpb25OYW1lGAQgASgMSANSDmNvbGxlY3Rpb25OYW1liAEBEl0KJ2ZpcnN0Rm91ckJ5dGVzRnJvbUFIYXNoT2ZTbmFwc2hvdE1hY0tleRgFIAEoDEgEUidmaXJzdEZvdXJCeXRlc0Zyb21BSGFzaE9mU25hcHNob3RNYWNLZXmIAQESMQoRbmV3THRoYXNoU3VidHJhY3QYBiABKAxIBVIRbmV3THRoYXNoU3VidHJhY3SIAQESIQoJbnVtYmVyQWRkGAcgASgFSAZSCW51bWJlckFkZIgBARInCgxudW1iZXJSZW1vdmUYCCABKAVIB1IMbnVtYmVyUmVtb3ZliAEBEisKDm51bWJlck92ZXJyaWRlGAkgASgFSAhSDm51bWJlck92ZXJyaWRliAEBEksKDnNlbmRlclBsYXRmb3JtGAogASgOMh4ucHJvdG8uUGF0Y2hEZWJ1Z0RhdGEuUGxhdGZvcm1ICVIOc2VuZGVyUGxhdGZvcm2IAQESLQoPaXNTZW5kZXJQcmltYXJ5GAsgASgISApSD2lzU2VuZGVyUHJpbWFyeYgBASKKAQoIUGxhdGZvcm0SCwoHQU5EUk9JRBAAEggKBFNNQkEQARIKCgZJUEhPTkUQAhIICgRTTUJJEAMSBwoDV0VCEAQSBwoDVVdQEAUSCgoGREFSV0lOEAYSCAoESVBBRBAHEgoKBldFQVJPUxAIEggKBFdBU0cQCRIJCgVXRUFSTRAKEggKBENBUEkQC0IQCg5fY3VycmVudEx0aGFzaEIMCgpfbmV3THRoYXNoQg8KDV9wYXRjaFZlcnNpb25CEQoPX2NvbGxlY3Rpb25OYW1lQioKKF9maXJzdEZvdXJCeXRlc0Zyb21BSGFzaE9mU25hcHNob3RNYWNLZXlCFAoSX25ld0x0aGFzaFN1YnRyYWN0QgwKCl9udW1iZXJBZGRCDwoNX251bWJlclJlbW92ZUIRCg9fbnVtYmVyT3ZlcnJpZGVCEQoPX3NlbmRlclBsYXRmb3JtQhIKEF9pc1NlbmRlclByaW1hcnk=');
@$core.Deprecated('Use paymentBackgroundDescriptor instead')
const PaymentBackground$json = const {
  '1': 'PaymentBackground',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
    const {'1': 'fileLength', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'fileLength', '17': true},
    const {'1': 'width', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'width', '17': true},
    const {'1': 'height', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'height', '17': true},
    const {'1': 'mimetype', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'mimetype', '17': true},
    const {'1': 'placeholderArgb', '3': 6, '4': 1, '5': 7, '9': 5, '10': 'placeholderArgb', '17': true},
    const {'1': 'textArgb', '3': 7, '4': 1, '5': 7, '9': 6, '10': 'textArgb', '17': true},
    const {'1': 'subtextArgb', '3': 8, '4': 1, '5': 7, '9': 7, '10': 'subtextArgb', '17': true},
    const {'1': 'mediaData', '3': 9, '4': 1, '5': 11, '6': '.proto.PaymentBackground.MediaData', '9': 8, '10': 'mediaData', '17': true},
    const {'1': 'type', '3': 10, '4': 1, '5': 14, '6': '.proto.PaymentBackground.Type', '9': 9, '10': 'type', '17': true},
  ],
  '3': const [PaymentBackground_MediaData$json],
  '4': const [PaymentBackground_Type$json],
  '8': const [
    const {'1': '_id'},
    const {'1': '_fileLength'},
    const {'1': '_width'},
    const {'1': '_height'},
    const {'1': '_mimetype'},
    const {'1': '_placeholderArgb'},
    const {'1': '_textArgb'},
    const {'1': '_subtextArgb'},
    const {'1': '_mediaData'},
    const {'1': '_type'},
  ],
};

@$core.Deprecated('Use paymentBackgroundDescriptor instead')
const PaymentBackground_MediaData$json = const {
  '1': 'MediaData',
  '2': const [
    const {'1': 'mediaKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'mediaKey', '17': true},
    const {'1': 'mediaKeyTimestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'mediaKeyTimestamp', '17': true},
    const {'1': 'fileSha256', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'fileSha256', '17': true},
    const {'1': 'fileEncSha256', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'fileEncSha256', '17': true},
    const {'1': 'directPath', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'directPath', '17': true},
  ],
  '8': const [
    const {'1': '_mediaKey'},
    const {'1': '_mediaKeyTimestamp'},
    const {'1': '_fileSha256'},
    const {'1': '_fileEncSha256'},
    const {'1': '_directPath'},
  ],
};

@$core.Deprecated('Use paymentBackgroundDescriptor instead')
const PaymentBackground_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'DEFAULT', '2': 1},
  ],
};

/// Descriptor for `PaymentBackground`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentBackgroundDescriptor = $convert.base64Decode('ChFQYXltZW50QmFja2dyb3VuZBITCgJpZBgBIAEoCUgAUgJpZIgBARIjCgpmaWxlTGVuZ3RoGAIgASgESAFSCmZpbGVMZW5ndGiIAQESGQoFd2lkdGgYAyABKA1IAlIFd2lkdGiIAQESGwoGaGVpZ2h0GAQgASgNSANSBmhlaWdodIgBARIfCghtaW1ldHlwZRgFIAEoCUgEUghtaW1ldHlwZYgBARItCg9wbGFjZWhvbGRlckFyZ2IYBiABKAdIBVIPcGxhY2Vob2xkZXJBcmdiiAEBEh8KCHRleHRBcmdiGAcgASgHSAZSCHRleHRBcmdiiAEBEiUKC3N1YnRleHRBcmdiGAggASgHSAdSC3N1YnRleHRBcmdiiAEBEkUKCW1lZGlhRGF0YRgJIAEoCzIiLnByb3RvLlBheW1lbnRCYWNrZ3JvdW5kLk1lZGlhRGF0YUgIUgltZWRpYURhdGGIAQESNgoEdHlwZRgKIAEoDjIdLnByb3RvLlBheW1lbnRCYWNrZ3JvdW5kLlR5cGVICVIEdHlwZYgBARqnAgoJTWVkaWFEYXRhEh8KCG1lZGlhS2V5GAEgASgMSABSCG1lZGlhS2V5iAEBEjEKEW1lZGlhS2V5VGltZXN0YW1wGAIgASgDSAFSEW1lZGlhS2V5VGltZXN0YW1wiAEBEiMKCmZpbGVTaGEyNTYYAyABKAxIAlIKZmlsZVNoYTI1NogBARIpCg1maWxlRW5jU2hhMjU2GAQgASgMSANSDWZpbGVFbmNTaGEyNTaIAQESIwoKZGlyZWN0UGF0aBgFIAEoCUgEUgpkaXJlY3RQYXRoiAEBQgsKCV9tZWRpYUtleUIUChJfbWVkaWFLZXlUaW1lc3RhbXBCDQoLX2ZpbGVTaGEyNTZCEAoOX2ZpbGVFbmNTaGEyNTZCDQoLX2RpcmVjdFBhdGgiIAoEVHlwZRILCgdVTktOT1dOEAASCwoHREVGQVVMVBABQgUKA19pZEINCgtfZmlsZUxlbmd0aEIICgZfd2lkdGhCCQoHX2hlaWdodEILCglfbWltZXR5cGVCEgoQX3BsYWNlaG9sZGVyQXJnYkILCglfdGV4dEFyZ2JCDgoMX3N1YnRleHRBcmdiQgwKCl9tZWRpYURhdGFCBwoFX3R5cGU=');
@$core.Deprecated('Use paymentInfoDescriptor instead')
const PaymentInfo$json = const {
  '1': 'PaymentInfo',
  '2': const [
    const {'1': 'currencyDeprecated', '3': 1, '4': 1, '5': 14, '6': '.proto.PaymentInfo.Currency', '9': 0, '10': 'currencyDeprecated', '17': true},
    const {'1': 'amount1000', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'amount1000', '17': true},
    const {'1': 'receiverJid', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'receiverJid', '17': true},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.proto.PaymentInfo.Status', '9': 3, '10': 'status', '17': true},
    const {'1': 'transactionTimestamp', '3': 5, '4': 1, '5': 4, '9': 4, '10': 'transactionTimestamp', '17': true},
    const {'1': 'requestMessageKey', '3': 6, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 5, '10': 'requestMessageKey', '17': true},
    const {'1': 'expiryTimestamp', '3': 7, '4': 1, '5': 4, '9': 6, '10': 'expiryTimestamp', '17': true},
    const {'1': 'futureproofed', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'futureproofed', '17': true},
    const {'1': 'currency', '3': 9, '4': 1, '5': 9, '9': 8, '10': 'currency', '17': true},
    const {'1': 'txnStatus', '3': 10, '4': 1, '5': 14, '6': '.proto.PaymentInfo.TxnStatus', '9': 9, '10': 'txnStatus', '17': true},
    const {'1': 'useNoviFiatFormat', '3': 11, '4': 1, '5': 8, '9': 10, '10': 'useNoviFiatFormat', '17': true},
    const {'1': 'primaryAmount', '3': 12, '4': 1, '5': 11, '6': '.proto.Money', '9': 11, '10': 'primaryAmount', '17': true},
    const {'1': 'exchangeAmount', '3': 13, '4': 1, '5': 11, '6': '.proto.Money', '9': 12, '10': 'exchangeAmount', '17': true},
  ],
  '4': const [PaymentInfo_Currency$json, PaymentInfo_Status$json, PaymentInfo_TxnStatus$json],
  '8': const [
    const {'1': '_currencyDeprecated'},
    const {'1': '_amount1000'},
    const {'1': '_receiverJid'},
    const {'1': '_status'},
    const {'1': '_transactionTimestamp'},
    const {'1': '_requestMessageKey'},
    const {'1': '_expiryTimestamp'},
    const {'1': '_futureproofed'},
    const {'1': '_currency'},
    const {'1': '_txnStatus'},
    const {'1': '_useNoviFiatFormat'},
    const {'1': '_primaryAmount'},
    const {'1': '_exchangeAmount'},
  ],
};

@$core.Deprecated('Use paymentInfoDescriptor instead')
const PaymentInfo_Currency$json = const {
  '1': 'Currency',
  '2': const [
    const {'1': 'UNKNOWN_CURRENCY', '2': 0},
    const {'1': 'INR', '2': 1},
  ],
};

@$core.Deprecated('Use paymentInfoDescriptor instead')
const PaymentInfo_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'UNKNOWN_STATUS', '2': 0},
    const {'1': 'PROCESSING', '2': 1},
    const {'1': 'SENT', '2': 2},
    const {'1': 'NEED_TO_ACCEPT', '2': 3},
    const {'1': 'COMPLETE', '2': 4},
    const {'1': 'COULD_NOT_COMPLETE', '2': 5},
    const {'1': 'REFUNDED', '2': 6},
    const {'1': 'EXPIRED', '2': 7},
    const {'1': 'REJECTED', '2': 8},
    const {'1': 'CANCELLED', '2': 9},
    const {'1': 'WAITING_FOR_PAYER', '2': 10},
    const {'1': 'WAITING', '2': 11},
  ],
};

@$core.Deprecated('Use paymentInfoDescriptor instead')
const PaymentInfo_TxnStatus$json = const {
  '1': 'TxnStatus',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'PENDING_SETUP', '2': 1},
    const {'1': 'PENDING_RECEIVER_SETUP', '2': 2},
    const {'1': 'INIT', '2': 3},
    const {'1': 'SUCCESS', '2': 4},
    const {'1': 'COMPLETED', '2': 5},
    const {'1': 'FAILED', '2': 6},
    const {'1': 'FAILED_RISK', '2': 7},
    const {'1': 'FAILED_PROCESSING', '2': 8},
    const {'1': 'FAILED_RECEIVER_PROCESSING', '2': 9},
    const {'1': 'FAILED_DA', '2': 10},
    const {'1': 'FAILED_DA_FINAL', '2': 11},
    const {'1': 'REFUNDED_TXN', '2': 12},
    const {'1': 'REFUND_FAILED', '2': 13},
    const {'1': 'REFUND_FAILED_PROCESSING', '2': 14},
    const {'1': 'REFUND_FAILED_DA', '2': 15},
    const {'1': 'EXPIRED_TXN', '2': 16},
    const {'1': 'AUTH_CANCELED', '2': 17},
    const {'1': 'AUTH_CANCEL_FAILED_PROCESSING', '2': 18},
    const {'1': 'AUTH_CANCEL_FAILED', '2': 19},
    const {'1': 'COLLECT_INIT', '2': 20},
    const {'1': 'COLLECT_SUCCESS', '2': 21},
    const {'1': 'COLLECT_FAILED', '2': 22},
    const {'1': 'COLLECT_FAILED_RISK', '2': 23},
    const {'1': 'COLLECT_REJECTED', '2': 24},
    const {'1': 'COLLECT_EXPIRED', '2': 25},
    const {'1': 'COLLECT_CANCELED', '2': 26},
    const {'1': 'COLLECT_CANCELLING', '2': 27},
    const {'1': 'IN_REVIEW', '2': 28},
    const {'1': 'REVERSAL_SUCCESS', '2': 29},
    const {'1': 'REVERSAL_PENDING', '2': 30},
    const {'1': 'REFUND_PENDING', '2': 31},
  ],
};

/// Descriptor for `PaymentInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentInfoDescriptor = $convert.base64Decode('CgtQYXltZW50SW5mbxJQChJjdXJyZW5jeURlcHJlY2F0ZWQYASABKA4yGy5wcm90by5QYXltZW50SW5mby5DdXJyZW5jeUgAUhJjdXJyZW5jeURlcHJlY2F0ZWSIAQESIwoKYW1vdW50MTAwMBgCIAEoBEgBUgphbW91bnQxMDAwiAEBEiUKC3JlY2VpdmVySmlkGAMgASgJSAJSC3JlY2VpdmVySmlkiAEBEjYKBnN0YXR1cxgEIAEoDjIZLnByb3RvLlBheW1lbnRJbmZvLlN0YXR1c0gDUgZzdGF0dXOIAQESNwoUdHJhbnNhY3Rpb25UaW1lc3RhbXAYBSABKARIBFIUdHJhbnNhY3Rpb25UaW1lc3RhbXCIAQESRAoRcmVxdWVzdE1lc3NhZ2VLZXkYBiABKAsyES5wcm90by5NZXNzYWdlS2V5SAVSEXJlcXVlc3RNZXNzYWdlS2V5iAEBEi0KD2V4cGlyeVRpbWVzdGFtcBgHIAEoBEgGUg9leHBpcnlUaW1lc3RhbXCIAQESKQoNZnV0dXJlcHJvb2ZlZBgIIAEoCEgHUg1mdXR1cmVwcm9vZmVkiAEBEh8KCGN1cnJlbmN5GAkgASgJSAhSCGN1cnJlbmN5iAEBEj8KCXR4blN0YXR1cxgKIAEoDjIcLnByb3RvLlBheW1lbnRJbmZvLlR4blN0YXR1c0gJUgl0eG5TdGF0dXOIAQESMQoRdXNlTm92aUZpYXRGb3JtYXQYCyABKAhIClIRdXNlTm92aUZpYXRGb3JtYXSIAQESNwoNcHJpbWFyeUFtb3VudBgMIAEoCzIMLnByb3RvLk1vbmV5SAtSDXByaW1hcnlBbW91bnSIAQESOQoOZXhjaGFuZ2VBbW91bnQYDSABKAsyDC5wcm90by5Nb25leUgMUg5leGNoYW5nZUFtb3VudIgBASIpCghDdXJyZW5jeRIUChBVTktOT1dOX0NVUlJFTkNZEAASBwoDSU5SEAEizAEKBlN0YXR1cxISCg5VTktOT1dOX1NUQVRVUxAAEg4KClBST0NFU1NJTkcQARIICgRTRU5UEAISEgoOTkVFRF9UT19BQ0NFUFQQAxIMCghDT01QTEVURRAEEhYKEkNPVUxEX05PVF9DT01QTEVURRAFEgwKCFJFRlVOREVEEAYSCwoHRVhQSVJFRBAHEgwKCFJFSkVDVEVEEAgSDQoJQ0FOQ0VMTEVEEAkSFQoRV0FJVElOR19GT1JfUEFZRVIQChILCgdXQUlUSU5HEAsimQUKCVR4blN0YXR1cxILCgdVTktOT1dOEAASEQoNUEVORElOR19TRVRVUBABEhoKFlBFTkRJTkdfUkVDRUlWRVJfU0VUVVAQAhIICgRJTklUEAMSCwoHU1VDQ0VTUxAEEg0KCUNPTVBMRVRFRBAFEgoKBkZBSUxFRBAGEg8KC0ZBSUxFRF9SSVNLEAcSFQoRRkFJTEVEX1BST0NFU1NJTkcQCBIeChpGQUlMRURfUkVDRUlWRVJfUFJPQ0VTU0lORxAJEg0KCUZBSUxFRF9EQRAKEhMKD0ZBSUxFRF9EQV9GSU5BTBALEhAKDFJFRlVOREVEX1RYThAMEhEKDVJFRlVORF9GQUlMRUQQDRIcChhSRUZVTkRfRkFJTEVEX1BST0NFU1NJTkcQDhIUChBSRUZVTkRfRkFJTEVEX0RBEA8SDwoLRVhQSVJFRF9UWE4QEBIRCg1BVVRIX0NBTkNFTEVEEBESIQodQVVUSF9DQU5DRUxfRkFJTEVEX1BST0NFU1NJTkcQEhIWChJBVVRIX0NBTkNFTF9GQUlMRUQQExIQCgxDT0xMRUNUX0lOSVQQFBITCg9DT0xMRUNUX1NVQ0NFU1MQFRISCg5DT0xMRUNUX0ZBSUxFRBAWEhcKE0NPTExFQ1RfRkFJTEVEX1JJU0sQFxIUChBDT0xMRUNUX1JFSkVDVEVEEBgSEwoPQ09MTEVDVF9FWFBJUkVEEBkSFAoQQ09MTEVDVF9DQU5DRUxFRBAaEhYKEkNPTExFQ1RfQ0FOQ0VMTElORxAbEg0KCUlOX1JFVklFVxAcEhQKEFJFVkVSU0FMX1NVQ0NFU1MQHRIUChBSRVZFUlNBTF9QRU5ESU5HEB4SEgoOUkVGVU5EX1BFTkRJTkcQH0IVChNfY3VycmVuY3lEZXByZWNhdGVkQg0KC19hbW91bnQxMDAwQg4KDF9yZWNlaXZlckppZEIJCgdfc3RhdHVzQhcKFV90cmFuc2FjdGlvblRpbWVzdGFtcEIUChJfcmVxdWVzdE1lc3NhZ2VLZXlCEgoQX2V4cGlyeVRpbWVzdGFtcEIQCg5fZnV0dXJlcHJvb2ZlZEILCglfY3VycmVuY3lCDAoKX3R4blN0YXR1c0IUChJfdXNlTm92aUZpYXRGb3JtYXRCEAoOX3ByaW1hcnlBbW91bnRCEQoPX2V4Y2hhbmdlQW1vdW50');
@$core.Deprecated('Use phoneNumberToLIDMappingDescriptor instead')
const PhoneNumberToLIDMapping$json = const {
  '1': 'PhoneNumberToLIDMapping',
  '2': const [
    const {'1': 'pnJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'pnJid', '17': true},
    const {'1': 'lidJid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'lidJid', '17': true},
  ],
  '8': const [
    const {'1': '_pnJid'},
    const {'1': '_lidJid'},
  ],
};

/// Descriptor for `PhoneNumberToLIDMapping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List phoneNumberToLIDMappingDescriptor = $convert.base64Decode('ChdQaG9uZU51bWJlclRvTElETWFwcGluZxIZCgVwbkppZBgBIAEoCUgAUgVwbkppZIgBARIbCgZsaWRKaWQYAiABKAlIAVIGbGlkSmlkiAEBQggKBl9wbkppZEIJCgdfbGlkSmlk');
@$core.Deprecated('Use photoChangeDescriptor instead')
const PhotoChange$json = const {
  '1': 'PhotoChange',
  '2': const [
    const {'1': 'oldPhoto', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'oldPhoto', '17': true},
    const {'1': 'newPhoto', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'newPhoto', '17': true},
    const {'1': 'newPhotoId', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'newPhotoId', '17': true},
  ],
  '8': const [
    const {'1': '_oldPhoto'},
    const {'1': '_newPhoto'},
    const {'1': '_newPhotoId'},
  ],
};

/// Descriptor for `PhotoChange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List photoChangeDescriptor = $convert.base64Decode('CgtQaG90b0NoYW5nZRIfCghvbGRQaG90bxgBIAEoDEgAUghvbGRQaG90b4gBARIfCghuZXdQaG90bxgCIAEoDEgBUghuZXdQaG90b4gBARIjCgpuZXdQaG90b0lkGAMgASgNSAJSCm5ld1Bob3RvSWSIAQFCCwoJX29sZFBob3RvQgsKCV9uZXdQaG90b0INCgtfbmV3UGhvdG9JZA==');
@$core.Deprecated('Use pinInChatDescriptor instead')
const PinInChat$json = const {
  '1': 'PinInChat',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.PinInChat.Type', '9': 0, '10': 'type', '17': true},
    const {'1': 'key', '3': 2, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 1, '10': 'key', '17': true},
    const {'1': 'senderTimestampMs', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'senderTimestampMs', '17': true},
    const {'1': 'serverTimestampMs', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'serverTimestampMs', '17': true},
    const {'1': 'messageAddOnContextInfo', '3': 5, '4': 1, '5': 11, '6': '.proto.MessageAddOnContextInfo', '9': 4, '10': 'messageAddOnContextInfo', '17': true},
  ],
  '4': const [PinInChat_Type$json],
  '8': const [
    const {'1': '_type'},
    const {'1': '_key'},
    const {'1': '_senderTimestampMs'},
    const {'1': '_serverTimestampMs'},
    const {'1': '_messageAddOnContextInfo'},
  ],
};

@$core.Deprecated('Use pinInChatDescriptor instead')
const PinInChat_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN_TYPE', '2': 0},
    const {'1': 'PIN_FOR_ALL', '2': 1},
    const {'1': 'UNPIN_FOR_ALL', '2': 2},
  ],
};

/// Descriptor for `PinInChat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pinInChatDescriptor = $convert.base64Decode('CglQaW5JbkNoYXQSLgoEdHlwZRgBIAEoDjIVLnByb3RvLlBpbkluQ2hhdC5UeXBlSABSBHR5cGWIAQESKAoDa2V5GAIgASgLMhEucHJvdG8uTWVzc2FnZUtleUgBUgNrZXmIAQESMQoRc2VuZGVyVGltZXN0YW1wTXMYAyABKANIAlIRc2VuZGVyVGltZXN0YW1wTXOIAQESMQoRc2VydmVyVGltZXN0YW1wTXMYBCABKANIA1IRc2VydmVyVGltZXN0YW1wTXOIAQESXQoXbWVzc2FnZUFkZE9uQ29udGV4dEluZm8YBSABKAsyHi5wcm90by5NZXNzYWdlQWRkT25Db250ZXh0SW5mb0gEUhdtZXNzYWdlQWRkT25Db250ZXh0SW5mb4gBASI8CgRUeXBlEhAKDFVOS05PV05fVFlQRRAAEg8KC1BJTl9GT1JfQUxMEAESEQoNVU5QSU5fRk9SX0FMTBACQgcKBV90eXBlQgYKBF9rZXlCFAoSX3NlbmRlclRpbWVzdGFtcE1zQhQKEl9zZXJ2ZXJUaW1lc3RhbXBNc0IaChhfbWVzc2FnZUFkZE9uQ29udGV4dEluZm8=');
@$core.Deprecated('Use pointDescriptor instead')
const Point$json = const {
  '1': 'Point',
  '2': const [
    const {'1': 'xDeprecated', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'xDeprecated', '17': true},
    const {'1': 'yDeprecated', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'yDeprecated', '17': true},
    const {'1': 'x', '3': 3, '4': 1, '5': 1, '9': 2, '10': 'x', '17': true},
    const {'1': 'y', '3': 4, '4': 1, '5': 1, '9': 3, '10': 'y', '17': true},
  ],
  '8': const [
    const {'1': '_xDeprecated'},
    const {'1': '_yDeprecated'},
    const {'1': '_x'},
    const {'1': '_y'},
  ],
};

/// Descriptor for `Point`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pointDescriptor = $convert.base64Decode('CgVQb2ludBIlCgt4RGVwcmVjYXRlZBgBIAEoBUgAUgt4RGVwcmVjYXRlZIgBARIlCgt5RGVwcmVjYXRlZBgCIAEoBUgBUgt5RGVwcmVjYXRlZIgBARIRCgF4GAMgASgBSAJSAXiIAQESEQoBeRgEIAEoAUgDUgF5iAEBQg4KDF94RGVwcmVjYXRlZEIOCgxfeURlcHJlY2F0ZWRCBAoCX3hCBAoCX3k=');
@$core.Deprecated('Use pollAdditionalMetadataDescriptor instead')
const PollAdditionalMetadata$json = const {
  '1': 'PollAdditionalMetadata',
  '2': const [
    const {'1': 'pollInvalidated', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'pollInvalidated', '17': true},
  ],
  '8': const [
    const {'1': '_pollInvalidated'},
  ],
};

/// Descriptor for `PollAdditionalMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollAdditionalMetadataDescriptor = $convert.base64Decode('ChZQb2xsQWRkaXRpb25hbE1ldGFkYXRhEi0KD3BvbGxJbnZhbGlkYXRlZBgBIAEoCEgAUg9wb2xsSW52YWxpZGF0ZWSIAQFCEgoQX3BvbGxJbnZhbGlkYXRlZA==');
@$core.Deprecated('Use pollEncValueDescriptor instead')
const PollEncValue$json = const {
  '1': 'PollEncValue',
  '2': const [
    const {'1': 'encPayload', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'encPayload', '17': true},
    const {'1': 'encIv', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'encIv', '17': true},
  ],
  '8': const [
    const {'1': '_encPayload'},
    const {'1': '_encIv'},
  ],
};

/// Descriptor for `PollEncValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollEncValueDescriptor = $convert.base64Decode('CgxQb2xsRW5jVmFsdWUSIwoKZW5jUGF5bG9hZBgBIAEoDEgAUgplbmNQYXlsb2FkiAEBEhkKBWVuY0l2GAIgASgMSAFSBWVuY0l2iAEBQg0KC19lbmNQYXlsb2FkQggKBl9lbmNJdg==');
@$core.Deprecated('Use pollUpdateDescriptor instead')
const PollUpdate$json = const {
  '1': 'PollUpdate',
  '2': const [
    const {'1': 'pollUpdateMessageKey', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'pollUpdateMessageKey', '17': true},
    const {'1': 'vote', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.PollVoteMessage', '9': 1, '10': 'vote', '17': true},
    const {'1': 'senderTimestampMs', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'senderTimestampMs', '17': true},
    const {'1': 'serverTimestampMs', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'serverTimestampMs', '17': true},
    const {'1': 'unread', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'unread', '17': true},
  ],
  '8': const [
    const {'1': '_pollUpdateMessageKey'},
    const {'1': '_vote'},
    const {'1': '_senderTimestampMs'},
    const {'1': '_serverTimestampMs'},
    const {'1': '_unread'},
  ],
};

/// Descriptor for `PollUpdate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pollUpdateDescriptor = $convert.base64Decode('CgpQb2xsVXBkYXRlEkoKFHBvbGxVcGRhdGVNZXNzYWdlS2V5GAEgASgLMhEucHJvdG8uTWVzc2FnZUtleUgAUhRwb2xsVXBkYXRlTWVzc2FnZUtleYgBARI3CgR2b3RlGAIgASgLMh4ucHJvdG8uTWVzc2FnZS5Qb2xsVm90ZU1lc3NhZ2VIAVIEdm90ZYgBARIxChFzZW5kZXJUaW1lc3RhbXBNcxgDIAEoA0gCUhFzZW5kZXJUaW1lc3RhbXBNc4gBARIxChFzZXJ2ZXJUaW1lc3RhbXBNcxgEIAEoA0gDUhFzZXJ2ZXJUaW1lc3RhbXBNc4gBARIbCgZ1bnJlYWQYBSABKAhIBFIGdW5yZWFkiAEBQhcKFV9wb2xsVXBkYXRlTWVzc2FnZUtleUIHCgVfdm90ZUIUChJfc2VuZGVyVGltZXN0YW1wTXNCFAoSX3NlcnZlclRpbWVzdGFtcE1zQgkKB191bnJlYWQ=');
@$core.Deprecated('Use preKeyRecordStructureDescriptor instead')
const PreKeyRecordStructure$json = const {
  '1': 'PreKeyRecordStructure',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'id', '17': true},
    const {'1': 'publicKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'publicKey', '17': true},
    const {'1': 'privateKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'privateKey', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_publicKey'},
    const {'1': '_privateKey'},
  ],
};

/// Descriptor for `PreKeyRecordStructure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preKeyRecordStructureDescriptor = $convert.base64Decode('ChVQcmVLZXlSZWNvcmRTdHJ1Y3R1cmUSEwoCaWQYASABKA1IAFICaWSIAQESIQoJcHVibGljS2V5GAIgASgMSAFSCXB1YmxpY0tleYgBARIjCgpwcml2YXRlS2V5GAMgASgMSAJSCnByaXZhdGVLZXmIAQFCBQoDX2lkQgwKCl9wdWJsaWNLZXlCDQoLX3ByaXZhdGVLZXk=');
@$core.Deprecated('Use preKeySignalMessageDescriptor instead')
const PreKeySignalMessage$json = const {
  '1': 'PreKeySignalMessage',
  '2': const [
    const {'1': 'registrationId', '3': 5, '4': 1, '5': 13, '9': 0, '10': 'registrationId', '17': true},
    const {'1': 'preKeyId', '3': 1, '4': 1, '5': 13, '9': 1, '10': 'preKeyId', '17': true},
    const {'1': 'signedPreKeyId', '3': 6, '4': 1, '5': 13, '9': 2, '10': 'signedPreKeyId', '17': true},
    const {'1': 'baseKey', '3': 2, '4': 1, '5': 12, '9': 3, '10': 'baseKey', '17': true},
    const {'1': 'identityKey', '3': 3, '4': 1, '5': 12, '9': 4, '10': 'identityKey', '17': true},
    const {'1': 'message', '3': 4, '4': 1, '5': 12, '9': 5, '10': 'message', '17': true},
  ],
  '8': const [
    const {'1': '_registrationId'},
    const {'1': '_preKeyId'},
    const {'1': '_signedPreKeyId'},
    const {'1': '_baseKey'},
    const {'1': '_identityKey'},
    const {'1': '_message'},
  ],
};

/// Descriptor for `PreKeySignalMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List preKeySignalMessageDescriptor = $convert.base64Decode('ChNQcmVLZXlTaWduYWxNZXNzYWdlEisKDnJlZ2lzdHJhdGlvbklkGAUgASgNSABSDnJlZ2lzdHJhdGlvbklkiAEBEh8KCHByZUtleUlkGAEgASgNSAFSCHByZUtleUlkiAEBEisKDnNpZ25lZFByZUtleUlkGAYgASgNSAJSDnNpZ25lZFByZUtleUlkiAEBEh0KB2Jhc2VLZXkYAiABKAxIA1IHYmFzZUtleYgBARIlCgtpZGVudGl0eUtleRgDIAEoDEgEUgtpZGVudGl0eUtleYgBARIdCgdtZXNzYWdlGAQgASgMSAVSB21lc3NhZ2WIAQFCEQoPX3JlZ2lzdHJhdGlvbklkQgsKCV9wcmVLZXlJZEIRCg9fc2lnbmVkUHJlS2V5SWRCCgoIX2Jhc2VLZXlCDgoMX2lkZW50aXR5S2V5QgoKCF9tZXNzYWdl');
@$core.Deprecated('Use premiumMessageInfoDescriptor instead')
const PremiumMessageInfo$json = const {
  '1': 'PremiumMessageInfo',
  '2': const [
    const {'1': 'serverCampaignId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'serverCampaignId', '17': true},
  ],
  '8': const [
    const {'1': '_serverCampaignId'},
  ],
};

/// Descriptor for `PremiumMessageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List premiumMessageInfoDescriptor = $convert.base64Decode('ChJQcmVtaXVtTWVzc2FnZUluZm8SLwoQc2VydmVyQ2FtcGFpZ25JZBgBIAEoCUgAUhBzZXJ2ZXJDYW1wYWlnbklkiAEBQhMKEV9zZXJ2ZXJDYW1wYWlnbklk');
@$core.Deprecated('Use primaryEphemeralIdentityDescriptor instead')
const PrimaryEphemeralIdentity$json = const {
  '1': 'PrimaryEphemeralIdentity',
  '2': const [
    const {'1': 'publicKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'publicKey', '17': true},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'nonce', '17': true},
  ],
  '8': const [
    const {'1': '_publicKey'},
    const {'1': '_nonce'},
  ],
};

/// Descriptor for `PrimaryEphemeralIdentity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List primaryEphemeralIdentityDescriptor = $convert.base64Decode('ChhQcmltYXJ5RXBoZW1lcmFsSWRlbnRpdHkSIQoJcHVibGljS2V5GAEgASgMSABSCXB1YmxpY0tleYgBARIZCgVub25jZRgCIAEoDEgBUgVub25jZYgBAUIMCgpfcHVibGljS2V5QggKBl9ub25jZQ==');
@$core.Deprecated('Use processedVideoDescriptor instead')
const ProcessedVideo$json = const {
  '1': 'ProcessedVideo',
  '2': const [
    const {'1': 'directPath', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'directPath', '17': true},
    const {'1': 'fileSha256', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'fileSha256', '17': true},
    const {'1': 'height', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'height', '17': true},
    const {'1': 'width', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'width', '17': true},
    const {'1': 'fileLength', '3': 5, '4': 1, '5': 4, '9': 4, '10': 'fileLength', '17': true},
    const {'1': 'bitrate', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'bitrate', '17': true},
    const {'1': 'quality', '3': 7, '4': 1, '5': 14, '6': '.proto.ProcessedVideo.VideoQuality', '9': 6, '10': 'quality', '17': true},
    const {'1': 'capabilities', '3': 8, '4': 3, '5': 9, '10': 'capabilities'},
  ],
  '4': const [ProcessedVideo_VideoQuality$json],
  '8': const [
    const {'1': '_directPath'},
    const {'1': '_fileSha256'},
    const {'1': '_height'},
    const {'1': '_width'},
    const {'1': '_fileLength'},
    const {'1': '_bitrate'},
    const {'1': '_quality'},
  ],
};

@$core.Deprecated('Use processedVideoDescriptor instead')
const ProcessedVideo_VideoQuality$json = const {
  '1': 'VideoQuality',
  '2': const [
    const {'1': 'UNDEFINED', '2': 0},
    const {'1': 'LOW', '2': 1},
    const {'1': 'MID', '2': 2},
    const {'1': 'HIGH', '2': 3},
  ],
};

/// Descriptor for `ProcessedVideo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List processedVideoDescriptor = $convert.base64Decode('Cg5Qcm9jZXNzZWRWaWRlbxIjCgpkaXJlY3RQYXRoGAEgASgJSABSCmRpcmVjdFBhdGiIAQESIwoKZmlsZVNoYTI1NhgCIAEoDEgBUgpmaWxlU2hhMjU2iAEBEhsKBmhlaWdodBgDIAEoDUgCUgZoZWlnaHSIAQESGQoFd2lkdGgYBCABKA1IA1IFd2lkdGiIAQESIwoKZmlsZUxlbmd0aBgFIAEoBEgEUgpmaWxlTGVuZ3RoiAEBEh0KB2JpdHJhdGUYBiABKA1IBVIHYml0cmF0ZYgBARJBCgdxdWFsaXR5GAcgASgOMiIucHJvdG8uUHJvY2Vzc2VkVmlkZW8uVmlkZW9RdWFsaXR5SAZSB3F1YWxpdHmIAQESIgoMY2FwYWJpbGl0aWVzGAggAygJUgxjYXBhYmlsaXRpZXMiOQoMVmlkZW9RdWFsaXR5Eg0KCVVOREVGSU5FRBAAEgcKA0xPVxABEgcKA01JRBACEggKBEhJR0gQA0INCgtfZGlyZWN0UGF0aEINCgtfZmlsZVNoYTI1NkIJCgdfaGVpZ2h0QggKBl93aWR0aEINCgtfZmlsZUxlbmd0aEIKCghfYml0cmF0ZUIKCghfcXVhbGl0eQ==');
@$core.Deprecated('Use prologuePayloadDescriptor instead')
const ProloguePayload$json = const {
  '1': 'ProloguePayload',
  '2': const [
    const {'1': 'companionEphemeralIdentity', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'companionEphemeralIdentity', '17': true},
    const {'1': 'commitment', '3': 2, '4': 1, '5': 11, '6': '.proto.CompanionCommitment', '9': 1, '10': 'commitment', '17': true},
  ],
  '8': const [
    const {'1': '_companionEphemeralIdentity'},
    const {'1': '_commitment'},
  ],
};

/// Descriptor for `ProloguePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List prologuePayloadDescriptor = $convert.base64Decode('Cg9Qcm9sb2d1ZVBheWxvYWQSQwoaY29tcGFuaW9uRXBoZW1lcmFsSWRlbnRpdHkYASABKAxIAFIaY29tcGFuaW9uRXBoZW1lcmFsSWRlbnRpdHmIAQESPwoKY29tbWl0bWVudBgCIAEoCzIaLnByb3RvLkNvbXBhbmlvbkNvbW1pdG1lbnRIAVIKY29tbWl0bWVudIgBAUIdChtfY29tcGFuaW9uRXBoZW1lcmFsSWRlbnRpdHlCDQoLX2NvbW1pdG1lbnQ=');
@$core.Deprecated('Use pushnameDescriptor instead')
const Pushname$json = const {
  '1': 'Pushname',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
    const {'1': 'pushname', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'pushname', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_pushname'},
  ],
};

/// Descriptor for `Pushname`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pushnameDescriptor = $convert.base64Decode('CghQdXNobmFtZRITCgJpZBgBIAEoCUgAUgJpZIgBARIfCghwdXNobmFtZRgCIAEoCUgBUghwdXNobmFtZYgBAUIFCgNfaWRCCwoJX3B1c2huYW1l');
@$core.Deprecated('Use quarantinedMessageDescriptor instead')
const QuarantinedMessage$json = const {
  '1': 'QuarantinedMessage',
  '2': const [
    const {'1': 'originalData', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'originalData', '17': true},
    const {'1': 'extractedText', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'extractedText', '17': true},
  ],
  '8': const [
    const {'1': '_originalData'},
    const {'1': '_extractedText'},
  ],
};

/// Descriptor for `QuarantinedMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List quarantinedMessageDescriptor = $convert.base64Decode('ChJRdWFyYW50aW5lZE1lc3NhZ2USJwoMb3JpZ2luYWxEYXRhGAEgASgMSABSDG9yaWdpbmFsRGF0YYgBARIpCg1leHRyYWN0ZWRUZXh0GAIgASgJSAFSDWV4dHJhY3RlZFRleHSIAQFCDwoNX29yaWdpbmFsRGF0YUIQCg5fZXh0cmFjdGVkVGV4dA==');
@$core.Deprecated('Use reactionDescriptor instead')
const Reaction$json = const {
  '1': 'Reaction',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'text', '17': true},
    const {'1': 'groupingKey', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'groupingKey', '17': true},
    const {'1': 'senderTimestampMs', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'senderTimestampMs', '17': true},
    const {'1': 'unread', '3': 5, '4': 1, '5': 8, '9': 4, '10': 'unread', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_text'},
    const {'1': '_groupingKey'},
    const {'1': '_senderTimestampMs'},
    const {'1': '_unread'},
  ],
};

/// Descriptor for `Reaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reactionDescriptor = $convert.base64Decode('CghSZWFjdGlvbhIoCgNrZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5SABSA2tleYgBARIXCgR0ZXh0GAIgASgJSAFSBHRleHSIAQESJQoLZ3JvdXBpbmdLZXkYAyABKAlIAlILZ3JvdXBpbmdLZXmIAQESMQoRc2VuZGVyVGltZXN0YW1wTXMYBCABKANIA1IRc2VuZGVyVGltZXN0YW1wTXOIAQESGwoGdW5yZWFkGAUgASgISARSBnVucmVhZIgBAUIGCgRfa2V5QgcKBV90ZXh0Qg4KDF9ncm91cGluZ0tleUIUChJfc2VuZGVyVGltZXN0YW1wTXNCCQoHX3VucmVhZA==');
@$core.Deprecated('Use recentEmojiWeightDescriptor instead')
const RecentEmojiWeight$json = const {
  '1': 'RecentEmojiWeight',
  '2': const [
    const {'1': 'emoji', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'emoji', '17': true},
    const {'1': 'weight', '3': 2, '4': 1, '5': 2, '9': 1, '10': 'weight', '17': true},
  ],
  '8': const [
    const {'1': '_emoji'},
    const {'1': '_weight'},
  ],
};

/// Descriptor for `RecentEmojiWeight`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recentEmojiWeightDescriptor = $convert.base64Decode('ChFSZWNlbnRFbW9qaVdlaWdodBIZCgVlbW9qaRgBIAEoCUgAUgVlbW9qaYgBARIbCgZ3ZWlnaHQYAiABKAJIAVIGd2VpZ2h0iAEBQggKBl9lbW9qaUIJCgdfd2VpZ2h0');
@$core.Deprecated('Use recordStructureDescriptor instead')
const RecordStructure$json = const {
  '1': 'RecordStructure',
  '2': const [
    const {'1': 'currentSession', '3': 1, '4': 1, '5': 11, '6': '.proto.SessionStructure', '9': 0, '10': 'currentSession', '17': true},
    const {'1': 'previousSessions', '3': 2, '4': 3, '5': 11, '6': '.proto.SessionStructure', '10': 'previousSessions'},
  ],
  '8': const [
    const {'1': '_currentSession'},
  ],
};

/// Descriptor for `RecordStructure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordStructureDescriptor = $convert.base64Decode('Cg9SZWNvcmRTdHJ1Y3R1cmUSRAoOY3VycmVudFNlc3Npb24YASABKAsyFy5wcm90by5TZXNzaW9uU3RydWN0dXJlSABSDmN1cnJlbnRTZXNzaW9uiAEBEkMKEHByZXZpb3VzU2Vzc2lvbnMYAiADKAsyFy5wcm90by5TZXNzaW9uU3RydWN0dXJlUhBwcmV2aW91c1Nlc3Npb25zQhEKD19jdXJyZW50U2Vzc2lvbg==');
@$core.Deprecated('Use reportableDescriptor instead')
const Reportable$json = const {
  '1': 'Reportable',
  '2': const [
    const {'1': 'minVersion', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'minVersion', '17': true},
    const {'1': 'maxVersion', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'maxVersion', '17': true},
    const {'1': 'notReportableMinVersion', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'notReportableMinVersion', '17': true},
    const {'1': 'never', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'never', '17': true},
  ],
  '8': const [
    const {'1': '_minVersion'},
    const {'1': '_maxVersion'},
    const {'1': '_notReportableMinVersion'},
    const {'1': '_never'},
  ],
};

/// Descriptor for `Reportable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportableDescriptor = $convert.base64Decode('CgpSZXBvcnRhYmxlEiMKCm1pblZlcnNpb24YASABKA1IAFIKbWluVmVyc2lvbogBARIjCgptYXhWZXJzaW9uGAIgASgNSAFSCm1heFZlcnNpb26IAQESPQoXbm90UmVwb3J0YWJsZU1pblZlcnNpb24YAyABKA1IAlIXbm90UmVwb3J0YWJsZU1pblZlcnNpb26IAQESGQoFbmV2ZXIYBCABKAhIA1IFbmV2ZXKIAQFCDQoLX21pblZlcnNpb25CDQoLX21heFZlcnNpb25CGgoYX25vdFJlcG9ydGFibGVNaW5WZXJzaW9uQggKBl9uZXZlcg==');
@$core.Deprecated('Use reportingTokenInfoDescriptor instead')
const ReportingTokenInfo$json = const {
  '1': 'ReportingTokenInfo',
  '2': const [
    const {'1': 'reportingTag', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'reportingTag', '17': true},
  ],
  '8': const [
    const {'1': '_reportingTag'},
  ],
};

/// Descriptor for `ReportingTokenInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reportingTokenInfoDescriptor = $convert.base64Decode('ChJSZXBvcnRpbmdUb2tlbkluZm8SJwoMcmVwb3J0aW5nVGFnGAEgASgMSABSDHJlcG9ydGluZ1RhZ4gBAUIPCg1fcmVwb3J0aW5nVGFn');
@$core.Deprecated('Use senderKeyDistributionMessageDescriptor instead')
const SenderKeyDistributionMessage$json = const {
  '1': 'SenderKeyDistributionMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'id', '17': true},
    const {'1': 'iteration', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'iteration', '17': true},
    const {'1': 'chainKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'chainKey', '17': true},
    const {'1': 'signingKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'signingKey', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_iteration'},
    const {'1': '_chainKey'},
    const {'1': '_signingKey'},
  ],
};

/// Descriptor for `SenderKeyDistributionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List senderKeyDistributionMessageDescriptor = $convert.base64Decode('ChxTZW5kZXJLZXlEaXN0cmlidXRpb25NZXNzYWdlEhMKAmlkGAEgASgNSABSAmlkiAEBEiEKCWl0ZXJhdGlvbhgCIAEoDUgBUglpdGVyYXRpb26IAQESHwoIY2hhaW5LZXkYAyABKAxIAlIIY2hhaW5LZXmIAQESIwoKc2lnbmluZ0tleRgEIAEoDEgDUgpzaWduaW5nS2V5iAEBQgUKA19pZEIMCgpfaXRlcmF0aW9uQgsKCV9jaGFpbktleUINCgtfc2lnbmluZ0tleQ==');
@$core.Deprecated('Use senderKeyMessageDescriptor instead')
const SenderKeyMessage$json = const {
  '1': 'SenderKeyMessage',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'id', '17': true},
    const {'1': 'iteration', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'iteration', '17': true},
    const {'1': 'ciphertext', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'ciphertext', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_iteration'},
    const {'1': '_ciphertext'},
  ],
};

/// Descriptor for `SenderKeyMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List senderKeyMessageDescriptor = $convert.base64Decode('ChBTZW5kZXJLZXlNZXNzYWdlEhMKAmlkGAEgASgNSABSAmlkiAEBEiEKCWl0ZXJhdGlvbhgCIAEoDUgBUglpdGVyYXRpb26IAQESIwoKY2lwaGVydGV4dBgDIAEoDEgCUgpjaXBoZXJ0ZXh0iAEBQgUKA19pZEIMCgpfaXRlcmF0aW9uQg0KC19jaXBoZXJ0ZXh0');
@$core.Deprecated('Use senderKeyRecordStructureDescriptor instead')
const SenderKeyRecordStructure$json = const {
  '1': 'SenderKeyRecordStructure',
  '2': const [
    const {'1': 'senderKeyStates', '3': 1, '4': 3, '5': 11, '6': '.proto.SenderKeyStateStructure', '10': 'senderKeyStates'},
  ],
};

/// Descriptor for `SenderKeyRecordStructure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List senderKeyRecordStructureDescriptor = $convert.base64Decode('ChhTZW5kZXJLZXlSZWNvcmRTdHJ1Y3R1cmUSSAoPc2VuZGVyS2V5U3RhdGVzGAEgAygLMh4ucHJvdG8uU2VuZGVyS2V5U3RhdGVTdHJ1Y3R1cmVSD3NlbmRlcktleVN0YXRlcw==');
@$core.Deprecated('Use senderKeyStateStructureDescriptor instead')
const SenderKeyStateStructure$json = const {
  '1': 'SenderKeyStateStructure',
  '2': const [
    const {'1': 'senderKeyId', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'senderKeyId', '17': true},
    const {'1': 'senderChainKey', '3': 2, '4': 1, '5': 11, '6': '.proto.SenderKeyStateStructure.SenderChainKey', '9': 1, '10': 'senderChainKey', '17': true},
    const {'1': 'senderSigningKey', '3': 3, '4': 1, '5': 11, '6': '.proto.SenderKeyStateStructure.SenderSigningKey', '9': 2, '10': 'senderSigningKey', '17': true},
    const {'1': 'senderMessageKeys', '3': 4, '4': 3, '5': 11, '6': '.proto.SenderKeyStateStructure.SenderMessageKey', '10': 'senderMessageKeys'},
  ],
  '3': const [SenderKeyStateStructure_SenderChainKey$json, SenderKeyStateStructure_SenderMessageKey$json, SenderKeyStateStructure_SenderSigningKey$json],
  '8': const [
    const {'1': '_senderKeyId'},
    const {'1': '_senderChainKey'},
    const {'1': '_senderSigningKey'},
  ],
};

@$core.Deprecated('Use senderKeyStateStructureDescriptor instead')
const SenderKeyStateStructure_SenderChainKey$json = const {
  '1': 'SenderChainKey',
  '2': const [
    const {'1': 'iteration', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'iteration', '17': true},
    const {'1': 'seed', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'seed', '17': true},
  ],
  '8': const [
    const {'1': '_iteration'},
    const {'1': '_seed'},
  ],
};

@$core.Deprecated('Use senderKeyStateStructureDescriptor instead')
const SenderKeyStateStructure_SenderMessageKey$json = const {
  '1': 'SenderMessageKey',
  '2': const [
    const {'1': 'iteration', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'iteration', '17': true},
    const {'1': 'seed', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'seed', '17': true},
  ],
  '8': const [
    const {'1': '_iteration'},
    const {'1': '_seed'},
  ],
};

@$core.Deprecated('Use senderKeyStateStructureDescriptor instead')
const SenderKeyStateStructure_SenderSigningKey$json = const {
  '1': 'SenderSigningKey',
  '2': const [
    const {'1': 'public', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'public', '17': true},
    const {'1': 'private', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'private', '17': true},
  ],
  '8': const [
    const {'1': '_public'},
    const {'1': '_private'},
  ],
};

/// Descriptor for `SenderKeyStateStructure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List senderKeyStateStructureDescriptor = $convert.base64Decode('ChdTZW5kZXJLZXlTdGF0ZVN0cnVjdHVyZRIlCgtzZW5kZXJLZXlJZBgBIAEoDUgAUgtzZW5kZXJLZXlJZIgBARJaCg5zZW5kZXJDaGFpbktleRgCIAEoCzItLnByb3RvLlNlbmRlcktleVN0YXRlU3RydWN0dXJlLlNlbmRlckNoYWluS2V5SAFSDnNlbmRlckNoYWluS2V5iAEBEmAKEHNlbmRlclNpZ25pbmdLZXkYAyABKAsyLy5wcm90by5TZW5kZXJLZXlTdGF0ZVN0cnVjdHVyZS5TZW5kZXJTaWduaW5nS2V5SAJSEHNlbmRlclNpZ25pbmdLZXmIAQESXQoRc2VuZGVyTWVzc2FnZUtleXMYBCADKAsyLy5wcm90by5TZW5kZXJLZXlTdGF0ZVN0cnVjdHVyZS5TZW5kZXJNZXNzYWdlS2V5UhFzZW5kZXJNZXNzYWdlS2V5cxpjCg5TZW5kZXJDaGFpbktleRIhCglpdGVyYXRpb24YASABKA1IAFIJaXRlcmF0aW9uiAEBEhcKBHNlZWQYAiABKAxIAVIEc2VlZIgBAUIMCgpfaXRlcmF0aW9uQgcKBV9zZWVkGmUKEFNlbmRlck1lc3NhZ2VLZXkSIQoJaXRlcmF0aW9uGAEgASgNSABSCWl0ZXJhdGlvbogBARIXCgRzZWVkGAIgASgMSAFSBHNlZWSIAQFCDAoKX2l0ZXJhdGlvbkIHCgVfc2VlZBplChBTZW5kZXJTaWduaW5nS2V5EhsKBnB1YmxpYxgBIAEoDEgAUgZwdWJsaWOIAQESHQoHcHJpdmF0ZRgCIAEoDEgBUgdwcml2YXRliAEBQgkKB19wdWJsaWNCCgoIX3ByaXZhdGVCDgoMX3NlbmRlcktleUlkQhEKD19zZW5kZXJDaGFpbktleUITChFfc2VuZGVyU2lnbmluZ0tleQ==');
@$core.Deprecated('Use serverErrorReceiptDescriptor instead')
const ServerErrorReceipt$json = const {
  '1': 'ServerErrorReceipt',
  '2': const [
    const {'1': 'stanzaId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'stanzaId', '17': true},
  ],
  '8': const [
    const {'1': '_stanzaId'},
  ],
};

/// Descriptor for `ServerErrorReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverErrorReceiptDescriptor = $convert.base64Decode('ChJTZXJ2ZXJFcnJvclJlY2VpcHQSHwoIc3RhbnphSWQYASABKAlIAFIIc3RhbnphSWSIAQFCCwoJX3N0YW56YUlk');
@$core.Deprecated('Use sessionStructureDescriptor instead')
const SessionStructure$json = const {
  '1': 'SessionStructure',
  '2': const [
    const {'1': 'sessionVersion', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'sessionVersion', '17': true},
    const {'1': 'localIdentityPublic', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'localIdentityPublic', '17': true},
    const {'1': 'remoteIdentityPublic', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'remoteIdentityPublic', '17': true},
    const {'1': 'rootKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'rootKey', '17': true},
    const {'1': 'previousCounter', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'previousCounter', '17': true},
    const {'1': 'senderChain', '3': 6, '4': 1, '5': 11, '6': '.proto.SessionStructure.Chain', '9': 5, '10': 'senderChain', '17': true},
    const {'1': 'receiverChains', '3': 7, '4': 3, '5': 11, '6': '.proto.SessionStructure.Chain', '10': 'receiverChains'},
    const {'1': 'pendingKeyExchange', '3': 8, '4': 1, '5': 11, '6': '.proto.SessionStructure.PendingKeyExchange', '9': 6, '10': 'pendingKeyExchange', '17': true},
    const {'1': 'pendingPreKey', '3': 9, '4': 1, '5': 11, '6': '.proto.SessionStructure.PendingPreKey', '9': 7, '10': 'pendingPreKey', '17': true},
    const {'1': 'remoteRegistrationId', '3': 10, '4': 1, '5': 13, '9': 8, '10': 'remoteRegistrationId', '17': true},
    const {'1': 'localRegistrationId', '3': 11, '4': 1, '5': 13, '9': 9, '10': 'localRegistrationId', '17': true},
    const {'1': 'needsRefresh', '3': 12, '4': 1, '5': 8, '9': 10, '10': 'needsRefresh', '17': true},
    const {'1': 'aliceBaseKey', '3': 13, '4': 1, '5': 12, '9': 11, '10': 'aliceBaseKey', '17': true},
  ],
  '3': const [SessionStructure_Chain$json, SessionStructure_PendingKeyExchange$json, SessionStructure_PendingPreKey$json],
  '8': const [
    const {'1': '_sessionVersion'},
    const {'1': '_localIdentityPublic'},
    const {'1': '_remoteIdentityPublic'},
    const {'1': '_rootKey'},
    const {'1': '_previousCounter'},
    const {'1': '_senderChain'},
    const {'1': '_pendingKeyExchange'},
    const {'1': '_pendingPreKey'},
    const {'1': '_remoteRegistrationId'},
    const {'1': '_localRegistrationId'},
    const {'1': '_needsRefresh'},
    const {'1': '_aliceBaseKey'},
  ],
};

@$core.Deprecated('Use sessionStructureDescriptor instead')
const SessionStructure_Chain$json = const {
  '1': 'Chain',
  '2': const [
    const {'1': 'senderRatchetKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'senderRatchetKey', '17': true},
    const {'1': 'senderRatchetKeyPrivate', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'senderRatchetKeyPrivate', '17': true},
    const {'1': 'chainKey', '3': 3, '4': 1, '5': 11, '6': '.proto.SessionStructure.Chain.ChainKey', '9': 2, '10': 'chainKey', '17': true},
    const {'1': 'messageKeys', '3': 4, '4': 3, '5': 11, '6': '.proto.SessionStructure.Chain.MessageKey', '10': 'messageKeys'},
  ],
  '3': const [SessionStructure_Chain_ChainKey$json, SessionStructure_Chain_MessageKey$json],
  '8': const [
    const {'1': '_senderRatchetKey'},
    const {'1': '_senderRatchetKeyPrivate'},
    const {'1': '_chainKey'},
  ],
};

@$core.Deprecated('Use sessionStructureDescriptor instead')
const SessionStructure_Chain_ChainKey$json = const {
  '1': 'ChainKey',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'index', '17': true},
    const {'1': 'key', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'key', '17': true},
  ],
  '8': const [
    const {'1': '_index'},
    const {'1': '_key'},
  ],
};

@$core.Deprecated('Use sessionStructureDescriptor instead')
const SessionStructure_Chain_MessageKey$json = const {
  '1': 'MessageKey',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'index', '17': true},
    const {'1': 'cipherKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'cipherKey', '17': true},
    const {'1': 'macKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'macKey', '17': true},
    const {'1': 'iv', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'iv', '17': true},
  ],
  '8': const [
    const {'1': '_index'},
    const {'1': '_cipherKey'},
    const {'1': '_macKey'},
    const {'1': '_iv'},
  ],
};

@$core.Deprecated('Use sessionStructureDescriptor instead')
const SessionStructure_PendingKeyExchange$json = const {
  '1': 'PendingKeyExchange',
  '2': const [
    const {'1': 'sequence', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'sequence', '17': true},
    const {'1': 'localBaseKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'localBaseKey', '17': true},
    const {'1': 'localBaseKeyPrivate', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'localBaseKeyPrivate', '17': true},
    const {'1': 'localRatchetKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'localRatchetKey', '17': true},
    const {'1': 'localRatchetKeyPrivate', '3': 5, '4': 1, '5': 12, '9': 4, '10': 'localRatchetKeyPrivate', '17': true},
    const {'1': 'localIdentityKey', '3': 7, '4': 1, '5': 12, '9': 5, '10': 'localIdentityKey', '17': true},
    const {'1': 'localIdentityKeyPrivate', '3': 8, '4': 1, '5': 12, '9': 6, '10': 'localIdentityKeyPrivate', '17': true},
  ],
  '8': const [
    const {'1': '_sequence'},
    const {'1': '_localBaseKey'},
    const {'1': '_localBaseKeyPrivate'},
    const {'1': '_localRatchetKey'},
    const {'1': '_localRatchetKeyPrivate'},
    const {'1': '_localIdentityKey'},
    const {'1': '_localIdentityKeyPrivate'},
  ],
};

@$core.Deprecated('Use sessionStructureDescriptor instead')
const SessionStructure_PendingPreKey$json = const {
  '1': 'PendingPreKey',
  '2': const [
    const {'1': 'preKeyId', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'preKeyId', '17': true},
    const {'1': 'signedPreKeyId', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'signedPreKeyId', '17': true},
    const {'1': 'baseKey', '3': 2, '4': 1, '5': 12, '9': 2, '10': 'baseKey', '17': true},
  ],
  '8': const [
    const {'1': '_preKeyId'},
    const {'1': '_signedPreKeyId'},
    const {'1': '_baseKey'},
  ],
};

/// Descriptor for `SessionStructure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionStructureDescriptor = $convert.base64Decode('ChBTZXNzaW9uU3RydWN0dXJlEisKDnNlc3Npb25WZXJzaW9uGAEgASgNSABSDnNlc3Npb25WZXJzaW9uiAEBEjUKE2xvY2FsSWRlbnRpdHlQdWJsaWMYAiABKAxIAVITbG9jYWxJZGVudGl0eVB1YmxpY4gBARI3ChRyZW1vdGVJZGVudGl0eVB1YmxpYxgDIAEoDEgCUhRyZW1vdGVJZGVudGl0eVB1YmxpY4gBARIdCgdyb290S2V5GAQgASgMSANSB3Jvb3RLZXmIAQESLQoPcHJldmlvdXNDb3VudGVyGAUgASgNSARSD3ByZXZpb3VzQ291bnRlcogBARJECgtzZW5kZXJDaGFpbhgGIAEoCzIdLnByb3RvLlNlc3Npb25TdHJ1Y3R1cmUuQ2hhaW5IBVILc2VuZGVyQ2hhaW6IAQESRQoOcmVjZWl2ZXJDaGFpbnMYByADKAsyHS5wcm90by5TZXNzaW9uU3RydWN0dXJlLkNoYWluUg5yZWNlaXZlckNoYWlucxJfChJwZW5kaW5nS2V5RXhjaGFuZ2UYCCABKAsyKi5wcm90by5TZXNzaW9uU3RydWN0dXJlLlBlbmRpbmdLZXlFeGNoYW5nZUgGUhJwZW5kaW5nS2V5RXhjaGFuZ2WIAQESUAoNcGVuZGluZ1ByZUtleRgJIAEoCzIlLnByb3RvLlNlc3Npb25TdHJ1Y3R1cmUuUGVuZGluZ1ByZUtleUgHUg1wZW5kaW5nUHJlS2V5iAEBEjcKFHJlbW90ZVJlZ2lzdHJhdGlvbklkGAogASgNSAhSFHJlbW90ZVJlZ2lzdHJhdGlvbklkiAEBEjUKE2xvY2FsUmVnaXN0cmF0aW9uSWQYCyABKA1ICVITbG9jYWxSZWdpc3RyYXRpb25JZIgBARInCgxuZWVkc1JlZnJlc2gYDCABKAhIClIMbmVlZHNSZWZyZXNoiAEBEicKDGFsaWNlQmFzZUtleRgNIAEoDEgLUgxhbGljZUJhc2VLZXmIAQEawwQKBUNoYWluEi8KEHNlbmRlclJhdGNoZXRLZXkYASABKAxIAFIQc2VuZGVyUmF0Y2hldEtleYgBARI9ChdzZW5kZXJSYXRjaGV0S2V5UHJpdmF0ZRgCIAEoDEgBUhdzZW5kZXJSYXRjaGV0S2V5UHJpdmF0ZYgBARJHCghjaGFpbktleRgDIAEoCzImLnByb3RvLlNlc3Npb25TdHJ1Y3R1cmUuQ2hhaW4uQ2hhaW5LZXlIAlIIY2hhaW5LZXmIAQESSgoLbWVzc2FnZUtleXMYBCADKAsyKC5wcm90by5TZXNzaW9uU3RydWN0dXJlLkNoYWluLk1lc3NhZ2VLZXlSC21lc3NhZ2VLZXlzGk4KCENoYWluS2V5EhkKBWluZGV4GAEgASgNSABSBWluZGV4iAEBEhUKA2tleRgCIAEoDEgBUgNrZXmIAQFCCAoGX2luZGV4QgYKBF9rZXkapgEKCk1lc3NhZ2VLZXkSGQoFaW5kZXgYASABKA1IAFIFaW5kZXiIAQESIQoJY2lwaGVyS2V5GAIgASgMSAFSCWNpcGhlcktleYgBARIbCgZtYWNLZXkYAyABKAxIAlIGbWFjS2V5iAEBEhMKAml2GAQgASgMSANSAml2iAEBQggKBl9pbmRleEIMCgpfY2lwaGVyS2V5QgkKB19tYWNLZXlCBQoDX2l2QhMKEV9zZW5kZXJSYXRjaGV0S2V5QhoKGF9zZW5kZXJSYXRjaGV0S2V5UHJpdmF0ZUILCglfY2hhaW5LZXkahwQKElBlbmRpbmdLZXlFeGNoYW5nZRIfCghzZXF1ZW5jZRgBIAEoDUgAUghzZXF1ZW5jZYgBARInCgxsb2NhbEJhc2VLZXkYAiABKAxIAVIMbG9jYWxCYXNlS2V5iAEBEjUKE2xvY2FsQmFzZUtleVByaXZhdGUYAyABKAxIAlITbG9jYWxCYXNlS2V5UHJpdmF0ZYgBARItCg9sb2NhbFJhdGNoZXRLZXkYBCABKAxIA1IPbG9jYWxSYXRjaGV0S2V5iAEBEjsKFmxvY2FsUmF0Y2hldEtleVByaXZhdGUYBSABKAxIBFIWbG9jYWxSYXRjaGV0S2V5UHJpdmF0ZYgBARIvChBsb2NhbElkZW50aXR5S2V5GAcgASgMSAVSEGxvY2FsSWRlbnRpdHlLZXmIAQESPQoXbG9jYWxJZGVudGl0eUtleVByaXZhdGUYCCABKAxIBlIXbG9jYWxJZGVudGl0eUtleVByaXZhdGWIAQFCCwoJX3NlcXVlbmNlQg8KDV9sb2NhbEJhc2VLZXlCFgoUX2xvY2FsQmFzZUtleVByaXZhdGVCEgoQX2xvY2FsUmF0Y2hldEtleUIZChdfbG9jYWxSYXRjaGV0S2V5UHJpdmF0ZUITChFfbG9jYWxJZGVudGl0eUtleUIaChhfbG9jYWxJZGVudGl0eUtleVByaXZhdGUaqAEKDVBlbmRpbmdQcmVLZXkSHwoIcHJlS2V5SWQYASABKA1IAFIIcHJlS2V5SWSIAQESKwoOc2lnbmVkUHJlS2V5SWQYAyABKAVIAVIOc2lnbmVkUHJlS2V5SWSIAQESHQoHYmFzZUtleRgCIAEoDEgCUgdiYXNlS2V5iAEBQgsKCV9wcmVLZXlJZEIRCg9fc2lnbmVkUHJlS2V5SWRCCgoIX2Jhc2VLZXlCEQoPX3Nlc3Npb25WZXJzaW9uQhYKFF9sb2NhbElkZW50aXR5UHVibGljQhcKFV9yZW1vdGVJZGVudGl0eVB1YmxpY0IKCghfcm9vdEtleUISChBfcHJldmlvdXNDb3VudGVyQg4KDF9zZW5kZXJDaGFpbkIVChNfcGVuZGluZ0tleUV4Y2hhbmdlQhAKDl9wZW5kaW5nUHJlS2V5QhcKFV9yZW1vdGVSZWdpc3RyYXRpb25JZEIWChRfbG9jYWxSZWdpc3RyYXRpb25JZEIPCg1fbmVlZHNSZWZyZXNoQg8KDV9hbGljZUJhc2VLZXk=');
@$core.Deprecated('Use sessionTransparencyMetadataDescriptor instead')
const SessionTransparencyMetadata$json = const {
  '1': 'SessionTransparencyMetadata',
  '2': const [
    const {'1': 'disclaimerText', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'disclaimerText', '17': true},
    const {'1': 'hcaId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'hcaId', '17': true},
    const {'1': 'sessionTransparencyType', '3': 3, '4': 1, '5': 14, '6': '.proto.SessionTransparencyType', '9': 2, '10': 'sessionTransparencyType', '17': true},
  ],
  '8': const [
    const {'1': '_disclaimerText'},
    const {'1': '_hcaId'},
    const {'1': '_sessionTransparencyType'},
  ],
};

/// Descriptor for `SessionTransparencyMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionTransparencyMetadataDescriptor = $convert.base64Decode('ChtTZXNzaW9uVHJhbnNwYXJlbmN5TWV0YWRhdGESKwoOZGlzY2xhaW1lclRleHQYASABKAlIAFIOZGlzY2xhaW1lclRleHSIAQESGQoFaGNhSWQYAiABKAlIAVIFaGNhSWSIAQESXQoXc2Vzc2lvblRyYW5zcGFyZW5jeVR5cGUYAyABKA4yHi5wcm90by5TZXNzaW9uVHJhbnNwYXJlbmN5VHlwZUgCUhdzZXNzaW9uVHJhbnNwYXJlbmN5VHlwZYgBAUIRCg9fZGlzY2xhaW1lclRleHRCCAoGX2hjYUlkQhoKGF9zZXNzaW9uVHJhbnNwYXJlbmN5VHlwZQ==');
@$core.Deprecated('Use signalMessageDescriptor instead')
const SignalMessage$json = const {
  '1': 'SignalMessage',
  '2': const [
    const {'1': 'ratchetKey', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'ratchetKey', '17': true},
    const {'1': 'counter', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'counter', '17': true},
    const {'1': 'previousCounter', '3': 3, '4': 1, '5': 13, '9': 2, '10': 'previousCounter', '17': true},
    const {'1': 'ciphertext', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'ciphertext', '17': true},
  ],
  '8': const [
    const {'1': '_ratchetKey'},
    const {'1': '_counter'},
    const {'1': '_previousCounter'},
    const {'1': '_ciphertext'},
  ],
};

/// Descriptor for `SignalMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signalMessageDescriptor = $convert.base64Decode('Cg1TaWduYWxNZXNzYWdlEiMKCnJhdGNoZXRLZXkYASABKAxIAFIKcmF0Y2hldEtleYgBARIdCgdjb3VudGVyGAIgASgNSAFSB2NvdW50ZXKIAQESLQoPcHJldmlvdXNDb3VudGVyGAMgASgNSAJSD3ByZXZpb3VzQ291bnRlcogBARIjCgpjaXBoZXJ0ZXh0GAQgASgMSANSCmNpcGhlcnRleHSIAQFCDQoLX3JhdGNoZXRLZXlCCgoIX2NvdW50ZXJCEgoQX3ByZXZpb3VzQ291bnRlckINCgtfY2lwaGVydGV4dA==');
@$core.Deprecated('Use signedPreKeyRecordStructureDescriptor instead')
const SignedPreKeyRecordStructure$json = const {
  '1': 'SignedPreKeyRecordStructure',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'id', '17': true},
    const {'1': 'publicKey', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'publicKey', '17': true},
    const {'1': 'privateKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'privateKey', '17': true},
    const {'1': 'signature', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'signature', '17': true},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 6, '9': 4, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
    const {'1': '_publicKey'},
    const {'1': '_privateKey'},
    const {'1': '_signature'},
    const {'1': '_timestamp'},
  ],
};

/// Descriptor for `SignedPreKeyRecordStructure`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedPreKeyRecordStructureDescriptor = $convert.base64Decode('ChtTaWduZWRQcmVLZXlSZWNvcmRTdHJ1Y3R1cmUSEwoCaWQYASABKA1IAFICaWSIAQESIQoJcHVibGljS2V5GAIgASgMSAFSCXB1YmxpY0tleYgBARIjCgpwcml2YXRlS2V5GAMgASgMSAJSCnByaXZhdGVLZXmIAQESIQoJc2lnbmF0dXJlGAQgASgMSANSCXNpZ25hdHVyZYgBARIhCgl0aW1lc3RhbXAYBSABKAZIBFIJdGltZXN0YW1wiAEBQgUKA19pZEIMCgpfcHVibGljS2V5Qg0KC19wcml2YXRlS2V5QgwKCl9zaWduYXR1cmVCDAoKX3RpbWVzdGFtcA==');
@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution$json = const {
  '1': 'StatusAttribution',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.StatusAttribution.Type', '9': 1, '10': 'type', '17': true},
    const {'1': 'actionUrl', '3': 2, '4': 1, '5': 9, '9': 2, '10': 'actionUrl', '17': true},
    const {'1': 'statusReshare', '3': 3, '4': 1, '5': 11, '6': '.proto.StatusAttribution.StatusReshare', '9': 0, '10': 'statusReshare'},
    const {'1': 'externalShare', '3': 4, '4': 1, '5': 11, '6': '.proto.StatusAttribution.ExternalShare', '9': 0, '10': 'externalShare'},
    const {'1': 'music', '3': 5, '4': 1, '5': 11, '6': '.proto.StatusAttribution.Music', '9': 0, '10': 'music'},
    const {'1': 'groupStatus', '3': 6, '4': 1, '5': 11, '6': '.proto.StatusAttribution.GroupStatus', '9': 0, '10': 'groupStatus'},
    const {'1': 'rlAttribution', '3': 7, '4': 1, '5': 11, '6': '.proto.StatusAttribution.RLAttribution', '9': 0, '10': 'rlAttribution'},
    const {'1': 'aiCreatedAttribution', '3': 8, '4': 1, '5': 11, '6': '.proto.StatusAttribution.AiCreatedAttribution', '9': 0, '10': 'aiCreatedAttribution'},
  ],
  '3': const [StatusAttribution_AiCreatedAttribution$json, StatusAttribution_ExternalShare$json, StatusAttribution_GroupStatus$json, StatusAttribution_Music$json, StatusAttribution_RLAttribution$json, StatusAttribution_StatusReshare$json],
  '4': const [StatusAttribution_Type$json],
  '8': const [
    const {'1': 'attributionData'},
    const {'1': '_type'},
    const {'1': '_actionUrl'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_AiCreatedAttribution$json = const {
  '1': 'AiCreatedAttribution',
  '2': const [
    const {'1': 'source', '3': 1, '4': 1, '5': 14, '6': '.proto.StatusAttribution.AiCreatedAttribution.Source', '9': 0, '10': 'source', '17': true},
  ],
  '4': const [StatusAttribution_AiCreatedAttribution_Source$json],
  '8': const [
    const {'1': '_source'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_AiCreatedAttribution_Source$json = const {
  '1': 'Source',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'STATUS_MIMICRY', '2': 1},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_ExternalShare$json = const {
  '1': 'ExternalShare',
  '2': const [
    const {'1': 'actionUrl', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'actionUrl', '17': true},
    const {'1': 'source', '3': 2, '4': 1, '5': 14, '6': '.proto.StatusAttribution.ExternalShare.Source', '9': 1, '10': 'source', '17': true},
    const {'1': 'duration', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'duration', '17': true},
    const {'1': 'actionFallbackUrl', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'actionFallbackUrl', '17': true},
  ],
  '4': const [StatusAttribution_ExternalShare_Source$json],
  '8': const [
    const {'1': '_actionUrl'},
    const {'1': '_source'},
    const {'1': '_duration'},
    const {'1': '_actionFallbackUrl'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_ExternalShare_Source$json = const {
  '1': 'Source',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'INSTAGRAM', '2': 1},
    const {'1': 'FACEBOOK', '2': 2},
    const {'1': 'MESSENGER', '2': 3},
    const {'1': 'SPOTIFY', '2': 4},
    const {'1': 'YOUTUBE', '2': 5},
    const {'1': 'PINTEREST', '2': 6},
    const {'1': 'THREADS', '2': 7},
    const {'1': 'APPLE_MUSIC', '2': 8},
    const {'1': 'SHARECHAT', '2': 9},
    const {'1': 'GOOGLE_PHOTOS', '2': 10},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_GroupStatus$json = const {
  '1': 'GroupStatus',
  '2': const [
    const {'1': 'authorJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'authorJid', '17': true},
  ],
  '8': const [
    const {'1': '_authorJid'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_Music$json = const {
  '1': 'Music',
  '2': const [
    const {'1': 'authorName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'authorName', '17': true},
    const {'1': 'songId', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'songId', '17': true},
    const {'1': 'title', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'title', '17': true},
    const {'1': 'author', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'author', '17': true},
    const {'1': 'artistAttribution', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'artistAttribution', '17': true},
    const {'1': 'isExplicit', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'isExplicit', '17': true},
  ],
  '8': const [
    const {'1': '_authorName'},
    const {'1': '_songId'},
    const {'1': '_title'},
    const {'1': '_author'},
    const {'1': '_artistAttribution'},
    const {'1': '_isExplicit'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_RLAttribution$json = const {
  '1': 'RLAttribution',
  '2': const [
    const {'1': 'source', '3': 1, '4': 1, '5': 14, '6': '.proto.StatusAttribution.RLAttribution.Source', '9': 0, '10': 'source', '17': true},
  ],
  '4': const [StatusAttribution_RLAttribution_Source$json],
  '8': const [
    const {'1': '_source'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_RLAttribution_Source$json = const {
  '1': 'Source',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'RAY_BAN_META_GLASSES', '2': 1},
    const {'1': 'OAKLEY_META_GLASSES', '2': 2},
    const {'1': 'HYPERNOVA_GLASSES', '2': 3},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_StatusReshare$json = const {
  '1': 'StatusReshare',
  '2': const [
    const {'1': 'source', '3': 1, '4': 1, '5': 14, '6': '.proto.StatusAttribution.StatusReshare.Source', '9': 0, '10': 'source', '17': true},
    const {'1': 'metadata', '3': 2, '4': 1, '5': 11, '6': '.proto.StatusAttribution.StatusReshare.Metadata', '9': 1, '10': 'metadata', '17': true},
  ],
  '3': const [StatusAttribution_StatusReshare_Metadata$json],
  '4': const [StatusAttribution_StatusReshare_Source$json],
  '8': const [
    const {'1': '_source'},
    const {'1': '_metadata'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_StatusReshare_Metadata$json = const {
  '1': 'Metadata',
  '2': const [
    const {'1': 'duration', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'duration', '17': true},
    const {'1': 'channelJid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'channelJid', '17': true},
    const {'1': 'channelMessageId', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'channelMessageId', '17': true},
    const {'1': 'hasMultipleReshares', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'hasMultipleReshares', '17': true},
  ],
  '8': const [
    const {'1': '_duration'},
    const {'1': '_channelJid'},
    const {'1': '_channelMessageId'},
    const {'1': '_hasMultipleReshares'},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_StatusReshare_Source$json = const {
  '1': 'Source',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'INTERNAL_RESHARE', '2': 1},
    const {'1': 'MENTION_RESHARE', '2': 2},
    const {'1': 'CHANNEL_RESHARE', '2': 3},
    const {'1': 'FORWARD', '2': 4},
  ],
};

@$core.Deprecated('Use statusAttributionDescriptor instead')
const StatusAttribution_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'RESHARE', '2': 1},
    const {'1': 'EXTERNAL_SHARE', '2': 2},
    const {'1': 'MUSIC', '2': 3},
    const {'1': 'STATUS_MENTION', '2': 4},
    const {'1': 'GROUP_STATUS', '2': 5},
    const {'1': 'RL_ATTRIBUTION', '2': 6},
    const {'1': 'AI_CREATED', '2': 7},
    const {'1': 'LAYOUTS', '2': 8},
  ],
};

/// Descriptor for `StatusAttribution`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusAttributionDescriptor = $convert.base64Decode('ChFTdGF0dXNBdHRyaWJ1dGlvbhI2CgR0eXBlGAEgASgOMh0ucHJvdG8uU3RhdHVzQXR0cmlidXRpb24uVHlwZUgBUgR0eXBliAEBEiEKCWFjdGlvblVybBgCIAEoCUgCUglhY3Rpb25VcmyIAQESTgoNc3RhdHVzUmVzaGFyZRgDIAEoCzImLnByb3RvLlN0YXR1c0F0dHJpYnV0aW9uLlN0YXR1c1Jlc2hhcmVIAFINc3RhdHVzUmVzaGFyZRJOCg1leHRlcm5hbFNoYXJlGAQgASgLMiYucHJvdG8uU3RhdHVzQXR0cmlidXRpb24uRXh0ZXJuYWxTaGFyZUgAUg1leHRlcm5hbFNoYXJlEjYKBW11c2ljGAUgASgLMh4ucHJvdG8uU3RhdHVzQXR0cmlidXRpb24uTXVzaWNIAFIFbXVzaWMSSAoLZ3JvdXBTdGF0dXMYBiABKAsyJC5wcm90by5TdGF0dXNBdHRyaWJ1dGlvbi5Hcm91cFN0YXR1c0gAUgtncm91cFN0YXR1cxJOCg1ybEF0dHJpYnV0aW9uGAcgASgLMiYucHJvdG8uU3RhdHVzQXR0cmlidXRpb24uUkxBdHRyaWJ1dGlvbkgAUg1ybEF0dHJpYnV0aW9uEmMKFGFpQ3JlYXRlZEF0dHJpYnV0aW9uGAggASgLMi0ucHJvdG8uU3RhdHVzQXR0cmlidXRpb24uQWlDcmVhdGVkQXR0cmlidXRpb25IAFIUYWlDcmVhdGVkQXR0cmlidXRpb24anwEKFEFpQ3JlYXRlZEF0dHJpYnV0aW9uElEKBnNvdXJjZRgBIAEoDjI0LnByb3RvLlN0YXR1c0F0dHJpYnV0aW9uLkFpQ3JlYXRlZEF0dHJpYnV0aW9uLlNvdXJjZUgAUgZzb3VyY2WIAQEiKQoGU291cmNlEgsKB1VOS05PV04QABISCg5TVEFUVVNfTUlNSUNSWRABQgkKB19zb3VyY2UauwMKDUV4dGVybmFsU2hhcmUSIQoJYWN0aW9uVXJsGAEgASgJSABSCWFjdGlvblVybIgBARJKCgZzb3VyY2UYAiABKA4yLS5wcm90by5TdGF0dXNBdHRyaWJ1dGlvbi5FeHRlcm5hbFNoYXJlLlNvdXJjZUgBUgZzb3VyY2WIAQESHwoIZHVyYXRpb24YAyABKAVIAlIIZHVyYXRpb26IAQESMQoRYWN0aW9uRmFsbGJhY2tVcmwYBCABKAlIA1IRYWN0aW9uRmFsbGJhY2tVcmyIAQEiqgEKBlNvdXJjZRILCgdVTktOT1dOEAASDQoJSU5TVEFHUkFNEAESDAoIRkFDRUJPT0sQAhINCglNRVNTRU5HRVIQAxILCgdTUE9USUZZEAQSCwoHWU9VVFVCRRAFEg0KCVBJTlRFUkVTVBAGEgsKB1RIUkVBRFMQBxIPCgtBUFBMRV9NVVNJQxAIEg0KCVNIQVJFQ0hBVBAJEhEKDUdPT0dMRV9QSE9UT1MQCkIMCgpfYWN0aW9uVXJsQgkKB19zb3VyY2VCCwoJX2R1cmF0aW9uQhQKEl9hY3Rpb25GYWxsYmFja1VybBo+CgtHcm91cFN0YXR1cxIhCglhdXRob3JKaWQYASABKAlIAFIJYXV0aG9ySmlkiAEBQgwKCl9hdXRob3JKaWQarQIKBU11c2ljEiMKCmF1dGhvck5hbWUYASABKAlIAFIKYXV0aG9yTmFtZYgBARIbCgZzb25nSWQYAiABKAlIAVIGc29uZ0lkiAEBEhkKBXRpdGxlGAMgASgJSAJSBXRpdGxliAEBEhsKBmF1dGhvchgEIAEoCUgDUgZhdXRob3KIAQESMQoRYXJ0aXN0QXR0cmlidXRpb24YBSABKAlIBFIRYXJ0aXN0QXR0cmlidXRpb26IAQESIwoKaXNFeHBsaWNpdBgGIAEoCEgFUgppc0V4cGxpY2l0iAEBQg0KC19hdXRob3JOYW1lQgkKB19zb25nSWRCCAoGX3RpdGxlQgkKB19hdXRob3JCFAoSX2FydGlzdEF0dHJpYnV0aW9uQg0KC19pc0V4cGxpY2l0GscBCg1STEF0dHJpYnV0aW9uEkoKBnNvdXJjZRgBIAEoDjItLnByb3RvLlN0YXR1c0F0dHJpYnV0aW9uLlJMQXR0cmlidXRpb24uU291cmNlSABSBnNvdXJjZYgBASJfCgZTb3VyY2USCwoHVU5LTk9XThAAEhgKFFJBWV9CQU5fTUVUQV9HTEFTU0VTEAESFwoTT0FLTEVZX01FVEFfR0xBU1NFUxACEhUKEUhZUEVSTk9WQV9HTEFTU0VTEANCCQoHX3NvdXJjZRqtBAoNU3RhdHVzUmVzaGFyZRJKCgZzb3VyY2UYASABKA4yLS5wcm90by5TdGF0dXNBdHRyaWJ1dGlvbi5TdGF0dXNSZXNoYXJlLlNvdXJjZUgAUgZzb3VyY2WIAQESUAoIbWV0YWRhdGEYAiABKAsyLy5wcm90by5TdGF0dXNBdHRyaWJ1dGlvbi5TdGF0dXNSZXNoYXJlLk1ldGFkYXRhSAFSCG1ldGFkYXRhiAEBGoECCghNZXRhZGF0YRIfCghkdXJhdGlvbhgBIAEoBUgAUghkdXJhdGlvbogBARIjCgpjaGFubmVsSmlkGAIgASgJSAFSCmNoYW5uZWxKaWSIAQESLwoQY2hhbm5lbE1lc3NhZ2VJZBgDIAEoBUgCUhBjaGFubmVsTWVzc2FnZUlkiAEBEjUKE2hhc011bHRpcGxlUmVzaGFyZXMYBCABKAhIA1ITaGFzTXVsdGlwbGVSZXNoYXJlc4gBAUILCglfZHVyYXRpb25CDQoLX2NoYW5uZWxKaWRCEwoRX2NoYW5uZWxNZXNzYWdlSWRCFgoUX2hhc011bHRpcGxlUmVzaGFyZXMiYgoGU291cmNlEgsKB1VOS05PV04QABIUChBJTlRFUk5BTF9SRVNIQVJFEAESEwoPTUVOVElPTl9SRVNIQVJFEAISEwoPQ0hBTk5FTF9SRVNIQVJFEAMSCwoHRk9SV0FSRBAEQgkKB19zb3VyY2VCCwoJX21ldGFkYXRhIpYBCgRUeXBlEgsKB1VOS05PV04QABILCgdSRVNIQVJFEAESEgoORVhURVJOQUxfU0hBUkUQAhIJCgVNVVNJQxADEhIKDlNUQVRVU19NRU5USU9OEAQSEAoMR1JPVVBfU1RBVFVTEAUSEgoOUkxfQVRUUklCVVRJT04QBhIOCgpBSV9DUkVBVEVEEAcSCwoHTEFZT1VUUxAIQhEKD2F0dHJpYnV0aW9uRGF0YUIHCgVfdHlwZUIMCgpfYWN0aW9uVXJs');
@$core.Deprecated('Use statusMentionMessageDescriptor instead')
const StatusMentionMessage$json = const {
  '1': 'StatusMentionMessage',
  '2': const [
    const {'1': 'quotedStatus', '3': 1, '4': 1, '5': 11, '6': '.proto.Message', '9': 0, '10': 'quotedStatus', '17': true},
  ],
  '8': const [
    const {'1': '_quotedStatus'},
  ],
};

/// Descriptor for `StatusMentionMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusMentionMessageDescriptor = $convert.base64Decode('ChRTdGF0dXNNZW50aW9uTWVzc2FnZRI3CgxxdW90ZWRTdGF0dXMYASABKAsyDi5wcm90by5NZXNzYWdlSABSDHF1b3RlZFN0YXR1c4gBAUIPCg1fcXVvdGVkU3RhdHVz');
@$core.Deprecated('Use statusPSADescriptor instead')
const StatusPSA$json = const {
  '1': 'StatusPSA',
  '2': const [
    const {'1': 'campaignId', '3': 44, '4': 1, '5': 4, '10': 'campaignId'},
    const {'1': 'campaignExpirationTimestamp', '3': 45, '4': 1, '5': 4, '9': 0, '10': 'campaignExpirationTimestamp', '17': true},
  ],
  '8': const [
    const {'1': '_campaignExpirationTimestamp'},
  ],
};

/// Descriptor for `StatusPSA`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusPSADescriptor = $convert.base64Decode('CglTdGF0dXNQU0ESHgoKY2FtcGFpZ25JZBgsIAEoBFIKY2FtcGFpZ25JZBJFChtjYW1wYWlnbkV4cGlyYXRpb25UaW1lc3RhbXAYLSABKARIAFIbY2FtcGFpZ25FeHBpcmF0aW9uVGltZXN0YW1wiAEBQh4KHF9jYW1wYWlnbkV4cGlyYXRpb25UaW1lc3RhbXA=');
@$core.Deprecated('Use stickerMetadataDescriptor instead')
const StickerMetadata$json = const {
  '1': 'StickerMetadata',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'fileSha256', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'fileSha256', '17': true},
    const {'1': 'fileEncSha256', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'fileEncSha256', '17': true},
    const {'1': 'mediaKey', '3': 4, '4': 1, '5': 12, '9': 3, '10': 'mediaKey', '17': true},
    const {'1': 'mimetype', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'mimetype', '17': true},
    const {'1': 'height', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'height', '17': true},
    const {'1': 'width', '3': 7, '4': 1, '5': 13, '9': 6, '10': 'width', '17': true},
    const {'1': 'directPath', '3': 8, '4': 1, '5': 9, '9': 7, '10': 'directPath', '17': true},
    const {'1': 'fileLength', '3': 9, '4': 1, '5': 4, '9': 8, '10': 'fileLength', '17': true},
    const {'1': 'weight', '3': 10, '4': 1, '5': 2, '9': 9, '10': 'weight', '17': true},
    const {'1': 'lastStickerSentTs', '3': 11, '4': 1, '5': 3, '9': 10, '10': 'lastStickerSentTs', '17': true},
    const {'1': 'isLottie', '3': 12, '4': 1, '5': 8, '9': 11, '10': 'isLottie', '17': true},
    const {'1': 'imageHash', '3': 13, '4': 1, '5': 9, '9': 12, '10': 'imageHash', '17': true},
    const {'1': 'isAvatarSticker', '3': 14, '4': 1, '5': 8, '9': 13, '10': 'isAvatarSticker', '17': true},
  ],
  '8': const [
    const {'1': '_url'},
    const {'1': '_fileSha256'},
    const {'1': '_fileEncSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_mimetype'},
    const {'1': '_height'},
    const {'1': '_width'},
    const {'1': '_directPath'},
    const {'1': '_fileLength'},
    const {'1': '_weight'},
    const {'1': '_lastStickerSentTs'},
    const {'1': '_isLottie'},
    const {'1': '_imageHash'},
    const {'1': '_isAvatarSticker'},
  ],
};

/// Descriptor for `StickerMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stickerMetadataDescriptor = $convert.base64Decode('Cg9TdGlja2VyTWV0YWRhdGESFQoDdXJsGAEgASgJSABSA3VybIgBARIjCgpmaWxlU2hhMjU2GAIgASgMSAFSCmZpbGVTaGEyNTaIAQESKQoNZmlsZUVuY1NoYTI1NhgDIAEoDEgCUg1maWxlRW5jU2hhMjU2iAEBEh8KCG1lZGlhS2V5GAQgASgMSANSCG1lZGlhS2V5iAEBEh8KCG1pbWV0eXBlGAUgASgJSARSCG1pbWV0eXBliAEBEhsKBmhlaWdodBgGIAEoDUgFUgZoZWlnaHSIAQESGQoFd2lkdGgYByABKA1IBlIFd2lkdGiIAQESIwoKZGlyZWN0UGF0aBgIIAEoCUgHUgpkaXJlY3RQYXRoiAEBEiMKCmZpbGVMZW5ndGgYCSABKARICFIKZmlsZUxlbmd0aIgBARIbCgZ3ZWlnaHQYCiABKAJICVIGd2VpZ2h0iAEBEjEKEWxhc3RTdGlja2VyU2VudFRzGAsgASgDSApSEWxhc3RTdGlja2VyU2VudFRziAEBEh8KCGlzTG90dGllGAwgASgISAtSCGlzTG90dGlliAEBEiEKCWltYWdlSGFzaBgNIAEoCUgMUglpbWFnZUhhc2iIAQESLQoPaXNBdmF0YXJTdGlja2VyGA4gASgISA1SD2lzQXZhdGFyU3RpY2tlcogBAUIGCgRfdXJsQg0KC19maWxlU2hhMjU2QhAKDl9maWxlRW5jU2hhMjU2QgsKCV9tZWRpYUtleUILCglfbWltZXR5cGVCCQoHX2hlaWdodEIICgZfd2lkdGhCDQoLX2RpcmVjdFBhdGhCDQoLX2ZpbGVMZW5ndGhCCQoHX3dlaWdodEIUChJfbGFzdFN0aWNrZXJTZW50VHNCCwoJX2lzTG90dGllQgwKCl9pbWFnZUhhc2hCEgoQX2lzQXZhdGFyU3RpY2tlcg==');
@$core.Deprecated('Use syncActionDataDescriptor instead')
const SyncActionData$json = const {
  '1': 'SyncActionData',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'index', '17': true},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.proto.SyncActionValue', '9': 1, '10': 'value', '17': true},
    const {'1': 'padding', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'padding', '17': true},
    const {'1': 'version', '3': 4, '4': 1, '5': 5, '9': 3, '10': 'version', '17': true},
  ],
  '8': const [
    const {'1': '_index'},
    const {'1': '_value'},
    const {'1': '_padding'},
    const {'1': '_version'},
  ],
};

/// Descriptor for `SyncActionData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncActionDataDescriptor = $convert.base64Decode('Cg5TeW5jQWN0aW9uRGF0YRIZCgVpbmRleBgBIAEoDEgAUgVpbmRleIgBARIxCgV2YWx1ZRgCIAEoCzIWLnByb3RvLlN5bmNBY3Rpb25WYWx1ZUgBUgV2YWx1ZYgBARIdCgdwYWRkaW5nGAMgASgMSAJSB3BhZGRpbmeIAQESHQoHdmVyc2lvbhgEIAEoBUgDUgd2ZXJzaW9uiAEBQggKBl9pbmRleEIICgZfdmFsdWVCCgoIX3BhZGRpbmdCCgoIX3ZlcnNpb24=');
@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue$json = const {
  '1': 'SyncActionValue',
  '2': const [
    const {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'timestamp', '17': true},
    const {'1': 'starAction', '3': 2, '4': 1, '5': 11, '6': '.proto.SyncActionValue.StarAction', '9': 1, '10': 'starAction', '17': true},
    const {'1': 'contactAction', '3': 3, '4': 1, '5': 11, '6': '.proto.SyncActionValue.ContactAction', '9': 2, '10': 'contactAction', '17': true},
    const {'1': 'muteAction', '3': 4, '4': 1, '5': 11, '6': '.proto.SyncActionValue.MuteAction', '9': 3, '10': 'muteAction', '17': true},
    const {'1': 'pinAction', '3': 5, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PinAction', '9': 4, '10': 'pinAction', '17': true},
    const {'1': 'pushNameSetting', '3': 7, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PushNameSetting', '9': 5, '10': 'pushNameSetting', '17': true},
    const {'1': 'quickReplyAction', '3': 8, '4': 1, '5': 11, '6': '.proto.SyncActionValue.QuickReplyAction', '9': 6, '10': 'quickReplyAction', '17': true},
    const {'1': 'recentEmojiWeightsAction', '3': 11, '4': 1, '5': 11, '6': '.proto.SyncActionValue.RecentEmojiWeightsAction', '9': 7, '10': 'recentEmojiWeightsAction', '17': true},
    const {'1': 'labelEditAction', '3': 14, '4': 1, '5': 11, '6': '.proto.SyncActionValue.LabelEditAction', '9': 8, '10': 'labelEditAction', '17': true},
    const {'1': 'labelAssociationAction', '3': 15, '4': 1, '5': 11, '6': '.proto.SyncActionValue.LabelAssociationAction', '9': 9, '10': 'labelAssociationAction', '17': true},
    const {'1': 'localeSetting', '3': 16, '4': 1, '5': 11, '6': '.proto.SyncActionValue.LocaleSetting', '9': 10, '10': 'localeSetting', '17': true},
    const {'1': 'archiveChatAction', '3': 17, '4': 1, '5': 11, '6': '.proto.SyncActionValue.ArchiveChatAction', '9': 11, '10': 'archiveChatAction', '17': true},
    const {'1': 'deleteMessageForMeAction', '3': 18, '4': 1, '5': 11, '6': '.proto.SyncActionValue.DeleteMessageForMeAction', '9': 12, '10': 'deleteMessageForMeAction', '17': true},
    const {'1': 'keyExpiration', '3': 19, '4': 1, '5': 11, '6': '.proto.SyncActionValue.KeyExpiration', '9': 13, '10': 'keyExpiration', '17': true},
    const {'1': 'markChatAsReadAction', '3': 20, '4': 1, '5': 11, '6': '.proto.SyncActionValue.MarkChatAsReadAction', '9': 14, '10': 'markChatAsReadAction', '17': true},
    const {'1': 'clearChatAction', '3': 21, '4': 1, '5': 11, '6': '.proto.SyncActionValue.ClearChatAction', '9': 15, '10': 'clearChatAction', '17': true},
    const {'1': 'deleteChatAction', '3': 22, '4': 1, '5': 11, '6': '.proto.SyncActionValue.DeleteChatAction', '9': 16, '10': 'deleteChatAction', '17': true},
    const {'1': 'unarchiveChatsSetting', '3': 23, '4': 1, '5': 11, '6': '.proto.SyncActionValue.UnarchiveChatsSetting', '9': 17, '10': 'unarchiveChatsSetting', '17': true},
    const {'1': 'primaryFeature', '3': 24, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PrimaryFeature', '9': 18, '10': 'primaryFeature', '17': true},
    const {'1': 'androidUnsupportedActions', '3': 26, '4': 1, '5': 11, '6': '.proto.SyncActionValue.AndroidUnsupportedActions', '9': 19, '10': 'androidUnsupportedActions', '17': true},
    const {'1': 'agentAction', '3': 27, '4': 1, '5': 11, '6': '.proto.SyncActionValue.AgentAction', '9': 20, '10': 'agentAction', '17': true},
    const {'1': 'subscriptionAction', '3': 28, '4': 1, '5': 11, '6': '.proto.SyncActionValue.SubscriptionAction', '9': 21, '10': 'subscriptionAction', '17': true},
    const {'1': 'userStatusMuteAction', '3': 29, '4': 1, '5': 11, '6': '.proto.SyncActionValue.UserStatusMuteAction', '9': 22, '10': 'userStatusMuteAction', '17': true},
    const {'1': 'timeFormatAction', '3': 30, '4': 1, '5': 11, '6': '.proto.SyncActionValue.TimeFormatAction', '9': 23, '10': 'timeFormatAction', '17': true},
    const {'1': 'nuxAction', '3': 31, '4': 1, '5': 11, '6': '.proto.SyncActionValue.NuxAction', '9': 24, '10': 'nuxAction', '17': true},
    const {'1': 'primaryVersionAction', '3': 32, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PrimaryVersionAction', '9': 25, '10': 'primaryVersionAction', '17': true},
    const {'1': 'stickerAction', '3': 33, '4': 1, '5': 11, '6': '.proto.SyncActionValue.StickerAction', '9': 26, '10': 'stickerAction', '17': true},
    const {'1': 'removeRecentStickerAction', '3': 34, '4': 1, '5': 11, '6': '.proto.SyncActionValue.RemoveRecentStickerAction', '9': 27, '10': 'removeRecentStickerAction', '17': true},
    const {'1': 'chatAssignment', '3': 35, '4': 1, '5': 11, '6': '.proto.SyncActionValue.ChatAssignmentAction', '9': 28, '10': 'chatAssignment', '17': true},
    const {'1': 'chatAssignmentOpenedStatus', '3': 36, '4': 1, '5': 11, '6': '.proto.SyncActionValue.ChatAssignmentOpenedStatusAction', '9': 29, '10': 'chatAssignmentOpenedStatus', '17': true},
    const {'1': 'pnForLidChatAction', '3': 37, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PnForLidChatAction', '9': 30, '10': 'pnForLidChatAction', '17': true},
    const {'1': 'marketingMessageAction', '3': 38, '4': 1, '5': 11, '6': '.proto.SyncActionValue.MarketingMessageAction', '9': 31, '10': 'marketingMessageAction', '17': true},
    const {'1': 'marketingMessageBroadcastAction', '3': 39, '4': 1, '5': 11, '6': '.proto.SyncActionValue.MarketingMessageBroadcastAction', '9': 32, '10': 'marketingMessageBroadcastAction', '17': true},
    const {'1': 'externalWebBetaAction', '3': 40, '4': 1, '5': 11, '6': '.proto.SyncActionValue.ExternalWebBetaAction', '9': 33, '10': 'externalWebBetaAction', '17': true},
    const {'1': 'privacySettingRelayAllCalls', '3': 41, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PrivacySettingRelayAllCalls', '9': 34, '10': 'privacySettingRelayAllCalls', '17': true},
    const {'1': 'callLogAction', '3': 42, '4': 1, '5': 11, '6': '.proto.SyncActionValue.CallLogAction', '9': 35, '10': 'callLogAction', '17': true},
    const {'1': 'ugcBot', '3': 43, '4': 1, '5': 11, '6': '.proto.SyncActionValue.UGCBot', '9': 36, '10': 'ugcBot', '17': true},
    const {'1': 'statusPrivacy', '3': 44, '4': 1, '5': 11, '6': '.proto.SyncActionValue.StatusPrivacyAction', '9': 37, '10': 'statusPrivacy', '17': true},
    const {'1': 'botWelcomeRequestAction', '3': 45, '4': 1, '5': 11, '6': '.proto.SyncActionValue.BotWelcomeRequestAction', '9': 38, '10': 'botWelcomeRequestAction', '17': true},
    const {'1': 'deleteIndividualCallLog', '3': 46, '4': 1, '5': 11, '6': '.proto.SyncActionValue.DeleteIndividualCallLogAction', '9': 39, '10': 'deleteIndividualCallLog', '17': true},
    const {'1': 'labelReorderingAction', '3': 47, '4': 1, '5': 11, '6': '.proto.SyncActionValue.LabelReorderingAction', '9': 40, '10': 'labelReorderingAction', '17': true},
    const {'1': 'paymentInfoAction', '3': 48, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PaymentInfoAction', '9': 41, '10': 'paymentInfoAction', '17': true},
    const {'1': 'customPaymentMethodsAction', '3': 49, '4': 1, '5': 11, '6': '.proto.SyncActionValue.CustomPaymentMethodsAction', '9': 42, '10': 'customPaymentMethodsAction', '17': true},
    const {'1': 'lockChatAction', '3': 50, '4': 1, '5': 11, '6': '.proto.SyncActionValue.LockChatAction', '9': 43, '10': 'lockChatAction', '17': true},
    const {'1': 'chatLockSettings', '3': 51, '4': 1, '5': 11, '6': '.proto.ChatLockSettings', '9': 44, '10': 'chatLockSettings', '17': true},
    const {'1': 'wamoUserIdentifierAction', '3': 52, '4': 1, '5': 11, '6': '.proto.SyncActionValue.WamoUserIdentifierAction', '9': 45, '10': 'wamoUserIdentifierAction', '17': true},
    const {'1': 'privacySettingDisableLinkPreviewsAction', '3': 53, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PrivacySettingDisableLinkPreviewsAction', '9': 46, '10': 'privacySettingDisableLinkPreviewsAction', '17': true},
    const {'1': 'deviceCapabilities', '3': 54, '4': 1, '5': 11, '6': '.proto.DeviceCapabilities', '9': 47, '10': 'deviceCapabilities', '17': true},
    const {'1': 'noteEditAction', '3': 55, '4': 1, '5': 11, '6': '.proto.SyncActionValue.NoteEditAction', '9': 48, '10': 'noteEditAction', '17': true},
    const {'1': 'favoritesAction', '3': 56, '4': 1, '5': 11, '6': '.proto.SyncActionValue.FavoritesAction', '9': 49, '10': 'favoritesAction', '17': true},
    const {'1': 'merchantPaymentPartnerAction', '3': 57, '4': 1, '5': 11, '6': '.proto.SyncActionValue.MerchantPaymentPartnerAction', '9': 50, '10': 'merchantPaymentPartnerAction', '17': true},
    const {'1': 'waffleAccountLinkStateAction', '3': 58, '4': 1, '5': 11, '6': '.proto.SyncActionValue.WaffleAccountLinkStateAction', '9': 51, '10': 'waffleAccountLinkStateAction', '17': true},
    const {'1': 'usernameChatStartMode', '3': 59, '4': 1, '5': 11, '6': '.proto.SyncActionValue.UsernameChatStartModeAction', '9': 52, '10': 'usernameChatStartMode', '17': true},
    const {'1': 'notificationActivitySettingAction', '3': 60, '4': 1, '5': 11, '6': '.proto.SyncActionValue.NotificationActivitySettingAction', '9': 53, '10': 'notificationActivitySettingAction', '17': true},
    const {'1': 'lidContactAction', '3': 61, '4': 1, '5': 11, '6': '.proto.SyncActionValue.LidContactAction', '9': 54, '10': 'lidContactAction', '17': true},
    const {'1': 'ctwaPerCustomerDataSharingAction', '3': 62, '4': 1, '5': 11, '6': '.proto.SyncActionValue.CtwaPerCustomerDataSharingAction', '9': 55, '10': 'ctwaPerCustomerDataSharingAction', '17': true},
    const {'1': 'paymentTosAction', '3': 63, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PaymentTosAction', '9': 56, '10': 'paymentTosAction', '17': true},
    const {'1': 'privacySettingChannelsPersonalisedRecommendationAction', '3': 64, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PrivacySettingChannelsPersonalisedRecommendationAction', '9': 57, '10': 'privacySettingChannelsPersonalisedRecommendationAction', '17': true},
    const {'1': 'businessBroadcastAssociationAction', '3': 65, '4': 1, '5': 11, '6': '.proto.SyncActionValue.BusinessBroadcastAssociationAction', '9': 58, '10': 'businessBroadcastAssociationAction', '17': true},
    const {'1': 'detectedOutcomesStatusAction', '3': 66, '4': 1, '5': 11, '6': '.proto.SyncActionValue.DetectedOutcomesStatusAction', '9': 59, '10': 'detectedOutcomesStatusAction', '17': true},
    const {'1': 'maibaAiFeaturesControlAction', '3': 68, '4': 1, '5': 11, '6': '.proto.SyncActionValue.MaibaAIFeaturesControlAction', '9': 60, '10': 'maibaAiFeaturesControlAction', '17': true},
    const {'1': 'businessBroadcastListAction', '3': 69, '4': 1, '5': 11, '6': '.proto.SyncActionValue.BusinessBroadcastListAction', '9': 61, '10': 'businessBroadcastListAction', '17': true},
    const {'1': 'musicUserIdAction', '3': 70, '4': 1, '5': 11, '6': '.proto.SyncActionValue.MusicUserIdAction', '9': 62, '10': 'musicUserIdAction', '17': true},
    const {'1': 'statusPostOptInNotificationPreferencesAction', '3': 71, '4': 1, '5': 11, '6': '.proto.SyncActionValue.StatusPostOptInNotificationPreferencesAction', '9': 63, '10': 'statusPostOptInNotificationPreferencesAction', '17': true},
    const {'1': 'avatarUpdatedAction', '3': 72, '4': 1, '5': 11, '6': '.proto.SyncActionValue.AvatarUpdatedAction', '9': 64, '10': 'avatarUpdatedAction', '17': true},
    const {'1': 'privateProcessingSettingAction', '3': 74, '4': 1, '5': 11, '6': '.proto.SyncActionValue.PrivateProcessingSettingAction', '9': 65, '10': 'privateProcessingSettingAction', '17': true},
    const {'1': 'newsletterSavedInterestsAction', '3': 75, '4': 1, '5': 11, '6': '.proto.SyncActionValue.NewsletterSavedInterestsAction', '9': 66, '10': 'newsletterSavedInterestsAction', '17': true},
    const {'1': 'aiThreadRenameAction', '3': 76, '4': 1, '5': 11, '6': '.proto.SyncActionValue.AiThreadRenameAction', '9': 67, '10': 'aiThreadRenameAction', '17': true},
    const {'1': 'interactiveMessageAction', '3': 77, '4': 1, '5': 11, '6': '.proto.SyncActionValue.InteractiveMessageAction', '9': 68, '10': 'interactiveMessageAction', '17': true},
  ],
  '3': const [SyncActionValue_AgentAction$json, SyncActionValue_AiThreadRenameAction$json, SyncActionValue_AndroidUnsupportedActions$json, SyncActionValue_ArchiveChatAction$json, SyncActionValue_AvatarUpdatedAction$json, SyncActionValue_BotWelcomeRequestAction$json, SyncActionValue_BroadcastListParticipant$json, SyncActionValue_BusinessBroadcastAssociationAction$json, SyncActionValue_BusinessBroadcastListAction$json, SyncActionValue_CallLogAction$json, SyncActionValue_ChatAssignmentAction$json, SyncActionValue_ChatAssignmentOpenedStatusAction$json, SyncActionValue_ClearChatAction$json, SyncActionValue_ContactAction$json, SyncActionValue_CtwaPerCustomerDataSharingAction$json, SyncActionValue_CustomPaymentMethod$json, SyncActionValue_CustomPaymentMethodMetadata$json, SyncActionValue_CustomPaymentMethodsAction$json, SyncActionValue_DeleteChatAction$json, SyncActionValue_DeleteIndividualCallLogAction$json, SyncActionValue_DeleteMessageForMeAction$json, SyncActionValue_DetectedOutcomesStatusAction$json, SyncActionValue_ExternalWebBetaAction$json, SyncActionValue_FavoritesAction$json, SyncActionValue_InteractiveMessageAction$json, SyncActionValue_KeyExpiration$json, SyncActionValue_LabelAssociationAction$json, SyncActionValue_LabelEditAction$json, SyncActionValue_LabelReorderingAction$json, SyncActionValue_LidContactAction$json, SyncActionValue_LocaleSetting$json, SyncActionValue_LockChatAction$json, SyncActionValue_MaibaAIFeaturesControlAction$json, SyncActionValue_MarkChatAsReadAction$json, SyncActionValue_MarketingMessageAction$json, SyncActionValue_MarketingMessageBroadcastAction$json, SyncActionValue_MerchantPaymentPartnerAction$json, SyncActionValue_MusicUserIdAction$json, SyncActionValue_MuteAction$json, SyncActionValue_NewsletterSavedInterestsAction$json, SyncActionValue_NoteEditAction$json, SyncActionValue_NotificationActivitySettingAction$json, SyncActionValue_NuxAction$json, SyncActionValue_PaymentInfoAction$json, SyncActionValue_PaymentTosAction$json, SyncActionValue_PinAction$json, SyncActionValue_PnForLidChatAction$json, SyncActionValue_PrimaryFeature$json, SyncActionValue_PrimaryVersionAction$json, SyncActionValue_PrivacySettingChannelsPersonalisedRecommendationAction$json, SyncActionValue_PrivacySettingDisableLinkPreviewsAction$json, SyncActionValue_PrivacySettingRelayAllCalls$json, SyncActionValue_PrivateProcessingSettingAction$json, SyncActionValue_PushNameSetting$json, SyncActionValue_QuickReplyAction$json, SyncActionValue_RecentEmojiWeightsAction$json, SyncActionValue_RemoveRecentStickerAction$json, SyncActionValue_StarAction$json, SyncActionValue_StatusPostOptInNotificationPreferencesAction$json, SyncActionValue_StatusPrivacyAction$json, SyncActionValue_StickerAction$json, SyncActionValue_SubscriptionAction$json, SyncActionValue_SyncActionMessage$json, SyncActionValue_SyncActionMessageRange$json, SyncActionValue_TimeFormatAction$json, SyncActionValue_UGCBot$json, SyncActionValue_UnarchiveChatsSetting$json, SyncActionValue_UserStatusMuteAction$json, SyncActionValue_UsernameChatStartModeAction$json, SyncActionValue_WaffleAccountLinkStateAction$json, SyncActionValue_WamoUserIdentifierAction$json],
  '8': const [
    const {'1': '_timestamp'},
    const {'1': '_starAction'},
    const {'1': '_contactAction'},
    const {'1': '_muteAction'},
    const {'1': '_pinAction'},
    const {'1': '_pushNameSetting'},
    const {'1': '_quickReplyAction'},
    const {'1': '_recentEmojiWeightsAction'},
    const {'1': '_labelEditAction'},
    const {'1': '_labelAssociationAction'},
    const {'1': '_localeSetting'},
    const {'1': '_archiveChatAction'},
    const {'1': '_deleteMessageForMeAction'},
    const {'1': '_keyExpiration'},
    const {'1': '_markChatAsReadAction'},
    const {'1': '_clearChatAction'},
    const {'1': '_deleteChatAction'},
    const {'1': '_unarchiveChatsSetting'},
    const {'1': '_primaryFeature'},
    const {'1': '_androidUnsupportedActions'},
    const {'1': '_agentAction'},
    const {'1': '_subscriptionAction'},
    const {'1': '_userStatusMuteAction'},
    const {'1': '_timeFormatAction'},
    const {'1': '_nuxAction'},
    const {'1': '_primaryVersionAction'},
    const {'1': '_stickerAction'},
    const {'1': '_removeRecentStickerAction'},
    const {'1': '_chatAssignment'},
    const {'1': '_chatAssignmentOpenedStatus'},
    const {'1': '_pnForLidChatAction'},
    const {'1': '_marketingMessageAction'},
    const {'1': '_marketingMessageBroadcastAction'},
    const {'1': '_externalWebBetaAction'},
    const {'1': '_privacySettingRelayAllCalls'},
    const {'1': '_callLogAction'},
    const {'1': '_ugcBot'},
    const {'1': '_statusPrivacy'},
    const {'1': '_botWelcomeRequestAction'},
    const {'1': '_deleteIndividualCallLog'},
    const {'1': '_labelReorderingAction'},
    const {'1': '_paymentInfoAction'},
    const {'1': '_customPaymentMethodsAction'},
    const {'1': '_lockChatAction'},
    const {'1': '_chatLockSettings'},
    const {'1': '_wamoUserIdentifierAction'},
    const {'1': '_privacySettingDisableLinkPreviewsAction'},
    const {'1': '_deviceCapabilities'},
    const {'1': '_noteEditAction'},
    const {'1': '_favoritesAction'},
    const {'1': '_merchantPaymentPartnerAction'},
    const {'1': '_waffleAccountLinkStateAction'},
    const {'1': '_usernameChatStartMode'},
    const {'1': '_notificationActivitySettingAction'},
    const {'1': '_lidContactAction'},
    const {'1': '_ctwaPerCustomerDataSharingAction'},
    const {'1': '_paymentTosAction'},
    const {'1': '_privacySettingChannelsPersonalisedRecommendationAction'},
    const {'1': '_businessBroadcastAssociationAction'},
    const {'1': '_detectedOutcomesStatusAction'},
    const {'1': '_maibaAiFeaturesControlAction'},
    const {'1': '_businessBroadcastListAction'},
    const {'1': '_musicUserIdAction'},
    const {'1': '_statusPostOptInNotificationPreferencesAction'},
    const {'1': '_avatarUpdatedAction'},
    const {'1': '_privateProcessingSettingAction'},
    const {'1': '_newsletterSavedInterestsAction'},
    const {'1': '_aiThreadRenameAction'},
    const {'1': '_interactiveMessageAction'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_AgentAction$json = const {
  '1': 'AgentAction',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'deviceID', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'deviceID', '17': true},
    const {'1': 'isDeleted', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'isDeleted', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_deviceID'},
    const {'1': '_isDeleted'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_AiThreadRenameAction$json = const {
  '1': 'AiThreadRenameAction',
  '2': const [
    const {'1': 'newTitle', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'newTitle', '17': true},
  ],
  '8': const [
    const {'1': '_newTitle'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_AndroidUnsupportedActions$json = const {
  '1': 'AndroidUnsupportedActions',
  '2': const [
    const {'1': 'allowed', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'allowed', '17': true},
  ],
  '8': const [
    const {'1': '_allowed'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_ArchiveChatAction$json = const {
  '1': 'ArchiveChatAction',
  '2': const [
    const {'1': 'archived', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'archived', '17': true},
    const {'1': 'messageRange', '3': 2, '4': 1, '5': 11, '6': '.proto.SyncActionValue.SyncActionMessageRange', '9': 1, '10': 'messageRange', '17': true},
  ],
  '8': const [
    const {'1': '_archived'},
    const {'1': '_messageRange'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_AvatarUpdatedAction$json = const {
  '1': 'AvatarUpdatedAction',
  '2': const [
    const {'1': 'eventType', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.AvatarUpdatedAction.AvatarEventType', '9': 0, '10': 'eventType', '17': true},
    const {'1': 'recentAvatarStickers', '3': 2, '4': 3, '5': 11, '6': '.proto.SyncActionValue.StickerAction', '10': 'recentAvatarStickers'},
  ],
  '4': const [SyncActionValue_AvatarUpdatedAction_AvatarEventType$json],
  '8': const [
    const {'1': '_eventType'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_AvatarUpdatedAction_AvatarEventType$json = const {
  '1': 'AvatarEventType',
  '2': const [
    const {'1': 'UPDATED', '2': 0},
    const {'1': 'CREATED', '2': 1},
    const {'1': 'DELETED', '2': 2},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_BotWelcomeRequestAction$json = const {
  '1': 'BotWelcomeRequestAction',
  '2': const [
    const {'1': 'isSent', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isSent', '17': true},
  ],
  '8': const [
    const {'1': '_isSent'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_BroadcastListParticipant$json = const {
  '1': 'BroadcastListParticipant',
  '2': const [
    const {'1': 'lidJid', '3': 1, '4': 1, '5': 9, '10': 'lidJid'},
    const {'1': 'pnJid', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'pnJid', '17': true},
  ],
  '8': const [
    const {'1': '_pnJid'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_BusinessBroadcastAssociationAction$json = const {
  '1': 'BusinessBroadcastAssociationAction',
  '2': const [
    const {'1': 'deleted', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'deleted', '17': true},
  ],
  '8': const [
    const {'1': '_deleted'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_BusinessBroadcastListAction$json = const {
  '1': 'BusinessBroadcastListAction',
  '2': const [
    const {'1': 'deleted', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'deleted', '17': true},
    const {'1': 'participants', '3': 2, '4': 3, '5': 11, '6': '.proto.SyncActionValue.BroadcastListParticipant', '10': 'participants'},
    const {'1': 'listName', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'listName', '17': true},
  ],
  '8': const [
    const {'1': '_deleted'},
    const {'1': '_listName'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_CallLogAction$json = const {
  '1': 'CallLogAction',
  '2': const [
    const {'1': 'callLogRecord', '3': 1, '4': 1, '5': 11, '6': '.proto.CallLogRecord', '9': 0, '10': 'callLogRecord', '17': true},
  ],
  '8': const [
    const {'1': '_callLogRecord'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_ChatAssignmentAction$json = const {
  '1': 'ChatAssignmentAction',
  '2': const [
    const {'1': 'deviceAgentID', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'deviceAgentID', '17': true},
  ],
  '8': const [
    const {'1': '_deviceAgentID'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_ChatAssignmentOpenedStatusAction$json = const {
  '1': 'ChatAssignmentOpenedStatusAction',
  '2': const [
    const {'1': 'chatOpened', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'chatOpened', '17': true},
  ],
  '8': const [
    const {'1': '_chatOpened'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_ClearChatAction$json = const {
  '1': 'ClearChatAction',
  '2': const [
    const {'1': 'messageRange', '3': 1, '4': 1, '5': 11, '6': '.proto.SyncActionValue.SyncActionMessageRange', '9': 0, '10': 'messageRange', '17': true},
  ],
  '8': const [
    const {'1': '_messageRange'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_ContactAction$json = const {
  '1': 'ContactAction',
  '2': const [
    const {'1': 'fullName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'fullName', '17': true},
    const {'1': 'firstName', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'firstName', '17': true},
    const {'1': 'lidJid', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'lidJid', '17': true},
    const {'1': 'saveOnPrimaryAddressbook', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'saveOnPrimaryAddressbook', '17': true},
    const {'1': 'pnJid', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'pnJid', '17': true},
    const {'1': 'username', '3': 6, '4': 1, '5': 9, '9': 5, '10': 'username', '17': true},
  ],
  '8': const [
    const {'1': '_fullName'},
    const {'1': '_firstName'},
    const {'1': '_lidJid'},
    const {'1': '_saveOnPrimaryAddressbook'},
    const {'1': '_pnJid'},
    const {'1': '_username'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_CtwaPerCustomerDataSharingAction$json = const {
  '1': 'CtwaPerCustomerDataSharingAction',
  '2': const [
    const {'1': 'isCtwaPerCustomerDataSharingEnabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isCtwaPerCustomerDataSharingEnabled', '17': true},
  ],
  '8': const [
    const {'1': '_isCtwaPerCustomerDataSharingEnabled'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_CustomPaymentMethod$json = const {
  '1': 'CustomPaymentMethod',
  '2': const [
    const {'1': 'credentialId', '3': 1, '4': 1, '5': 9, '10': 'credentialId'},
    const {'1': 'country', '3': 2, '4': 1, '5': 9, '10': 'country'},
    const {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'metadata', '3': 4, '4': 3, '5': 11, '6': '.proto.SyncActionValue.CustomPaymentMethodMetadata', '10': 'metadata'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_CustomPaymentMethodMetadata$json = const {
  '1': 'CustomPaymentMethodMetadata',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_CustomPaymentMethodsAction$json = const {
  '1': 'CustomPaymentMethodsAction',
  '2': const [
    const {'1': 'customPaymentMethods', '3': 1, '4': 3, '5': 11, '6': '.proto.SyncActionValue.CustomPaymentMethod', '10': 'customPaymentMethods'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_DeleteChatAction$json = const {
  '1': 'DeleteChatAction',
  '2': const [
    const {'1': 'messageRange', '3': 1, '4': 1, '5': 11, '6': '.proto.SyncActionValue.SyncActionMessageRange', '9': 0, '10': 'messageRange', '17': true},
  ],
  '8': const [
    const {'1': '_messageRange'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_DeleteIndividualCallLogAction$json = const {
  '1': 'DeleteIndividualCallLogAction',
  '2': const [
    const {'1': 'peerJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'peerJid', '17': true},
    const {'1': 'isIncoming', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'isIncoming', '17': true},
  ],
  '8': const [
    const {'1': '_peerJid'},
    const {'1': '_isIncoming'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_DeleteMessageForMeAction$json = const {
  '1': 'DeleteMessageForMeAction',
  '2': const [
    const {'1': 'deleteMedia', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'deleteMedia', '17': true},
    const {'1': 'messageTimestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'messageTimestamp', '17': true},
  ],
  '8': const [
    const {'1': '_deleteMedia'},
    const {'1': '_messageTimestamp'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_DetectedOutcomesStatusAction$json = const {
  '1': 'DetectedOutcomesStatusAction',
  '2': const [
    const {'1': 'isEnabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isEnabled', '17': true},
  ],
  '8': const [
    const {'1': '_isEnabled'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_ExternalWebBetaAction$json = const {
  '1': 'ExternalWebBetaAction',
  '2': const [
    const {'1': 'isOptIn', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isOptIn', '17': true},
  ],
  '8': const [
    const {'1': '_isOptIn'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_FavoritesAction$json = const {
  '1': 'FavoritesAction',
  '2': const [
    const {'1': 'favorites', '3': 1, '4': 3, '5': 11, '6': '.proto.SyncActionValue.FavoritesAction.Favorite', '10': 'favorites'},
  ],
  '3': const [SyncActionValue_FavoritesAction_Favorite$json],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_FavoritesAction_Favorite$json = const {
  '1': 'Favorite',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'id', '17': true},
  ],
  '8': const [
    const {'1': '_id'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_InteractiveMessageAction$json = const {
  '1': 'InteractiveMessageAction',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.InteractiveMessageAction.InteractiveMessageActionMode', '10': 'type'},
  ],
  '4': const [SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode$json],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode$json = const {
  '1': 'InteractiveMessageActionMode',
  '2': const [
    const {'1': 'UNKNOWN_INTERACTIVEMESSAGEACTIONMODE_ZERO', '2': 0},
    const {'1': 'DISABLE_CTA', '2': 1},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_KeyExpiration$json = const {
  '1': 'KeyExpiration',
  '2': const [
    const {'1': 'expiredKeyEpoch', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'expiredKeyEpoch', '17': true},
  ],
  '8': const [
    const {'1': '_expiredKeyEpoch'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_LabelAssociationAction$json = const {
  '1': 'LabelAssociationAction',
  '2': const [
    const {'1': 'labeled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'labeled', '17': true},
  ],
  '8': const [
    const {'1': '_labeled'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_LabelEditAction$json = const {
  '1': 'LabelEditAction',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'color', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'color', '17': true},
    const {'1': 'predefinedId', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'predefinedId', '17': true},
    const {'1': 'deleted', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'deleted', '17': true},
    const {'1': 'orderIndex', '3': 5, '4': 1, '5': 5, '9': 4, '10': 'orderIndex', '17': true},
    const {'1': 'isActive', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'isActive', '17': true},
    const {'1': 'type', '3': 7, '4': 1, '5': 14, '6': '.proto.SyncActionValue.LabelEditAction.ListType', '9': 6, '10': 'type', '17': true},
    const {'1': 'isImmutable', '3': 8, '4': 1, '5': 8, '9': 7, '10': 'isImmutable', '17': true},
    const {'1': 'muteEndTimeMs', '3': 9, '4': 1, '5': 3, '9': 8, '10': 'muteEndTimeMs', '17': true},
  ],
  '4': const [SyncActionValue_LabelEditAction_ListType$json],
  '8': const [
    const {'1': '_name'},
    const {'1': '_color'},
    const {'1': '_predefinedId'},
    const {'1': '_deleted'},
    const {'1': '_orderIndex'},
    const {'1': '_isActive'},
    const {'1': '_type'},
    const {'1': '_isImmutable'},
    const {'1': '_muteEndTimeMs'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_LabelEditAction_ListType$json = const {
  '1': 'ListType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'UNREAD', '2': 1},
    const {'1': 'GROUPS', '2': 2},
    const {'1': 'FAVORITES', '2': 3},
    const {'1': 'PREDEFINED', '2': 4},
    const {'1': 'CUSTOM', '2': 5},
    const {'1': 'COMMUNITY', '2': 6},
    const {'1': 'SERVER_ASSIGNED', '2': 7},
    const {'1': 'DRAFTED', '2': 8},
    const {'1': 'AI_HANDOFF', '2': 9},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_LabelReorderingAction$json = const {
  '1': 'LabelReorderingAction',
  '2': const [
    const {'1': 'sortedLabelIds', '3': 1, '4': 3, '5': 5, '10': 'sortedLabelIds'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_LidContactAction$json = const {
  '1': 'LidContactAction',
  '2': const [
    const {'1': 'fullName', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'fullName', '17': true},
    const {'1': 'firstName', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'firstName', '17': true},
    const {'1': 'username', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'username', '17': true},
  ],
  '8': const [
    const {'1': '_fullName'},
    const {'1': '_firstName'},
    const {'1': '_username'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_LocaleSetting$json = const {
  '1': 'LocaleSetting',
  '2': const [
    const {'1': 'locale', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'locale', '17': true},
  ],
  '8': const [
    const {'1': '_locale'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_LockChatAction$json = const {
  '1': 'LockChatAction',
  '2': const [
    const {'1': 'locked', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'locked', '17': true},
  ],
  '8': const [
    const {'1': '_locked'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MaibaAIFeaturesControlAction$json = const {
  '1': 'MaibaAIFeaturesControlAction',
  '2': const [
    const {'1': 'aiFeatureStatus', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.MaibaAIFeaturesControlAction.MaibaAIFeatureStatus', '9': 0, '10': 'aiFeatureStatus', '17': true},
  ],
  '4': const [SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus$json],
  '8': const [
    const {'1': '_aiFeatureStatus'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus$json = const {
  '1': 'MaibaAIFeatureStatus',
  '2': const [
    const {'1': 'ENABLED', '2': 0},
    const {'1': 'ENABLED_HAS_LEARNING', '2': 1},
    const {'1': 'DISABLED', '2': 2},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MarkChatAsReadAction$json = const {
  '1': 'MarkChatAsReadAction',
  '2': const [
    const {'1': 'read', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'read', '17': true},
    const {'1': 'messageRange', '3': 2, '4': 1, '5': 11, '6': '.proto.SyncActionValue.SyncActionMessageRange', '9': 1, '10': 'messageRange', '17': true},
  ],
  '8': const [
    const {'1': '_read'},
    const {'1': '_messageRange'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MarketingMessageAction$json = const {
  '1': 'MarketingMessageAction',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'message', '17': true},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.proto.SyncActionValue.MarketingMessageAction.MarketingMessagePrototypeType', '9': 2, '10': 'type', '17': true},
    const {'1': 'createdAt', '3': 4, '4': 1, '5': 3, '9': 3, '10': 'createdAt', '17': true},
    const {'1': 'lastSentAt', '3': 5, '4': 1, '5': 3, '9': 4, '10': 'lastSentAt', '17': true},
    const {'1': 'isDeleted', '3': 6, '4': 1, '5': 8, '9': 5, '10': 'isDeleted', '17': true},
    const {'1': 'mediaId', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'mediaId', '17': true},
  ],
  '4': const [SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType$json],
  '8': const [
    const {'1': '_name'},
    const {'1': '_message'},
    const {'1': '_type'},
    const {'1': '_createdAt'},
    const {'1': '_lastSentAt'},
    const {'1': '_isDeleted'},
    const {'1': '_mediaId'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType$json = const {
  '1': 'MarketingMessagePrototypeType',
  '2': const [
    const {'1': 'PERSONALIZED', '2': 0},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MarketingMessageBroadcastAction$json = const {
  '1': 'MarketingMessageBroadcastAction',
  '2': const [
    const {'1': 'repliedCount', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'repliedCount', '17': true},
  ],
  '8': const [
    const {'1': '_repliedCount'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MerchantPaymentPartnerAction$json = const {
  '1': 'MerchantPaymentPartnerAction',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.MerchantPaymentPartnerAction.Status', '10': 'status'},
    const {'1': 'country', '3': 2, '4': 1, '5': 9, '10': 'country'},
    const {'1': 'gatewayName', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'gatewayName', '17': true},
    const {'1': 'credentialId', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'credentialId', '17': true},
  ],
  '4': const [SyncActionValue_MerchantPaymentPartnerAction_Status$json],
  '8': const [
    const {'1': '_gatewayName'},
    const {'1': '_credentialId'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MerchantPaymentPartnerAction_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'ACTIVE', '2': 0},
    const {'1': 'INACTIVE', '2': 1},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MusicUserIdAction$json = const {
  '1': 'MusicUserIdAction',
  '2': const [
    const {'1': 'musicUserId', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'musicUserId', '17': true},
    const {'1': 'music_user_id_map', '3': 2, '4': 3, '5': 11, '6': '.proto.SyncActionValue.MusicUserIdAction.MusicUserIdMapEntry', '10': 'musicUserIdMap'},
  ],
  '3': const [SyncActionValue_MusicUserIdAction_MusicUserIdMapEntry$json],
  '8': const [
    const {'1': '_musicUserId'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MusicUserIdAction_MusicUserIdMapEntry$json = const {
  '1': 'MusicUserIdMapEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_MuteAction$json = const {
  '1': 'MuteAction',
  '2': const [
    const {'1': 'muted', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'muted', '17': true},
    const {'1': 'muteEndTimestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'muteEndTimestamp', '17': true},
    const {'1': 'autoMuted', '3': 3, '4': 1, '5': 8, '9': 2, '10': 'autoMuted', '17': true},
  ],
  '8': const [
    const {'1': '_muted'},
    const {'1': '_muteEndTimestamp'},
    const {'1': '_autoMuted'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_NewsletterSavedInterestsAction$json = const {
  '1': 'NewsletterSavedInterestsAction',
  '2': const [
    const {'1': 'newsletterSavedInterests', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'newsletterSavedInterests', '17': true},
  ],
  '8': const [
    const {'1': '_newsletterSavedInterests'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_NoteEditAction$json = const {
  '1': 'NoteEditAction',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.NoteEditAction.NoteType', '9': 0, '10': 'type', '17': true},
    const {'1': 'chatJid', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'chatJid', '17': true},
    const {'1': 'createdAt', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'createdAt', '17': true},
    const {'1': 'deleted', '3': 4, '4': 1, '5': 8, '9': 3, '10': 'deleted', '17': true},
    const {'1': 'unstructuredContent', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'unstructuredContent', '17': true},
  ],
  '4': const [SyncActionValue_NoteEditAction_NoteType$json],
  '8': const [
    const {'1': '_type'},
    const {'1': '_chatJid'},
    const {'1': '_createdAt'},
    const {'1': '_deleted'},
    const {'1': '_unstructuredContent'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_NoteEditAction_NoteType$json = const {
  '1': 'NoteType',
  '2': const [
    const {'1': 'UNKNOWN_NOTETYPE_ZERO', '2': 0},
    const {'1': 'UNSTRUCTURED', '2': 1},
    const {'1': 'STRUCTURED', '2': 2},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_NotificationActivitySettingAction$json = const {
  '1': 'NotificationActivitySettingAction',
  '2': const [
    const {'1': 'notificationActivitySetting', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.NotificationActivitySettingAction.NotificationActivitySetting', '9': 0, '10': 'notificationActivitySetting', '17': true},
  ],
  '4': const [SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting$json],
  '8': const [
    const {'1': '_notificationActivitySetting'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting$json = const {
  '1': 'NotificationActivitySetting',
  '2': const [
    const {'1': 'DEFAULT_ALL_MESSAGES', '2': 0},
    const {'1': 'ALL_MESSAGES', '2': 1},
    const {'1': 'HIGHLIGHTS', '2': 2},
    const {'1': 'DEFAULT_HIGHLIGHTS', '2': 3},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_NuxAction$json = const {
  '1': 'NuxAction',
  '2': const [
    const {'1': 'acknowledged', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'acknowledged', '17': true},
  ],
  '8': const [
    const {'1': '_acknowledged'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PaymentInfoAction$json = const {
  '1': 'PaymentInfoAction',
  '2': const [
    const {'1': 'cpi', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'cpi', '17': true},
  ],
  '8': const [
    const {'1': '_cpi'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PaymentTosAction$json = const {
  '1': 'PaymentTosAction',
  '2': const [
    const {'1': 'paymentNotice', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.PaymentTosAction.PaymentNotice', '10': 'paymentNotice'},
    const {'1': 'accepted', '3': 2, '4': 1, '5': 8, '10': 'accepted'},
  ],
  '4': const [SyncActionValue_PaymentTosAction_PaymentNotice$json],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PaymentTosAction_PaymentNotice$json = const {
  '1': 'PaymentNotice',
  '2': const [
    const {'1': 'BR_PAY_PRIVACY_POLICY', '2': 0},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PinAction$json = const {
  '1': 'PinAction',
  '2': const [
    const {'1': 'pinned', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'pinned', '17': true},
  ],
  '8': const [
    const {'1': '_pinned'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PnForLidChatAction$json = const {
  '1': 'PnForLidChatAction',
  '2': const [
    const {'1': 'pnJid', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'pnJid', '17': true},
  ],
  '8': const [
    const {'1': '_pnJid'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PrimaryFeature$json = const {
  '1': 'PrimaryFeature',
  '2': const [
    const {'1': 'flags', '3': 1, '4': 3, '5': 9, '10': 'flags'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PrimaryVersionAction$json = const {
  '1': 'PrimaryVersionAction',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'version', '17': true},
  ],
  '8': const [
    const {'1': '_version'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PrivacySettingChannelsPersonalisedRecommendationAction$json = const {
  '1': 'PrivacySettingChannelsPersonalisedRecommendationAction',
  '2': const [
    const {'1': 'isUserOptedOut', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isUserOptedOut', '17': true},
  ],
  '8': const [
    const {'1': '_isUserOptedOut'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PrivacySettingDisableLinkPreviewsAction$json = const {
  '1': 'PrivacySettingDisableLinkPreviewsAction',
  '2': const [
    const {'1': 'isPreviewsDisabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isPreviewsDisabled', '17': true},
  ],
  '8': const [
    const {'1': '_isPreviewsDisabled'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PrivacySettingRelayAllCalls$json = const {
  '1': 'PrivacySettingRelayAllCalls',
  '2': const [
    const {'1': 'isEnabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isEnabled', '17': true},
  ],
  '8': const [
    const {'1': '_isEnabled'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PrivateProcessingSettingAction$json = const {
  '1': 'PrivateProcessingSettingAction',
  '2': const [
    const {'1': 'privateProcessingStatus', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.PrivateProcessingSettingAction.PrivateProcessingStatus', '9': 0, '10': 'privateProcessingStatus', '17': true},
  ],
  '4': const [SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus$json],
  '8': const [
    const {'1': '_privateProcessingStatus'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus$json = const {
  '1': 'PrivateProcessingStatus',
  '2': const [
    const {'1': 'UNDEFINED', '2': 0},
    const {'1': 'ENABLED', '2': 1},
    const {'1': 'DISABLED', '2': 2},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_PushNameSetting$json = const {
  '1': 'PushNameSetting',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_QuickReplyAction$json = const {
  '1': 'QuickReplyAction',
  '2': const [
    const {'1': 'shortcut', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'shortcut', '17': true},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'message', '17': true},
    const {'1': 'keywords', '3': 3, '4': 3, '5': 9, '10': 'keywords'},
    const {'1': 'count', '3': 4, '4': 1, '5': 5, '9': 2, '10': 'count', '17': true},
    const {'1': 'deleted', '3': 5, '4': 1, '5': 8, '9': 3, '10': 'deleted', '17': true},
  ],
  '8': const [
    const {'1': '_shortcut'},
    const {'1': '_message'},
    const {'1': '_count'},
    const {'1': '_deleted'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_RecentEmojiWeightsAction$json = const {
  '1': 'RecentEmojiWeightsAction',
  '2': const [
    const {'1': 'weights', '3': 1, '4': 3, '5': 11, '6': '.proto.RecentEmojiWeight', '10': 'weights'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_RemoveRecentStickerAction$json = const {
  '1': 'RemoveRecentStickerAction',
  '2': const [
    const {'1': 'lastStickerSentTs', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'lastStickerSentTs', '17': true},
  ],
  '8': const [
    const {'1': '_lastStickerSentTs'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_StarAction$json = const {
  '1': 'StarAction',
  '2': const [
    const {'1': 'starred', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'starred', '17': true},
  ],
  '8': const [
    const {'1': '_starred'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_StatusPostOptInNotificationPreferencesAction$json = const {
  '1': 'StatusPostOptInNotificationPreferencesAction',
  '2': const [
    const {'1': 'enabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'enabled', '17': true},
  ],
  '8': const [
    const {'1': '_enabled'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_StatusPrivacyAction$json = const {
  '1': 'StatusPrivacyAction',
  '2': const [
    const {'1': 'mode', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.StatusPrivacyAction.StatusDistributionMode', '9': 0, '10': 'mode', '17': true},
    const {'1': 'userJid', '3': 2, '4': 3, '5': 9, '10': 'userJid'},
  ],
  '4': const [SyncActionValue_StatusPrivacyAction_StatusDistributionMode$json],
  '8': const [
    const {'1': '_mode'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_StatusPrivacyAction_StatusDistributionMode$json = const {
  '1': 'StatusDistributionMode',
  '2': const [
    const {'1': 'ALLOW_LIST', '2': 0},
    const {'1': 'DENY_LIST', '2': 1},
    const {'1': 'CONTACTS', '2': 2},
    const {'1': 'CLOSE_FRIENDS', '2': 3},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_StickerAction$json = const {
  '1': 'StickerAction',
  '2': const [
    const {'1': 'url', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'url', '17': true},
    const {'1': 'fileEncSha256', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'fileEncSha256', '17': true},
    const {'1': 'mediaKey', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'mediaKey', '17': true},
    const {'1': 'mimetype', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'mimetype', '17': true},
    const {'1': 'height', '3': 5, '4': 1, '5': 13, '9': 4, '10': 'height', '17': true},
    const {'1': 'width', '3': 6, '4': 1, '5': 13, '9': 5, '10': 'width', '17': true},
    const {'1': 'directPath', '3': 7, '4': 1, '5': 9, '9': 6, '10': 'directPath', '17': true},
    const {'1': 'fileLength', '3': 8, '4': 1, '5': 4, '9': 7, '10': 'fileLength', '17': true},
    const {'1': 'isFavorite', '3': 9, '4': 1, '5': 8, '9': 8, '10': 'isFavorite', '17': true},
    const {'1': 'deviceIdHint', '3': 10, '4': 1, '5': 13, '9': 9, '10': 'deviceIdHint', '17': true},
    const {'1': 'isLottie', '3': 11, '4': 1, '5': 8, '9': 10, '10': 'isLottie', '17': true},
    const {'1': 'imageHash', '3': 12, '4': 1, '5': 9, '9': 11, '10': 'imageHash', '17': true},
    const {'1': 'isAvatarSticker', '3': 13, '4': 1, '5': 8, '9': 12, '10': 'isAvatarSticker', '17': true},
  ],
  '8': const [
    const {'1': '_url'},
    const {'1': '_fileEncSha256'},
    const {'1': '_mediaKey'},
    const {'1': '_mimetype'},
    const {'1': '_height'},
    const {'1': '_width'},
    const {'1': '_directPath'},
    const {'1': '_fileLength'},
    const {'1': '_isFavorite'},
    const {'1': '_deviceIdHint'},
    const {'1': '_isLottie'},
    const {'1': '_imageHash'},
    const {'1': '_isAvatarSticker'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_SubscriptionAction$json = const {
  '1': 'SubscriptionAction',
  '2': const [
    const {'1': 'isDeactivated', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isDeactivated', '17': true},
    const {'1': 'isAutoRenewing', '3': 2, '4': 1, '5': 8, '9': 1, '10': 'isAutoRenewing', '17': true},
    const {'1': 'expirationDate', '3': 3, '4': 1, '5': 3, '9': 2, '10': 'expirationDate', '17': true},
  ],
  '8': const [
    const {'1': '_isDeactivated'},
    const {'1': '_isAutoRenewing'},
    const {'1': '_expirationDate'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_SyncActionMessage$json = const {
  '1': 'SyncActionMessage',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 0, '10': 'key', '17': true},
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'timestamp', '17': true},
  ],
  '8': const [
    const {'1': '_key'},
    const {'1': '_timestamp'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_SyncActionMessageRange$json = const {
  '1': 'SyncActionMessageRange',
  '2': const [
    const {'1': 'lastMessageTimestamp', '3': 1, '4': 1, '5': 3, '9': 0, '10': 'lastMessageTimestamp', '17': true},
    const {'1': 'lastSystemMessageTimestamp', '3': 2, '4': 1, '5': 3, '9': 1, '10': 'lastSystemMessageTimestamp', '17': true},
    const {'1': 'messages', '3': 3, '4': 3, '5': 11, '6': '.proto.SyncActionValue.SyncActionMessage', '10': 'messages'},
  ],
  '8': const [
    const {'1': '_lastMessageTimestamp'},
    const {'1': '_lastSystemMessageTimestamp'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_TimeFormatAction$json = const {
  '1': 'TimeFormatAction',
  '2': const [
    const {'1': 'isTwentyFourHourFormatEnabled', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'isTwentyFourHourFormatEnabled', '17': true},
  ],
  '8': const [
    const {'1': '_isTwentyFourHourFormatEnabled'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_UGCBot$json = const {
  '1': 'UGCBot',
  '2': const [
    const {'1': 'definition', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'definition', '17': true},
  ],
  '8': const [
    const {'1': '_definition'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_UnarchiveChatsSetting$json = const {
  '1': 'UnarchiveChatsSetting',
  '2': const [
    const {'1': 'unarchiveChats', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'unarchiveChats', '17': true},
  ],
  '8': const [
    const {'1': '_unarchiveChats'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_UserStatusMuteAction$json = const {
  '1': 'UserStatusMuteAction',
  '2': const [
    const {'1': 'muted', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'muted', '17': true},
  ],
  '8': const [
    const {'1': '_muted'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_UsernameChatStartModeAction$json = const {
  '1': 'UsernameChatStartModeAction',
  '2': const [
    const {'1': 'chatStartMode', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncActionValue.UsernameChatStartModeAction.ChatStartMode', '9': 0, '10': 'chatStartMode', '17': true},
  ],
  '4': const [SyncActionValue_UsernameChatStartModeAction_ChatStartMode$json],
  '8': const [
    const {'1': '_chatStartMode'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_UsernameChatStartModeAction_ChatStartMode$json = const {
  '1': 'ChatStartMode',
  '2': const [
    const {'1': 'UNKNOWN_CHATSTARTMODE_ZERO', '2': 0},
    const {'1': 'LID', '2': 1},
    const {'1': 'PN', '2': 2},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_WaffleAccountLinkStateAction$json = const {
  '1': 'WaffleAccountLinkStateAction',
  '2': const [
    const {'1': 'linkState', '3': 2, '4': 1, '5': 14, '6': '.proto.SyncActionValue.WaffleAccountLinkStateAction.AccountLinkState', '9': 0, '10': 'linkState', '17': true},
  ],
  '4': const [SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState$json],
  '8': const [
    const {'1': '_linkState'},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState$json = const {
  '1': 'AccountLinkState',
  '2': const [
    const {'1': 'ACTIVE', '2': 0},
    const {'1': 'PAUSED', '2': 1},
    const {'1': 'UNLINKED', '2': 2},
  ],
};

@$core.Deprecated('Use syncActionValueDescriptor instead')
const SyncActionValue_WamoUserIdentifierAction$json = const {
  '1': 'WamoUserIdentifierAction',
  '2': const [
    const {'1': 'identifier', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'identifier', '17': true},
  ],
  '8': const [
    const {'1': '_identifier'},
  ],
};

/// Descriptor for `SyncActionValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncActionValueDescriptor = $convert.base64Decode('Cg9TeW5jQWN0aW9uVmFsdWUSIQoJdGltZXN0YW1wGAEgASgDSABSCXRpbWVzdGFtcIgBARJGCgpzdGFyQWN0aW9uGAIgASgLMiEucHJvdG8uU3luY0FjdGlvblZhbHVlLlN0YXJBY3Rpb25IAVIKc3RhckFjdGlvbogBARJPCg1jb250YWN0QWN0aW9uGAMgASgLMiQucHJvdG8uU3luY0FjdGlvblZhbHVlLkNvbnRhY3RBY3Rpb25IAlINY29udGFjdEFjdGlvbogBARJGCgptdXRlQWN0aW9uGAQgASgLMiEucHJvdG8uU3luY0FjdGlvblZhbHVlLk11dGVBY3Rpb25IA1IKbXV0ZUFjdGlvbogBARJDCglwaW5BY3Rpb24YBSABKAsyIC5wcm90by5TeW5jQWN0aW9uVmFsdWUuUGluQWN0aW9uSARSCXBpbkFjdGlvbogBARJVCg9wdXNoTmFtZVNldHRpbmcYByABKAsyJi5wcm90by5TeW5jQWN0aW9uVmFsdWUuUHVzaE5hbWVTZXR0aW5nSAVSD3B1c2hOYW1lU2V0dGluZ4gBARJYChBxdWlja1JlcGx5QWN0aW9uGAggASgLMicucHJvdG8uU3luY0FjdGlvblZhbHVlLlF1aWNrUmVwbHlBY3Rpb25IBlIQcXVpY2tSZXBseUFjdGlvbogBARJwChhyZWNlbnRFbW9qaVdlaWdodHNBY3Rpb24YCyABKAsyLy5wcm90by5TeW5jQWN0aW9uVmFsdWUuUmVjZW50RW1vamlXZWlnaHRzQWN0aW9uSAdSGHJlY2VudEVtb2ppV2VpZ2h0c0FjdGlvbogBARJVCg9sYWJlbEVkaXRBY3Rpb24YDiABKAsyJi5wcm90by5TeW5jQWN0aW9uVmFsdWUuTGFiZWxFZGl0QWN0aW9uSAhSD2xhYmVsRWRpdEFjdGlvbogBARJqChZsYWJlbEFzc29jaWF0aW9uQWN0aW9uGA8gASgLMi0ucHJvdG8uU3luY0FjdGlvblZhbHVlLkxhYmVsQXNzb2NpYXRpb25BY3Rpb25ICVIWbGFiZWxBc3NvY2lhdGlvbkFjdGlvbogBARJPCg1sb2NhbGVTZXR0aW5nGBAgASgLMiQucHJvdG8uU3luY0FjdGlvblZhbHVlLkxvY2FsZVNldHRpbmdIClINbG9jYWxlU2V0dGluZ4gBARJbChFhcmNoaXZlQ2hhdEFjdGlvbhgRIAEoCzIoLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5BcmNoaXZlQ2hhdEFjdGlvbkgLUhFhcmNoaXZlQ2hhdEFjdGlvbogBARJwChhkZWxldGVNZXNzYWdlRm9yTWVBY3Rpb24YEiABKAsyLy5wcm90by5TeW5jQWN0aW9uVmFsdWUuRGVsZXRlTWVzc2FnZUZvck1lQWN0aW9uSAxSGGRlbGV0ZU1lc3NhZ2VGb3JNZUFjdGlvbogBARJPCg1rZXlFeHBpcmF0aW9uGBMgASgLMiQucHJvdG8uU3luY0FjdGlvblZhbHVlLktleUV4cGlyYXRpb25IDVINa2V5RXhwaXJhdGlvbogBARJkChRtYXJrQ2hhdEFzUmVhZEFjdGlvbhgUIAEoCzIrLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5NYXJrQ2hhdEFzUmVhZEFjdGlvbkgOUhRtYXJrQ2hhdEFzUmVhZEFjdGlvbogBARJVCg9jbGVhckNoYXRBY3Rpb24YFSABKAsyJi5wcm90by5TeW5jQWN0aW9uVmFsdWUuQ2xlYXJDaGF0QWN0aW9uSA9SD2NsZWFyQ2hhdEFjdGlvbogBARJYChBkZWxldGVDaGF0QWN0aW9uGBYgASgLMicucHJvdG8uU3luY0FjdGlvblZhbHVlLkRlbGV0ZUNoYXRBY3Rpb25IEFIQZGVsZXRlQ2hhdEFjdGlvbogBARJnChV1bmFyY2hpdmVDaGF0c1NldHRpbmcYFyABKAsyLC5wcm90by5TeW5jQWN0aW9uVmFsdWUuVW5hcmNoaXZlQ2hhdHNTZXR0aW5nSBFSFXVuYXJjaGl2ZUNoYXRzU2V0dGluZ4gBARJSCg5wcmltYXJ5RmVhdHVyZRgYIAEoCzIlLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5QcmltYXJ5RmVhdHVyZUgSUg5wcmltYXJ5RmVhdHVyZYgBARJzChlhbmRyb2lkVW5zdXBwb3J0ZWRBY3Rpb25zGBogASgLMjAucHJvdG8uU3luY0FjdGlvblZhbHVlLkFuZHJvaWRVbnN1cHBvcnRlZEFjdGlvbnNIE1IZYW5kcm9pZFVuc3VwcG9ydGVkQWN0aW9uc4gBARJJCgthZ2VudEFjdGlvbhgbIAEoCzIiLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5BZ2VudEFjdGlvbkgUUgthZ2VudEFjdGlvbogBARJeChJzdWJzY3JpcHRpb25BY3Rpb24YHCABKAsyKS5wcm90by5TeW5jQWN0aW9uVmFsdWUuU3Vic2NyaXB0aW9uQWN0aW9uSBVSEnN1YnNjcmlwdGlvbkFjdGlvbogBARJkChR1c2VyU3RhdHVzTXV0ZUFjdGlvbhgdIAEoCzIrLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5Vc2VyU3RhdHVzTXV0ZUFjdGlvbkgWUhR1c2VyU3RhdHVzTXV0ZUFjdGlvbogBARJYChB0aW1lRm9ybWF0QWN0aW9uGB4gASgLMicucHJvdG8uU3luY0FjdGlvblZhbHVlLlRpbWVGb3JtYXRBY3Rpb25IF1IQdGltZUZvcm1hdEFjdGlvbogBARJDCgludXhBY3Rpb24YHyABKAsyIC5wcm90by5TeW5jQWN0aW9uVmFsdWUuTnV4QWN0aW9uSBhSCW51eEFjdGlvbogBARJkChRwcmltYXJ5VmVyc2lvbkFjdGlvbhggIAEoCzIrLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5QcmltYXJ5VmVyc2lvbkFjdGlvbkgZUhRwcmltYXJ5VmVyc2lvbkFjdGlvbogBARJPCg1zdGlja2VyQWN0aW9uGCEgASgLMiQucHJvdG8uU3luY0FjdGlvblZhbHVlLlN0aWNrZXJBY3Rpb25IGlINc3RpY2tlckFjdGlvbogBARJzChlyZW1vdmVSZWNlbnRTdGlja2VyQWN0aW9uGCIgASgLMjAucHJvdG8uU3luY0FjdGlvblZhbHVlLlJlbW92ZVJlY2VudFN0aWNrZXJBY3Rpb25IG1IZcmVtb3ZlUmVjZW50U3RpY2tlckFjdGlvbogBARJYCg5jaGF0QXNzaWdubWVudBgjIAEoCzIrLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5DaGF0QXNzaWdubWVudEFjdGlvbkgcUg5jaGF0QXNzaWdubWVudIgBARJ8ChpjaGF0QXNzaWdubWVudE9wZW5lZFN0YXR1cxgkIAEoCzI3LnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5DaGF0QXNzaWdubWVudE9wZW5lZFN0YXR1c0FjdGlvbkgdUhpjaGF0QXNzaWdubWVudE9wZW5lZFN0YXR1c4gBARJeChJwbkZvckxpZENoYXRBY3Rpb24YJSABKAsyKS5wcm90by5TeW5jQWN0aW9uVmFsdWUuUG5Gb3JMaWRDaGF0QWN0aW9uSB5SEnBuRm9yTGlkQ2hhdEFjdGlvbogBARJqChZtYXJrZXRpbmdNZXNzYWdlQWN0aW9uGCYgASgLMi0ucHJvdG8uU3luY0FjdGlvblZhbHVlLk1hcmtldGluZ01lc3NhZ2VBY3Rpb25IH1IWbWFya2V0aW5nTWVzc2FnZUFjdGlvbogBARKFAQofbWFya2V0aW5nTWVzc2FnZUJyb2FkY2FzdEFjdGlvbhgnIAEoCzI2LnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5NYXJrZXRpbmdNZXNzYWdlQnJvYWRjYXN0QWN0aW9uSCBSH21hcmtldGluZ01lc3NhZ2VCcm9hZGNhc3RBY3Rpb26IAQESZwoVZXh0ZXJuYWxXZWJCZXRhQWN0aW9uGCggASgLMiwucHJvdG8uU3luY0FjdGlvblZhbHVlLkV4dGVybmFsV2ViQmV0YUFjdGlvbkghUhVleHRlcm5hbFdlYkJldGFBY3Rpb26IAQESeQobcHJpdmFjeVNldHRpbmdSZWxheUFsbENhbGxzGCkgASgLMjIucHJvdG8uU3luY0FjdGlvblZhbHVlLlByaXZhY3lTZXR0aW5nUmVsYXlBbGxDYWxsc0giUhtwcml2YWN5U2V0dGluZ1JlbGF5QWxsQ2FsbHOIAQESTwoNY2FsbExvZ0FjdGlvbhgqIAEoCzIkLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5DYWxsTG9nQWN0aW9uSCNSDWNhbGxMb2dBY3Rpb26IAQESOgoGdWdjQm90GCsgASgLMh0ucHJvdG8uU3luY0FjdGlvblZhbHVlLlVHQ0JvdEgkUgZ1Z2NCb3SIAQESVQoNc3RhdHVzUHJpdmFjeRgsIAEoCzIqLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5TdGF0dXNQcml2YWN5QWN0aW9uSCVSDXN0YXR1c1ByaXZhY3mIAQESbQoXYm90V2VsY29tZVJlcXVlc3RBY3Rpb24YLSABKAsyLi5wcm90by5TeW5jQWN0aW9uVmFsdWUuQm90V2VsY29tZVJlcXVlc3RBY3Rpb25IJlIXYm90V2VsY29tZVJlcXVlc3RBY3Rpb26IAQEScwoXZGVsZXRlSW5kaXZpZHVhbENhbGxMb2cYLiABKAsyNC5wcm90by5TeW5jQWN0aW9uVmFsdWUuRGVsZXRlSW5kaXZpZHVhbENhbGxMb2dBY3Rpb25IJ1IXZGVsZXRlSW5kaXZpZHVhbENhbGxMb2eIAQESZwoVbGFiZWxSZW9yZGVyaW5nQWN0aW9uGC8gASgLMiwucHJvdG8uU3luY0FjdGlvblZhbHVlLkxhYmVsUmVvcmRlcmluZ0FjdGlvbkgoUhVsYWJlbFJlb3JkZXJpbmdBY3Rpb26IAQESWwoRcGF5bWVudEluZm9BY3Rpb24YMCABKAsyKC5wcm90by5TeW5jQWN0aW9uVmFsdWUuUGF5bWVudEluZm9BY3Rpb25IKVIRcGF5bWVudEluZm9BY3Rpb26IAQESdgoaY3VzdG9tUGF5bWVudE1ldGhvZHNBY3Rpb24YMSABKAsyMS5wcm90by5TeW5jQWN0aW9uVmFsdWUuQ3VzdG9tUGF5bWVudE1ldGhvZHNBY3Rpb25IKlIaY3VzdG9tUGF5bWVudE1ldGhvZHNBY3Rpb26IAQESUgoObG9ja0NoYXRBY3Rpb24YMiABKAsyJS5wcm90by5TeW5jQWN0aW9uVmFsdWUuTG9ja0NoYXRBY3Rpb25IK1IObG9ja0NoYXRBY3Rpb26IAQESSAoQY2hhdExvY2tTZXR0aW5ncxgzIAEoCzIXLnByb3RvLkNoYXRMb2NrU2V0dGluZ3NILFIQY2hhdExvY2tTZXR0aW5nc4gBARJwChh3YW1vVXNlcklkZW50aWZpZXJBY3Rpb24YNCABKAsyLy5wcm90by5TeW5jQWN0aW9uVmFsdWUuV2Ftb1VzZXJJZGVudGlmaWVyQWN0aW9uSC1SGHdhbW9Vc2VySWRlbnRpZmllckFjdGlvbogBARKdAQoncHJpdmFjeVNldHRpbmdEaXNhYmxlTGlua1ByZXZpZXdzQWN0aW9uGDUgASgLMj4ucHJvdG8uU3luY0FjdGlvblZhbHVlLlByaXZhY3lTZXR0aW5nRGlzYWJsZUxpbmtQcmV2aWV3c0FjdGlvbkguUidwcml2YWN5U2V0dGluZ0Rpc2FibGVMaW5rUHJldmlld3NBY3Rpb26IAQESTgoSZGV2aWNlQ2FwYWJpbGl0aWVzGDYgASgLMhkucHJvdG8uRGV2aWNlQ2FwYWJpbGl0aWVzSC9SEmRldmljZUNhcGFiaWxpdGllc4gBARJSCg5ub3RlRWRpdEFjdGlvbhg3IAEoCzIlLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5Ob3RlRWRpdEFjdGlvbkgwUg5ub3RlRWRpdEFjdGlvbogBARJVCg9mYXZvcml0ZXNBY3Rpb24YOCABKAsyJi5wcm90by5TeW5jQWN0aW9uVmFsdWUuRmF2b3JpdGVzQWN0aW9uSDFSD2Zhdm9yaXRlc0FjdGlvbogBARJ8ChxtZXJjaGFudFBheW1lbnRQYXJ0bmVyQWN0aW9uGDkgASgLMjMucHJvdG8uU3luY0FjdGlvblZhbHVlLk1lcmNoYW50UGF5bWVudFBhcnRuZXJBY3Rpb25IMlIcbWVyY2hhbnRQYXltZW50UGFydG5lckFjdGlvbogBARJ8Chx3YWZmbGVBY2NvdW50TGlua1N0YXRlQWN0aW9uGDogASgLMjMucHJvdG8uU3luY0FjdGlvblZhbHVlLldhZmZsZUFjY291bnRMaW5rU3RhdGVBY3Rpb25IM1Icd2FmZmxlQWNjb3VudExpbmtTdGF0ZUFjdGlvbogBARJtChV1c2VybmFtZUNoYXRTdGFydE1vZGUYOyABKAsyMi5wcm90by5TeW5jQWN0aW9uVmFsdWUuVXNlcm5hbWVDaGF0U3RhcnRNb2RlQWN0aW9uSDRSFXVzZXJuYW1lQ2hhdFN0YXJ0TW9kZYgBARKLAQohbm90aWZpY2F0aW9uQWN0aXZpdHlTZXR0aW5nQWN0aW9uGDwgASgLMjgucHJvdG8uU3luY0FjdGlvblZhbHVlLk5vdGlmaWNhdGlvbkFjdGl2aXR5U2V0dGluZ0FjdGlvbkg1UiFub3RpZmljYXRpb25BY3Rpdml0eVNldHRpbmdBY3Rpb26IAQESWAoQbGlkQ29udGFjdEFjdGlvbhg9IAEoCzInLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5MaWRDb250YWN0QWN0aW9uSDZSEGxpZENvbnRhY3RBY3Rpb26IAQESiAEKIGN0d2FQZXJDdXN0b21lckRhdGFTaGFyaW5nQWN0aW9uGD4gASgLMjcucHJvdG8uU3luY0FjdGlvblZhbHVlLkN0d2FQZXJDdXN0b21lckRhdGFTaGFyaW5nQWN0aW9uSDdSIGN0d2FQZXJDdXN0b21lckRhdGFTaGFyaW5nQWN0aW9uiAEBElgKEHBheW1lbnRUb3NBY3Rpb24YPyABKAsyJy5wcm90by5TeW5jQWN0aW9uVmFsdWUuUGF5bWVudFRvc0FjdGlvbkg4UhBwYXltZW50VG9zQWN0aW9uiAEBEsoBCjZwcml2YWN5U2V0dGluZ0NoYW5uZWxzUGVyc29uYWxpc2VkUmVjb21tZW5kYXRpb25BY3Rpb24YQCABKAsyTS5wcm90by5TeW5jQWN0aW9uVmFsdWUuUHJpdmFjeVNldHRpbmdDaGFubmVsc1BlcnNvbmFsaXNlZFJlY29tbWVuZGF0aW9uQWN0aW9uSDlSNnByaXZhY3lTZXR0aW5nQ2hhbm5lbHNQZXJzb25hbGlzZWRSZWNvbW1lbmRhdGlvbkFjdGlvbogBARKOAQoiYnVzaW5lc3NCcm9hZGNhc3RBc3NvY2lhdGlvbkFjdGlvbhhBIAEoCzI5LnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5CdXNpbmVzc0Jyb2FkY2FzdEFzc29jaWF0aW9uQWN0aW9uSDpSImJ1c2luZXNzQnJvYWRjYXN0QXNzb2NpYXRpb25BY3Rpb26IAQESfAocZGV0ZWN0ZWRPdXRjb21lc1N0YXR1c0FjdGlvbhhCIAEoCzIzLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5EZXRlY3RlZE91dGNvbWVzU3RhdHVzQWN0aW9uSDtSHGRldGVjdGVkT3V0Y29tZXNTdGF0dXNBY3Rpb26IAQESfAocbWFpYmFBaUZlYXR1cmVzQ29udHJvbEFjdGlvbhhEIAEoCzIzLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5NYWliYUFJRmVhdHVyZXNDb250cm9sQWN0aW9uSDxSHG1haWJhQWlGZWF0dXJlc0NvbnRyb2xBY3Rpb26IAQESeQobYnVzaW5lc3NCcm9hZGNhc3RMaXN0QWN0aW9uGEUgASgLMjIucHJvdG8uU3luY0FjdGlvblZhbHVlLkJ1c2luZXNzQnJvYWRjYXN0TGlzdEFjdGlvbkg9UhtidXNpbmVzc0Jyb2FkY2FzdExpc3RBY3Rpb26IAQESWwoRbXVzaWNVc2VySWRBY3Rpb24YRiABKAsyKC5wcm90by5TeW5jQWN0aW9uVmFsdWUuTXVzaWNVc2VySWRBY3Rpb25IPlIRbXVzaWNVc2VySWRBY3Rpb26IAQESrAEKLHN0YXR1c1Bvc3RPcHRJbk5vdGlmaWNhdGlvblByZWZlcmVuY2VzQWN0aW9uGEcgASgLMkMucHJvdG8uU3luY0FjdGlvblZhbHVlLlN0YXR1c1Bvc3RPcHRJbk5vdGlmaWNhdGlvblByZWZlcmVuY2VzQWN0aW9uSD9SLHN0YXR1c1Bvc3RPcHRJbk5vdGlmaWNhdGlvblByZWZlcmVuY2VzQWN0aW9uiAEBEmEKE2F2YXRhclVwZGF0ZWRBY3Rpb24YSCABKAsyKi5wcm90by5TeW5jQWN0aW9uVmFsdWUuQXZhdGFyVXBkYXRlZEFjdGlvbkhAUhNhdmF0YXJVcGRhdGVkQWN0aW9uiAEBEoIBCh5wcml2YXRlUHJvY2Vzc2luZ1NldHRpbmdBY3Rpb24YSiABKAsyNS5wcm90by5TeW5jQWN0aW9uVmFsdWUuUHJpdmF0ZVByb2Nlc3NpbmdTZXR0aW5nQWN0aW9uSEFSHnByaXZhdGVQcm9jZXNzaW5nU2V0dGluZ0FjdGlvbogBARKCAQoebmV3c2xldHRlclNhdmVkSW50ZXJlc3RzQWN0aW9uGEsgASgLMjUucHJvdG8uU3luY0FjdGlvblZhbHVlLk5ld3NsZXR0ZXJTYXZlZEludGVyZXN0c0FjdGlvbkhCUh5uZXdzbGV0dGVyU2F2ZWRJbnRlcmVzdHNBY3Rpb26IAQESZAoUYWlUaHJlYWRSZW5hbWVBY3Rpb24YTCABKAsyKy5wcm90by5TeW5jQWN0aW9uVmFsdWUuQWlUaHJlYWRSZW5hbWVBY3Rpb25IQ1IUYWlUaHJlYWRSZW5hbWVBY3Rpb26IAQEScAoYaW50ZXJhY3RpdmVNZXNzYWdlQWN0aW9uGE0gASgLMi8ucHJvdG8uU3luY0FjdGlvblZhbHVlLkludGVyYWN0aXZlTWVzc2FnZUFjdGlvbkhEUhhpbnRlcmFjdGl2ZU1lc3NhZ2VBY3Rpb26IAQEajgEKC0FnZW50QWN0aW9uEhcKBG5hbWUYASABKAlIAFIEbmFtZYgBARIfCghkZXZpY2VJRBgCIAEoBUgBUghkZXZpY2VJRIgBARIhCglpc0RlbGV0ZWQYAyABKAhIAlIJaXNEZWxldGVkiAEBQgcKBV9uYW1lQgsKCV9kZXZpY2VJREIMCgpfaXNEZWxldGVkGkQKFEFpVGhyZWFkUmVuYW1lQWN0aW9uEh8KCG5ld1RpdGxlGAEgASgJSABSCG5ld1RpdGxliAEBQgsKCV9uZXdUaXRsZRpGChlBbmRyb2lkVW5zdXBwb3J0ZWRBY3Rpb25zEh0KB2FsbG93ZWQYASABKAhIAFIHYWxsb3dlZIgBAUIKCghfYWxsb3dlZBqqAQoRQXJjaGl2ZUNoYXRBY3Rpb24SHwoIYXJjaGl2ZWQYASABKAhIAFIIYXJjaGl2ZWSIAQESVgoMbWVzc2FnZVJhbmdlGAIgASgLMi0ucHJvdG8uU3luY0FjdGlvblZhbHVlLlN5bmNBY3Rpb25NZXNzYWdlUmFuZ2VIAVIMbWVzc2FnZVJhbmdliAEBQgsKCV9hcmNoaXZlZEIPCg1fbWVzc2FnZVJhbmdlGpYCChNBdmF0YXJVcGRhdGVkQWN0aW9uEl0KCWV2ZW50VHlwZRgBIAEoDjI6LnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5BdmF0YXJVcGRhdGVkQWN0aW9uLkF2YXRhckV2ZW50VHlwZUgAUglldmVudFR5cGWIAQESWAoUcmVjZW50QXZhdGFyU3RpY2tlcnMYAiADKAsyJC5wcm90by5TeW5jQWN0aW9uVmFsdWUuU3RpY2tlckFjdGlvblIUcmVjZW50QXZhdGFyU3RpY2tlcnMiOAoPQXZhdGFyRXZlbnRUeXBlEgsKB1VQREFURUQQABILCgdDUkVBVEVEEAESCwoHREVMRVRFRBACQgwKCl9ldmVudFR5cGUaQQoXQm90V2VsY29tZVJlcXVlc3RBY3Rpb24SGwoGaXNTZW50GAEgASgISABSBmlzU2VudIgBAUIJCgdfaXNTZW50GlcKGEJyb2FkY2FzdExpc3RQYXJ0aWNpcGFudBIWCgZsaWRKaWQYASABKAlSBmxpZEppZBIZCgVwbkppZBgCIAEoCUgAUgVwbkppZIgBAUIICgZfcG5KaWQaTwoiQnVzaW5lc3NCcm9hZGNhc3RBc3NvY2lhdGlvbkFjdGlvbhIdCgdkZWxldGVkGAEgASgISABSB2RlbGV0ZWSIAQFCCgoIX2RlbGV0ZWQaywEKG0J1c2luZXNzQnJvYWRjYXN0TGlzdEFjdGlvbhIdCgdkZWxldGVkGAEgASgISABSB2RlbGV0ZWSIAQESUwoMcGFydGljaXBhbnRzGAIgAygLMi8ucHJvdG8uU3luY0FjdGlvblZhbHVlLkJyb2FkY2FzdExpc3RQYXJ0aWNpcGFudFIMcGFydGljaXBhbnRzEh8KCGxpc3ROYW1lGAMgASgJSAFSCGxpc3ROYW1liAEBQgoKCF9kZWxldGVkQgsKCV9saXN0TmFtZRpiCg1DYWxsTG9nQWN0aW9uEj8KDWNhbGxMb2dSZWNvcmQYASABKAsyFC5wcm90by5DYWxsTG9nUmVjb3JkSABSDWNhbGxMb2dSZWNvcmSIAQFCEAoOX2NhbGxMb2dSZWNvcmQaUwoUQ2hhdEFzc2lnbm1lbnRBY3Rpb24SKQoNZGV2aWNlQWdlbnRJRBgBIAEoCUgAUg1kZXZpY2VBZ2VudElEiAEBQhAKDl9kZXZpY2VBZ2VudElEGlYKIENoYXRBc3NpZ25tZW50T3BlbmVkU3RhdHVzQWN0aW9uEiMKCmNoYXRPcGVuZWQYASABKAhIAFIKY2hhdE9wZW5lZIgBAUINCgtfY2hhdE9wZW5lZBp6Cg9DbGVhckNoYXRBY3Rpb24SVgoMbWVzc2FnZVJhbmdlGAEgASgLMi0ucHJvdG8uU3luY0FjdGlvblZhbHVlLlN5bmNBY3Rpb25NZXNzYWdlUmFuZ2VIAFIMbWVzc2FnZVJhbmdliAEBQg8KDV9tZXNzYWdlUmFuZ2UaxwIKDUNvbnRhY3RBY3Rpb24SHwoIZnVsbE5hbWUYASABKAlIAFIIZnVsbE5hbWWIAQESIQoJZmlyc3ROYW1lGAIgASgJSAFSCWZpcnN0TmFtZYgBARIbCgZsaWRKaWQYAyABKAlIAlIGbGlkSmlkiAEBEj8KGHNhdmVPblByaW1hcnlBZGRyZXNzYm9vaxgEIAEoCEgDUhhzYXZlT25QcmltYXJ5QWRkcmVzc2Jvb2uIAQESGQoFcG5KaWQYBSABKAlIBFIFcG5KaWSIAQESHwoIdXNlcm5hbWUYBiABKAlIBVIIdXNlcm5hbWWIAQFCCwoJX2Z1bGxOYW1lQgwKCl9maXJzdE5hbWVCCQoHX2xpZEppZEIbChlfc2F2ZU9uUHJpbWFyeUFkZHJlc3Nib29rQggKBl9wbkppZEILCglfdXNlcm5hbWUaoQEKIEN0d2FQZXJDdXN0b21lckRhdGFTaGFyaW5nQWN0aW9uElUKI2lzQ3R3YVBlckN1c3RvbWVyRGF0YVNoYXJpbmdFbmFibGVkGAEgASgISABSI2lzQ3R3YVBlckN1c3RvbWVyRGF0YVNoYXJpbmdFbmFibGVkiAEBQiYKJF9pc0N0d2FQZXJDdXN0b21lckRhdGFTaGFyaW5nRW5hYmxlZBq3AQoTQ3VzdG9tUGF5bWVudE1ldGhvZBIiCgxjcmVkZW50aWFsSWQYASABKAlSDGNyZWRlbnRpYWxJZBIYCgdjb3VudHJ5GAIgASgJUgdjb3VudHJ5EhIKBHR5cGUYAyABKAlSBHR5cGUSTgoIbWV0YWRhdGEYBCADKAsyMi5wcm90by5TeW5jQWN0aW9uVmFsdWUuQ3VzdG9tUGF5bWVudE1ldGhvZE1ldGFkYXRhUghtZXRhZGF0YRpFChtDdXN0b21QYXltZW50TWV0aG9kTWV0YWRhdGESEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlGnwKGkN1c3RvbVBheW1lbnRNZXRob2RzQWN0aW9uEl4KFGN1c3RvbVBheW1lbnRNZXRob2RzGAEgAygLMioucHJvdG8uU3luY0FjdGlvblZhbHVlLkN1c3RvbVBheW1lbnRNZXRob2RSFGN1c3RvbVBheW1lbnRNZXRob2RzGnsKEERlbGV0ZUNoYXRBY3Rpb24SVgoMbWVzc2FnZVJhbmdlGAEgASgLMi0ucHJvdG8uU3luY0FjdGlvblZhbHVlLlN5bmNBY3Rpb25NZXNzYWdlUmFuZ2VIAFIMbWVzc2FnZVJhbmdliAEBQg8KDV9tZXNzYWdlUmFuZ2UafgodRGVsZXRlSW5kaXZpZHVhbENhbGxMb2dBY3Rpb24SHQoHcGVlckppZBgBIAEoCUgAUgdwZWVySmlkiAEBEiMKCmlzSW5jb21pbmcYAiABKAhIAVIKaXNJbmNvbWluZ4gBAUIKCghfcGVlckppZEINCgtfaXNJbmNvbWluZxqXAQoYRGVsZXRlTWVzc2FnZUZvck1lQWN0aW9uEiUKC2RlbGV0ZU1lZGlhGAEgASgISABSC2RlbGV0ZU1lZGlhiAEBEi8KEG1lc3NhZ2VUaW1lc3RhbXAYAiABKANIAVIQbWVzc2FnZVRpbWVzdGFtcIgBAUIOCgxfZGVsZXRlTWVkaWFCEwoRX21lc3NhZ2VUaW1lc3RhbXAaTwocRGV0ZWN0ZWRPdXRjb21lc1N0YXR1c0FjdGlvbhIhCglpc0VuYWJsZWQYASABKAhIAFIJaXNFbmFibGVkiAEBQgwKCl9pc0VuYWJsZWQaQgoVRXh0ZXJuYWxXZWJCZXRhQWN0aW9uEh0KB2lzT3B0SW4YASABKAhIAFIHaXNPcHRJbogBAUIKCghfaXNPcHRJbhqIAQoPRmF2b3JpdGVzQWN0aW9uEk0KCWZhdm9yaXRlcxgBIAMoCzIvLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5GYXZvcml0ZXNBY3Rpb24uRmF2b3JpdGVSCWZhdm9yaXRlcxomCghGYXZvcml0ZRITCgJpZBgBIAEoCUgAUgJpZIgBAUIFCgNfaWQa3AEKGEludGVyYWN0aXZlTWVzc2FnZUFjdGlvbhJgCgR0eXBlGAEgASgOMkwucHJvdG8uU3luY0FjdGlvblZhbHVlLkludGVyYWN0aXZlTWVzc2FnZUFjdGlvbi5JbnRlcmFjdGl2ZU1lc3NhZ2VBY3Rpb25Nb2RlUgR0eXBlIl4KHEludGVyYWN0aXZlTWVzc2FnZUFjdGlvbk1vZGUSLQopVU5LTk9XTl9JTlRFUkFDVElWRU1FU1NBR0VBQ1RJT05NT0RFX1pFUk8QABIPCgtESVNBQkxFX0NUQRABGlIKDUtleUV4cGlyYXRpb24SLQoPZXhwaXJlZEtleUVwb2NoGAEgASgFSABSD2V4cGlyZWRLZXlFcG9jaIgBAUISChBfZXhwaXJlZEtleUVwb2NoGkMKFkxhYmVsQXNzb2NpYXRpb25BY3Rpb24SHQoHbGFiZWxlZBgBIAEoCEgAUgdsYWJlbGVkiAEBQgoKCF9sYWJlbGVkGoEFCg9MYWJlbEVkaXRBY3Rpb24SFwoEbmFtZRgBIAEoCUgAUgRuYW1liAEBEhkKBWNvbG9yGAIgASgFSAFSBWNvbG9yiAEBEicKDHByZWRlZmluZWRJZBgDIAEoBUgCUgxwcmVkZWZpbmVkSWSIAQESHQoHZGVsZXRlZBgEIAEoCEgDUgdkZWxldGVkiAEBEiMKCm9yZGVySW5kZXgYBSABKAVIBFIKb3JkZXJJbmRleIgBARIfCghpc0FjdGl2ZRgGIAEoCEgFUghpc0FjdGl2ZYgBARJICgR0eXBlGAcgASgOMi8ucHJvdG8uU3luY0FjdGlvblZhbHVlLkxhYmVsRWRpdEFjdGlvbi5MaXN0VHlwZUgGUgR0eXBliAEBEiUKC2lzSW1tdXRhYmxlGAggASgISAdSC2lzSW1tdXRhYmxliAEBEikKDW11dGVFbmRUaW1lTXMYCSABKANICFINbXV0ZUVuZFRpbWVNc4gBASKYAQoITGlzdFR5cGUSCAoETk9ORRAAEgoKBlVOUkVBRBABEgoKBkdST1VQUxACEg0KCUZBVk9SSVRFUxADEg4KClBSRURFRklORUQQBBIKCgZDVVNUT00QBRINCglDT01NVU5JVFkQBhITCg9TRVJWRVJfQVNTSUdORUQQBxILCgdEUkFGVEVEEAgSDgoKQUlfSEFORE9GRhAJQgcKBV9uYW1lQggKBl9jb2xvckIPCg1fcHJlZGVmaW5lZElkQgoKCF9kZWxldGVkQg0KC19vcmRlckluZGV4QgsKCV9pc0FjdGl2ZUIHCgVfdHlwZUIOCgxfaXNJbW11dGFibGVCEAoOX211dGVFbmRUaW1lTXMaPwoVTGFiZWxSZW9yZGVyaW5nQWN0aW9uEiYKDnNvcnRlZExhYmVsSWRzGAEgAygFUg5zb3J0ZWRMYWJlbElkcxqfAQoQTGlkQ29udGFjdEFjdGlvbhIfCghmdWxsTmFtZRgBIAEoCUgAUghmdWxsTmFtZYgBARIhCglmaXJzdE5hbWUYAiABKAlIAVIJZmlyc3ROYW1liAEBEh8KCHVzZXJuYW1lGAMgASgJSAJSCHVzZXJuYW1liAEBQgsKCV9mdWxsTmFtZUIMCgpfZmlyc3ROYW1lQgsKCV91c2VybmFtZRo3Cg1Mb2NhbGVTZXR0aW5nEhsKBmxvY2FsZRgBIAEoCUgAUgZsb2NhbGWIAQFCCQoHX2xvY2FsZRo4Cg5Mb2NrQ2hhdEFjdGlvbhIbCgZsb2NrZWQYASABKAhIAFIGbG9ja2VkiAEBQgkKB19sb2NrZWQa+AEKHE1haWJhQUlGZWF0dXJlc0NvbnRyb2xBY3Rpb24SdwoPYWlGZWF0dXJlU3RhdHVzGAEgASgOMkgucHJvdG8uU3luY0FjdGlvblZhbHVlLk1haWJhQUlGZWF0dXJlc0NvbnRyb2xBY3Rpb24uTWFpYmFBSUZlYXR1cmVTdGF0dXNIAFIPYWlGZWF0dXJlU3RhdHVziAEBIksKFE1haWJhQUlGZWF0dXJlU3RhdHVzEgsKB0VOQUJMRUQQABIYChRFTkFCTEVEX0hBU19MRUFSTklORxABEgwKCERJU0FCTEVEEAJCEgoQX2FpRmVhdHVyZVN0YXR1cxqhAQoUTWFya0NoYXRBc1JlYWRBY3Rpb24SFwoEcmVhZBgBIAEoCEgAUgRyZWFkiAEBElYKDG1lc3NhZ2VSYW5nZRgCIAEoCzItLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5TeW5jQWN0aW9uTWVzc2FnZVJhbmdlSAFSDG1lc3NhZ2VSYW5nZYgBAUIHCgVfcmVhZEIPCg1fbWVzc2FnZVJhbmdlGsgDChZNYXJrZXRpbmdNZXNzYWdlQWN0aW9uEhcKBG5hbWUYASABKAlIAFIEbmFtZYgBARIdCgdtZXNzYWdlGAIgASgJSAFSB21lc3NhZ2WIAQESZAoEdHlwZRgDIAEoDjJLLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5NYXJrZXRpbmdNZXNzYWdlQWN0aW9uLk1hcmtldGluZ01lc3NhZ2VQcm90b3R5cGVUeXBlSAJSBHR5cGWIAQESIQoJY3JlYXRlZEF0GAQgASgDSANSCWNyZWF0ZWRBdIgBARIjCgpsYXN0U2VudEF0GAUgASgDSARSCmxhc3RTZW50QXSIAQESIQoJaXNEZWxldGVkGAYgASgISAVSCWlzRGVsZXRlZIgBARIdCgdtZWRpYUlkGAcgASgJSAZSB21lZGlhSWSIAQEiMQodTWFya2V0aW5nTWVzc2FnZVByb3RvdHlwZVR5cGUSEAoMUEVSU09OQUxJWkVEEABCBwoFX25hbWVCCgoIX21lc3NhZ2VCBwoFX3R5cGVCDAoKX2NyZWF0ZWRBdEINCgtfbGFzdFNlbnRBdEIMCgpfaXNEZWxldGVkQgoKCF9tZWRpYUlkGlsKH01hcmtldGluZ01lc3NhZ2VCcm9hZGNhc3RBY3Rpb24SJwoMcmVwbGllZENvdW50GAEgASgFSABSDHJlcGxpZWRDb3VudIgBAUIPCg1fcmVwbGllZENvdW50GqECChxNZXJjaGFudFBheW1lbnRQYXJ0bmVyQWN0aW9uElIKBnN0YXR1cxgBIAEoDjI6LnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5NZXJjaGFudFBheW1lbnRQYXJ0bmVyQWN0aW9uLlN0YXR1c1IGc3RhdHVzEhgKB2NvdW50cnkYAiABKAlSB2NvdW50cnkSJQoLZ2F0ZXdheU5hbWUYAyABKAlIAFILZ2F0ZXdheU5hbWWIAQESJwoMY3JlZGVudGlhbElkGAQgASgJSAFSDGNyZWRlbnRpYWxJZIgBASIiCgZTdGF0dXMSCgoGQUNUSVZFEAASDAoISU5BQ1RJVkUQAUIOCgxfZ2F0ZXdheU5hbWVCDwoNX2NyZWRlbnRpYWxJZBr2AQoRTXVzaWNVc2VySWRBY3Rpb24SJQoLbXVzaWNVc2VySWQYASABKAlIAFILbXVzaWNVc2VySWSIAQESZwoRbXVzaWNfdXNlcl9pZF9tYXAYAiADKAsyPC5wcm90by5TeW5jQWN0aW9uVmFsdWUuTXVzaWNVc2VySWRBY3Rpb24uTXVzaWNVc2VySWRNYXBFbnRyeVIObXVzaWNVc2VySWRNYXAaQQoTTXVzaWNVc2VySWRNYXBFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBQg4KDF9tdXNpY1VzZXJJZBqoAQoKTXV0ZUFjdGlvbhIZCgVtdXRlZBgBIAEoCEgAUgVtdXRlZIgBARIvChBtdXRlRW5kVGltZXN0YW1wGAIgASgDSAFSEG11dGVFbmRUaW1lc3RhbXCIAQESIQoJYXV0b011dGVkGAMgASgISAJSCWF1dG9NdXRlZIgBAUIICgZfbXV0ZWRCEwoRX211dGVFbmRUaW1lc3RhbXBCDAoKX2F1dG9NdXRlZBp+Ch5OZXdzbGV0dGVyU2F2ZWRJbnRlcmVzdHNBY3Rpb24SPwoYbmV3c2xldHRlclNhdmVkSW50ZXJlc3RzGAEgASgJSABSGG5ld3NsZXR0ZXJTYXZlZEludGVyZXN0c4gBAUIbChlfbmV3c2xldHRlclNhdmVkSW50ZXJlc3RzGoEDCg5Ob3RlRWRpdEFjdGlvbhJHCgR0eXBlGAEgASgOMi4ucHJvdG8uU3luY0FjdGlvblZhbHVlLk5vdGVFZGl0QWN0aW9uLk5vdGVUeXBlSABSBHR5cGWIAQESHQoHY2hhdEppZBgCIAEoCUgBUgdjaGF0SmlkiAEBEiEKCWNyZWF0ZWRBdBgDIAEoA0gCUgljcmVhdGVkQXSIAQESHQoHZGVsZXRlZBgEIAEoCEgDUgdkZWxldGVkiAEBEjUKE3Vuc3RydWN0dXJlZENvbnRlbnQYBSABKAlIBFITdW5zdHJ1Y3R1cmVkQ29udGVudIgBASJHCghOb3RlVHlwZRIZChVVTktOT1dOX05PVEVUWVBFX1pFUk8QABIQCgxVTlNUUlVDVFVSRUQQARIOCgpTVFJVQ1RVUkVEEAJCBwoFX3R5cGVCCgoIX2NoYXRKaWRCDAoKX2NyZWF0ZWRBdEIKCghfZGVsZXRlZEIWChRfdW5zdHJ1Y3R1cmVkQ29udGVudBrUAgohTm90aWZpY2F0aW9uQWN0aXZpdHlTZXR0aW5nQWN0aW9uEpsBChtub3RpZmljYXRpb25BY3Rpdml0eVNldHRpbmcYASABKA4yVC5wcm90by5TeW5jQWN0aW9uVmFsdWUuTm90aWZpY2F0aW9uQWN0aXZpdHlTZXR0aW5nQWN0aW9uLk5vdGlmaWNhdGlvbkFjdGl2aXR5U2V0dGluZ0gAUhtub3RpZmljYXRpb25BY3Rpdml0eVNldHRpbmeIAQEicQobTm90aWZpY2F0aW9uQWN0aXZpdHlTZXR0aW5nEhgKFERFRkFVTFRfQUxMX01FU1NBR0VTEAASEAoMQUxMX01FU1NBR0VTEAESDgoKSElHSExJR0hUUxACEhYKEkRFRkFVTFRfSElHSExJR0hUUxADQh4KHF9ub3RpZmljYXRpb25BY3Rpdml0eVNldHRpbmcaRQoJTnV4QWN0aW9uEicKDGFja25vd2xlZGdlZBgBIAEoCEgAUgxhY2tub3dsZWRnZWSIAQFCDwoNX2Fja25vd2xlZGdlZBoyChFQYXltZW50SW5mb0FjdGlvbhIVCgNjcGkYASABKAlIAFIDY3BpiAEBQgYKBF9jcGkatwEKEFBheW1lbnRUb3NBY3Rpb24SWwoNcGF5bWVudE5vdGljZRgBIAEoDjI1LnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5QYXltZW50VG9zQWN0aW9uLlBheW1lbnROb3RpY2VSDXBheW1lbnROb3RpY2USGgoIYWNjZXB0ZWQYAiABKAhSCGFjY2VwdGVkIioKDVBheW1lbnROb3RpY2USGQoVQlJfUEFZX1BSSVZBQ1lfUE9MSUNZEAAaMwoJUGluQWN0aW9uEhsKBnBpbm5lZBgBIAEoCEgAUgZwaW5uZWSIAQFCCQoHX3Bpbm5lZBo5ChJQbkZvckxpZENoYXRBY3Rpb24SGQoFcG5KaWQYASABKAlIAFIFcG5KaWSIAQFCCAoGX3BuSmlkGiYKDlByaW1hcnlGZWF0dXJlEhQKBWZsYWdzGAEgAygJUgVmbGFncxpBChRQcmltYXJ5VmVyc2lvbkFjdGlvbhIdCgd2ZXJzaW9uGAEgASgJSABSB3ZlcnNpb26IAQFCCgoIX3ZlcnNpb24aeAo2UHJpdmFjeVNldHRpbmdDaGFubmVsc1BlcnNvbmFsaXNlZFJlY29tbWVuZGF0aW9uQWN0aW9uEisKDmlzVXNlck9wdGVkT3V0GAEgASgISABSDmlzVXNlck9wdGVkT3V0iAEBQhEKD19pc1VzZXJPcHRlZE91dBp1CidQcml2YWN5U2V0dGluZ0Rpc2FibGVMaW5rUHJldmlld3NBY3Rpb24SMwoSaXNQcmV2aWV3c0Rpc2FibGVkGAEgASgISABSEmlzUHJldmlld3NEaXNhYmxlZIgBAUIVChNfaXNQcmV2aWV3c0Rpc2FibGVkGk4KG1ByaXZhY3lTZXR0aW5nUmVsYXlBbGxDYWxscxIhCglpc0VuYWJsZWQYASABKAhIAFIJaXNFbmFibGVkiAEBQgwKCl9pc0VuYWJsZWQakAIKHlByaXZhdGVQcm9jZXNzaW5nU2V0dGluZ0FjdGlvbhKMAQoXcHJpdmF0ZVByb2Nlc3NpbmdTdGF0dXMYASABKA4yTS5wcm90by5TeW5jQWN0aW9uVmFsdWUuUHJpdmF0ZVByb2Nlc3NpbmdTZXR0aW5nQWN0aW9uLlByaXZhdGVQcm9jZXNzaW5nU3RhdHVzSABSF3ByaXZhdGVQcm9jZXNzaW5nU3RhdHVziAEBIkMKF1ByaXZhdGVQcm9jZXNzaW5nU3RhdHVzEg0KCVVOREVGSU5FRBAAEgsKB0VOQUJMRUQQARIMCghESVNBQkxFRBACQhoKGF9wcml2YXRlUHJvY2Vzc2luZ1N0YXR1cxozCg9QdXNoTmFtZVNldHRpbmcSFwoEbmFtZRgBIAEoCUgAUgRuYW1liAEBQgcKBV9uYW1lGtcBChBRdWlja1JlcGx5QWN0aW9uEh8KCHNob3J0Y3V0GAEgASgJSABSCHNob3J0Y3V0iAEBEh0KB21lc3NhZ2UYAiABKAlIAVIHbWVzc2FnZYgBARIaCghrZXl3b3JkcxgDIAMoCVIIa2V5d29yZHMSGQoFY291bnQYBCABKAVIAlIFY291bnSIAQESHQoHZGVsZXRlZBgFIAEoCEgDUgdkZWxldGVkiAEBQgsKCV9zaG9ydGN1dEIKCghfbWVzc2FnZUIICgZfY291bnRCCgoIX2RlbGV0ZWQaTgoYUmVjZW50RW1vamlXZWlnaHRzQWN0aW9uEjIKB3dlaWdodHMYASADKAsyGC5wcm90by5SZWNlbnRFbW9qaVdlaWdodFIHd2VpZ2h0cxpkChlSZW1vdmVSZWNlbnRTdGlja2VyQWN0aW9uEjEKEWxhc3RTdGlja2VyU2VudFRzGAEgASgDSABSEWxhc3RTdGlja2VyU2VudFRziAEBQhQKEl9sYXN0U3RpY2tlclNlbnRUcxo3CgpTdGFyQWN0aW9uEh0KB3N0YXJyZWQYASABKAhIAFIHc3RhcnJlZIgBAUIKCghfc3RhcnJlZBpZCixTdGF0dXNQb3N0T3B0SW5Ob3RpZmljYXRpb25QcmVmZXJlbmNlc0FjdGlvbhIdCgdlbmFibGVkGAEgASgISABSB2VuYWJsZWSIAQFCCgoIX2VuYWJsZWQa7gEKE1N0YXR1c1ByaXZhY3lBY3Rpb24SWgoEbW9kZRgBIAEoDjJBLnByb3RvLlN5bmNBY3Rpb25WYWx1ZS5TdGF0dXNQcml2YWN5QWN0aW9uLlN0YXR1c0Rpc3RyaWJ1dGlvbk1vZGVIAFIEbW9kZYgBARIYCgd1c2VySmlkGAIgAygJUgd1c2VySmlkIlgKFlN0YXR1c0Rpc3RyaWJ1dGlvbk1vZGUSDgoKQUxMT1dfTElTVBAAEg0KCURFTllfTElTVBABEgwKCENPTlRBQ1RTEAISEQoNQ0xPU0VfRlJJRU5EUxADQgcKBV9tb2RlGowFCg1TdGlja2VyQWN0aW9uEhUKA3VybBgBIAEoCUgAUgN1cmyIAQESKQoNZmlsZUVuY1NoYTI1NhgCIAEoDEgBUg1maWxlRW5jU2hhMjU2iAEBEh8KCG1lZGlhS2V5GAMgASgMSAJSCG1lZGlhS2V5iAEBEh8KCG1pbWV0eXBlGAQgASgJSANSCG1pbWV0eXBliAEBEhsKBmhlaWdodBgFIAEoDUgEUgZoZWlnaHSIAQESGQoFd2lkdGgYBiABKA1IBVIFd2lkdGiIAQESIwoKZGlyZWN0UGF0aBgHIAEoCUgGUgpkaXJlY3RQYXRoiAEBEiMKCmZpbGVMZW5ndGgYCCABKARIB1IKZmlsZUxlbmd0aIgBARIjCgppc0Zhdm9yaXRlGAkgASgISAhSCmlzRmF2b3JpdGWIAQESJwoMZGV2aWNlSWRIaW50GAogASgNSAlSDGRldmljZUlkSGludIgBARIfCghpc0xvdHRpZRgLIAEoCEgKUghpc0xvdHRpZYgBARIhCglpbWFnZUhhc2gYDCABKAlIC1IJaW1hZ2VIYXNoiAEBEi0KD2lzQXZhdGFyU3RpY2tlchgNIAEoCEgMUg9pc0F2YXRhclN0aWNrZXKIAQFCBgoEX3VybEIQCg5fZmlsZUVuY1NoYTI1NkILCglfbWVkaWFLZXlCCwoJX21pbWV0eXBlQgkKB19oZWlnaHRCCAoGX3dpZHRoQg0KC19kaXJlY3RQYXRoQg0KC19maWxlTGVuZ3RoQg0KC19pc0Zhdm9yaXRlQg8KDV9kZXZpY2VJZEhpbnRCCwoJX2lzTG90dGllQgwKCl9pbWFnZUhhc2hCEgoQX2lzQXZhdGFyU3RpY2tlchrRAQoSU3Vic2NyaXB0aW9uQWN0aW9uEikKDWlzRGVhY3RpdmF0ZWQYASABKAhIAFINaXNEZWFjdGl2YXRlZIgBARIrCg5pc0F1dG9SZW5ld2luZxgCIAEoCEgBUg5pc0F1dG9SZW5ld2luZ4gBARIrCg5leHBpcmF0aW9uRGF0ZRgDIAEoA0gCUg5leHBpcmF0aW9uRGF0ZYgBAUIQCg5faXNEZWFjdGl2YXRlZEIRCg9faXNBdXRvUmVuZXdpbmdCEQoPX2V4cGlyYXRpb25EYXRlGnYKEVN5bmNBY3Rpb25NZXNzYWdlEigKA2tleRgBIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAFIDa2V5iAEBEiEKCXRpbWVzdGFtcBgCIAEoA0gBUgl0aW1lc3RhbXCIAQFCBgoEX2tleUIMCgpfdGltZXN0YW1wGpQCChZTeW5jQWN0aW9uTWVzc2FnZVJhbmdlEjcKFGxhc3RNZXNzYWdlVGltZXN0YW1wGAEgASgDSABSFGxhc3RNZXNzYWdlVGltZXN0YW1wiAEBEkMKGmxhc3RTeXN0ZW1NZXNzYWdlVGltZXN0YW1wGAIgASgDSAFSGmxhc3RTeXN0ZW1NZXNzYWdlVGltZXN0YW1wiAEBEkQKCG1lc3NhZ2VzGAMgAygLMigucHJvdG8uU3luY0FjdGlvblZhbHVlLlN5bmNBY3Rpb25NZXNzYWdlUghtZXNzYWdlc0IXChVfbGFzdE1lc3NhZ2VUaW1lc3RhbXBCHQobX2xhc3RTeXN0ZW1NZXNzYWdlVGltZXN0YW1wGn8KEFRpbWVGb3JtYXRBY3Rpb24SSQodaXNUd2VudHlGb3VySG91ckZvcm1hdEVuYWJsZWQYASABKAhIAFIdaXNUd2VudHlGb3VySG91ckZvcm1hdEVuYWJsZWSIAQFCIAoeX2lzVHdlbnR5Rm91ckhvdXJGb3JtYXRFbmFibGVkGjwKBlVHQ0JvdBIjCgpkZWZpbml0aW9uGAEgASgMSABSCmRlZmluaXRpb26IAQFCDQoLX2RlZmluaXRpb24aVwoVVW5hcmNoaXZlQ2hhdHNTZXR0aW5nEisKDnVuYXJjaGl2ZUNoYXRzGAEgASgISABSDnVuYXJjaGl2ZUNoYXRziAEBQhEKD191bmFyY2hpdmVDaGF0cxo7ChRVc2VyU3RhdHVzTXV0ZUFjdGlvbhIZCgVtdXRlZBgBIAEoCEgAUgVtdXRlZIgBAUIICgZfbXV0ZWQa3gEKG1VzZXJuYW1lQ2hhdFN0YXJ0TW9kZUFjdGlvbhJrCg1jaGF0U3RhcnRNb2RlGAEgASgOMkAucHJvdG8uU3luY0FjdGlvblZhbHVlLlVzZXJuYW1lQ2hhdFN0YXJ0TW9kZUFjdGlvbi5DaGF0U3RhcnRNb2RlSABSDWNoYXRTdGFydE1vZGWIAQEiQAoNQ2hhdFN0YXJ0TW9kZRIeChpVTktOT1dOX0NIQVRTVEFSVE1PREVfWkVSTxAAEgcKA0xJRBABEgYKAlBOEAJCEAoOX2NoYXRTdGFydE1vZGUazwEKHFdhZmZsZUFjY291bnRMaW5rU3RhdGVBY3Rpb24SZwoJbGlua1N0YXRlGAIgASgOMkQucHJvdG8uU3luY0FjdGlvblZhbHVlLldhZmZsZUFjY291bnRMaW5rU3RhdGVBY3Rpb24uQWNjb3VudExpbmtTdGF0ZUgAUglsaW5rU3RhdGWIAQEiOAoQQWNjb3VudExpbmtTdGF0ZRIKCgZBQ1RJVkUQABIKCgZQQVVTRUQQARIMCghVTkxJTktFRBACQgwKCl9saW5rU3RhdGUaTgoYV2Ftb1VzZXJJZGVudGlmaWVyQWN0aW9uEiMKCmlkZW50aWZpZXIYASABKAlIAFIKaWRlbnRpZmllcogBAUINCgtfaWRlbnRpZmllckIMCgpfdGltZXN0YW1wQg0KC19zdGFyQWN0aW9uQhAKDl9jb250YWN0QWN0aW9uQg0KC19tdXRlQWN0aW9uQgwKCl9waW5BY3Rpb25CEgoQX3B1c2hOYW1lU2V0dGluZ0ITChFfcXVpY2tSZXBseUFjdGlvbkIbChlfcmVjZW50RW1vamlXZWlnaHRzQWN0aW9uQhIKEF9sYWJlbEVkaXRBY3Rpb25CGQoXX2xhYmVsQXNzb2NpYXRpb25BY3Rpb25CEAoOX2xvY2FsZVNldHRpbmdCFAoSX2FyY2hpdmVDaGF0QWN0aW9uQhsKGV9kZWxldGVNZXNzYWdlRm9yTWVBY3Rpb25CEAoOX2tleUV4cGlyYXRpb25CFwoVX21hcmtDaGF0QXNSZWFkQWN0aW9uQhIKEF9jbGVhckNoYXRBY3Rpb25CEwoRX2RlbGV0ZUNoYXRBY3Rpb25CGAoWX3VuYXJjaGl2ZUNoYXRzU2V0dGluZ0IRCg9fcHJpbWFyeUZlYXR1cmVCHAoaX2FuZHJvaWRVbnN1cHBvcnRlZEFjdGlvbnNCDgoMX2FnZW50QWN0aW9uQhUKE19zdWJzY3JpcHRpb25BY3Rpb25CFwoVX3VzZXJTdGF0dXNNdXRlQWN0aW9uQhMKEV90aW1lRm9ybWF0QWN0aW9uQgwKCl9udXhBY3Rpb25CFwoVX3ByaW1hcnlWZXJzaW9uQWN0aW9uQhAKDl9zdGlja2VyQWN0aW9uQhwKGl9yZW1vdmVSZWNlbnRTdGlja2VyQWN0aW9uQhEKD19jaGF0QXNzaWdubWVudEIdChtfY2hhdEFzc2lnbm1lbnRPcGVuZWRTdGF0dXNCFQoTX3BuRm9yTGlkQ2hhdEFjdGlvbkIZChdfbWFya2V0aW5nTWVzc2FnZUFjdGlvbkIiCiBfbWFya2V0aW5nTWVzc2FnZUJyb2FkY2FzdEFjdGlvbkIYChZfZXh0ZXJuYWxXZWJCZXRhQWN0aW9uQh4KHF9wcml2YWN5U2V0dGluZ1JlbGF5QWxsQ2FsbHNCEAoOX2NhbGxMb2dBY3Rpb25CCQoHX3VnY0JvdEIQCg5fc3RhdHVzUHJpdmFjeUIaChhfYm90V2VsY29tZVJlcXVlc3RBY3Rpb25CGgoYX2RlbGV0ZUluZGl2aWR1YWxDYWxsTG9nQhgKFl9sYWJlbFJlb3JkZXJpbmdBY3Rpb25CFAoSX3BheW1lbnRJbmZvQWN0aW9uQh0KG19jdXN0b21QYXltZW50TWV0aG9kc0FjdGlvbkIRCg9fbG9ja0NoYXRBY3Rpb25CEwoRX2NoYXRMb2NrU2V0dGluZ3NCGwoZX3dhbW9Vc2VySWRlbnRpZmllckFjdGlvbkIqCihfcHJpdmFjeVNldHRpbmdEaXNhYmxlTGlua1ByZXZpZXdzQWN0aW9uQhUKE19kZXZpY2VDYXBhYmlsaXRpZXNCEQoPX25vdGVFZGl0QWN0aW9uQhIKEF9mYXZvcml0ZXNBY3Rpb25CHwodX21lcmNoYW50UGF5bWVudFBhcnRuZXJBY3Rpb25CHwodX3dhZmZsZUFjY291bnRMaW5rU3RhdGVBY3Rpb25CGAoWX3VzZXJuYW1lQ2hhdFN0YXJ0TW9kZUIkCiJfbm90aWZpY2F0aW9uQWN0aXZpdHlTZXR0aW5nQWN0aW9uQhMKEV9saWRDb250YWN0QWN0aW9uQiMKIV9jdHdhUGVyQ3VzdG9tZXJEYXRhU2hhcmluZ0FjdGlvbkITChFfcGF5bWVudFRvc0FjdGlvbkI5CjdfcHJpdmFjeVNldHRpbmdDaGFubmVsc1BlcnNvbmFsaXNlZFJlY29tbWVuZGF0aW9uQWN0aW9uQiUKI19idXNpbmVzc0Jyb2FkY2FzdEFzc29jaWF0aW9uQWN0aW9uQh8KHV9kZXRlY3RlZE91dGNvbWVzU3RhdHVzQWN0aW9uQh8KHV9tYWliYUFpRmVhdHVyZXNDb250cm9sQWN0aW9uQh4KHF9idXNpbmVzc0Jyb2FkY2FzdExpc3RBY3Rpb25CFAoSX211c2ljVXNlcklkQWN0aW9uQi8KLV9zdGF0dXNQb3N0T3B0SW5Ob3RpZmljYXRpb25QcmVmZXJlbmNlc0FjdGlvbkIWChRfYXZhdGFyVXBkYXRlZEFjdGlvbkIhCh9fcHJpdmF0ZVByb2Nlc3NpbmdTZXR0aW5nQWN0aW9uQiEKH19uZXdzbGV0dGVyU2F2ZWRJbnRlcmVzdHNBY3Rpb25CFwoVX2FpVGhyZWFkUmVuYW1lQWN0aW9uQhsKGV9pbnRlcmFjdGl2ZU1lc3NhZ2VBY3Rpb24=');
@$core.Deprecated('Use syncdIndexDescriptor instead')
const SyncdIndex$json = const {
  '1': 'SyncdIndex',
  '2': const [
    const {'1': 'blob', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'blob', '17': true},
  ],
  '8': const [
    const {'1': '_blob'},
  ],
};

/// Descriptor for `SyncdIndex`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdIndexDescriptor = $convert.base64Decode('CgpTeW5jZEluZGV4EhcKBGJsb2IYASABKAxIAFIEYmxvYogBAUIHCgVfYmxvYg==');
@$core.Deprecated('Use syncdMutationDescriptor instead')
const SyncdMutation$json = const {
  '1': 'SyncdMutation',
  '2': const [
    const {'1': 'operation', '3': 1, '4': 1, '5': 14, '6': '.proto.SyncdMutation.SyncdOperation', '9': 0, '10': 'operation', '17': true},
    const {'1': 'record', '3': 2, '4': 1, '5': 11, '6': '.proto.SyncdRecord', '9': 1, '10': 'record', '17': true},
  ],
  '4': const [SyncdMutation_SyncdOperation$json],
  '8': const [
    const {'1': '_operation'},
    const {'1': '_record'},
  ],
};

@$core.Deprecated('Use syncdMutationDescriptor instead')
const SyncdMutation_SyncdOperation$json = const {
  '1': 'SyncdOperation',
  '2': const [
    const {'1': 'SET', '2': 0},
    const {'1': 'REMOVE', '2': 1},
  ],
};

/// Descriptor for `SyncdMutation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdMutationDescriptor = $convert.base64Decode('Cg1TeW5jZE11dGF0aW9uEkYKCW9wZXJhdGlvbhgBIAEoDjIjLnByb3RvLlN5bmNkTXV0YXRpb24uU3luY2RPcGVyYXRpb25IAFIJb3BlcmF0aW9uiAEBEi8KBnJlY29yZBgCIAEoCzISLnByb3RvLlN5bmNkUmVjb3JkSAFSBnJlY29yZIgBASIlCg5TeW5jZE9wZXJhdGlvbhIHCgNTRVQQABIKCgZSRU1PVkUQAUIMCgpfb3BlcmF0aW9uQgkKB19yZWNvcmQ=');
@$core.Deprecated('Use syncdMutationsDescriptor instead')
const SyncdMutations$json = const {
  '1': 'SyncdMutations',
  '2': const [
    const {'1': 'mutations', '3': 1, '4': 3, '5': 11, '6': '.proto.SyncdMutation', '10': 'mutations'},
  ],
};

/// Descriptor for `SyncdMutations`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdMutationsDescriptor = $convert.base64Decode('Cg5TeW5jZE11dGF0aW9ucxIyCgltdXRhdGlvbnMYASADKAsyFC5wcm90by5TeW5jZE11dGF0aW9uUgltdXRhdGlvbnM=');
@$core.Deprecated('Use syncdPatchDescriptor instead')
const SyncdPatch$json = const {
  '1': 'SyncdPatch',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 11, '6': '.proto.SyncdVersion', '9': 0, '10': 'version', '17': true},
    const {'1': 'mutations', '3': 2, '4': 3, '5': 11, '6': '.proto.SyncdMutation', '10': 'mutations'},
    const {'1': 'externalMutations', '3': 3, '4': 1, '5': 11, '6': '.proto.ExternalBlobReference', '9': 1, '10': 'externalMutations', '17': true},
    const {'1': 'snapshotMac', '3': 4, '4': 1, '5': 12, '9': 2, '10': 'snapshotMac', '17': true},
    const {'1': 'patchMac', '3': 5, '4': 1, '5': 12, '9': 3, '10': 'patchMac', '17': true},
    const {'1': 'keyId', '3': 6, '4': 1, '5': 11, '6': '.proto.KeyId', '9': 4, '10': 'keyId', '17': true},
    const {'1': 'exitCode', '3': 7, '4': 1, '5': 11, '6': '.proto.ExitCode', '9': 5, '10': 'exitCode', '17': true},
    const {'1': 'deviceIndex', '3': 8, '4': 1, '5': 13, '9': 6, '10': 'deviceIndex', '17': true},
    const {'1': 'clientDebugData', '3': 9, '4': 1, '5': 12, '9': 7, '10': 'clientDebugData', '17': true},
  ],
  '8': const [
    const {'1': '_version'},
    const {'1': '_externalMutations'},
    const {'1': '_snapshotMac'},
    const {'1': '_patchMac'},
    const {'1': '_keyId'},
    const {'1': '_exitCode'},
    const {'1': '_deviceIndex'},
    const {'1': '_clientDebugData'},
  ],
};

/// Descriptor for `SyncdPatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdPatchDescriptor = $convert.base64Decode('CgpTeW5jZFBhdGNoEjIKB3ZlcnNpb24YASABKAsyEy5wcm90by5TeW5jZFZlcnNpb25IAFIHdmVyc2lvbogBARIyCgltdXRhdGlvbnMYAiADKAsyFC5wcm90by5TeW5jZE11dGF0aW9uUgltdXRhdGlvbnMSTwoRZXh0ZXJuYWxNdXRhdGlvbnMYAyABKAsyHC5wcm90by5FeHRlcm5hbEJsb2JSZWZlcmVuY2VIAVIRZXh0ZXJuYWxNdXRhdGlvbnOIAQESJQoLc25hcHNob3RNYWMYBCABKAxIAlILc25hcHNob3RNYWOIAQESHwoIcGF0Y2hNYWMYBSABKAxIA1IIcGF0Y2hNYWOIAQESJwoFa2V5SWQYBiABKAsyDC5wcm90by5LZXlJZEgEUgVrZXlJZIgBARIwCghleGl0Q29kZRgHIAEoCzIPLnByb3RvLkV4aXRDb2RlSAVSCGV4aXRDb2RliAEBEiUKC2RldmljZUluZGV4GAggASgNSAZSC2RldmljZUluZGV4iAEBEi0KD2NsaWVudERlYnVnRGF0YRgJIAEoDEgHUg9jbGllbnREZWJ1Z0RhdGGIAQFCCgoIX3ZlcnNpb25CFAoSX2V4dGVybmFsTXV0YXRpb25zQg4KDF9zbmFwc2hvdE1hY0ILCglfcGF0Y2hNYWNCCAoGX2tleUlkQgsKCV9leGl0Q29kZUIOCgxfZGV2aWNlSW5kZXhCEgoQX2NsaWVudERlYnVnRGF0YQ==');
@$core.Deprecated('Use syncdRecordDescriptor instead')
const SyncdRecord$json = const {
  '1': 'SyncdRecord',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 11, '6': '.proto.SyncdIndex', '9': 0, '10': 'index', '17': true},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.proto.SyncdValue', '9': 1, '10': 'value', '17': true},
    const {'1': 'keyId', '3': 3, '4': 1, '5': 11, '6': '.proto.KeyId', '9': 2, '10': 'keyId', '17': true},
  ],
  '8': const [
    const {'1': '_index'},
    const {'1': '_value'},
    const {'1': '_keyId'},
  ],
};

/// Descriptor for `SyncdRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdRecordDescriptor = $convert.base64Decode('CgtTeW5jZFJlY29yZBIsCgVpbmRleBgBIAEoCzIRLnByb3RvLlN5bmNkSW5kZXhIAFIFaW5kZXiIAQESLAoFdmFsdWUYAiABKAsyES5wcm90by5TeW5jZFZhbHVlSAFSBXZhbHVliAEBEicKBWtleUlkGAMgASgLMgwucHJvdG8uS2V5SWRIAlIFa2V5SWSIAQFCCAoGX2luZGV4QggKBl92YWx1ZUIICgZfa2V5SWQ=');
@$core.Deprecated('Use syncdSnapshotDescriptor instead')
const SyncdSnapshot$json = const {
  '1': 'SyncdSnapshot',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 11, '6': '.proto.SyncdVersion', '9': 0, '10': 'version', '17': true},
    const {'1': 'records', '3': 2, '4': 3, '5': 11, '6': '.proto.SyncdRecord', '10': 'records'},
    const {'1': 'mac', '3': 3, '4': 1, '5': 12, '9': 1, '10': 'mac', '17': true},
    const {'1': 'keyId', '3': 4, '4': 1, '5': 11, '6': '.proto.KeyId', '9': 2, '10': 'keyId', '17': true},
  ],
  '8': const [
    const {'1': '_version'},
    const {'1': '_mac'},
    const {'1': '_keyId'},
  ],
};

/// Descriptor for `SyncdSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdSnapshotDescriptor = $convert.base64Decode('Cg1TeW5jZFNuYXBzaG90EjIKB3ZlcnNpb24YASABKAsyEy5wcm90by5TeW5jZFZlcnNpb25IAFIHdmVyc2lvbogBARIsCgdyZWNvcmRzGAIgAygLMhIucHJvdG8uU3luY2RSZWNvcmRSB3JlY29yZHMSFQoDbWFjGAMgASgMSAFSA21hY4gBARInCgVrZXlJZBgEIAEoCzIMLnByb3RvLktleUlkSAJSBWtleUlkiAEBQgoKCF92ZXJzaW9uQgYKBF9tYWNCCAoGX2tleUlk');
@$core.Deprecated('Use syncdValueDescriptor instead')
const SyncdValue$json = const {
  '1': 'SyncdValue',
  '2': const [
    const {'1': 'blob', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'blob', '17': true},
  ],
  '8': const [
    const {'1': '_blob'},
  ],
};

/// Descriptor for `SyncdValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdValueDescriptor = $convert.base64Decode('CgpTeW5jZFZhbHVlEhcKBGJsb2IYASABKAxIAFIEYmxvYogBAUIHCgVfYmxvYg==');
@$core.Deprecated('Use syncdVersionDescriptor instead')
const SyncdVersion$json = const {
  '1': 'SyncdVersion',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'version', '17': true},
  ],
  '8': const [
    const {'1': '_version'},
  ],
};

/// Descriptor for `SyncdVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncdVersionDescriptor = $convert.base64Decode('CgxTeW5jZFZlcnNpb24SHQoHdmVyc2lvbhgBIAEoBEgAUgd2ZXJzaW9uiAEBQgoKCF92ZXJzaW9u');
@$core.Deprecated('Use tapLinkActionDescriptor instead')
const TapLinkAction$json = const {
  '1': 'TapLinkAction',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'title', '17': true},
    const {'1': 'tapUrl', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'tapUrl', '17': true},
  ],
  '8': const [
    const {'1': '_title'},
    const {'1': '_tapUrl'},
  ],
};

/// Descriptor for `TapLinkAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tapLinkActionDescriptor = $convert.base64Decode('Cg1UYXBMaW5rQWN0aW9uEhkKBXRpdGxlGAEgASgJSABSBXRpdGxliAEBEhsKBnRhcFVybBgCIAEoCUgBUgZ0YXBVcmyIAQFCCAoGX3RpdGxlQgkKB190YXBVcmw=');
@$core.Deprecated('Use templateButtonDescriptor instead')
const TemplateButton$json = const {
  '1': 'TemplateButton',
  '2': const [
    const {'1': 'index', '3': 4, '4': 1, '5': 13, '9': 1, '10': 'index', '17': true},
    const {'1': 'quickReplyButton', '3': 1, '4': 1, '5': 11, '6': '.proto.TemplateButton.QuickReplyButton', '9': 0, '10': 'quickReplyButton'},
    const {'1': 'urlButton', '3': 2, '4': 1, '5': 11, '6': '.proto.TemplateButton.URLButton', '9': 0, '10': 'urlButton'},
    const {'1': 'callButton', '3': 3, '4': 1, '5': 11, '6': '.proto.TemplateButton.CallButton', '9': 0, '10': 'callButton'},
  ],
  '3': const [TemplateButton_CallButton$json, TemplateButton_QuickReplyButton$json, TemplateButton_URLButton$json],
  '8': const [
    const {'1': 'button'},
    const {'1': '_index'},
  ],
};

@$core.Deprecated('Use templateButtonDescriptor instead')
const TemplateButton_CallButton$json = const {
  '1': 'CallButton',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 0, '10': 'displayText', '17': true},
    const {'1': 'phoneNumber', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 1, '10': 'phoneNumber', '17': true},
  ],
  '8': const [
    const {'1': '_displayText'},
    const {'1': '_phoneNumber'},
  ],
};

@$core.Deprecated('Use templateButtonDescriptor instead')
const TemplateButton_QuickReplyButton$json = const {
  '1': 'QuickReplyButton',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 0, '10': 'displayText', '17': true},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'id', '17': true},
  ],
  '8': const [
    const {'1': '_displayText'},
    const {'1': '_id'},
  ],
};

@$core.Deprecated('Use templateButtonDescriptor instead')
const TemplateButton_URLButton$json = const {
  '1': 'URLButton',
  '2': const [
    const {'1': 'displayText', '3': 1, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 0, '10': 'displayText', '17': true},
    const {'1': 'url', '3': 2, '4': 1, '5': 11, '6': '.proto.Message.HighlyStructuredMessage', '9': 1, '10': 'url', '17': true},
  ],
  '8': const [
    const {'1': '_displayText'},
    const {'1': '_url'},
  ],
};

/// Descriptor for `TemplateButton`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List templateButtonDescriptor = $convert.base64Decode('Cg5UZW1wbGF0ZUJ1dHRvbhIZCgVpbmRleBgEIAEoDUgBUgVpbmRleIgBARJUChBxdWlja1JlcGx5QnV0dG9uGAEgASgLMiYucHJvdG8uVGVtcGxhdGVCdXR0b24uUXVpY2tSZXBseUJ1dHRvbkgAUhBxdWlja1JlcGx5QnV0dG9uEj8KCXVybEJ1dHRvbhgCIAEoCzIfLnByb3RvLlRlbXBsYXRlQnV0dG9uLlVSTEJ1dHRvbkgAUgl1cmxCdXR0b24SQgoKY2FsbEJ1dHRvbhgDIAEoCzIgLnByb3RvLlRlbXBsYXRlQnV0dG9uLkNhbGxCdXR0b25IAFIKY2FsbEJ1dHRvbhrKAQoKQ2FsbEJ1dHRvbhJNCgtkaXNwbGF5VGV4dBgBIAEoCzImLnByb3RvLk1lc3NhZ2UuSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2VIAFILZGlzcGxheVRleHSIAQESTQoLcGhvbmVOdW1iZXIYAiABKAsyJi5wcm90by5NZXNzYWdlLkhpZ2hseVN0cnVjdHVyZWRNZXNzYWdlSAFSC3Bob25lTnVtYmVyiAEBQg4KDF9kaXNwbGF5VGV4dEIOCgxfcGhvbmVOdW1iZXIajQEKEFF1aWNrUmVwbHlCdXR0b24STQoLZGlzcGxheVRleHQYASABKAsyJi5wcm90by5NZXNzYWdlLkhpZ2hseVN0cnVjdHVyZWRNZXNzYWdlSABSC2Rpc3BsYXlUZXh0iAEBEhMKAmlkGAIgASgJSAFSAmlkiAEBQg4KDF9kaXNwbGF5VGV4dEIFCgNfaWQasQEKCVVSTEJ1dHRvbhJNCgtkaXNwbGF5VGV4dBgBIAEoCzImLnByb3RvLk1lc3NhZ2UuSGlnaGx5U3RydWN0dXJlZE1lc3NhZ2VIAFILZGlzcGxheVRleHSIAQESPQoDdXJsGAIgASgLMiYucHJvdG8uTWVzc2FnZS5IaWdobHlTdHJ1Y3R1cmVkTWVzc2FnZUgBUgN1cmyIAQFCDgoMX2Rpc3BsYXlUZXh0QgYKBF91cmxCCAoGYnV0dG9uQggKBl9pbmRleA==');
@$core.Deprecated('Use threadIDDescriptor instead')
const ThreadID$json = const {
  '1': 'ThreadID',
  '2': const [
    const {'1': 'threadType', '3': 1, '4': 1, '5': 14, '6': '.proto.ThreadID.ThreadType', '9': 0, '10': 'threadType', '17': true},
    const {'1': 'threadKey', '3': 2, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 1, '10': 'threadKey', '17': true},
  ],
  '4': const [ThreadID_ThreadType$json],
  '8': const [
    const {'1': '_threadType'},
    const {'1': '_threadKey'},
  ],
};

@$core.Deprecated('Use threadIDDescriptor instead')
const ThreadID_ThreadType$json = const {
  '1': 'ThreadType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'VIEW_REPLIES', '2': 1},
    const {'1': 'AI_THREAD', '2': 2},
  ],
};

/// Descriptor for `ThreadID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List threadIDDescriptor = $convert.base64Decode('CghUaHJlYWRJRBI/Cgp0aHJlYWRUeXBlGAEgASgOMhoucHJvdG8uVGhyZWFkSUQuVGhyZWFkVHlwZUgAUgp0aHJlYWRUeXBliAEBEjQKCXRocmVhZEtleRgCIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIAVIJdGhyZWFkS2V5iAEBIjoKClRocmVhZFR5cGUSCwoHVU5LTk9XThAAEhAKDFZJRVdfUkVQTElFUxABEg0KCUFJX1RIUkVBRBACQg0KC190aHJlYWRUeXBlQgwKCl90aHJlYWRLZXk=');
@$core.Deprecated('Use urlTrackingMapDescriptor instead')
const UrlTrackingMap$json = const {
  '1': 'UrlTrackingMap',
  '2': const [
    const {'1': 'urlTrackingMapElements', '3': 1, '4': 3, '5': 11, '6': '.proto.UrlTrackingMap.UrlTrackingMapElement', '10': 'urlTrackingMapElements'},
  ],
  '3': const [UrlTrackingMap_UrlTrackingMapElement$json],
};

@$core.Deprecated('Use urlTrackingMapDescriptor instead')
const UrlTrackingMap_UrlTrackingMapElement$json = const {
  '1': 'UrlTrackingMapElement',
  '2': const [
    const {'1': 'originalUrl', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'originalUrl', '17': true},
    const {'1': 'unconsentedUsersUrl', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'unconsentedUsersUrl', '17': true},
    const {'1': 'consentedUsersUrl', '3': 3, '4': 1, '5': 9, '9': 2, '10': 'consentedUsersUrl', '17': true},
    const {'1': 'cardIndex', '3': 4, '4': 1, '5': 13, '9': 3, '10': 'cardIndex', '17': true},
  ],
  '8': const [
    const {'1': '_originalUrl'},
    const {'1': '_unconsentedUsersUrl'},
    const {'1': '_consentedUsersUrl'},
    const {'1': '_cardIndex'},
  ],
};

/// Descriptor for `UrlTrackingMap`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List urlTrackingMapDescriptor = $convert.base64Decode('Cg5VcmxUcmFja2luZ01hcBJjChZ1cmxUcmFja2luZ01hcEVsZW1lbnRzGAEgAygLMisucHJvdG8uVXJsVHJhY2tpbmdNYXAuVXJsVHJhY2tpbmdNYXBFbGVtZW50UhZ1cmxUcmFja2luZ01hcEVsZW1lbnRzGpcCChVVcmxUcmFja2luZ01hcEVsZW1lbnQSJQoLb3JpZ2luYWxVcmwYASABKAlIAFILb3JpZ2luYWxVcmyIAQESNQoTdW5jb25zZW50ZWRVc2Vyc1VybBgCIAEoCUgBUhN1bmNvbnNlbnRlZFVzZXJzVXJsiAEBEjEKEWNvbnNlbnRlZFVzZXJzVXJsGAMgASgJSAJSEWNvbnNlbnRlZFVzZXJzVXJsiAEBEiEKCWNhcmRJbmRleBgEIAEoDUgDUgljYXJkSW5kZXiIAQFCDgoMX29yaWdpbmFsVXJsQhYKFF91bmNvbnNlbnRlZFVzZXJzVXJsQhQKEl9jb25zZW50ZWRVc2Vyc1VybEIMCgpfY2FyZEluZGV4');
@$core.Deprecated('Use userPasswordDescriptor instead')
const UserPassword$json = const {
  '1': 'UserPassword',
  '2': const [
    const {'1': 'encoding', '3': 1, '4': 1, '5': 14, '6': '.proto.UserPassword.Encoding', '9': 0, '10': 'encoding', '17': true},
    const {'1': 'transformer', '3': 2, '4': 1, '5': 14, '6': '.proto.UserPassword.Transformer', '9': 1, '10': 'transformer', '17': true},
    const {'1': 'transformerArg', '3': 3, '4': 3, '5': 11, '6': '.proto.UserPassword.TransformerArg', '10': 'transformerArg'},
    const {'1': 'transformedData', '3': 4, '4': 1, '5': 12, '9': 2, '10': 'transformedData', '17': true},
  ],
  '3': const [UserPassword_TransformerArg$json],
  '4': const [UserPassword_Encoding$json, UserPassword_Transformer$json],
  '8': const [
    const {'1': '_encoding'},
    const {'1': '_transformer'},
    const {'1': '_transformedData'},
  ],
};

@$core.Deprecated('Use userPasswordDescriptor instead')
const UserPassword_TransformerArg$json = const {
  '1': 'TransformerArg',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'key', '17': true},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.proto.UserPassword.TransformerArg.Value', '9': 1, '10': 'value', '17': true},
  ],
  '3': const [UserPassword_TransformerArg_Value$json],
  '8': const [
    const {'1': '_key'},
    const {'1': '_value'},
  ],
};

@$core.Deprecated('Use userPasswordDescriptor instead')
const UserPassword_TransformerArg_Value$json = const {
  '1': 'Value',
  '2': const [
    const {'1': 'asBlob', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'asBlob'},
    const {'1': 'asUnsignedInteger', '3': 2, '4': 1, '5': 13, '9': 0, '10': 'asUnsignedInteger'},
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

@$core.Deprecated('Use userPasswordDescriptor instead')
const UserPassword_Encoding$json = const {
  '1': 'Encoding',
  '2': const [
    const {'1': 'UTF8', '2': 0},
    const {'1': 'UTF8_BROKEN', '2': 1},
  ],
};

@$core.Deprecated('Use userPasswordDescriptor instead')
const UserPassword_Transformer$json = const {
  '1': 'Transformer',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'PBKDF2_HMAC_SHA512', '2': 1},
    const {'1': 'PBKDF2_HMAC_SHA384', '2': 2},
  ],
};

/// Descriptor for `UserPassword`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPasswordDescriptor = $convert.base64Decode('CgxVc2VyUGFzc3dvcmQSPQoIZW5jb2RpbmcYASABKA4yHC5wcm90by5Vc2VyUGFzc3dvcmQuRW5jb2RpbmdIAFIIZW5jb2RpbmeIAQESRgoLdHJhbnNmb3JtZXIYAiABKA4yHy5wcm90by5Vc2VyUGFzc3dvcmQuVHJhbnNmb3JtZXJIAVILdHJhbnNmb3JtZXKIAQESSgoOdHJhbnNmb3JtZXJBcmcYAyADKAsyIi5wcm90by5Vc2VyUGFzc3dvcmQuVHJhbnNmb3JtZXJBcmdSDnRyYW5zZm9ybWVyQXJnEi0KD3RyYW5zZm9ybWVkRGF0YRgEIAEoDEgCUg90cmFuc2Zvcm1lZERhdGGIAQEa2gEKDlRyYW5zZm9ybWVyQXJnEhUKA2tleRgBIAEoCUgAUgNrZXmIAQESQwoFdmFsdWUYAiABKAsyKC5wcm90by5Vc2VyUGFzc3dvcmQuVHJhbnNmb3JtZXJBcmcuVmFsdWVIAVIFdmFsdWWIAQEaWgoFVmFsdWUSGAoGYXNCbG9iGAEgASgMSABSBmFzQmxvYhIuChFhc1Vuc2lnbmVkSW50ZWdlchgCIAEoDUgAUhFhc1Vuc2lnbmVkSW50ZWdlckIHCgV2YWx1ZUIGCgRfa2V5QggKBl92YWx1ZSIlCghFbmNvZGluZxIICgRVVEY4EAASDwoLVVRGOF9CUk9LRU4QASJHCgtUcmFuc2Zvcm1lchIICgROT05FEAASFgoSUEJLREYyX0hNQUNfU0hBNTEyEAESFgoSUEJLREYyX0hNQUNfU0hBMzg0EAJCCwoJX2VuY29kaW5nQg4KDF90cmFuc2Zvcm1lckISChBfdHJhbnNmb3JtZWREYXRh');
@$core.Deprecated('Use userReceiptDescriptor instead')
const UserReceipt$json = const {
  '1': 'UserReceipt',
  '2': const [
    const {'1': 'userJid', '3': 1, '4': 1, '5': 9, '10': 'userJid'},
    const {'1': 'receiptTimestamp', '3': 2, '4': 1, '5': 3, '9': 0, '10': 'receiptTimestamp', '17': true},
    const {'1': 'readTimestamp', '3': 3, '4': 1, '5': 3, '9': 1, '10': 'readTimestamp', '17': true},
    const {'1': 'playedTimestamp', '3': 4, '4': 1, '5': 3, '9': 2, '10': 'playedTimestamp', '17': true},
    const {'1': 'pendingDeviceJid', '3': 5, '4': 3, '5': 9, '10': 'pendingDeviceJid'},
    const {'1': 'deliveredDeviceJid', '3': 6, '4': 3, '5': 9, '10': 'deliveredDeviceJid'},
  ],
  '8': const [
    const {'1': '_receiptTimestamp'},
    const {'1': '_readTimestamp'},
    const {'1': '_playedTimestamp'},
  ],
};

/// Descriptor for `UserReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userReceiptDescriptor = $convert.base64Decode('CgtVc2VyUmVjZWlwdBIYCgd1c2VySmlkGAEgASgJUgd1c2VySmlkEi8KEHJlY2VpcHRUaW1lc3RhbXAYAiABKANIAFIQcmVjZWlwdFRpbWVzdGFtcIgBARIpCg1yZWFkVGltZXN0YW1wGAMgASgDSAFSDXJlYWRUaW1lc3RhbXCIAQESLQoPcGxheWVkVGltZXN0YW1wGAQgASgDSAJSD3BsYXllZFRpbWVzdGFtcIgBARIqChBwZW5kaW5nRGV2aWNlSmlkGAUgAygJUhBwZW5kaW5nRGV2aWNlSmlkEi4KEmRlbGl2ZXJlZERldmljZUppZBgGIAMoCVISZGVsaXZlcmVkRGV2aWNlSmlkQhMKEV9yZWNlaXB0VGltZXN0YW1wQhAKDl9yZWFkVGltZXN0YW1wQhIKEF9wbGF5ZWRUaW1lc3RhbXA=');
@$core.Deprecated('Use verifiedNameCertificateDescriptor instead')
const VerifiedNameCertificate$json = const {
  '1': 'VerifiedNameCertificate',
  '2': const [
    const {'1': 'details', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'details', '17': true},
    const {'1': 'signature', '3': 2, '4': 1, '5': 12, '9': 1, '10': 'signature', '17': true},
    const {'1': 'serverSignature', '3': 3, '4': 1, '5': 12, '9': 2, '10': 'serverSignature', '17': true},
  ],
  '3': const [VerifiedNameCertificate_Details$json],
  '8': const [
    const {'1': '_details'},
    const {'1': '_signature'},
    const {'1': '_serverSignature'},
  ],
};

@$core.Deprecated('Use verifiedNameCertificateDescriptor instead')
const VerifiedNameCertificate_Details$json = const {
  '1': 'Details',
  '2': const [
    const {'1': 'serial', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'serial', '17': true},
    const {'1': 'issuer', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'issuer', '17': true},
    const {'1': 'verifiedName', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'verifiedName', '17': true},
    const {'1': 'localizedNames', '3': 8, '4': 3, '5': 11, '6': '.proto.LocalizedName', '10': 'localizedNames'},
    const {'1': 'issueTime', '3': 10, '4': 1, '5': 4, '9': 3, '10': 'issueTime', '17': true},
  ],
  '8': const [
    const {'1': '_serial'},
    const {'1': '_issuer'},
    const {'1': '_verifiedName'},
    const {'1': '_issueTime'},
  ],
};

/// Descriptor for `VerifiedNameCertificate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifiedNameCertificateDescriptor = $convert.base64Decode('ChdWZXJpZmllZE5hbWVDZXJ0aWZpY2F0ZRIdCgdkZXRhaWxzGAEgASgMSABSB2RldGFpbHOIAQESIQoJc2lnbmF0dXJlGAIgASgMSAFSCXNpZ25hdHVyZYgBARItCg9zZXJ2ZXJTaWduYXR1cmUYAyABKAxIAlIPc2VydmVyU2lnbmF0dXJliAEBGoICCgdEZXRhaWxzEhsKBnNlcmlhbBgBIAEoBEgAUgZzZXJpYWyIAQESGwoGaXNzdWVyGAIgASgJSAFSBmlzc3VlcogBARInCgx2ZXJpZmllZE5hbWUYBCABKAlIAlIMdmVyaWZpZWROYW1liAEBEjwKDmxvY2FsaXplZE5hbWVzGAggAygLMhQucHJvdG8uTG9jYWxpemVkTmFtZVIObG9jYWxpemVkTmFtZXMSIQoJaXNzdWVUaW1lGAogASgESANSCWlzc3VlVGltZYgBAUIJCgdfc2VyaWFsQgkKB19pc3N1ZXJCDwoNX3ZlcmlmaWVkTmFtZUIMCgpfaXNzdWVUaW1lQgoKCF9kZXRhaWxzQgwKCl9zaWduYXR1cmVCEgoQX3NlcnZlclNpZ25hdHVyZQ==');
@$core.Deprecated('Use wallpaperSettingsDescriptor instead')
const WallpaperSettings$json = const {
  '1': 'WallpaperSettings',
  '2': const [
    const {'1': 'filename', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'filename', '17': true},
    const {'1': 'opacity', '3': 2, '4': 1, '5': 13, '9': 1, '10': 'opacity', '17': true},
  ],
  '8': const [
    const {'1': '_filename'},
    const {'1': '_opacity'},
  ],
};

/// Descriptor for `WallpaperSettings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wallpaperSettingsDescriptor = $convert.base64Decode('ChFXYWxscGFwZXJTZXR0aW5ncxIfCghmaWxlbmFtZRgBIAEoCUgAUghmaWxlbmFtZYgBARIdCgdvcGFjaXR5GAIgASgNSAFSB29wYWNpdHmIAQFCCwoJX2ZpbGVuYW1lQgoKCF9vcGFjaXR5');
@$core.Deprecated('Use webFeaturesDescriptor instead')
const WebFeatures$json = const {
  '1': 'WebFeatures',
  '2': const [
    const {'1': 'labelsDisplay', '3': 1, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 0, '10': 'labelsDisplay', '17': true},
    const {'1': 'voipIndividualOutgoing', '3': 2, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 1, '10': 'voipIndividualOutgoing', '17': true},
    const {'1': 'groupsV3', '3': 3, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 2, '10': 'groupsV3', '17': true},
    const {'1': 'groupsV3Create', '3': 4, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 3, '10': 'groupsV3Create', '17': true},
    const {'1': 'changeNumberV2', '3': 5, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 4, '10': 'changeNumberV2', '17': true},
    const {'1': 'queryStatusV3Thumbnail', '3': 6, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 5, '10': 'queryStatusV3Thumbnail', '17': true},
    const {'1': 'liveLocations', '3': 7, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 6, '10': 'liveLocations', '17': true},
    const {'1': 'queryVname', '3': 8, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 7, '10': 'queryVname', '17': true},
    const {'1': 'voipIndividualIncoming', '3': 9, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 8, '10': 'voipIndividualIncoming', '17': true},
    const {'1': 'quickRepliesQuery', '3': 10, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 9, '10': 'quickRepliesQuery', '17': true},
    const {'1': 'payments', '3': 11, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 10, '10': 'payments', '17': true},
    const {'1': 'stickerPackQuery', '3': 12, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 11, '10': 'stickerPackQuery', '17': true},
    const {'1': 'liveLocationsFinal', '3': 13, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 12, '10': 'liveLocationsFinal', '17': true},
    const {'1': 'labelsEdit', '3': 14, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 13, '10': 'labelsEdit', '17': true},
    const {'1': 'mediaUpload', '3': 15, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 14, '10': 'mediaUpload', '17': true},
    const {'1': 'mediaUploadRichQuickReplies', '3': 18, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 15, '10': 'mediaUploadRichQuickReplies', '17': true},
    const {'1': 'vnameV2', '3': 19, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 16, '10': 'vnameV2', '17': true},
    const {'1': 'videoPlaybackUrl', '3': 20, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 17, '10': 'videoPlaybackUrl', '17': true},
    const {'1': 'statusRanking', '3': 21, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 18, '10': 'statusRanking', '17': true},
    const {'1': 'voipIndividualVideo', '3': 22, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 19, '10': 'voipIndividualVideo', '17': true},
    const {'1': 'thirdPartyStickers', '3': 23, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 20, '10': 'thirdPartyStickers', '17': true},
    const {'1': 'frequentlyForwardedSetting', '3': 24, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 21, '10': 'frequentlyForwardedSetting', '17': true},
    const {'1': 'groupsV4JoinPermission', '3': 25, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 22, '10': 'groupsV4JoinPermission', '17': true},
    const {'1': 'recentStickers', '3': 26, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 23, '10': 'recentStickers', '17': true},
    const {'1': 'catalog', '3': 27, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 24, '10': 'catalog', '17': true},
    const {'1': 'starredStickers', '3': 28, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 25, '10': 'starredStickers', '17': true},
    const {'1': 'voipGroupCall', '3': 29, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 26, '10': 'voipGroupCall', '17': true},
    const {'1': 'templateMessage', '3': 30, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 27, '10': 'templateMessage', '17': true},
    const {'1': 'templateMessageInteractivity', '3': 31, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 28, '10': 'templateMessageInteractivity', '17': true},
    const {'1': 'ephemeralMessages', '3': 32, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 29, '10': 'ephemeralMessages', '17': true},
    const {'1': 'e2ENotificationSync', '3': 33, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 30, '10': 'e2ENotificationSync', '17': true},
    const {'1': 'recentStickersV2', '3': 34, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 31, '10': 'recentStickersV2', '17': true},
    const {'1': 'recentStickersV3', '3': 36, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 32, '10': 'recentStickersV3', '17': true},
    const {'1': 'userNotice', '3': 37, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 33, '10': 'userNotice', '17': true},
    const {'1': 'support', '3': 39, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 34, '10': 'support', '17': true},
    const {'1': 'groupUiiCleanup', '3': 40, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 35, '10': 'groupUiiCleanup', '17': true},
    const {'1': 'groupDogfoodingInternalOnly', '3': 41, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 36, '10': 'groupDogfoodingInternalOnly', '17': true},
    const {'1': 'settingsSync', '3': 42, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 37, '10': 'settingsSync', '17': true},
    const {'1': 'archiveV2', '3': 43, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 38, '10': 'archiveV2', '17': true},
    const {'1': 'ephemeralAllowGroupMembers', '3': 44, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 39, '10': 'ephemeralAllowGroupMembers', '17': true},
    const {'1': 'ephemeral24HDuration', '3': 45, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 40, '10': 'ephemeral24HDuration', '17': true},
    const {'1': 'mdForceUpgrade', '3': 46, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 41, '10': 'mdForceUpgrade', '17': true},
    const {'1': 'disappearingMode', '3': 47, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 42, '10': 'disappearingMode', '17': true},
    const {'1': 'externalMdOptInAvailable', '3': 48, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 43, '10': 'externalMdOptInAvailable', '17': true},
    const {'1': 'noDeleteMessageTimeLimit', '3': 49, '4': 1, '5': 14, '6': '.proto.WebFeatures.Flag', '9': 44, '10': 'noDeleteMessageTimeLimit', '17': true},
  ],
  '4': const [WebFeatures_Flag$json],
  '8': const [
    const {'1': '_labelsDisplay'},
    const {'1': '_voipIndividualOutgoing'},
    const {'1': '_groupsV3'},
    const {'1': '_groupsV3Create'},
    const {'1': '_changeNumberV2'},
    const {'1': '_queryStatusV3Thumbnail'},
    const {'1': '_liveLocations'},
    const {'1': '_queryVname'},
    const {'1': '_voipIndividualIncoming'},
    const {'1': '_quickRepliesQuery'},
    const {'1': '_payments'},
    const {'1': '_stickerPackQuery'},
    const {'1': '_liveLocationsFinal'},
    const {'1': '_labelsEdit'},
    const {'1': '_mediaUpload'},
    const {'1': '_mediaUploadRichQuickReplies'},
    const {'1': '_vnameV2'},
    const {'1': '_videoPlaybackUrl'},
    const {'1': '_statusRanking'},
    const {'1': '_voipIndividualVideo'},
    const {'1': '_thirdPartyStickers'},
    const {'1': '_frequentlyForwardedSetting'},
    const {'1': '_groupsV4JoinPermission'},
    const {'1': '_recentStickers'},
    const {'1': '_catalog'},
    const {'1': '_starredStickers'},
    const {'1': '_voipGroupCall'},
    const {'1': '_templateMessage'},
    const {'1': '_templateMessageInteractivity'},
    const {'1': '_ephemeralMessages'},
    const {'1': '_e2ENotificationSync'},
    const {'1': '_recentStickersV2'},
    const {'1': '_recentStickersV3'},
    const {'1': '_userNotice'},
    const {'1': '_support'},
    const {'1': '_groupUiiCleanup'},
    const {'1': '_groupDogfoodingInternalOnly'},
    const {'1': '_settingsSync'},
    const {'1': '_archiveV2'},
    const {'1': '_ephemeralAllowGroupMembers'},
    const {'1': '_ephemeral24HDuration'},
    const {'1': '_mdForceUpgrade'},
    const {'1': '_disappearingMode'},
    const {'1': '_externalMdOptInAvailable'},
    const {'1': '_noDeleteMessageTimeLimit'},
  ],
};

@$core.Deprecated('Use webFeaturesDescriptor instead')
const WebFeatures_Flag$json = const {
  '1': 'Flag',
  '2': const [
    const {'1': 'NOT_STARTED', '2': 0},
    const {'1': 'FORCE_UPGRADE', '2': 1},
    const {'1': 'DEVELOPMENT', '2': 2},
    const {'1': 'PRODUCTION', '2': 3},
  ],
};

/// Descriptor for `WebFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webFeaturesDescriptor = $convert.base64Decode('CgtXZWJGZWF0dXJlcxJCCg1sYWJlbHNEaXNwbGF5GAEgASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gAUg1sYWJlbHNEaXNwbGF5iAEBElQKFnZvaXBJbmRpdmlkdWFsT3V0Z29pbmcYAiABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSAFSFnZvaXBJbmRpdmlkdWFsT3V0Z29pbmeIAQESOAoIZ3JvdXBzVjMYAyABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSAJSCGdyb3Vwc1YziAEBEkQKDmdyb3Vwc1YzQ3JlYXRlGAQgASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gDUg5ncm91cHNWM0NyZWF0ZYgBARJECg5jaGFuZ2VOdW1iZXJWMhgFIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIBFIOY2hhbmdlTnVtYmVyVjKIAQESVAoWcXVlcnlTdGF0dXNWM1RodW1ibmFpbBgGIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIBVIWcXVlcnlTdGF0dXNWM1RodW1ibmFpbIgBARJCCg1saXZlTG9jYXRpb25zGAcgASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gGUg1saXZlTG9jYXRpb25ziAEBEjwKCnF1ZXJ5Vm5hbWUYCCABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSAdSCnF1ZXJ5Vm5hbWWIAQESVAoWdm9pcEluZGl2aWR1YWxJbmNvbWluZxgJIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdICFIWdm9pcEluZGl2aWR1YWxJbmNvbWluZ4gBARJKChFxdWlja1JlcGxpZXNRdWVyeRgKIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdICVIRcXVpY2tSZXBsaWVzUXVlcnmIAQESOAoIcGF5bWVudHMYCyABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSApSCHBheW1lbnRziAEBEkgKEHN0aWNrZXJQYWNrUXVlcnkYDCABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSAtSEHN0aWNrZXJQYWNrUXVlcnmIAQESTAoSbGl2ZUxvY2F0aW9uc0ZpbmFsGA0gASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gMUhJsaXZlTG9jYXRpb25zRmluYWyIAQESPAoKbGFiZWxzRWRpdBgOIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIDVIKbGFiZWxzRWRpdIgBARI+CgttZWRpYVVwbG9hZBgPIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIDlILbWVkaWFVcGxvYWSIAQESXgobbWVkaWFVcGxvYWRSaWNoUXVpY2tSZXBsaWVzGBIgASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gPUhttZWRpYVVwbG9hZFJpY2hRdWlja1JlcGxpZXOIAQESNgoHdm5hbWVWMhgTIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIEFIHdm5hbWVWMogBARJIChB2aWRlb1BsYXliYWNrVXJsGBQgASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gRUhB2aWRlb1BsYXliYWNrVXJsiAEBEkIKDXN0YXR1c1JhbmtpbmcYFSABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSBJSDXN0YXR1c1JhbmtpbmeIAQESTgoTdm9pcEluZGl2aWR1YWxWaWRlbxgWIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIE1ITdm9pcEluZGl2aWR1YWxWaWRlb4gBARJMChJ0aGlyZFBhcnR5U3RpY2tlcnMYFyABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSBRSEnRoaXJkUGFydHlTdGlja2Vyc4gBARJcChpmcmVxdWVudGx5Rm9yd2FyZGVkU2V0dGluZxgYIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIFVIaZnJlcXVlbnRseUZvcndhcmRlZFNldHRpbmeIAQESVAoWZ3JvdXBzVjRKb2luUGVybWlzc2lvbhgZIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIFlIWZ3JvdXBzVjRKb2luUGVybWlzc2lvbogBARJECg5yZWNlbnRTdGlja2VycxgaIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIF1IOcmVjZW50U3RpY2tlcnOIAQESNgoHY2F0YWxvZxgbIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIGFIHY2F0YWxvZ4gBARJGCg9zdGFycmVkU3RpY2tlcnMYHCABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSBlSD3N0YXJyZWRTdGlja2Vyc4gBARJCCg12b2lwR3JvdXBDYWxsGB0gASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gaUg12b2lwR3JvdXBDYWxsiAEBEkYKD3RlbXBsYXRlTWVzc2FnZRgeIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIG1IPdGVtcGxhdGVNZXNzYWdliAEBEmAKHHRlbXBsYXRlTWVzc2FnZUludGVyYWN0aXZpdHkYHyABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSBxSHHRlbXBsYXRlTWVzc2FnZUludGVyYWN0aXZpdHmIAQESSgoRZXBoZW1lcmFsTWVzc2FnZXMYICABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSB1SEWVwaGVtZXJhbE1lc3NhZ2VziAEBEk4KE2UyRU5vdGlmaWNhdGlvblN5bmMYISABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSB5SE2UyRU5vdGlmaWNhdGlvblN5bmOIAQESSAoQcmVjZW50U3RpY2tlcnNWMhgiIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIH1IQcmVjZW50U3RpY2tlcnNWMogBARJIChByZWNlbnRTdGlja2Vyc1YzGCQgASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0ggUhByZWNlbnRTdGlja2Vyc1YziAEBEjwKCnVzZXJOb3RpY2UYJSABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSCFSCnVzZXJOb3RpY2WIAQESNgoHc3VwcG9ydBgnIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIIlIHc3VwcG9ydIgBARJGCg9ncm91cFVpaUNsZWFudXAYKCABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSCNSD2dyb3VwVWlpQ2xlYW51cIgBARJeChtncm91cERvZ2Zvb2RpbmdJbnRlcm5hbE9ubHkYKSABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSCRSG2dyb3VwRG9nZm9vZGluZ0ludGVybmFsT25seYgBARJACgxzZXR0aW5nc1N5bmMYKiABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSCVSDHNldHRpbmdzU3luY4gBARI6CglhcmNoaXZlVjIYKyABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSCZSCWFyY2hpdmVWMogBARJcChplcGhlbWVyYWxBbGxvd0dyb3VwTWVtYmVycxgsIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIJ1IaZXBoZW1lcmFsQWxsb3dHcm91cE1lbWJlcnOIAQESUAoUZXBoZW1lcmFsMjRIRHVyYXRpb24YLSABKA4yFy5wcm90by5XZWJGZWF0dXJlcy5GbGFnSChSFGVwaGVtZXJhbDI0SER1cmF0aW9uiAEBEkQKDm1kRm9yY2VVcGdyYWRlGC4gASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gpUg5tZEZvcmNlVXBncmFkZYgBARJIChBkaXNhcHBlYXJpbmdNb2RlGC8gASgOMhcucHJvdG8uV2ViRmVhdHVyZXMuRmxhZ0gqUhBkaXNhcHBlYXJpbmdNb2RliAEBElgKGGV4dGVybmFsTWRPcHRJbkF2YWlsYWJsZRgwIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdIK1IYZXh0ZXJuYWxNZE9wdEluQXZhaWxhYmxliAEBElgKGG5vRGVsZXRlTWVzc2FnZVRpbWVMaW1pdBgxIAEoDjIXLnByb3RvLldlYkZlYXR1cmVzLkZsYWdILFIYbm9EZWxldGVNZXNzYWdlVGltZUxpbWl0iAEBIksKBEZsYWcSDwoLTk9UX1NUQVJURUQQABIRCg1GT1JDRV9VUEdSQURFEAESDwoLREVWRUxPUE1FTlQQAhIOCgpQUk9EVUNUSU9OEANCEAoOX2xhYmVsc0Rpc3BsYXlCGQoXX3ZvaXBJbmRpdmlkdWFsT3V0Z29pbmdCCwoJX2dyb3Vwc1YzQhEKD19ncm91cHNWM0NyZWF0ZUIRCg9fY2hhbmdlTnVtYmVyVjJCGQoXX3F1ZXJ5U3RhdHVzVjNUaHVtYm5haWxCEAoOX2xpdmVMb2NhdGlvbnNCDQoLX3F1ZXJ5Vm5hbWVCGQoXX3ZvaXBJbmRpdmlkdWFsSW5jb21pbmdCFAoSX3F1aWNrUmVwbGllc1F1ZXJ5QgsKCV9wYXltZW50c0ITChFfc3RpY2tlclBhY2tRdWVyeUIVChNfbGl2ZUxvY2F0aW9uc0ZpbmFsQg0KC19sYWJlbHNFZGl0Qg4KDF9tZWRpYVVwbG9hZEIeChxfbWVkaWFVcGxvYWRSaWNoUXVpY2tSZXBsaWVzQgoKCF92bmFtZVYyQhMKEV92aWRlb1BsYXliYWNrVXJsQhAKDl9zdGF0dXNSYW5raW5nQhYKFF92b2lwSW5kaXZpZHVhbFZpZGVvQhUKE190aGlyZFBhcnR5U3RpY2tlcnNCHQobX2ZyZXF1ZW50bHlGb3J3YXJkZWRTZXR0aW5nQhkKF19ncm91cHNWNEpvaW5QZXJtaXNzaW9uQhEKD19yZWNlbnRTdGlja2Vyc0IKCghfY2F0YWxvZ0ISChBfc3RhcnJlZFN0aWNrZXJzQhAKDl92b2lwR3JvdXBDYWxsQhIKEF90ZW1wbGF0ZU1lc3NhZ2VCHwodX3RlbXBsYXRlTWVzc2FnZUludGVyYWN0aXZpdHlCFAoSX2VwaGVtZXJhbE1lc3NhZ2VzQhYKFF9lMkVOb3RpZmljYXRpb25TeW5jQhMKEV9yZWNlbnRTdGlja2Vyc1YyQhMKEV9yZWNlbnRTdGlja2Vyc1YzQg0KC191c2VyTm90aWNlQgoKCF9zdXBwb3J0QhIKEF9ncm91cFVpaUNsZWFudXBCHgocX2dyb3VwRG9nZm9vZGluZ0ludGVybmFsT25seUIPCg1fc2V0dGluZ3NTeW5jQgwKCl9hcmNoaXZlVjJCHQobX2VwaGVtZXJhbEFsbG93R3JvdXBNZW1iZXJzQhcKFV9lcGhlbWVyYWwyNEhEdXJhdGlvbkIRCg9fbWRGb3JjZVVwZ3JhZGVCEwoRX2Rpc2FwcGVhcmluZ01vZGVCGwoZX2V4dGVybmFsTWRPcHRJbkF2YWlsYWJsZUIbChlfbm9EZWxldGVNZXNzYWdlVGltZUxpbWl0');
@$core.Deprecated('Use webMessageInfoDescriptor instead')
const WebMessageInfo$json = const {
  '1': 'WebMessageInfo',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 11, '6': '.proto.MessageKey', '10': 'key'},
    const {'1': 'message', '3': 2, '4': 1, '5': 11, '6': '.proto.Message', '9': 0, '10': 'message', '17': true},
    const {'1': 'messageTimestamp', '3': 3, '4': 1, '5': 4, '9': 1, '10': 'messageTimestamp', '17': true},
    const {'1': 'status', '3': 4, '4': 1, '5': 14, '6': '.proto.WebMessageInfo.Status', '9': 2, '10': 'status', '17': true},
    const {'1': 'participant', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'participant', '17': true},
    const {'1': 'messageC2STimestamp', '3': 6, '4': 1, '5': 4, '9': 4, '10': 'messageC2STimestamp', '17': true},
    const {'1': 'ignore', '3': 16, '4': 1, '5': 8, '9': 5, '10': 'ignore', '17': true},
    const {'1': 'starred', '3': 17, '4': 1, '5': 8, '9': 6, '10': 'starred', '17': true},
    const {'1': 'broadcast', '3': 18, '4': 1, '5': 8, '9': 7, '10': 'broadcast', '17': true},
    const {'1': 'pushName', '3': 19, '4': 1, '5': 9, '9': 8, '10': 'pushName', '17': true},
    const {'1': 'mediaCiphertextSha256', '3': 20, '4': 1, '5': 12, '9': 9, '10': 'mediaCiphertextSha256', '17': true},
    const {'1': 'multicast', '3': 21, '4': 1, '5': 8, '9': 10, '10': 'multicast', '17': true},
    const {'1': 'urlText', '3': 22, '4': 1, '5': 8, '9': 11, '10': 'urlText', '17': true},
    const {'1': 'urlNumber', '3': 23, '4': 1, '5': 8, '9': 12, '10': 'urlNumber', '17': true},
    const {'1': 'messageStubType', '3': 24, '4': 1, '5': 14, '6': '.proto.WebMessageInfo.StubType', '9': 13, '10': 'messageStubType', '17': true},
    const {'1': 'clearMedia', '3': 25, '4': 1, '5': 8, '9': 14, '10': 'clearMedia', '17': true},
    const {'1': 'messageStubParameters', '3': 26, '4': 3, '5': 9, '10': 'messageStubParameters'},
    const {'1': 'duration', '3': 27, '4': 1, '5': 13, '9': 15, '10': 'duration', '17': true},
    const {'1': 'labels', '3': 28, '4': 3, '5': 9, '10': 'labels'},
    const {'1': 'paymentInfo', '3': 29, '4': 1, '5': 11, '6': '.proto.PaymentInfo', '9': 16, '10': 'paymentInfo', '17': true},
    const {'1': 'finalLiveLocation', '3': 30, '4': 1, '5': 11, '6': '.proto.Message.LiveLocationMessage', '9': 17, '10': 'finalLiveLocation', '17': true},
    const {'1': 'quotedPaymentInfo', '3': 31, '4': 1, '5': 11, '6': '.proto.PaymentInfo', '9': 18, '10': 'quotedPaymentInfo', '17': true},
    const {'1': 'ephemeralStartTimestamp', '3': 32, '4': 1, '5': 4, '9': 19, '10': 'ephemeralStartTimestamp', '17': true},
    const {'1': 'ephemeralDuration', '3': 33, '4': 1, '5': 13, '9': 20, '10': 'ephemeralDuration', '17': true},
    const {'1': 'ephemeralOffToOn', '3': 34, '4': 1, '5': 8, '9': 21, '10': 'ephemeralOffToOn', '17': true},
    const {'1': 'ephemeralOutOfSync', '3': 35, '4': 1, '5': 8, '9': 22, '10': 'ephemeralOutOfSync', '17': true},
    const {'1': 'bizPrivacyStatus', '3': 36, '4': 1, '5': 14, '6': '.proto.WebMessageInfo.BizPrivacyStatus', '9': 23, '10': 'bizPrivacyStatus', '17': true},
    const {'1': 'verifiedBizName', '3': 37, '4': 1, '5': 9, '9': 24, '10': 'verifiedBizName', '17': true},
    const {'1': 'mediaData', '3': 38, '4': 1, '5': 11, '6': '.proto.MediaData', '9': 25, '10': 'mediaData', '17': true},
    const {'1': 'photoChange', '3': 39, '4': 1, '5': 11, '6': '.proto.PhotoChange', '9': 26, '10': 'photoChange', '17': true},
    const {'1': 'userReceipt', '3': 40, '4': 3, '5': 11, '6': '.proto.UserReceipt', '10': 'userReceipt'},
    const {'1': 'reactions', '3': 41, '4': 3, '5': 11, '6': '.proto.Reaction', '10': 'reactions'},
    const {'1': 'quotedStickerData', '3': 42, '4': 1, '5': 11, '6': '.proto.MediaData', '9': 27, '10': 'quotedStickerData', '17': true},
    const {'1': 'futureproofData', '3': 43, '4': 1, '5': 12, '9': 28, '10': 'futureproofData', '17': true},
    const {'1': 'statusPsa', '3': 44, '4': 1, '5': 11, '6': '.proto.StatusPSA', '9': 29, '10': 'statusPsa', '17': true},
    const {'1': 'pollUpdates', '3': 45, '4': 3, '5': 11, '6': '.proto.PollUpdate', '10': 'pollUpdates'},
    const {'1': 'pollAdditionalMetadata', '3': 46, '4': 1, '5': 11, '6': '.proto.PollAdditionalMetadata', '9': 30, '10': 'pollAdditionalMetadata', '17': true},
    const {'1': 'agentId', '3': 47, '4': 1, '5': 9, '9': 31, '10': 'agentId', '17': true},
    const {'1': 'statusAlreadyViewed', '3': 48, '4': 1, '5': 8, '9': 32, '10': 'statusAlreadyViewed', '17': true},
    const {'1': 'messageSecret', '3': 49, '4': 1, '5': 12, '9': 33, '10': 'messageSecret', '17': true},
    const {'1': 'keepInChat', '3': 50, '4': 1, '5': 11, '6': '.proto.KeepInChat', '9': 34, '10': 'keepInChat', '17': true},
    const {'1': 'originalSelfAuthorUserJidString', '3': 51, '4': 1, '5': 9, '9': 35, '10': 'originalSelfAuthorUserJidString', '17': true},
    const {'1': 'revokeMessageTimestamp', '3': 52, '4': 1, '5': 4, '9': 36, '10': 'revokeMessageTimestamp', '17': true},
    const {'1': 'pinInChat', '3': 54, '4': 1, '5': 11, '6': '.proto.PinInChat', '9': 37, '10': 'pinInChat', '17': true},
    const {'1': 'premiumMessageInfo', '3': 55, '4': 1, '5': 11, '6': '.proto.PremiumMessageInfo', '9': 38, '10': 'premiumMessageInfo', '17': true},
    const {'1': 'is1PBizBotMessage', '3': 56, '4': 1, '5': 8, '9': 39, '10': 'is1PBizBotMessage', '17': true},
    const {'1': 'isGroupHistoryMessage', '3': 57, '4': 1, '5': 8, '9': 40, '10': 'isGroupHistoryMessage', '17': true},
    const {'1': 'botMessageInvokerJid', '3': 58, '4': 1, '5': 9, '9': 41, '10': 'botMessageInvokerJid', '17': true},
    const {'1': 'commentMetadata', '3': 59, '4': 1, '5': 11, '6': '.proto.CommentMetadata', '9': 42, '10': 'commentMetadata', '17': true},
    const {'1': 'eventResponses', '3': 61, '4': 3, '5': 11, '6': '.proto.EventResponse', '10': 'eventResponses'},
    const {'1': 'reportingTokenInfo', '3': 62, '4': 1, '5': 11, '6': '.proto.ReportingTokenInfo', '9': 43, '10': 'reportingTokenInfo', '17': true},
    const {'1': 'newsletterServerId', '3': 63, '4': 1, '5': 4, '9': 44, '10': 'newsletterServerId', '17': true},
    const {'1': 'eventAdditionalMetadata', '3': 64, '4': 1, '5': 11, '6': '.proto.EventAdditionalMetadata', '9': 45, '10': 'eventAdditionalMetadata', '17': true},
    const {'1': 'isMentionedInStatus', '3': 65, '4': 1, '5': 8, '9': 46, '10': 'isMentionedInStatus', '17': true},
    const {'1': 'statusMentions', '3': 66, '4': 3, '5': 9, '10': 'statusMentions'},
    const {'1': 'targetMessageId', '3': 67, '4': 1, '5': 11, '6': '.proto.MessageKey', '9': 47, '10': 'targetMessageId', '17': true},
    const {'1': 'messageAddOns', '3': 68, '4': 3, '5': 11, '6': '.proto.MessageAddOn', '10': 'messageAddOns'},
    const {'1': 'statusMentionMessageInfo', '3': 69, '4': 1, '5': 11, '6': '.proto.StatusMentionMessage', '9': 48, '10': 'statusMentionMessageInfo', '17': true},
    const {'1': 'isSupportAiMessage', '3': 70, '4': 1, '5': 8, '9': 49, '10': 'isSupportAiMessage', '17': true},
    const {'1': 'statusMentionSources', '3': 71, '4': 3, '5': 9, '10': 'statusMentionSources'},
    const {'1': 'supportAiCitations', '3': 72, '4': 3, '5': 11, '6': '.proto.Citation', '10': 'supportAiCitations'},
    const {'1': 'botTargetId', '3': 73, '4': 1, '5': 9, '9': 50, '10': 'botTargetId', '17': true},
    const {'1': 'groupHistoryIndividualMessageInfo', '3': 74, '4': 1, '5': 11, '6': '.proto.GroupHistoryIndividualMessageInfo', '9': 51, '10': 'groupHistoryIndividualMessageInfo', '17': true},
    const {'1': 'groupHistoryBundleInfo', '3': 75, '4': 1, '5': 11, '6': '.proto.GroupHistoryBundleInfo', '9': 52, '10': 'groupHistoryBundleInfo', '17': true},
    const {'1': 'interactiveMessageAdditionalMetadata', '3': 76, '4': 1, '5': 11, '6': '.proto.InteractiveMessageAdditionalMetadata', '9': 53, '10': 'interactiveMessageAdditionalMetadata', '17': true},
    const {'1': 'quarantinedMessage', '3': 77, '4': 1, '5': 11, '6': '.proto.QuarantinedMessage', '9': 54, '10': 'quarantinedMessage', '17': true},
  ],
  '4': const [WebMessageInfo_BizPrivacyStatus$json, WebMessageInfo_Status$json, WebMessageInfo_StubType$json],
  '8': const [
    const {'1': '_message'},
    const {'1': '_messageTimestamp'},
    const {'1': '_status'},
    const {'1': '_participant'},
    const {'1': '_messageC2STimestamp'},
    const {'1': '_ignore'},
    const {'1': '_starred'},
    const {'1': '_broadcast'},
    const {'1': '_pushName'},
    const {'1': '_mediaCiphertextSha256'},
    const {'1': '_multicast'},
    const {'1': '_urlText'},
    const {'1': '_urlNumber'},
    const {'1': '_messageStubType'},
    const {'1': '_clearMedia'},
    const {'1': '_duration'},
    const {'1': '_paymentInfo'},
    const {'1': '_finalLiveLocation'},
    const {'1': '_quotedPaymentInfo'},
    const {'1': '_ephemeralStartTimestamp'},
    const {'1': '_ephemeralDuration'},
    const {'1': '_ephemeralOffToOn'},
    const {'1': '_ephemeralOutOfSync'},
    const {'1': '_bizPrivacyStatus'},
    const {'1': '_verifiedBizName'},
    const {'1': '_mediaData'},
    const {'1': '_photoChange'},
    const {'1': '_quotedStickerData'},
    const {'1': '_futureproofData'},
    const {'1': '_statusPsa'},
    const {'1': '_pollAdditionalMetadata'},
    const {'1': '_agentId'},
    const {'1': '_statusAlreadyViewed'},
    const {'1': '_messageSecret'},
    const {'1': '_keepInChat'},
    const {'1': '_originalSelfAuthorUserJidString'},
    const {'1': '_revokeMessageTimestamp'},
    const {'1': '_pinInChat'},
    const {'1': '_premiumMessageInfo'},
    const {'1': '_is1PBizBotMessage'},
    const {'1': '_isGroupHistoryMessage'},
    const {'1': '_botMessageInvokerJid'},
    const {'1': '_commentMetadata'},
    const {'1': '_reportingTokenInfo'},
    const {'1': '_newsletterServerId'},
    const {'1': '_eventAdditionalMetadata'},
    const {'1': '_isMentionedInStatus'},
    const {'1': '_targetMessageId'},
    const {'1': '_statusMentionMessageInfo'},
    const {'1': '_isSupportAiMessage'},
    const {'1': '_botTargetId'},
    const {'1': '_groupHistoryIndividualMessageInfo'},
    const {'1': '_groupHistoryBundleInfo'},
    const {'1': '_interactiveMessageAdditionalMetadata'},
    const {'1': '_quarantinedMessage'},
  ],
};

@$core.Deprecated('Use webMessageInfoDescriptor instead')
const WebMessageInfo_BizPrivacyStatus$json = const {
  '1': 'BizPrivacyStatus',
  '2': const [
    const {'1': 'E2EE', '2': 0},
    const {'1': 'FB', '2': 2},
    const {'1': 'BSP', '2': 1},
    const {'1': 'BSP_AND_FB', '2': 3},
  ],
};

@$core.Deprecated('Use webMessageInfoDescriptor instead')
const WebMessageInfo_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'ERROR', '2': 0},
    const {'1': 'PENDING', '2': 1},
    const {'1': 'SERVER_ACK', '2': 2},
    const {'1': 'DELIVERY_ACK', '2': 3},
    const {'1': 'READ', '2': 4},
    const {'1': 'PLAYED', '2': 5},
  ],
};

@$core.Deprecated('Use webMessageInfoDescriptor instead')
const WebMessageInfo_StubType$json = const {
  '1': 'StubType',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'REVOKE', '2': 1},
    const {'1': 'CIPHERTEXT', '2': 2},
    const {'1': 'FUTUREPROOF', '2': 3},
    const {'1': 'NON_VERIFIED_TRANSITION', '2': 4},
    const {'1': 'UNVERIFIED_TRANSITION', '2': 5},
    const {'1': 'VERIFIED_TRANSITION', '2': 6},
    const {'1': 'VERIFIED_LOW_UNKNOWN', '2': 7},
    const {'1': 'VERIFIED_HIGH', '2': 8},
    const {'1': 'VERIFIED_INITIAL_UNKNOWN', '2': 9},
    const {'1': 'VERIFIED_INITIAL_LOW', '2': 10},
    const {'1': 'VERIFIED_INITIAL_HIGH', '2': 11},
    const {'1': 'VERIFIED_TRANSITION_ANY_TO_NONE', '2': 12},
    const {'1': 'VERIFIED_TRANSITION_ANY_TO_HIGH', '2': 13},
    const {'1': 'VERIFIED_TRANSITION_HIGH_TO_LOW', '2': 14},
    const {'1': 'VERIFIED_TRANSITION_HIGH_TO_UNKNOWN', '2': 15},
    const {'1': 'VERIFIED_TRANSITION_UNKNOWN_TO_LOW', '2': 16},
    const {'1': 'VERIFIED_TRANSITION_LOW_TO_UNKNOWN', '2': 17},
    const {'1': 'VERIFIED_TRANSITION_NONE_TO_LOW', '2': 18},
    const {'1': 'VERIFIED_TRANSITION_NONE_TO_UNKNOWN', '2': 19},
    const {'1': 'GROUP_CREATE', '2': 20},
    const {'1': 'GROUP_CHANGE_SUBJECT', '2': 21},
    const {'1': 'GROUP_CHANGE_ICON', '2': 22},
    const {'1': 'GROUP_CHANGE_INVITE_LINK', '2': 23},
    const {'1': 'GROUP_CHANGE_DESCRIPTION', '2': 24},
    const {'1': 'GROUP_CHANGE_RESTRICT', '2': 25},
    const {'1': 'GROUP_CHANGE_ANNOUNCE', '2': 26},
    const {'1': 'GROUP_PARTICIPANT_ADD', '2': 27},
    const {'1': 'GROUP_PARTICIPANT_REMOVE', '2': 28},
    const {'1': 'GROUP_PARTICIPANT_PROMOTE', '2': 29},
    const {'1': 'GROUP_PARTICIPANT_DEMOTE', '2': 30},
    const {'1': 'GROUP_PARTICIPANT_INVITE', '2': 31},
    const {'1': 'GROUP_PARTICIPANT_LEAVE', '2': 32},
    const {'1': 'GROUP_PARTICIPANT_CHANGE_NUMBER', '2': 33},
    const {'1': 'BROADCAST_CREATE', '2': 34},
    const {'1': 'BROADCAST_ADD', '2': 35},
    const {'1': 'BROADCAST_REMOVE', '2': 36},
    const {'1': 'GENERIC_NOTIFICATION', '2': 37},
    const {'1': 'E2E_IDENTITY_CHANGED', '2': 38},
    const {'1': 'E2E_ENCRYPTED', '2': 39},
    const {'1': 'CALL_MISSED_VOICE', '2': 40},
    const {'1': 'CALL_MISSED_VIDEO', '2': 41},
    const {'1': 'INDIVIDUAL_CHANGE_NUMBER', '2': 42},
    const {'1': 'GROUP_DELETE', '2': 43},
    const {'1': 'GROUP_ANNOUNCE_MODE_MESSAGE_BOUNCE', '2': 44},
    const {'1': 'CALL_MISSED_GROUP_VOICE', '2': 45},
    const {'1': 'CALL_MISSED_GROUP_VIDEO', '2': 46},
    const {'1': 'PAYMENT_CIPHERTEXT', '2': 47},
    const {'1': 'PAYMENT_FUTUREPROOF', '2': 48},
    const {'1': 'PAYMENT_TRANSACTION_STATUS_UPDATE_FAILED', '2': 49},
    const {'1': 'PAYMENT_TRANSACTION_STATUS_UPDATE_REFUNDED', '2': 50},
    const {'1': 'PAYMENT_TRANSACTION_STATUS_UPDATE_REFUND_FAILED', '2': 51},
    const {'1': 'PAYMENT_TRANSACTION_STATUS_RECEIVER_PENDING_SETUP', '2': 52},
    const {'1': 'PAYMENT_TRANSACTION_STATUS_RECEIVER_SUCCESS_AFTER_HICCUP', '2': 53},
    const {'1': 'PAYMENT_ACTION_ACCOUNT_SETUP_REMINDER', '2': 54},
    const {'1': 'PAYMENT_ACTION_SEND_PAYMENT_REMINDER', '2': 55},
    const {'1': 'PAYMENT_ACTION_SEND_PAYMENT_INVITATION', '2': 56},
    const {'1': 'PAYMENT_ACTION_REQUEST_DECLINED', '2': 57},
    const {'1': 'PAYMENT_ACTION_REQUEST_EXPIRED', '2': 58},
    const {'1': 'PAYMENT_ACTION_REQUEST_CANCELLED', '2': 59},
    const {'1': 'BIZ_VERIFIED_TRANSITION_TOP_TO_BOTTOM', '2': 60},
    const {'1': 'BIZ_VERIFIED_TRANSITION_BOTTOM_TO_TOP', '2': 61},
    const {'1': 'BIZ_INTRO_TOP', '2': 62},
    const {'1': 'BIZ_INTRO_BOTTOM', '2': 63},
    const {'1': 'BIZ_NAME_CHANGE', '2': 64},
    const {'1': 'BIZ_MOVE_TO_CONSUMER_APP', '2': 65},
    const {'1': 'BIZ_TWO_TIER_MIGRATION_TOP', '2': 66},
    const {'1': 'BIZ_TWO_TIER_MIGRATION_BOTTOM', '2': 67},
    const {'1': 'OVERSIZED', '2': 68},
    const {'1': 'GROUP_CHANGE_NO_FREQUENTLY_FORWARDED', '2': 69},
    const {'1': 'GROUP_V4_ADD_INVITE_SENT', '2': 70},
    const {'1': 'GROUP_PARTICIPANT_ADD_REQUEST_JOIN', '2': 71},
    const {'1': 'CHANGE_EPHEMERAL_SETTING', '2': 72},
    const {'1': 'E2E_DEVICE_CHANGED', '2': 73},
    const {'1': 'VIEWED_ONCE', '2': 74},
    const {'1': 'E2E_ENCRYPTED_NOW', '2': 75},
    const {'1': 'BLUE_MSG_BSP_FB_TO_BSP_PREMISE', '2': 76},
    const {'1': 'BLUE_MSG_BSP_FB_TO_SELF_FB', '2': 77},
    const {'1': 'BLUE_MSG_BSP_FB_TO_SELF_PREMISE', '2': 78},
    const {'1': 'BLUE_MSG_BSP_FB_UNVERIFIED', '2': 79},
    const {'1': 'BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED', '2': 80},
    const {'1': 'BLUE_MSG_BSP_FB_VERIFIED', '2': 81},
    const {'1': 'BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED', '2': 82},
    const {'1': 'BLUE_MSG_BSP_PREMISE_TO_SELF_PREMISE', '2': 83},
    const {'1': 'BLUE_MSG_BSP_PREMISE_UNVERIFIED', '2': 84},
    const {'1': 'BLUE_MSG_BSP_PREMISE_UNVERIFIED_TO_SELF_PREMISE_VERIFIED', '2': 85},
    const {'1': 'BLUE_MSG_BSP_PREMISE_VERIFIED', '2': 86},
    const {'1': 'BLUE_MSG_BSP_PREMISE_VERIFIED_TO_SELF_PREMISE_UNVERIFIED', '2': 87},
    const {'1': 'BLUE_MSG_CONSUMER_TO_BSP_FB_UNVERIFIED', '2': 88},
    const {'1': 'BLUE_MSG_CONSUMER_TO_BSP_PREMISE_UNVERIFIED', '2': 89},
    const {'1': 'BLUE_MSG_CONSUMER_TO_SELF_FB_UNVERIFIED', '2': 90},
    const {'1': 'BLUE_MSG_CONSUMER_TO_SELF_PREMISE_UNVERIFIED', '2': 91},
    const {'1': 'BLUE_MSG_SELF_FB_TO_BSP_PREMISE', '2': 92},
    const {'1': 'BLUE_MSG_SELF_FB_TO_SELF_PREMISE', '2': 93},
    const {'1': 'BLUE_MSG_SELF_FB_UNVERIFIED', '2': 94},
    const {'1': 'BLUE_MSG_SELF_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED', '2': 95},
    const {'1': 'BLUE_MSG_SELF_FB_VERIFIED', '2': 96},
    const {'1': 'BLUE_MSG_SELF_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED', '2': 97},
    const {'1': 'BLUE_MSG_SELF_PREMISE_TO_BSP_PREMISE', '2': 98},
    const {'1': 'BLUE_MSG_SELF_PREMISE_UNVERIFIED', '2': 99},
    const {'1': 'BLUE_MSG_SELF_PREMISE_VERIFIED', '2': 100},
    const {'1': 'BLUE_MSG_TO_BSP_FB', '2': 101},
    const {'1': 'BLUE_MSG_TO_CONSUMER', '2': 102},
    const {'1': 'BLUE_MSG_TO_SELF_FB', '2': 103},
    const {'1': 'BLUE_MSG_UNVERIFIED_TO_BSP_FB_VERIFIED', '2': 104},
    const {'1': 'BLUE_MSG_UNVERIFIED_TO_BSP_PREMISE_VERIFIED', '2': 105},
    const {'1': 'BLUE_MSG_UNVERIFIED_TO_SELF_FB_VERIFIED', '2': 106},
    const {'1': 'BLUE_MSG_UNVERIFIED_TO_VERIFIED', '2': 107},
    const {'1': 'BLUE_MSG_VERIFIED_TO_BSP_FB_UNVERIFIED', '2': 108},
    const {'1': 'BLUE_MSG_VERIFIED_TO_BSP_PREMISE_UNVERIFIED', '2': 109},
    const {'1': 'BLUE_MSG_VERIFIED_TO_SELF_FB_UNVERIFIED', '2': 110},
    const {'1': 'BLUE_MSG_VERIFIED_TO_UNVERIFIED', '2': 111},
    const {'1': 'BLUE_MSG_BSP_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED', '2': 112},
    const {'1': 'BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_FB_VERIFIED', '2': 113},
    const {'1': 'BLUE_MSG_BSP_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED', '2': 114},
    const {'1': 'BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_FB_UNVERIFIED', '2': 115},
    const {'1': 'BLUE_MSG_SELF_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED', '2': 116},
    const {'1': 'BLUE_MSG_SELF_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED', '2': 117},
    const {'1': 'E2E_IDENTITY_UNAVAILABLE', '2': 118},
    const {'1': 'GROUP_CREATING', '2': 119},
    const {'1': 'GROUP_CREATE_FAILED', '2': 120},
    const {'1': 'GROUP_BOUNCED', '2': 121},
    const {'1': 'BLOCK_CONTACT', '2': 122},
    const {'1': 'EPHEMERAL_SETTING_NOT_APPLIED', '2': 123},
    const {'1': 'SYNC_FAILED', '2': 124},
    const {'1': 'SYNCING', '2': 125},
    const {'1': 'BIZ_PRIVACY_MODE_INIT_FB', '2': 126},
    const {'1': 'BIZ_PRIVACY_MODE_INIT_BSP', '2': 127},
    const {'1': 'BIZ_PRIVACY_MODE_TO_FB', '2': 128},
    const {'1': 'BIZ_PRIVACY_MODE_TO_BSP', '2': 129},
    const {'1': 'DISAPPEARING_MODE', '2': 130},
    const {'1': 'E2E_DEVICE_FETCH_FAILED', '2': 131},
    const {'1': 'ADMIN_REVOKE', '2': 132},
    const {'1': 'GROUP_INVITE_LINK_GROWTH_LOCKED', '2': 133},
    const {'1': 'COMMUNITY_LINK_PARENT_GROUP', '2': 134},
    const {'1': 'COMMUNITY_LINK_SIBLING_GROUP', '2': 135},
    const {'1': 'COMMUNITY_LINK_SUB_GROUP', '2': 136},
    const {'1': 'COMMUNITY_UNLINK_PARENT_GROUP', '2': 137},
    const {'1': 'COMMUNITY_UNLINK_SIBLING_GROUP', '2': 138},
    const {'1': 'COMMUNITY_UNLINK_SUB_GROUP', '2': 139},
    const {'1': 'GROUP_PARTICIPANT_ACCEPT', '2': 140},
    const {'1': 'GROUP_PARTICIPANT_LINKED_GROUP_JOIN', '2': 141},
    const {'1': 'COMMUNITY_CREATE', '2': 142},
    const {'1': 'EPHEMERAL_KEEP_IN_CHAT', '2': 143},
    const {'1': 'GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST', '2': 144},
    const {'1': 'GROUP_MEMBERSHIP_JOIN_APPROVAL_MODE', '2': 145},
    const {'1': 'INTEGRITY_UNLINK_PARENT_GROUP', '2': 146},
    const {'1': 'COMMUNITY_PARTICIPANT_PROMOTE', '2': 147},
    const {'1': 'COMMUNITY_PARTICIPANT_DEMOTE', '2': 148},
    const {'1': 'COMMUNITY_PARENT_GROUP_DELETED', '2': 149},
    const {'1': 'COMMUNITY_LINK_PARENT_GROUP_MEMBERSHIP_APPROVAL', '2': 150},
    const {'1': 'GROUP_PARTICIPANT_JOINED_GROUP_AND_PARENT_GROUP', '2': 151},
    const {'1': 'MASKED_THREAD_CREATED', '2': 152},
    const {'1': 'MASKED_THREAD_UNMASKED', '2': 153},
    const {'1': 'BIZ_CHAT_ASSIGNMENT', '2': 154},
    const {'1': 'CHAT_PSA', '2': 155},
    const {'1': 'CHAT_POLL_CREATION_MESSAGE', '2': 156},
    const {'1': 'CAG_MASKED_THREAD_CREATED', '2': 157},
    const {'1': 'COMMUNITY_PARENT_GROUP_SUBJECT_CHANGED', '2': 158},
    const {'1': 'CAG_INVITE_AUTO_ADD', '2': 159},
    const {'1': 'BIZ_CHAT_ASSIGNMENT_UNASSIGN', '2': 160},
    const {'1': 'CAG_INVITE_AUTO_JOINED', '2': 161},
    const {'1': 'SCHEDULED_CALL_START_MESSAGE', '2': 162},
    const {'1': 'COMMUNITY_INVITE_RICH', '2': 163},
    const {'1': 'COMMUNITY_INVITE_AUTO_ADD_RICH', '2': 164},
    const {'1': 'SUB_GROUP_INVITE_RICH', '2': 165},
    const {'1': 'SUB_GROUP_PARTICIPANT_ADD_RICH', '2': 166},
    const {'1': 'COMMUNITY_LINK_PARENT_GROUP_RICH', '2': 167},
    const {'1': 'COMMUNITY_PARTICIPANT_ADD_RICH', '2': 168},
    const {'1': 'SILENCED_UNKNOWN_CALLER_AUDIO', '2': 169},
    const {'1': 'SILENCED_UNKNOWN_CALLER_VIDEO', '2': 170},
    const {'1': 'GROUP_MEMBER_ADD_MODE', '2': 171},
    const {'1': 'GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST_NON_ADMIN_ADD', '2': 172},
    const {'1': 'COMMUNITY_CHANGE_DESCRIPTION', '2': 173},
    const {'1': 'SENDER_INVITE', '2': 174},
    const {'1': 'RECEIVER_INVITE', '2': 175},
    const {'1': 'COMMUNITY_ALLOW_MEMBER_ADDED_GROUPS', '2': 176},
    const {'1': 'PINNED_MESSAGE_IN_CHAT', '2': 177},
    const {'1': 'PAYMENT_INVITE_SETUP_INVITER', '2': 178},
    const {'1': 'PAYMENT_INVITE_SETUP_INVITEE_RECEIVE_ONLY', '2': 179},
    const {'1': 'PAYMENT_INVITE_SETUP_INVITEE_SEND_AND_RECEIVE', '2': 180},
    const {'1': 'LINKED_GROUP_CALL_START', '2': 181},
    const {'1': 'REPORT_TO_ADMIN_ENABLED_STATUS', '2': 182},
    const {'1': 'EMPTY_SUBGROUP_CREATE', '2': 183},
    const {'1': 'SCHEDULED_CALL_CANCEL', '2': 184},
    const {'1': 'SUBGROUP_ADMIN_TRIGGERED_AUTO_ADD_RICH', '2': 185},
    const {'1': 'GROUP_CHANGE_RECENT_HISTORY_SHARING', '2': 186},
    const {'1': 'PAID_MESSAGE_SERVER_CAMPAIGN_ID', '2': 187},
    const {'1': 'GENERAL_CHAT_CREATE', '2': 188},
    const {'1': 'GENERAL_CHAT_ADD', '2': 189},
    const {'1': 'GENERAL_CHAT_AUTO_ADD_DISABLED', '2': 190},
    const {'1': 'SUGGESTED_SUBGROUP_ANNOUNCE', '2': 191},
    const {'1': 'BIZ_BOT_1P_MESSAGING_ENABLED', '2': 192},
    const {'1': 'CHANGE_USERNAME', '2': 193},
    const {'1': 'BIZ_COEX_PRIVACY_INIT_SELF', '2': 194},
    const {'1': 'BIZ_COEX_PRIVACY_TRANSITION_SELF', '2': 195},
    const {'1': 'SUPPORT_AI_EDUCATION', '2': 196},
    const {'1': 'BIZ_BOT_3P_MESSAGING_ENABLED', '2': 197},
    const {'1': 'REMINDER_SETUP_MESSAGE', '2': 198},
    const {'1': 'REMINDER_SENT_MESSAGE', '2': 199},
    const {'1': 'REMINDER_CANCEL_MESSAGE', '2': 200},
    const {'1': 'BIZ_COEX_PRIVACY_INIT', '2': 201},
    const {'1': 'BIZ_COEX_PRIVACY_TRANSITION', '2': 202},
    const {'1': 'GROUP_DEACTIVATED', '2': 203},
    const {'1': 'COMMUNITY_DEACTIVATE_SIBLING_GROUP', '2': 204},
    const {'1': 'EVENT_UPDATED', '2': 205},
    const {'1': 'EVENT_CANCELED', '2': 206},
    const {'1': 'COMMUNITY_OWNER_UPDATED', '2': 207},
    const {'1': 'COMMUNITY_SUB_GROUP_VISIBILITY_HIDDEN', '2': 208},
    const {'1': 'CAPI_GROUP_NE2EE_SYSTEM_MESSAGE', '2': 209},
    const {'1': 'STATUS_MENTION', '2': 210},
    const {'1': 'USER_CONTROLS_SYSTEM_MESSAGE', '2': 211},
    const {'1': 'SUPPORT_SYSTEM_MESSAGE', '2': 212},
    const {'1': 'CHANGE_LID', '2': 213},
    const {'1': 'BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_IN_MESSAGE', '2': 214},
    const {'1': 'BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_OUT_MESSAGE', '2': 215},
    const {'1': 'CHANGE_LIMIT_SHARING', '2': 216},
    const {'1': 'GROUP_MEMBER_LINK_MODE', '2': 217},
    const {'1': 'BIZ_AUTOMATICALLY_LABELED_CHAT_SYSTEM_MESSAGE', '2': 218},
    const {'1': 'PHONE_NUMBER_HIDING_CHAT_DEPRECATED_MESSAGE', '2': 219},
    const {'1': 'QUARANTINED_MESSAGE', '2': 220},
    const {'1': 'GROUP_MEMBER_SHARE_GROUP_HISTORY_MODE', '2': 221},
  ],
};

/// Descriptor for `WebMessageInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webMessageInfoDescriptor = $convert.base64Decode('Cg5XZWJNZXNzYWdlSW5mbxIjCgNrZXkYASABKAsyES5wcm90by5NZXNzYWdlS2V5UgNrZXkSLQoHbWVzc2FnZRgCIAEoCzIOLnByb3RvLk1lc3NhZ2VIAFIHbWVzc2FnZYgBARIvChBtZXNzYWdlVGltZXN0YW1wGAMgASgESAFSEG1lc3NhZ2VUaW1lc3RhbXCIAQESOQoGc3RhdHVzGAQgASgOMhwucHJvdG8uV2ViTWVzc2FnZUluZm8uU3RhdHVzSAJSBnN0YXR1c4gBARIlCgtwYXJ0aWNpcGFudBgFIAEoCUgDUgtwYXJ0aWNpcGFudIgBARI1ChNtZXNzYWdlQzJTVGltZXN0YW1wGAYgASgESARSE21lc3NhZ2VDMlNUaW1lc3RhbXCIAQESGwoGaWdub3JlGBAgASgISAVSBmlnbm9yZYgBARIdCgdzdGFycmVkGBEgASgISAZSB3N0YXJyZWSIAQESIQoJYnJvYWRjYXN0GBIgASgISAdSCWJyb2FkY2FzdIgBARIfCghwdXNoTmFtZRgTIAEoCUgIUghwdXNoTmFtZYgBARI5ChVtZWRpYUNpcGhlcnRleHRTaGEyNTYYFCABKAxICVIVbWVkaWFDaXBoZXJ0ZXh0U2hhMjU2iAEBEiEKCW11bHRpY2FzdBgVIAEoCEgKUgltdWx0aWNhc3SIAQESHQoHdXJsVGV4dBgWIAEoCEgLUgd1cmxUZXh0iAEBEiEKCXVybE51bWJlchgXIAEoCEgMUgl1cmxOdW1iZXKIAQESTQoPbWVzc2FnZVN0dWJUeXBlGBggASgOMh4ucHJvdG8uV2ViTWVzc2FnZUluZm8uU3R1YlR5cGVIDVIPbWVzc2FnZVN0dWJUeXBliAEBEiMKCmNsZWFyTWVkaWEYGSABKAhIDlIKY2xlYXJNZWRpYYgBARI0ChVtZXNzYWdlU3R1YlBhcmFtZXRlcnMYGiADKAlSFW1lc3NhZ2VTdHViUGFyYW1ldGVycxIfCghkdXJhdGlvbhgbIAEoDUgPUghkdXJhdGlvbogBARIWCgZsYWJlbHMYHCADKAlSBmxhYmVscxI5CgtwYXltZW50SW5mbxgdIAEoCzISLnByb3RvLlBheW1lbnRJbmZvSBBSC3BheW1lbnRJbmZviAEBElUKEWZpbmFsTGl2ZUxvY2F0aW9uGB4gASgLMiIucHJvdG8uTWVzc2FnZS5MaXZlTG9jYXRpb25NZXNzYWdlSBFSEWZpbmFsTGl2ZUxvY2F0aW9uiAEBEkUKEXF1b3RlZFBheW1lbnRJbmZvGB8gASgLMhIucHJvdG8uUGF5bWVudEluZm9IElIRcXVvdGVkUGF5bWVudEluZm+IAQESPQoXZXBoZW1lcmFsU3RhcnRUaW1lc3RhbXAYICABKARIE1IXZXBoZW1lcmFsU3RhcnRUaW1lc3RhbXCIAQESMQoRZXBoZW1lcmFsRHVyYXRpb24YISABKA1IFFIRZXBoZW1lcmFsRHVyYXRpb26IAQESLwoQZXBoZW1lcmFsT2ZmVG9PbhgiIAEoCEgVUhBlcGhlbWVyYWxPZmZUb09uiAEBEjMKEmVwaGVtZXJhbE91dE9mU3luYxgjIAEoCEgWUhJlcGhlbWVyYWxPdXRPZlN5bmOIAQESVwoQYml6UHJpdmFjeVN0YXR1cxgkIAEoDjImLnByb3RvLldlYk1lc3NhZ2VJbmZvLkJpelByaXZhY3lTdGF0dXNIF1IQYml6UHJpdmFjeVN0YXR1c4gBARItCg92ZXJpZmllZEJpek5hbWUYJSABKAlIGFIPdmVyaWZpZWRCaXpOYW1liAEBEjMKCW1lZGlhRGF0YRgmIAEoCzIQLnByb3RvLk1lZGlhRGF0YUgZUgltZWRpYURhdGGIAQESOQoLcGhvdG9DaGFuZ2UYJyABKAsyEi5wcm90by5QaG90b0NoYW5nZUgaUgtwaG90b0NoYW5nZYgBARI0Cgt1c2VyUmVjZWlwdBgoIAMoCzISLnByb3RvLlVzZXJSZWNlaXB0Ugt1c2VyUmVjZWlwdBItCglyZWFjdGlvbnMYKSADKAsyDy5wcm90by5SZWFjdGlvblIJcmVhY3Rpb25zEkMKEXF1b3RlZFN0aWNrZXJEYXRhGCogASgLMhAucHJvdG8uTWVkaWFEYXRhSBtSEXF1b3RlZFN0aWNrZXJEYXRhiAEBEi0KD2Z1dHVyZXByb29mRGF0YRgrIAEoDEgcUg9mdXR1cmVwcm9vZkRhdGGIAQESMwoJc3RhdHVzUHNhGCwgASgLMhAucHJvdG8uU3RhdHVzUFNBSB1SCXN0YXR1c1BzYYgBARIzCgtwb2xsVXBkYXRlcxgtIAMoCzIRLnByb3RvLlBvbGxVcGRhdGVSC3BvbGxVcGRhdGVzEloKFnBvbGxBZGRpdGlvbmFsTWV0YWRhdGEYLiABKAsyHS5wcm90by5Qb2xsQWRkaXRpb25hbE1ldGFkYXRhSB5SFnBvbGxBZGRpdGlvbmFsTWV0YWRhdGGIAQESHQoHYWdlbnRJZBgvIAEoCUgfUgdhZ2VudElkiAEBEjUKE3N0YXR1c0FscmVhZHlWaWV3ZWQYMCABKAhIIFITc3RhdHVzQWxyZWFkeVZpZXdlZIgBARIpCg1tZXNzYWdlU2VjcmV0GDEgASgMSCFSDW1lc3NhZ2VTZWNyZXSIAQESNgoKa2VlcEluQ2hhdBgyIAEoCzIRLnByb3RvLktlZXBJbkNoYXRIIlIKa2VlcEluQ2hhdIgBARJNCh9vcmlnaW5hbFNlbGZBdXRob3JVc2VySmlkU3RyaW5nGDMgASgJSCNSH29yaWdpbmFsU2VsZkF1dGhvclVzZXJKaWRTdHJpbmeIAQESOwoWcmV2b2tlTWVzc2FnZVRpbWVzdGFtcBg0IAEoBEgkUhZyZXZva2VNZXNzYWdlVGltZXN0YW1wiAEBEjMKCXBpbkluQ2hhdBg2IAEoCzIQLnByb3RvLlBpbkluQ2hhdEglUglwaW5JbkNoYXSIAQESTgoScHJlbWl1bU1lc3NhZ2VJbmZvGDcgASgLMhkucHJvdG8uUHJlbWl1bU1lc3NhZ2VJbmZvSCZSEnByZW1pdW1NZXNzYWdlSW5mb4gBARIxChFpczFQQml6Qm90TWVzc2FnZRg4IAEoCEgnUhFpczFQQml6Qm90TWVzc2FnZYgBARI5ChVpc0dyb3VwSGlzdG9yeU1lc3NhZ2UYOSABKAhIKFIVaXNHcm91cEhpc3RvcnlNZXNzYWdliAEBEjcKFGJvdE1lc3NhZ2VJbnZva2VySmlkGDogASgJSClSFGJvdE1lc3NhZ2VJbnZva2VySmlkiAEBEkUKD2NvbW1lbnRNZXRhZGF0YRg7IAEoCzIWLnByb3RvLkNvbW1lbnRNZXRhZGF0YUgqUg9jb21tZW50TWV0YWRhdGGIAQESPAoOZXZlbnRSZXNwb25zZXMYPSADKAsyFC5wcm90by5FdmVudFJlc3BvbnNlUg5ldmVudFJlc3BvbnNlcxJOChJyZXBvcnRpbmdUb2tlbkluZm8YPiABKAsyGS5wcm90by5SZXBvcnRpbmdUb2tlbkluZm9IK1IScmVwb3J0aW5nVG9rZW5JbmZviAEBEjMKEm5ld3NsZXR0ZXJTZXJ2ZXJJZBg/IAEoBEgsUhJuZXdzbGV0dGVyU2VydmVySWSIAQESXQoXZXZlbnRBZGRpdGlvbmFsTWV0YWRhdGEYQCABKAsyHi5wcm90by5FdmVudEFkZGl0aW9uYWxNZXRhZGF0YUgtUhdldmVudEFkZGl0aW9uYWxNZXRhZGF0YYgBARI1ChNpc01lbnRpb25lZEluU3RhdHVzGEEgASgISC5SE2lzTWVudGlvbmVkSW5TdGF0dXOIAQESJgoOc3RhdHVzTWVudGlvbnMYQiADKAlSDnN0YXR1c01lbnRpb25zEkAKD3RhcmdldE1lc3NhZ2VJZBhDIAEoCzIRLnByb3RvLk1lc3NhZ2VLZXlIL1IPdGFyZ2V0TWVzc2FnZUlkiAEBEjkKDW1lc3NhZ2VBZGRPbnMYRCADKAsyEy5wcm90by5NZXNzYWdlQWRkT25SDW1lc3NhZ2VBZGRPbnMSXAoYc3RhdHVzTWVudGlvbk1lc3NhZ2VJbmZvGEUgASgLMhsucHJvdG8uU3RhdHVzTWVudGlvbk1lc3NhZ2VIMFIYc3RhdHVzTWVudGlvbk1lc3NhZ2VJbmZviAEBEjMKEmlzU3VwcG9ydEFpTWVzc2FnZRhGIAEoCEgxUhJpc1N1cHBvcnRBaU1lc3NhZ2WIAQESMgoUc3RhdHVzTWVudGlvblNvdXJjZXMYRyADKAlSFHN0YXR1c01lbnRpb25Tb3VyY2VzEj8KEnN1cHBvcnRBaUNpdGF0aW9ucxhIIAMoCzIPLnByb3RvLkNpdGF0aW9uUhJzdXBwb3J0QWlDaXRhdGlvbnMSJQoLYm90VGFyZ2V0SWQYSSABKAlIMlILYm90VGFyZ2V0SWSIAQESewohZ3JvdXBIaXN0b3J5SW5kaXZpZHVhbE1lc3NhZ2VJbmZvGEogASgLMigucHJvdG8uR3JvdXBIaXN0b3J5SW5kaXZpZHVhbE1lc3NhZ2VJbmZvSDNSIWdyb3VwSGlzdG9yeUluZGl2aWR1YWxNZXNzYWdlSW5mb4gBARJaChZncm91cEhpc3RvcnlCdW5kbGVJbmZvGEsgASgLMh0ucHJvdG8uR3JvdXBIaXN0b3J5QnVuZGxlSW5mb0g0UhZncm91cEhpc3RvcnlCdW5kbGVJbmZviAEBEoQBCiRpbnRlcmFjdGl2ZU1lc3NhZ2VBZGRpdGlvbmFsTWV0YWRhdGEYTCABKAsyKy5wcm90by5JbnRlcmFjdGl2ZU1lc3NhZ2VBZGRpdGlvbmFsTWV0YWRhdGFINVIkaW50ZXJhY3RpdmVNZXNzYWdlQWRkaXRpb25hbE1ldGFkYXRhiAEBEk4KEnF1YXJhbnRpbmVkTWVzc2FnZRhNIAEoCzIZLnByb3RvLlF1YXJhbnRpbmVkTWVzc2FnZUg2UhJxdWFyYW50aW5lZE1lc3NhZ2WIAQEiPQoQQml6UHJpdmFjeVN0YXR1cxIICgRFMkVFEAASBgoCRkIQAhIHCgNCU1AQARIOCgpCU1BfQU5EX0ZCEAMiWAoGU3RhdHVzEgkKBUVSUk9SEAASCwoHUEVORElORxABEg4KClNFUlZFUl9BQ0sQAhIQCgxERUxJVkVSWV9BQ0sQAxIICgRSRUFEEAQSCgoGUExBWUVEEAUimzsKCFN0dWJUeXBlEgsKB1VOS05PV04QABIKCgZSRVZPS0UQARIOCgpDSVBIRVJURVhUEAISDwoLRlVUVVJFUFJPT0YQAxIbChdOT05fVkVSSUZJRURfVFJBTlNJVElPThAEEhkKFVVOVkVSSUZJRURfVFJBTlNJVElPThAFEhcKE1ZFUklGSUVEX1RSQU5TSVRJT04QBhIYChRWRVJJRklFRF9MT1dfVU5LTk9XThAHEhEKDVZFUklGSUVEX0hJR0gQCBIcChhWRVJJRklFRF9JTklUSUFMX1VOS05PV04QCRIYChRWRVJJRklFRF9JTklUSUFMX0xPVxAKEhkKFVZFUklGSUVEX0lOSVRJQUxfSElHSBALEiMKH1ZFUklGSUVEX1RSQU5TSVRJT05fQU5ZX1RPX05PTkUQDBIjCh9WRVJJRklFRF9UUkFOU0lUSU9OX0FOWV9UT19ISUdIEA0SIwofVkVSSUZJRURfVFJBTlNJVElPTl9ISUdIX1RPX0xPVxAOEicKI1ZFUklGSUVEX1RSQU5TSVRJT05fSElHSF9UT19VTktOT1dOEA8SJgoiVkVSSUZJRURfVFJBTlNJVElPTl9VTktOT1dOX1RPX0xPVxAQEiYKIlZFUklGSUVEX1RSQU5TSVRJT05fTE9XX1RPX1VOS05PV04QERIjCh9WRVJJRklFRF9UUkFOU0lUSU9OX05PTkVfVE9fTE9XEBISJwojVkVSSUZJRURfVFJBTlNJVElPTl9OT05FX1RPX1VOS05PV04QExIQCgxHUk9VUF9DUkVBVEUQFBIYChRHUk9VUF9DSEFOR0VfU1VCSkVDVBAVEhUKEUdST1VQX0NIQU5HRV9JQ09OEBYSHAoYR1JPVVBfQ0hBTkdFX0lOVklURV9MSU5LEBcSHAoYR1JPVVBfQ0hBTkdFX0RFU0NSSVBUSU9OEBgSGQoVR1JPVVBfQ0hBTkdFX1JFU1RSSUNUEBkSGQoVR1JPVVBfQ0hBTkdFX0FOTk9VTkNFEBoSGQoVR1JPVVBfUEFSVElDSVBBTlRfQUREEBsSHAoYR1JPVVBfUEFSVElDSVBBTlRfUkVNT1ZFEBwSHQoZR1JPVVBfUEFSVElDSVBBTlRfUFJPTU9URRAdEhwKGEdST1VQX1BBUlRJQ0lQQU5UX0RFTU9URRAeEhwKGEdST1VQX1BBUlRJQ0lQQU5UX0lOVklURRAfEhsKF0dST1VQX1BBUlRJQ0lQQU5UX0xFQVZFECASIwofR1JPVVBfUEFSVElDSVBBTlRfQ0hBTkdFX05VTUJFUhAhEhQKEEJST0FEQ0FTVF9DUkVBVEUQIhIRCg1CUk9BRENBU1RfQUREECMSFAoQQlJPQURDQVNUX1JFTU9WRRAkEhgKFEdFTkVSSUNfTk9USUZJQ0FUSU9OECUSGAoURTJFX0lERU5USVRZX0NIQU5HRUQQJhIRCg1FMkVfRU5DUllQVEVEECcSFQoRQ0FMTF9NSVNTRURfVk9JQ0UQKBIVChFDQUxMX01JU1NFRF9WSURFTxApEhwKGElORElWSURVQUxfQ0hBTkdFX05VTUJFUhAqEhAKDEdST1VQX0RFTEVURRArEiYKIkdST1VQX0FOTk9VTkNFX01PREVfTUVTU0FHRV9CT1VOQ0UQLBIbChdDQUxMX01JU1NFRF9HUk9VUF9WT0lDRRAtEhsKF0NBTExfTUlTU0VEX0dST1VQX1ZJREVPEC4SFgoSUEFZTUVOVF9DSVBIRVJURVhUEC8SFwoTUEFZTUVOVF9GVVRVUkVQUk9PRhAwEiwKKFBBWU1FTlRfVFJBTlNBQ1RJT05fU1RBVFVTX1VQREFURV9GQUlMRUQQMRIuCipQQVlNRU5UX1RSQU5TQUNUSU9OX1NUQVRVU19VUERBVEVfUkVGVU5ERUQQMhIzCi9QQVlNRU5UX1RSQU5TQUNUSU9OX1NUQVRVU19VUERBVEVfUkVGVU5EX0ZBSUxFRBAzEjUKMVBBWU1FTlRfVFJBTlNBQ1RJT05fU1RBVFVTX1JFQ0VJVkVSX1BFTkRJTkdfU0VUVVAQNBI8CjhQQVlNRU5UX1RSQU5TQUNUSU9OX1NUQVRVU19SRUNFSVZFUl9TVUNDRVNTX0FGVEVSX0hJQ0NVUBA1EikKJVBBWU1FTlRfQUNUSU9OX0FDQ09VTlRfU0VUVVBfUkVNSU5ERVIQNhIoCiRQQVlNRU5UX0FDVElPTl9TRU5EX1BBWU1FTlRfUkVNSU5ERVIQNxIqCiZQQVlNRU5UX0FDVElPTl9TRU5EX1BBWU1FTlRfSU5WSVRBVElPThA4EiMKH1BBWU1FTlRfQUNUSU9OX1JFUVVFU1RfREVDTElORUQQORIiCh5QQVlNRU5UX0FDVElPTl9SRVFVRVNUX0VYUElSRUQQOhIkCiBQQVlNRU5UX0FDVElPTl9SRVFVRVNUX0NBTkNFTExFRBA7EikKJUJJWl9WRVJJRklFRF9UUkFOU0lUSU9OX1RPUF9UT19CT1RUT00QPBIpCiVCSVpfVkVSSUZJRURfVFJBTlNJVElPTl9CT1RUT01fVE9fVE9QED0SEQoNQklaX0lOVFJPX1RPUBA+EhQKEEJJWl9JTlRST19CT1RUT00QPxITCg9CSVpfTkFNRV9DSEFOR0UQQBIcChhCSVpfTU9WRV9UT19DT05TVU1FUl9BUFAQQRIeChpCSVpfVFdPX1RJRVJfTUlHUkFUSU9OX1RPUBBCEiEKHUJJWl9UV09fVElFUl9NSUdSQVRJT05fQk9UVE9NEEMSDQoJT1ZFUlNJWkVEEEQSKAokR1JPVVBfQ0hBTkdFX05PX0ZSRVFVRU5UTFlfRk9SV0FSREVEEEUSHAoYR1JPVVBfVjRfQUREX0lOVklURV9TRU5UEEYSJgoiR1JPVVBfUEFSVElDSVBBTlRfQUREX1JFUVVFU1RfSk9JThBHEhwKGENIQU5HRV9FUEhFTUVSQUxfU0VUVElORxBIEhYKEkUyRV9ERVZJQ0VfQ0hBTkdFRBBJEg8KC1ZJRVdFRF9PTkNFEEoSFQoRRTJFX0VOQ1JZUFRFRF9OT1cQSxIiCh5CTFVFX01TR19CU1BfRkJfVE9fQlNQX1BSRU1JU0UQTBIeChpCTFVFX01TR19CU1BfRkJfVE9fU0VMRl9GQhBNEiMKH0JMVUVfTVNHX0JTUF9GQl9UT19TRUxGX1BSRU1JU0UQThIeChpCTFVFX01TR19CU1BfRkJfVU5WRVJJRklFRBBPEjcKM0JMVUVfTVNHX0JTUF9GQl9VTlZFUklGSUVEX1RPX1NFTEZfUFJFTUlTRV9WRVJJRklFRBBQEhwKGEJMVUVfTVNHX0JTUF9GQl9WRVJJRklFRBBREjcKM0JMVUVfTVNHX0JTUF9GQl9WRVJJRklFRF9UT19TRUxGX1BSRU1JU0VfVU5WRVJJRklFRBBSEigKJEJMVUVfTVNHX0JTUF9QUkVNSVNFX1RPX1NFTEZfUFJFTUlTRRBTEiMKH0JMVUVfTVNHX0JTUF9QUkVNSVNFX1VOVkVSSUZJRUQQVBI8CjhCTFVFX01TR19CU1BfUFJFTUlTRV9VTlZFUklGSUVEX1RPX1NFTEZfUFJFTUlTRV9WRVJJRklFRBBVEiEKHUJMVUVfTVNHX0JTUF9QUkVNSVNFX1ZFUklGSUVEEFYSPAo4QkxVRV9NU0dfQlNQX1BSRU1JU0VfVkVSSUZJRURfVE9fU0VMRl9QUkVNSVNFX1VOVkVSSUZJRUQQVxIqCiZCTFVFX01TR19DT05TVU1FUl9UT19CU1BfRkJfVU5WRVJJRklFRBBYEi8KK0JMVUVfTVNHX0NPTlNVTUVSX1RPX0JTUF9QUkVNSVNFX1VOVkVSSUZJRUQQWRIrCidCTFVFX01TR19DT05TVU1FUl9UT19TRUxGX0ZCX1VOVkVSSUZJRUQQWhIwCixCTFVFX01TR19DT05TVU1FUl9UT19TRUxGX1BSRU1JU0VfVU5WRVJJRklFRBBbEiMKH0JMVUVfTVNHX1NFTEZfRkJfVE9fQlNQX1BSRU1JU0UQXBIkCiBCTFVFX01TR19TRUxGX0ZCX1RPX1NFTEZfUFJFTUlTRRBdEh8KG0JMVUVfTVNHX1NFTEZfRkJfVU5WRVJJRklFRBBeEjgKNEJMVUVfTVNHX1NFTEZfRkJfVU5WRVJJRklFRF9UT19TRUxGX1BSRU1JU0VfVkVSSUZJRUQQXxIdChlCTFVFX01TR19TRUxGX0ZCX1ZFUklGSUVEEGASOAo0QkxVRV9NU0dfU0VMRl9GQl9WRVJJRklFRF9UT19TRUxGX1BSRU1JU0VfVU5WRVJJRklFRBBhEigKJEJMVUVfTVNHX1NFTEZfUFJFTUlTRV9UT19CU1BfUFJFTUlTRRBiEiQKIEJMVUVfTVNHX1NFTEZfUFJFTUlTRV9VTlZFUklGSUVEEGMSIgoeQkxVRV9NU0dfU0VMRl9QUkVNSVNFX1ZFUklGSUVEEGQSFgoSQkxVRV9NU0dfVE9fQlNQX0ZCEGUSGAoUQkxVRV9NU0dfVE9fQ09OU1VNRVIQZhIXChNCTFVFX01TR19UT19TRUxGX0ZCEGcSKgomQkxVRV9NU0dfVU5WRVJJRklFRF9UT19CU1BfRkJfVkVSSUZJRUQQaBIvCitCTFVFX01TR19VTlZFUklGSUVEX1RPX0JTUF9QUkVNSVNFX1ZFUklGSUVEEGkSKwonQkxVRV9NU0dfVU5WRVJJRklFRF9UT19TRUxGX0ZCX1ZFUklGSUVEEGoSIwofQkxVRV9NU0dfVU5WRVJJRklFRF9UT19WRVJJRklFRBBrEioKJkJMVUVfTVNHX1ZFUklGSUVEX1RPX0JTUF9GQl9VTlZFUklGSUVEEGwSLworQkxVRV9NU0dfVkVSSUZJRURfVE9fQlNQX1BSRU1JU0VfVU5WRVJJRklFRBBtEisKJ0JMVUVfTVNHX1ZFUklGSUVEX1RPX1NFTEZfRkJfVU5WRVJJRklFRBBuEiMKH0JMVUVfTVNHX1ZFUklGSUVEX1RPX1VOVkVSSUZJRUQQbxI2CjJCTFVFX01TR19CU1BfRkJfVU5WRVJJRklFRF9UT19CU1BfUFJFTUlTRV9WRVJJRklFRBBwEjIKLkJMVUVfTVNHX0JTUF9GQl9VTlZFUklGSUVEX1RPX1NFTEZfRkJfVkVSSUZJRUQQcRI2CjJCTFVFX01TR19CU1BfRkJfVkVSSUZJRURfVE9fQlNQX1BSRU1JU0VfVU5WRVJJRklFRBByEjIKLkJMVUVfTVNHX0JTUF9GQl9WRVJJRklFRF9UT19TRUxGX0ZCX1VOVkVSSUZJRUQQcxI3CjNCTFVFX01TR19TRUxGX0ZCX1VOVkVSSUZJRURfVE9fQlNQX1BSRU1JU0VfVkVSSUZJRUQQdBI3CjNCTFVFX01TR19TRUxGX0ZCX1ZFUklGSUVEX1RPX0JTUF9QUkVNSVNFX1VOVkVSSUZJRUQQdRIcChhFMkVfSURFTlRJVFlfVU5BVkFJTEFCTEUQdhISCg5HUk9VUF9DUkVBVElORxB3EhcKE0dST1VQX0NSRUFURV9GQUlMRUQQeBIRCg1HUk9VUF9CT1VOQ0VEEHkSEQoNQkxPQ0tfQ09OVEFDVBB6EiEKHUVQSEVNRVJBTF9TRVRUSU5HX05PVF9BUFBMSUVEEHsSDwoLU1lOQ19GQUlMRUQQfBILCgdTWU5DSU5HEH0SHAoYQklaX1BSSVZBQ1lfTU9ERV9JTklUX0ZCEH4SHQoZQklaX1BSSVZBQ1lfTU9ERV9JTklUX0JTUBB/EhsKFkJJWl9QUklWQUNZX01PREVfVE9fRkIQgAESHAoXQklaX1BSSVZBQ1lfTU9ERV9UT19CU1AQgQESFgoRRElTQVBQRUFSSU5HX01PREUQggESHAoXRTJFX0RFVklDRV9GRVRDSF9GQUlMRUQQgwESEQoMQURNSU5fUkVWT0tFEIQBEiQKH0dST1VQX0lOVklURV9MSU5LX0dST1dUSF9MT0NLRUQQhQESIAobQ09NTVVOSVRZX0xJTktfUEFSRU5UX0dST1VQEIYBEiEKHENPTU1VTklUWV9MSU5LX1NJQkxJTkdfR1JPVVAQhwESHQoYQ09NTVVOSVRZX0xJTktfU1VCX0dST1VQEIgBEiIKHUNPTU1VTklUWV9VTkxJTktfUEFSRU5UX0dST1VQEIkBEiMKHkNPTU1VTklUWV9VTkxJTktfU0lCTElOR19HUk9VUBCKARIfChpDT01NVU5JVFlfVU5MSU5LX1NVQl9HUk9VUBCLARIdChhHUk9VUF9QQVJUSUNJUEFOVF9BQ0NFUFQQjAESKAojR1JPVVBfUEFSVElDSVBBTlRfTElOS0VEX0dST1VQX0pPSU4QjQESFQoQQ09NTVVOSVRZX0NSRUFURRCOARIbChZFUEhFTUVSQUxfS0VFUF9JTl9DSEFUEI8BEisKJkdST1VQX01FTUJFUlNISVBfSk9JTl9BUFBST1ZBTF9SRVFVRVNUEJABEigKI0dST1VQX01FTUJFUlNISVBfSk9JTl9BUFBST1ZBTF9NT0RFEJEBEiIKHUlOVEVHUklUWV9VTkxJTktfUEFSRU5UX0dST1VQEJIBEiIKHUNPTU1VTklUWV9QQVJUSUNJUEFOVF9QUk9NT1RFEJMBEiEKHENPTU1VTklUWV9QQVJUSUNJUEFOVF9ERU1PVEUQlAESIwoeQ09NTVVOSVRZX1BBUkVOVF9HUk9VUF9ERUxFVEVEEJUBEjQKL0NPTU1VTklUWV9MSU5LX1BBUkVOVF9HUk9VUF9NRU1CRVJTSElQX0FQUFJPVkFMEJYBEjQKL0dST1VQX1BBUlRJQ0lQQU5UX0pPSU5FRF9HUk9VUF9BTkRfUEFSRU5UX0dST1VQEJcBEhoKFU1BU0tFRF9USFJFQURfQ1JFQVRFRBCYARIbChZNQVNLRURfVEhSRUFEX1VOTUFTS0VEEJkBEhgKE0JJWl9DSEFUX0FTU0lHTk1FTlQQmgESDQoIQ0hBVF9QU0EQmwESHwoaQ0hBVF9QT0xMX0NSRUFUSU9OX01FU1NBR0UQnAESHgoZQ0FHX01BU0tFRF9USFJFQURfQ1JFQVRFRBCdARIrCiZDT01NVU5JVFlfUEFSRU5UX0dST1VQX1NVQkpFQ1RfQ0hBTkdFRBCeARIYChNDQUdfSU5WSVRFX0FVVE9fQUREEJ8BEiEKHEJJWl9DSEFUX0FTU0lHTk1FTlRfVU5BU1NJR04QoAESGwoWQ0FHX0lOVklURV9BVVRPX0pPSU5FRBChARIhChxTQ0hFRFVMRURfQ0FMTF9TVEFSVF9NRVNTQUdFEKIBEhoKFUNPTU1VTklUWV9JTlZJVEVfUklDSBCjARIjCh5DT01NVU5JVFlfSU5WSVRFX0FVVE9fQUREX1JJQ0gQpAESGgoVU1VCX0dST1VQX0lOVklURV9SSUNIEKUBEiMKHlNVQl9HUk9VUF9QQVJUSUNJUEFOVF9BRERfUklDSBCmARIlCiBDT01NVU5JVFlfTElOS19QQVJFTlRfR1JPVVBfUklDSBCnARIjCh5DT01NVU5JVFlfUEFSVElDSVBBTlRfQUREX1JJQ0gQqAESIgodU0lMRU5DRURfVU5LTk9XTl9DQUxMRVJfQVVESU8QqQESIgodU0lMRU5DRURfVU5LTk9XTl9DQUxMRVJfVklERU8QqgESGgoVR1JPVVBfTUVNQkVSX0FERF9NT0RFEKsBEjkKNEdST1VQX01FTUJFUlNISVBfSk9JTl9BUFBST1ZBTF9SRVFVRVNUX05PTl9BRE1JTl9BREQQrAESIQocQ09NTVVOSVRZX0NIQU5HRV9ERVNDUklQVElPThCtARISCg1TRU5ERVJfSU5WSVRFEK4BEhQKD1JFQ0VJVkVSX0lOVklURRCvARIoCiNDT01NVU5JVFlfQUxMT1dfTUVNQkVSX0FEREVEX0dST1VQUxCwARIbChZQSU5ORURfTUVTU0FHRV9JTl9DSEFUELEBEiEKHFBBWU1FTlRfSU5WSVRFX1NFVFVQX0lOVklURVIQsgESLgopUEFZTUVOVF9JTlZJVEVfU0VUVVBfSU5WSVRFRV9SRUNFSVZFX09OTFkQswESMgotUEFZTUVOVF9JTlZJVEVfU0VUVVBfSU5WSVRFRV9TRU5EX0FORF9SRUNFSVZFELQBEhwKF0xJTktFRF9HUk9VUF9DQUxMX1NUQVJUELUBEiMKHlJFUE9SVF9UT19BRE1JTl9FTkFCTEVEX1NUQVRVUxC2ARIaChVFTVBUWV9TVUJHUk9VUF9DUkVBVEUQtwESGgoVU0NIRURVTEVEX0NBTExfQ0FOQ0VMELgBEisKJlNVQkdST1VQX0FETUlOX1RSSUdHRVJFRF9BVVRPX0FERF9SSUNIELkBEigKI0dST1VQX0NIQU5HRV9SRUNFTlRfSElTVE9SWV9TSEFSSU5HELoBEiQKH1BBSURfTUVTU0FHRV9TRVJWRVJfQ0FNUEFJR05fSUQQuwESGAoTR0VORVJBTF9DSEFUX0NSRUFURRC8ARIVChBHRU5FUkFMX0NIQVRfQUREEL0BEiMKHkdFTkVSQUxfQ0hBVF9BVVRPX0FERF9ESVNBQkxFRBC+ARIgChtTVUdHRVNURURfU1VCR1JPVVBfQU5OT1VOQ0UQvwESIQocQklaX0JPVF8xUF9NRVNTQUdJTkdfRU5BQkxFRBDAARIUCg9DSEFOR0VfVVNFUk5BTUUQwQESHwoaQklaX0NPRVhfUFJJVkFDWV9JTklUX1NFTEYQwgESJQogQklaX0NPRVhfUFJJVkFDWV9UUkFOU0lUSU9OX1NFTEYQwwESGQoUU1VQUE9SVF9BSV9FRFVDQVRJT04QxAESIQocQklaX0JPVF8zUF9NRVNTQUdJTkdfRU5BQkxFRBDFARIbChZSRU1JTkRFUl9TRVRVUF9NRVNTQUdFEMYBEhoKFVJFTUlOREVSX1NFTlRfTUVTU0FHRRDHARIcChdSRU1JTkRFUl9DQU5DRUxfTUVTU0FHRRDIARIaChVCSVpfQ09FWF9QUklWQUNZX0lOSVQQyQESIAobQklaX0NPRVhfUFJJVkFDWV9UUkFOU0lUSU9OEMoBEhYKEUdST1VQX0RFQUNUSVZBVEVEEMsBEicKIkNPTU1VTklUWV9ERUFDVElWQVRFX1NJQkxJTkdfR1JPVVAQzAESEgoNRVZFTlRfVVBEQVRFRBDNARITCg5FVkVOVF9DQU5DRUxFRBDOARIcChdDT01NVU5JVFlfT1dORVJfVVBEQVRFRBDPARIqCiVDT01NVU5JVFlfU1VCX0dST1VQX1ZJU0lCSUxJVFlfSElEREVOENABEiQKH0NBUElfR1JPVVBfTkUyRUVfU1lTVEVNX01FU1NBR0UQ0QESEwoOU1RBVFVTX01FTlRJT04Q0gESIQocVVNFUl9DT05UUk9MU19TWVNURU1fTUVTU0FHRRDTARIbChZTVVBQT1JUX1NZU1RFTV9NRVNTQUdFENQBEg8KCkNIQU5HRV9MSUQQ1QESMQosQklaX0NVU1RPTUVSXzNQRF9EQVRBX1NIQVJJTkdfT1BUX0lOX01FU1NBR0UQ1gESMgotQklaX0NVU1RPTUVSXzNQRF9EQVRBX1NIQVJJTkdfT1BUX09VVF9NRVNTQUdFENcBEhkKFENIQU5HRV9MSU1JVF9TSEFSSU5HENgBEhsKFkdST1VQX01FTUJFUl9MSU5LX01PREUQ2QESMgotQklaX0FVVE9NQVRJQ0FMTFlfTEFCRUxFRF9DSEFUX1NZU1RFTV9NRVNTQUdFENoBEjAKK1BIT05FX05VTUJFUl9ISURJTkdfQ0hBVF9ERVBSRUNBVEVEX01FU1NBR0UQ2wESGAoTUVVBUkFOVElORURfTUVTU0FHRRDcARIqCiVHUk9VUF9NRU1CRVJfU0hBUkVfR1JPVVBfSElTVE9SWV9NT0RFEN0BQgoKCF9tZXNzYWdlQhMKEV9tZXNzYWdlVGltZXN0YW1wQgkKB19zdGF0dXNCDgoMX3BhcnRpY2lwYW50QhYKFF9tZXNzYWdlQzJTVGltZXN0YW1wQgkKB19pZ25vcmVCCgoIX3N0YXJyZWRCDAoKX2Jyb2FkY2FzdEILCglfcHVzaE5hbWVCGAoWX21lZGlhQ2lwaGVydGV4dFNoYTI1NkIMCgpfbXVsdGljYXN0QgoKCF91cmxUZXh0QgwKCl91cmxOdW1iZXJCEgoQX21lc3NhZ2VTdHViVHlwZUINCgtfY2xlYXJNZWRpYUILCglfZHVyYXRpb25CDgoMX3BheW1lbnRJbmZvQhQKEl9maW5hbExpdmVMb2NhdGlvbkIUChJfcXVvdGVkUGF5bWVudEluZm9CGgoYX2VwaGVtZXJhbFN0YXJ0VGltZXN0YW1wQhQKEl9lcGhlbWVyYWxEdXJhdGlvbkITChFfZXBoZW1lcmFsT2ZmVG9PbkIVChNfZXBoZW1lcmFsT3V0T2ZTeW5jQhMKEV9iaXpQcml2YWN5U3RhdHVzQhIKEF92ZXJpZmllZEJpek5hbWVCDAoKX21lZGlhRGF0YUIOCgxfcGhvdG9DaGFuZ2VCFAoSX3F1b3RlZFN0aWNrZXJEYXRhQhIKEF9mdXR1cmVwcm9vZkRhdGFCDAoKX3N0YXR1c1BzYUIZChdfcG9sbEFkZGl0aW9uYWxNZXRhZGF0YUIKCghfYWdlbnRJZEIWChRfc3RhdHVzQWxyZWFkeVZpZXdlZEIQCg5fbWVzc2FnZVNlY3JldEINCgtfa2VlcEluQ2hhdEIiCiBfb3JpZ2luYWxTZWxmQXV0aG9yVXNlckppZFN0cmluZ0IZChdfcmV2b2tlTWVzc2FnZVRpbWVzdGFtcEIMCgpfcGluSW5DaGF0QhUKE19wcmVtaXVtTWVzc2FnZUluZm9CFAoSX2lzMVBCaXpCb3RNZXNzYWdlQhgKFl9pc0dyb3VwSGlzdG9yeU1lc3NhZ2VCFwoVX2JvdE1lc3NhZ2VJbnZva2VySmlkQhIKEF9jb21tZW50TWV0YWRhdGFCFQoTX3JlcG9ydGluZ1Rva2VuSW5mb0IVChNfbmV3c2xldHRlclNlcnZlcklkQhoKGF9ldmVudEFkZGl0aW9uYWxNZXRhZGF0YUIWChRfaXNNZW50aW9uZWRJblN0YXR1c0ISChBfdGFyZ2V0TWVzc2FnZUlkQhsKGV9zdGF0dXNNZW50aW9uTWVzc2FnZUluZm9CFQoTX2lzU3VwcG9ydEFpTWVzc2FnZUIOCgxfYm90VGFyZ2V0SWRCJAoiX2dyb3VwSGlzdG9yeUluZGl2aWR1YWxNZXNzYWdlSW5mb0IZChdfZ3JvdXBIaXN0b3J5QnVuZGxlSW5mb0InCiVfaW50ZXJhY3RpdmVNZXNzYWdlQWRkaXRpb25hbE1ldGFkYXRhQhUKE19xdWFyYW50aW5lZE1lc3NhZ2U=');
@$core.Deprecated('Use webNotificationsInfoDescriptor instead')
const WebNotificationsInfo$json = const {
  '1': 'WebNotificationsInfo',
  '2': const [
    const {'1': 'timestamp', '3': 2, '4': 1, '5': 4, '9': 0, '10': 'timestamp', '17': true},
    const {'1': 'unreadChats', '3': 3, '4': 1, '5': 13, '9': 1, '10': 'unreadChats', '17': true},
    const {'1': 'notifyMessageCount', '3': 4, '4': 1, '5': 13, '9': 2, '10': 'notifyMessageCount', '17': true},
    const {'1': 'notifyMessages', '3': 5, '4': 3, '5': 11, '6': '.proto.WebMessageInfo', '10': 'notifyMessages'},
  ],
  '8': const [
    const {'1': '_timestamp'},
    const {'1': '_unreadChats'},
    const {'1': '_notifyMessageCount'},
  ],
};

/// Descriptor for `WebNotificationsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webNotificationsInfoDescriptor = $convert.base64Decode('ChRXZWJOb3RpZmljYXRpb25zSW5mbxIhCgl0aW1lc3RhbXAYAiABKARIAFIJdGltZXN0YW1wiAEBEiUKC3VucmVhZENoYXRzGAMgASgNSAFSC3VucmVhZENoYXRziAEBEjMKEm5vdGlmeU1lc3NhZ2VDb3VudBgEIAEoDUgCUhJub3RpZnlNZXNzYWdlQ291bnSIAQESPQoObm90aWZ5TWVzc2FnZXMYBSADKAsyFS5wcm90by5XZWJNZXNzYWdlSW5mb1IObm90aWZ5TWVzc2FnZXNCDAoKX3RpbWVzdGFtcEIOCgxfdW5yZWFkQ2hhdHNCFQoTX25vdGlmeU1lc3NhZ2VDb3VudA==');
