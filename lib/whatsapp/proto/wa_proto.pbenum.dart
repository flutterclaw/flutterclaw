///
//  Generated code. Do not modify.
//  source: wa_proto.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ADVEncryptionType extends $pb.ProtobufEnum {
  static const ADVEncryptionType E2EE = ADVEncryptionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2EE');
  static const ADVEncryptionType HOSTED = ADVEncryptionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HOSTED');

  static const $core.List<ADVEncryptionType> values = <ADVEncryptionType> [
    E2EE,
    HOSTED,
  ];

  static final $core.Map<$core.int, ADVEncryptionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ADVEncryptionType? valueOf($core.int value) => _byValue[value];

  const ADVEncryptionType._($core.int v, $core.String n) : super(v, n);
}

class AIRichResponseMessageType extends $pb.ProtobufEnum {
  static const AIRichResponseMessageType AI_RICH_RESPONSE_TYPE_UNKNOWN = AIRichResponseMessageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_TYPE_UNKNOWN');
  static const AIRichResponseMessageType AI_RICH_RESPONSE_TYPE_STANDARD = AIRichResponseMessageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_TYPE_STANDARD');

  static const $core.List<AIRichResponseMessageType> values = <AIRichResponseMessageType> [
    AI_RICH_RESPONSE_TYPE_UNKNOWN,
    AI_RICH_RESPONSE_TYPE_STANDARD,
  ];

  static final $core.Map<$core.int, AIRichResponseMessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIRichResponseMessageType? valueOf($core.int value) => _byValue[value];

  const AIRichResponseMessageType._($core.int v, $core.String n) : super(v, n);
}

class AIRichResponseSubMessageType extends $pb.ProtobufEnum {
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_UNKNOWN = AIRichResponseSubMessageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_UNKNOWN');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_GRID_IMAGE = AIRichResponseSubMessageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_GRID_IMAGE');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_TEXT = AIRichResponseSubMessageType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_TEXT');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_INLINE_IMAGE = AIRichResponseSubMessageType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_INLINE_IMAGE');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_TABLE = AIRichResponseSubMessageType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_TABLE');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_CODE = AIRichResponseSubMessageType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CODE');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_DYNAMIC = AIRichResponseSubMessageType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_DYNAMIC');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_MAP = AIRichResponseSubMessageType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_MAP');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_LATEX = AIRichResponseSubMessageType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_LATEX');
  static const AIRichResponseSubMessageType AI_RICH_RESPONSE_CONTENT_ITEMS = AIRichResponseSubMessageType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CONTENT_ITEMS');

  static const $core.List<AIRichResponseSubMessageType> values = <AIRichResponseSubMessageType> [
    AI_RICH_RESPONSE_UNKNOWN,
    AI_RICH_RESPONSE_GRID_IMAGE,
    AI_RICH_RESPONSE_TEXT,
    AI_RICH_RESPONSE_INLINE_IMAGE,
    AI_RICH_RESPONSE_TABLE,
    AI_RICH_RESPONSE_CODE,
    AI_RICH_RESPONSE_DYNAMIC,
    AI_RICH_RESPONSE_MAP,
    AI_RICH_RESPONSE_LATEX,
    AI_RICH_RESPONSE_CONTENT_ITEMS,
  ];

  static final $core.Map<$core.int, AIRichResponseSubMessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIRichResponseSubMessageType? valueOf($core.int value) => _byValue[value];

  const AIRichResponseSubMessageType._($core.int v, $core.String n) : super(v, n);
}

class BotMetricsEntryPoint extends $pb.ProtobufEnum {
  static const BotMetricsEntryPoint UNDEFINED_ENTRY_POINT = BotMetricsEntryPoint._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNDEFINED_ENTRY_POINT');
  static const BotMetricsEntryPoint FAVICON = BotMetricsEntryPoint._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAVICON');
  static const BotMetricsEntryPoint CHATLIST = BotMetricsEntryPoint._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHATLIST');
  static const BotMetricsEntryPoint AISEARCH_NULL_STATE_PAPER_PLANE = BotMetricsEntryPoint._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AISEARCH_NULL_STATE_PAPER_PLANE');
  static const BotMetricsEntryPoint AISEARCH_NULL_STATE_SUGGESTION = BotMetricsEntryPoint._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AISEARCH_NULL_STATE_SUGGESTION');
  static const BotMetricsEntryPoint AISEARCH_TYPE_AHEAD_SUGGESTION = BotMetricsEntryPoint._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AISEARCH_TYPE_AHEAD_SUGGESTION');
  static const BotMetricsEntryPoint AISEARCH_TYPE_AHEAD_PAPER_PLANE = BotMetricsEntryPoint._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AISEARCH_TYPE_AHEAD_PAPER_PLANE');
  static const BotMetricsEntryPoint AISEARCH_TYPE_AHEAD_RESULT_CHATLIST = BotMetricsEntryPoint._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AISEARCH_TYPE_AHEAD_RESULT_CHATLIST');
  static const BotMetricsEntryPoint AISEARCH_TYPE_AHEAD_RESULT_MESSAGES = BotMetricsEntryPoint._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AISEARCH_TYPE_AHEAD_RESULT_MESSAGES');
  static const BotMetricsEntryPoint AIVOICE_SEARCH_BAR = BotMetricsEntryPoint._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AIVOICE_SEARCH_BAR');
  static const BotMetricsEntryPoint AIVOICE_FAVICON = BotMetricsEntryPoint._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AIVOICE_FAVICON');
  static const BotMetricsEntryPoint AISTUDIO = BotMetricsEntryPoint._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AISTUDIO');
  static const BotMetricsEntryPoint DEEPLINK = BotMetricsEntryPoint._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEEPLINK');
  static const BotMetricsEntryPoint NOTIFICATION = BotMetricsEntryPoint._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOTIFICATION');
  static const BotMetricsEntryPoint PROFILE_MESSAGE_BUTTON = BotMetricsEntryPoint._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROFILE_MESSAGE_BUTTON');
  static const BotMetricsEntryPoint FORWARD = BotMetricsEntryPoint._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FORWARD');
  static const BotMetricsEntryPoint APP_SHORTCUT = BotMetricsEntryPoint._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APP_SHORTCUT');
  static const BotMetricsEntryPoint FF_FAMILY = BotMetricsEntryPoint._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FF_FAMILY');
  static const BotMetricsEntryPoint AI_TAB = BotMetricsEntryPoint._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_TAB');
  static const BotMetricsEntryPoint AI_HOME = BotMetricsEntryPoint._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_HOME');
  static const BotMetricsEntryPoint AI_DEEPLINK_IMMERSIVE = BotMetricsEntryPoint._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_DEEPLINK_IMMERSIVE');
  static const BotMetricsEntryPoint AI_DEEPLINK = BotMetricsEntryPoint._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_DEEPLINK');
  static const BotMetricsEntryPoint META_AI_CHAT_SHORTCUT_AI_STUDIO = BotMetricsEntryPoint._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'META_AI_CHAT_SHORTCUT_AI_STUDIO');
  static const BotMetricsEntryPoint UGC_CHAT_SHORTCUT_AI_STUDIO = BotMetricsEntryPoint._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UGC_CHAT_SHORTCUT_AI_STUDIO');
  static const BotMetricsEntryPoint NEW_CHAT_AI_STUDIO = BotMetricsEntryPoint._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEW_CHAT_AI_STUDIO');
  static const BotMetricsEntryPoint AIVOICE_FAVICON_CALL_HISTORY = BotMetricsEntryPoint._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AIVOICE_FAVICON_CALL_HISTORY');
  static const BotMetricsEntryPoint ASK_META_AI_CONTEXT_MENU = BotMetricsEntryPoint._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASK_META_AI_CONTEXT_MENU');
  static const BotMetricsEntryPoint ASK_META_AI_CONTEXT_MENU_1ON1 = BotMetricsEntryPoint._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASK_META_AI_CONTEXT_MENU_1ON1');
  static const BotMetricsEntryPoint ASK_META_AI_CONTEXT_MENU_GROUP = BotMetricsEntryPoint._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASK_META_AI_CONTEXT_MENU_GROUP');
  static const BotMetricsEntryPoint INVOKE_META_AI_1ON1 = BotMetricsEntryPoint._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVOKE_META_AI_1ON1');
  static const BotMetricsEntryPoint INVOKE_META_AI_GROUP = BotMetricsEntryPoint._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVOKE_META_AI_GROUP');
  static const BotMetricsEntryPoint META_AI_FORWARD = BotMetricsEntryPoint._(31, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'META_AI_FORWARD');
  static const BotMetricsEntryPoint NEW_CHAT_AI_CONTACT = BotMetricsEntryPoint._(32, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEW_CHAT_AI_CONTACT');
  static const BotMetricsEntryPoint MESSAGE_QUICK_ACTION_1_ON_1_CHAT = BotMetricsEntryPoint._(33, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSAGE_QUICK_ACTION_1_ON_1_CHAT');
  static const BotMetricsEntryPoint MESSAGE_QUICK_ACTION_GROUP_CHAT = BotMetricsEntryPoint._(34, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSAGE_QUICK_ACTION_GROUP_CHAT');
  static const BotMetricsEntryPoint ATTACHMENT_TRAY_1_ON_1_CHAT = BotMetricsEntryPoint._(35, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ATTACHMENT_TRAY_1_ON_1_CHAT');
  static const BotMetricsEntryPoint ATTACHMENT_TRAY_GROUP_CHAT = BotMetricsEntryPoint._(36, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ATTACHMENT_TRAY_GROUP_CHAT');
  static const BotMetricsEntryPoint ASK_META_AI_MEDIA_VIEWER_1ON1 = BotMetricsEntryPoint._(37, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASK_META_AI_MEDIA_VIEWER_1ON1');
  static const BotMetricsEntryPoint ASK_META_AI_MEDIA_VIEWER_GROUP = BotMetricsEntryPoint._(38, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASK_META_AI_MEDIA_VIEWER_GROUP');

  static const $core.List<BotMetricsEntryPoint> values = <BotMetricsEntryPoint> [
    UNDEFINED_ENTRY_POINT,
    FAVICON,
    CHATLIST,
    AISEARCH_NULL_STATE_PAPER_PLANE,
    AISEARCH_NULL_STATE_SUGGESTION,
    AISEARCH_TYPE_AHEAD_SUGGESTION,
    AISEARCH_TYPE_AHEAD_PAPER_PLANE,
    AISEARCH_TYPE_AHEAD_RESULT_CHATLIST,
    AISEARCH_TYPE_AHEAD_RESULT_MESSAGES,
    AIVOICE_SEARCH_BAR,
    AIVOICE_FAVICON,
    AISTUDIO,
    DEEPLINK,
    NOTIFICATION,
    PROFILE_MESSAGE_BUTTON,
    FORWARD,
    APP_SHORTCUT,
    FF_FAMILY,
    AI_TAB,
    AI_HOME,
    AI_DEEPLINK_IMMERSIVE,
    AI_DEEPLINK,
    META_AI_CHAT_SHORTCUT_AI_STUDIO,
    UGC_CHAT_SHORTCUT_AI_STUDIO,
    NEW_CHAT_AI_STUDIO,
    AIVOICE_FAVICON_CALL_HISTORY,
    ASK_META_AI_CONTEXT_MENU,
    ASK_META_AI_CONTEXT_MENU_1ON1,
    ASK_META_AI_CONTEXT_MENU_GROUP,
    INVOKE_META_AI_1ON1,
    INVOKE_META_AI_GROUP,
    META_AI_FORWARD,
    NEW_CHAT_AI_CONTACT,
    MESSAGE_QUICK_ACTION_1_ON_1_CHAT,
    MESSAGE_QUICK_ACTION_GROUP_CHAT,
    ATTACHMENT_TRAY_1_ON_1_CHAT,
    ATTACHMENT_TRAY_GROUP_CHAT,
    ASK_META_AI_MEDIA_VIEWER_1ON1,
    ASK_META_AI_MEDIA_VIEWER_GROUP,
  ];

  static final $core.Map<$core.int, BotMetricsEntryPoint> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotMetricsEntryPoint? valueOf($core.int value) => _byValue[value];

  const BotMetricsEntryPoint._($core.int v, $core.String n) : super(v, n);
}

class BotMetricsThreadEntryPoint extends $pb.ProtobufEnum {
  static const BotMetricsThreadEntryPoint UNKNOWN_BOTMETRICSTHREADENTRYPOINT_ZERO = BotMetricsThreadEntryPoint._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_BOTMETRICSTHREADENTRYPOINT_ZERO');
  static const BotMetricsThreadEntryPoint AI_TAB_THREAD = BotMetricsThreadEntryPoint._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_TAB_THREAD');
  static const BotMetricsThreadEntryPoint AI_HOME_THREAD = BotMetricsThreadEntryPoint._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_HOME_THREAD');
  static const BotMetricsThreadEntryPoint AI_DEEPLINK_IMMERSIVE_THREAD = BotMetricsThreadEntryPoint._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_DEEPLINK_IMMERSIVE_THREAD');
  static const BotMetricsThreadEntryPoint AI_DEEPLINK_THREAD = BotMetricsThreadEntryPoint._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_DEEPLINK_THREAD');
  static const BotMetricsThreadEntryPoint ASK_META_AI_CONTEXT_MENU_THREAD = BotMetricsThreadEntryPoint._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ASK_META_AI_CONTEXT_MENU_THREAD');

  static const $core.List<BotMetricsThreadEntryPoint> values = <BotMetricsThreadEntryPoint> [
    UNKNOWN_BOTMETRICSTHREADENTRYPOINT_ZERO,
    AI_TAB_THREAD,
    AI_HOME_THREAD,
    AI_DEEPLINK_IMMERSIVE_THREAD,
    AI_DEEPLINK_THREAD,
    ASK_META_AI_CONTEXT_MENU_THREAD,
  ];

  static final $core.Map<$core.int, BotMetricsThreadEntryPoint> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotMetricsThreadEntryPoint? valueOf($core.int value) => _byValue[value];

  const BotMetricsThreadEntryPoint._($core.int v, $core.String n) : super(v, n);
}

class BotSessionSource extends $pb.ProtobufEnum {
  static const BotSessionSource NONE = BotSessionSource._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const BotSessionSource NULL_STATE = BotSessionSource._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NULL_STATE');
  static const BotSessionSource TYPEAHEAD = BotSessionSource._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TYPEAHEAD');
  static const BotSessionSource USER_INPUT = BotSessionSource._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_INPUT');
  static const BotSessionSource EMU_FLASH = BotSessionSource._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMU_FLASH');
  static const BotSessionSource EMU_FLASH_FOLLOWUP = BotSessionSource._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMU_FLASH_FOLLOWUP');
  static const BotSessionSource VOICE = BotSessionSource._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOICE');

  static const $core.List<BotSessionSource> values = <BotSessionSource> [
    NONE,
    NULL_STATE,
    TYPEAHEAD,
    USER_INPUT,
    EMU_FLASH,
    EMU_FLASH_FOLLOWUP,
    VOICE,
  ];

  static final $core.Map<$core.int, BotSessionSource> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotSessionSource? valueOf($core.int value) => _byValue[value];

  const BotSessionSource._($core.int v, $core.String n) : super(v, n);
}

class CollectionName extends $pb.ProtobufEnum {
  static const CollectionName COLLECTION_NAME_UNKNOWN = CollectionName._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECTION_NAME_UNKNOWN');
  static const CollectionName REGULAR = CollectionName._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGULAR');
  static const CollectionName REGULAR_LOW = CollectionName._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGULAR_LOW');
  static const CollectionName REGULAR_HIGH = CollectionName._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGULAR_HIGH');
  static const CollectionName CRITICAL_BLOCK = CollectionName._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CRITICAL_BLOCK');
  static const CollectionName CRITICAL_UNBLOCK_LOW = CollectionName._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CRITICAL_UNBLOCK_LOW');

  static const $core.List<CollectionName> values = <CollectionName> [
    COLLECTION_NAME_UNKNOWN,
    REGULAR,
    REGULAR_LOW,
    REGULAR_HIGH,
    CRITICAL_BLOCK,
    CRITICAL_UNBLOCK_LOW,
  ];

  static final $core.Map<$core.int, CollectionName> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CollectionName? valueOf($core.int value) => _byValue[value];

  const CollectionName._($core.int v, $core.String n) : super(v, n);
}

class KeepType extends $pb.ProtobufEnum {
  static const KeepType UNKNOWN = KeepType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const KeepType KEEP_FOR_ALL = KeepType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KEEP_FOR_ALL');
  static const KeepType UNDO_KEEP_FOR_ALL = KeepType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNDO_KEEP_FOR_ALL');

  static const $core.List<KeepType> values = <KeepType> [
    UNKNOWN,
    KEEP_FOR_ALL,
    UNDO_KEEP_FOR_ALL,
  ];

  static final $core.Map<$core.int, KeepType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static KeepType? valueOf($core.int value) => _byValue[value];

  const KeepType._($core.int v, $core.String n) : super(v, n);
}

class MediaVisibility extends $pb.ProtobufEnum {
  static const MediaVisibility DEFAULT = MediaVisibility._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');
  static const MediaVisibility OFF = MediaVisibility._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OFF');
  static const MediaVisibility ON = MediaVisibility._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ON');

  static const $core.List<MediaVisibility> values = <MediaVisibility> [
    DEFAULT,
    OFF,
    ON,
  ];

  static final $core.Map<$core.int, MediaVisibility> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MediaVisibility? valueOf($core.int value) => _byValue[value];

  const MediaVisibility._($core.int v, $core.String n) : super(v, n);
}

class MutationProps extends $pb.ProtobufEnum {
  static const MutationProps UNKNOWN_MUTATIONPROPS_ZERO = MutationProps._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_MUTATIONPROPS_ZERO');
  static const MutationProps STAR_ACTION = MutationProps._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STAR_ACTION');
  static const MutationProps CONTACT_ACTION = MutationProps._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONTACT_ACTION');
  static const MutationProps MUTE_ACTION = MutationProps._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUTE_ACTION');
  static const MutationProps PIN_ACTION = MutationProps._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PIN_ACTION');
  static const MutationProps SECURITY_NOTIFICATION_SETTING = MutationProps._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SECURITY_NOTIFICATION_SETTING');
  static const MutationProps PUSH_NAME_SETTING = MutationProps._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUSH_NAME_SETTING');
  static const MutationProps QUICK_REPLY_ACTION = MutationProps._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUICK_REPLY_ACTION');
  static const MutationProps RECENT_EMOJI_WEIGHTS_ACTION = MutationProps._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECENT_EMOJI_WEIGHTS_ACTION');
  static const MutationProps LABEL_MESSAGE_ACTION = MutationProps._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LABEL_MESSAGE_ACTION');
  static const MutationProps LABEL_EDIT_ACTION = MutationProps._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LABEL_EDIT_ACTION');
  static const MutationProps LABEL_ASSOCIATION_ACTION = MutationProps._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LABEL_ASSOCIATION_ACTION');
  static const MutationProps LOCALE_SETTING = MutationProps._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOCALE_SETTING');
  static const MutationProps ARCHIVE_CHAT_ACTION = MutationProps._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ARCHIVE_CHAT_ACTION');
  static const MutationProps DELETE_MESSAGE_FOR_ME_ACTION = MutationProps._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETE_MESSAGE_FOR_ME_ACTION');
  static const MutationProps KEY_EXPIRATION = MutationProps._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KEY_EXPIRATION');
  static const MutationProps MARK_CHAT_AS_READ_ACTION = MutationProps._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MARK_CHAT_AS_READ_ACTION');
  static const MutationProps CLEAR_CHAT_ACTION = MutationProps._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLEAR_CHAT_ACTION');
  static const MutationProps DELETE_CHAT_ACTION = MutationProps._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETE_CHAT_ACTION');
  static const MutationProps UNARCHIVE_CHATS_SETTING = MutationProps._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNARCHIVE_CHATS_SETTING');
  static const MutationProps PRIMARY_FEATURE = MutationProps._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIMARY_FEATURE');
  static const MutationProps ANDROID_UNSUPPORTED_ACTIONS = MutationProps._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANDROID_UNSUPPORTED_ACTIONS');
  static const MutationProps AGENT_ACTION = MutationProps._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AGENT_ACTION');
  static const MutationProps SUBSCRIPTION_ACTION = MutationProps._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUBSCRIPTION_ACTION');
  static const MutationProps USER_STATUS_MUTE_ACTION = MutationProps._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_STATUS_MUTE_ACTION');
  static const MutationProps TIME_FORMAT_ACTION = MutationProps._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIME_FORMAT_ACTION');
  static const MutationProps NUX_ACTION = MutationProps._(31, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NUX_ACTION');
  static const MutationProps PRIMARY_VERSION_ACTION = MutationProps._(32, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIMARY_VERSION_ACTION');
  static const MutationProps STICKER_ACTION = MutationProps._(33, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STICKER_ACTION');
  static const MutationProps REMOVE_RECENT_STICKER_ACTION = MutationProps._(34, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REMOVE_RECENT_STICKER_ACTION');
  static const MutationProps CHAT_ASSIGNMENT = MutationProps._(35, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT_ASSIGNMENT');
  static const MutationProps CHAT_ASSIGNMENT_OPENED_STATUS = MutationProps._(36, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT_ASSIGNMENT_OPENED_STATUS');
  static const MutationProps PN_FOR_LID_CHAT_ACTION = MutationProps._(37, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PN_FOR_LID_CHAT_ACTION');
  static const MutationProps MARKETING_MESSAGE_ACTION = MutationProps._(38, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MARKETING_MESSAGE_ACTION');
  static const MutationProps MARKETING_MESSAGE_BROADCAST_ACTION = MutationProps._(39, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MARKETING_MESSAGE_BROADCAST_ACTION');
  static const MutationProps EXTERNAL_WEB_BETA_ACTION = MutationProps._(40, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXTERNAL_WEB_BETA_ACTION');
  static const MutationProps PRIVACY_SETTING_RELAY_ALL_CALLS = MutationProps._(41, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIVACY_SETTING_RELAY_ALL_CALLS');
  static const MutationProps CALL_LOG_ACTION = MutationProps._(42, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CALL_LOG_ACTION');
  static const MutationProps UGC_BOT = MutationProps._(43, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UGC_BOT');
  static const MutationProps STATUS_PRIVACY = MutationProps._(44, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_PRIVACY');
  static const MutationProps BOT_WELCOME_REQUEST_ACTION = MutationProps._(45, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_WELCOME_REQUEST_ACTION');
  static const MutationProps DELETE_INDIVIDUAL_CALL_LOG = MutationProps._(46, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETE_INDIVIDUAL_CALL_LOG');
  static const MutationProps LABEL_REORDERING_ACTION = MutationProps._(47, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LABEL_REORDERING_ACTION');
  static const MutationProps PAYMENT_INFO_ACTION = MutationProps._(48, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_INFO_ACTION');
  static const MutationProps CUSTOM_PAYMENT_METHODS_ACTION = MutationProps._(49, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CUSTOM_PAYMENT_METHODS_ACTION');
  static const MutationProps LOCK_CHAT_ACTION = MutationProps._(50, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOCK_CHAT_ACTION');
  static const MutationProps CHAT_LOCK_SETTINGS = MutationProps._(51, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT_LOCK_SETTINGS');
  static const MutationProps WAMO_USER_IDENTIFIER_ACTION = MutationProps._(52, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WAMO_USER_IDENTIFIER_ACTION');
  static const MutationProps PRIVACY_SETTING_DISABLE_LINK_PREVIEWS_ACTION = MutationProps._(53, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIVACY_SETTING_DISABLE_LINK_PREVIEWS_ACTION');
  static const MutationProps DEVICE_CAPABILITIES = MutationProps._(54, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEVICE_CAPABILITIES');
  static const MutationProps NOTE_EDIT_ACTION = MutationProps._(55, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOTE_EDIT_ACTION');
  static const MutationProps FAVORITES_ACTION = MutationProps._(56, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAVORITES_ACTION');
  static const MutationProps MERCHANT_PAYMENT_PARTNER_ACTION = MutationProps._(57, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MERCHANT_PAYMENT_PARTNER_ACTION');
  static const MutationProps WAFFLE_ACCOUNT_LINK_STATE_ACTION = MutationProps._(58, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WAFFLE_ACCOUNT_LINK_STATE_ACTION');
  static const MutationProps USERNAME_CHAT_START_MODE = MutationProps._(59, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USERNAME_CHAT_START_MODE');
  static const MutationProps NOTIFICATION_ACTIVITY_SETTING_ACTION = MutationProps._(60, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOTIFICATION_ACTIVITY_SETTING_ACTION');
  static const MutationProps LID_CONTACT_ACTION = MutationProps._(61, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LID_CONTACT_ACTION');
  static const MutationProps CTWA_PER_CUSTOMER_DATA_SHARING_ACTION = MutationProps._(62, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CTWA_PER_CUSTOMER_DATA_SHARING_ACTION');
  static const MutationProps PAYMENT_TOS_ACTION = MutationProps._(63, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_TOS_ACTION');
  static const MutationProps PRIVACY_SETTING_CHANNELS_PERSONALISED_RECOMMENDATION_ACTION = MutationProps._(64, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIVACY_SETTING_CHANNELS_PERSONALISED_RECOMMENDATION_ACTION');
  static const MutationProps BUSINESS_BROADCAST_ASSOCIATION_ACTION = MutationProps._(65, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUSINESS_BROADCAST_ASSOCIATION_ACTION');
  static const MutationProps DETECTED_OUTCOMES_STATUS_ACTION = MutationProps._(66, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DETECTED_OUTCOMES_STATUS_ACTION');
  static const MutationProps MAIBA_AI_FEATURES_CONTROL_ACTION = MutationProps._(68, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MAIBA_AI_FEATURES_CONTROL_ACTION');
  static const MutationProps BUSINESS_BROADCAST_LIST_ACTION = MutationProps._(69, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUSINESS_BROADCAST_LIST_ACTION');
  static const MutationProps MUSIC_USER_ID_ACTION = MutationProps._(70, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUSIC_USER_ID_ACTION');
  static const MutationProps STATUS_POST_OPT_IN_NOTIFICATION_PREFERENCES_ACTION = MutationProps._(71, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_POST_OPT_IN_NOTIFICATION_PREFERENCES_ACTION');
  static const MutationProps AVATAR_UPDATED_ACTION = MutationProps._(72, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AVATAR_UPDATED_ACTION');
  static const MutationProps GALAXY_FLOW_ACTION = MutationProps._(73, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GALAXY_FLOW_ACTION');
  static const MutationProps PRIVATE_PROCESSING_SETTING_ACTION = MutationProps._(74, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIVATE_PROCESSING_SETTING_ACTION');
  static const MutationProps NEWSLETTER_SAVED_INTERESTS_ACTION = MutationProps._(75, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEWSLETTER_SAVED_INTERESTS_ACTION');
  static const MutationProps AI_THREAD_RENAME_ACTION = MutationProps._(76, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_THREAD_RENAME_ACTION');
  static const MutationProps INTERACTIVE_MESSAGE_ACTION = MutationProps._(77, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTERACTIVE_MESSAGE_ACTION');
  static const MutationProps SHARE_OWN_PN = MutationProps._(10001, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHARE_OWN_PN');
  static const MutationProps BUSINESS_BROADCAST_ACTION = MutationProps._(10002, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BUSINESS_BROADCAST_ACTION');

  static const $core.List<MutationProps> values = <MutationProps> [
    UNKNOWN_MUTATIONPROPS_ZERO,
    STAR_ACTION,
    CONTACT_ACTION,
    MUTE_ACTION,
    PIN_ACTION,
    SECURITY_NOTIFICATION_SETTING,
    PUSH_NAME_SETTING,
    QUICK_REPLY_ACTION,
    RECENT_EMOJI_WEIGHTS_ACTION,
    LABEL_MESSAGE_ACTION,
    LABEL_EDIT_ACTION,
    LABEL_ASSOCIATION_ACTION,
    LOCALE_SETTING,
    ARCHIVE_CHAT_ACTION,
    DELETE_MESSAGE_FOR_ME_ACTION,
    KEY_EXPIRATION,
    MARK_CHAT_AS_READ_ACTION,
    CLEAR_CHAT_ACTION,
    DELETE_CHAT_ACTION,
    UNARCHIVE_CHATS_SETTING,
    PRIMARY_FEATURE,
    ANDROID_UNSUPPORTED_ACTIONS,
    AGENT_ACTION,
    SUBSCRIPTION_ACTION,
    USER_STATUS_MUTE_ACTION,
    TIME_FORMAT_ACTION,
    NUX_ACTION,
    PRIMARY_VERSION_ACTION,
    STICKER_ACTION,
    REMOVE_RECENT_STICKER_ACTION,
    CHAT_ASSIGNMENT,
    CHAT_ASSIGNMENT_OPENED_STATUS,
    PN_FOR_LID_CHAT_ACTION,
    MARKETING_MESSAGE_ACTION,
    MARKETING_MESSAGE_BROADCAST_ACTION,
    EXTERNAL_WEB_BETA_ACTION,
    PRIVACY_SETTING_RELAY_ALL_CALLS,
    CALL_LOG_ACTION,
    UGC_BOT,
    STATUS_PRIVACY,
    BOT_WELCOME_REQUEST_ACTION,
    DELETE_INDIVIDUAL_CALL_LOG,
    LABEL_REORDERING_ACTION,
    PAYMENT_INFO_ACTION,
    CUSTOM_PAYMENT_METHODS_ACTION,
    LOCK_CHAT_ACTION,
    CHAT_LOCK_SETTINGS,
    WAMO_USER_IDENTIFIER_ACTION,
    PRIVACY_SETTING_DISABLE_LINK_PREVIEWS_ACTION,
    DEVICE_CAPABILITIES,
    NOTE_EDIT_ACTION,
    FAVORITES_ACTION,
    MERCHANT_PAYMENT_PARTNER_ACTION,
    WAFFLE_ACCOUNT_LINK_STATE_ACTION,
    USERNAME_CHAT_START_MODE,
    NOTIFICATION_ACTIVITY_SETTING_ACTION,
    LID_CONTACT_ACTION,
    CTWA_PER_CUSTOMER_DATA_SHARING_ACTION,
    PAYMENT_TOS_ACTION,
    PRIVACY_SETTING_CHANNELS_PERSONALISED_RECOMMENDATION_ACTION,
    BUSINESS_BROADCAST_ASSOCIATION_ACTION,
    DETECTED_OUTCOMES_STATUS_ACTION,
    MAIBA_AI_FEATURES_CONTROL_ACTION,
    BUSINESS_BROADCAST_LIST_ACTION,
    MUSIC_USER_ID_ACTION,
    STATUS_POST_OPT_IN_NOTIFICATION_PREFERENCES_ACTION,
    AVATAR_UPDATED_ACTION,
    GALAXY_FLOW_ACTION,
    PRIVATE_PROCESSING_SETTING_ACTION,
    NEWSLETTER_SAVED_INTERESTS_ACTION,
    AI_THREAD_RENAME_ACTION,
    INTERACTIVE_MESSAGE_ACTION,
    SHARE_OWN_PN,
    BUSINESS_BROADCAST_ACTION,
  ];

  static final $core.Map<$core.int, MutationProps> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MutationProps? valueOf($core.int value) => _byValue[value];

  const MutationProps._($core.int v, $core.String n) : super(v, n);
}

class PrivacySystemMessage extends $pb.ProtobufEnum {
  static const PrivacySystemMessage UNKNOWN_PRIVACYSYSTEMMESSAGE_ZERO = PrivacySystemMessage._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_PRIVACYSYSTEMMESSAGE_ZERO');
  static const PrivacySystemMessage E2EE_MSG = PrivacySystemMessage._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2EE_MSG');
  static const PrivacySystemMessage NE2EE_SELF = PrivacySystemMessage._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NE2EE_SELF');
  static const PrivacySystemMessage NE2EE_OTHER = PrivacySystemMessage._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NE2EE_OTHER');

  static const $core.List<PrivacySystemMessage> values = <PrivacySystemMessage> [
    UNKNOWN_PRIVACYSYSTEMMESSAGE_ZERO,
    E2EE_MSG,
    NE2EE_SELF,
    NE2EE_OTHER,
  ];

  static final $core.Map<$core.int, PrivacySystemMessage> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PrivacySystemMessage? valueOf($core.int value) => _byValue[value];

  const PrivacySystemMessage._($core.int v, $core.String n) : super(v, n);
}

class SessionTransparencyType extends $pb.ProtobufEnum {
  static const SessionTransparencyType UNKNOWN_TYPE = SessionTransparencyType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_TYPE');
  static const SessionTransparencyType NY_AI_SAFETY_DISCLAIMER = SessionTransparencyType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NY_AI_SAFETY_DISCLAIMER');

  static const $core.List<SessionTransparencyType> values = <SessionTransparencyType> [
    UNKNOWN_TYPE,
    NY_AI_SAFETY_DISCLAIMER,
  ];

  static final $core.Map<$core.int, SessionTransparencyType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SessionTransparencyType? valueOf($core.int value) => _byValue[value];

  const SessionTransparencyType._($core.int v, $core.String n) : super(v, n);
}

class WebLinkRenderConfig extends $pb.ProtobufEnum {
  static const WebLinkRenderConfig WEBVIEW = WebLinkRenderConfig._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEBVIEW');
  static const WebLinkRenderConfig SYSTEM = WebLinkRenderConfig._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYSTEM');

  static const $core.List<WebLinkRenderConfig> values = <WebLinkRenderConfig> [
    WEBVIEW,
    SYSTEM,
  ];

  static final $core.Map<$core.int, WebLinkRenderConfig> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WebLinkRenderConfig? valueOf($core.int value) => _byValue[value];

  const WebLinkRenderConfig._($core.int v, $core.String n) : super(v, n);
}

class AIHomeState_AIHomeOption_AIHomeActionType extends $pb.ProtobufEnum {
  static const AIHomeState_AIHomeOption_AIHomeActionType PROMPT = AIHomeState_AIHomeOption_AIHomeActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROMPT');
  static const AIHomeState_AIHomeOption_AIHomeActionType CREATE_IMAGE = AIHomeState_AIHomeOption_AIHomeActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CREATE_IMAGE');
  static const AIHomeState_AIHomeOption_AIHomeActionType ANIMATE_PHOTO = AIHomeState_AIHomeOption_AIHomeActionType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANIMATE_PHOTO');
  static const AIHomeState_AIHomeOption_AIHomeActionType ANALYZE_FILE = AIHomeState_AIHomeOption_AIHomeActionType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANALYZE_FILE');

  static const $core.List<AIHomeState_AIHomeOption_AIHomeActionType> values = <AIHomeState_AIHomeOption_AIHomeActionType> [
    PROMPT,
    CREATE_IMAGE,
    ANIMATE_PHOTO,
    ANALYZE_FILE,
  ];

  static final $core.Map<$core.int, AIHomeState_AIHomeOption_AIHomeActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIHomeState_AIHomeOption_AIHomeActionType? valueOf($core.int value) => _byValue[value];

  const AIHomeState_AIHomeOption_AIHomeActionType._($core.int v, $core.String n) : super(v, n);
}

class AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType extends $pb.ProtobufEnum {
  static const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType AI_RICH_RESPONSE_CODE_HIGHLIGHT_DEFAULT = AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_DEFAULT');
  static const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType AI_RICH_RESPONSE_CODE_HIGHLIGHT_KEYWORD = AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_KEYWORD');
  static const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType AI_RICH_RESPONSE_CODE_HIGHLIGHT_METHOD = AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_METHOD');
  static const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType AI_RICH_RESPONSE_CODE_HIGHLIGHT_STRING = AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_STRING');
  static const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType AI_RICH_RESPONSE_CODE_HIGHLIGHT_NUMBER = AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_NUMBER');
  static const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType AI_RICH_RESPONSE_CODE_HIGHLIGHT_COMMENT = AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_CODE_HIGHLIGHT_COMMENT');

  static const $core.List<AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType> values = <AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType> [
    AI_RICH_RESPONSE_CODE_HIGHLIGHT_DEFAULT,
    AI_RICH_RESPONSE_CODE_HIGHLIGHT_KEYWORD,
    AI_RICH_RESPONSE_CODE_HIGHLIGHT_METHOD,
    AI_RICH_RESPONSE_CODE_HIGHLIGHT_STRING,
    AI_RICH_RESPONSE_CODE_HIGHLIGHT_NUMBER,
    AI_RICH_RESPONSE_CODE_HIGHLIGHT_COMMENT,
  ];

  static final $core.Map<$core.int, AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType? valueOf($core.int value) => _byValue[value];

  const AIRichResponseCodeMetadata_AIRichResponseCodeHighlightType._($core.int v, $core.String n) : super(v, n);
}

class AIRichResponseContentItemsMetadata_ContentType extends $pb.ProtobufEnum {
  static const AIRichResponseContentItemsMetadata_ContentType DEFAULT = AIRichResponseContentItemsMetadata_ContentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');
  static const AIRichResponseContentItemsMetadata_ContentType CAROUSEL = AIRichResponseContentItemsMetadata_ContentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAROUSEL');

  static const $core.List<AIRichResponseContentItemsMetadata_ContentType> values = <AIRichResponseContentItemsMetadata_ContentType> [
    DEFAULT,
    CAROUSEL,
  ];

  static final $core.Map<$core.int, AIRichResponseContentItemsMetadata_ContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIRichResponseContentItemsMetadata_ContentType? valueOf($core.int value) => _byValue[value];

  const AIRichResponseContentItemsMetadata_ContentType._($core.int v, $core.String n) : super(v, n);
}

class AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType extends $pb.ProtobufEnum {
  static const AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_UNKNOWN = AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_UNKNOWN');
  static const AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_IMAGE = AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_IMAGE');
  static const AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_GIF = AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_GIF');

  static const $core.List<AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType> values = <AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType> [
    AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_UNKNOWN,
    AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_IMAGE,
    AI_RICH_RESPONSE_DYNAMIC_METADATA_TYPE_GIF,
  ];

  static final $core.Map<$core.int, AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType? valueOf($core.int value) => _byValue[value];

  const AIRichResponseDynamicMetadata_AIRichResponseDynamicMetadataType._($core.int v, $core.String n) : super(v, n);
}

class AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment extends $pb.ProtobufEnum {
  static const AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment AI_RICH_RESPONSE_IMAGE_LAYOUT_LEADING_ALIGNED = AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_IMAGE_LAYOUT_LEADING_ALIGNED');
  static const AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment AI_RICH_RESPONSE_IMAGE_LAYOUT_TRAILING_ALIGNED = AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_IMAGE_LAYOUT_TRAILING_ALIGNED');
  static const AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment AI_RICH_RESPONSE_IMAGE_LAYOUT_CENTER_ALIGNED = AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RICH_RESPONSE_IMAGE_LAYOUT_CENTER_ALIGNED');

  static const $core.List<AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment> values = <AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment> [
    AI_RICH_RESPONSE_IMAGE_LAYOUT_LEADING_ALIGNED,
    AI_RICH_RESPONSE_IMAGE_LAYOUT_TRAILING_ALIGNED,
    AI_RICH_RESPONSE_IMAGE_LAYOUT_CENTER_ALIGNED,
  ];

  static final $core.Map<$core.int, AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment? valueOf($core.int value) => _byValue[value];

  const AIRichResponseInlineImageMetadata_AIRichResponseImageAlignment._($core.int v, $core.String n) : super(v, n);
}

class AIThreadInfo_AIThreadClientInfo_AIThreadType extends $pb.ProtobufEnum {
  static const AIThreadInfo_AIThreadClientInfo_AIThreadType UNKNOWN = AIThreadInfo_AIThreadClientInfo_AIThreadType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const AIThreadInfo_AIThreadClientInfo_AIThreadType DEFAULT = AIThreadInfo_AIThreadClientInfo_AIThreadType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');
  static const AIThreadInfo_AIThreadClientInfo_AIThreadType INCOGNITO = AIThreadInfo_AIThreadClientInfo_AIThreadType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INCOGNITO');

  static const $core.List<AIThreadInfo_AIThreadClientInfo_AIThreadType> values = <AIThreadInfo_AIThreadClientInfo_AIThreadType> [
    UNKNOWN,
    DEFAULT,
    INCOGNITO,
  ];

  static final $core.Map<$core.int, AIThreadInfo_AIThreadClientInfo_AIThreadType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AIThreadInfo_AIThreadClientInfo_AIThreadType? valueOf($core.int value) => _byValue[value];

  const AIThreadInfo_AIThreadClientInfo_AIThreadType._($core.int v, $core.String n) : super(v, n);
}

class BizAccountLinkInfo_AccountType extends $pb.ProtobufEnum {
  static const BizAccountLinkInfo_AccountType ENTERPRISE = BizAccountLinkInfo_AccountType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ENTERPRISE');

  static const $core.List<BizAccountLinkInfo_AccountType> values = <BizAccountLinkInfo_AccountType> [
    ENTERPRISE,
  ];

  static final $core.Map<$core.int, BizAccountLinkInfo_AccountType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BizAccountLinkInfo_AccountType? valueOf($core.int value) => _byValue[value];

  const BizAccountLinkInfo_AccountType._($core.int v, $core.String n) : super(v, n);
}

class BizAccountLinkInfo_HostStorageType extends $pb.ProtobufEnum {
  static const BizAccountLinkInfo_HostStorageType ON_PREMISE = BizAccountLinkInfo_HostStorageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ON_PREMISE');
  static const BizAccountLinkInfo_HostStorageType FACEBOOK = BizAccountLinkInfo_HostStorageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FACEBOOK');

  static const $core.List<BizAccountLinkInfo_HostStorageType> values = <BizAccountLinkInfo_HostStorageType> [
    ON_PREMISE,
    FACEBOOK,
  ];

  static final $core.Map<$core.int, BizAccountLinkInfo_HostStorageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BizAccountLinkInfo_HostStorageType? valueOf($core.int value) => _byValue[value];

  const BizAccountLinkInfo_HostStorageType._($core.int v, $core.String n) : super(v, n);
}

class BizIdentityInfo_ActualActorsType extends $pb.ProtobufEnum {
  static const BizIdentityInfo_ActualActorsType SELF = BizIdentityInfo_ActualActorsType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SELF');
  static const BizIdentityInfo_ActualActorsType BSP = BizIdentityInfo_ActualActorsType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BSP');

  static const $core.List<BizIdentityInfo_ActualActorsType> values = <BizIdentityInfo_ActualActorsType> [
    SELF,
    BSP,
  ];

  static final $core.Map<$core.int, BizIdentityInfo_ActualActorsType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BizIdentityInfo_ActualActorsType? valueOf($core.int value) => _byValue[value];

  const BizIdentityInfo_ActualActorsType._($core.int v, $core.String n) : super(v, n);
}

class BizIdentityInfo_HostStorageType extends $pb.ProtobufEnum {
  static const BizIdentityInfo_HostStorageType ON_PREMISE = BizIdentityInfo_HostStorageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ON_PREMISE');
  static const BizIdentityInfo_HostStorageType FACEBOOK = BizIdentityInfo_HostStorageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FACEBOOK');

  static const $core.List<BizIdentityInfo_HostStorageType> values = <BizIdentityInfo_HostStorageType> [
    ON_PREMISE,
    FACEBOOK,
  ];

  static final $core.Map<$core.int, BizIdentityInfo_HostStorageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BizIdentityInfo_HostStorageType? valueOf($core.int value) => _byValue[value];

  const BizIdentityInfo_HostStorageType._($core.int v, $core.String n) : super(v, n);
}

class BizIdentityInfo_VerifiedLevelValue extends $pb.ProtobufEnum {
  static const BizIdentityInfo_VerifiedLevelValue UNKNOWN = BizIdentityInfo_VerifiedLevelValue._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const BizIdentityInfo_VerifiedLevelValue LOW = BizIdentityInfo_VerifiedLevelValue._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOW');
  static const BizIdentityInfo_VerifiedLevelValue HIGH = BizIdentityInfo_VerifiedLevelValue._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HIGH');

  static const $core.List<BizIdentityInfo_VerifiedLevelValue> values = <BizIdentityInfo_VerifiedLevelValue> [
    UNKNOWN,
    LOW,
    HIGH,
  ];

  static final $core.Map<$core.int, BizIdentityInfo_VerifiedLevelValue> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BizIdentityInfo_VerifiedLevelValue? valueOf($core.int value) => _byValue[value];

  const BizIdentityInfo_VerifiedLevelValue._($core.int v, $core.String n) : super(v, n);
}

class BotAgeCollectionMetadata_AgeCollectionType extends $pb.ProtobufEnum {
  static const BotAgeCollectionMetadata_AgeCollectionType O18_BINARY = BotAgeCollectionMetadata_AgeCollectionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'O18_BINARY');
  static const BotAgeCollectionMetadata_AgeCollectionType WAFFLE = BotAgeCollectionMetadata_AgeCollectionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WAFFLE');

  static const $core.List<BotAgeCollectionMetadata_AgeCollectionType> values = <BotAgeCollectionMetadata_AgeCollectionType> [
    O18_BINARY,
    WAFFLE,
  ];

  static final $core.Map<$core.int, BotAgeCollectionMetadata_AgeCollectionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotAgeCollectionMetadata_AgeCollectionType? valueOf($core.int value) => _byValue[value];

  const BotAgeCollectionMetadata_AgeCollectionType._($core.int v, $core.String n) : super(v, n);
}

class BotCapabilityMetadata_BotCapabilityType extends $pb.ProtobufEnum {
  static const BotCapabilityMetadata_BotCapabilityType UNKNOWN = BotCapabilityMetadata_BotCapabilityType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const BotCapabilityMetadata_BotCapabilityType PROGRESS_INDICATOR = BotCapabilityMetadata_BotCapabilityType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROGRESS_INDICATOR');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_HEADING = BotCapabilityMetadata_BotCapabilityType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_HEADING');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_NESTED_LIST = BotCapabilityMetadata_BotCapabilityType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_NESTED_LIST');
  static const BotCapabilityMetadata_BotCapabilityType AI_MEMORY = BotCapabilityMetadata_BotCapabilityType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_MEMORY');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_THREAD_SURFING = BotCapabilityMetadata_BotCapabilityType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_THREAD_SURFING');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_TABLE = BotCapabilityMetadata_BotCapabilityType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_TABLE');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_CODE = BotCapabilityMetadata_BotCapabilityType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_CODE');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_STRUCTURED_RESPONSE = BotCapabilityMetadata_BotCapabilityType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_STRUCTURED_RESPONSE');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_INLINE_IMAGE = BotCapabilityMetadata_BotCapabilityType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_INLINE_IMAGE');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_CONTROL = BotCapabilityMetadata_BotCapabilityType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_CONTROL');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_1 = BotCapabilityMetadata_BotCapabilityType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_1');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_2 = BotCapabilityMetadata_BotCapabilityType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_2');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_3 = BotCapabilityMetadata_BotCapabilityType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_3');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_4 = BotCapabilityMetadata_BotCapabilityType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_4');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_5 = BotCapabilityMetadata_BotCapabilityType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_5');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_6 = BotCapabilityMetadata_BotCapabilityType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_6');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_7 = BotCapabilityMetadata_BotCapabilityType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_7');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_8 = BotCapabilityMetadata_BotCapabilityType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_8');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_9 = BotCapabilityMetadata_BotCapabilityType._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_9');
  static const BotCapabilityMetadata_BotCapabilityType WA_IG_1P_PLUGIN_RANKING_UPDATE_10 = BotCapabilityMetadata_BotCapabilityType._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_IG_1P_PLUGIN_RANKING_UPDATE_10');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_SUB_HEADING = BotCapabilityMetadata_BotCapabilityType._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_SUB_HEADING');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_GRID_IMAGE = BotCapabilityMetadata_BotCapabilityType._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_GRID_IMAGE');
  static const BotCapabilityMetadata_BotCapabilityType AI_STUDIO_UGC_MEMORY = BotCapabilityMetadata_BotCapabilityType._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_STUDIO_UGC_MEMORY');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_LATEX = BotCapabilityMetadata_BotCapabilityType._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_LATEX');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_MAPS = BotCapabilityMetadata_BotCapabilityType._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_MAPS');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_INLINE_REELS = BotCapabilityMetadata_BotCapabilityType._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_INLINE_REELS');
  static const BotCapabilityMetadata_BotCapabilityType AGENTIC_PLANNING = BotCapabilityMetadata_BotCapabilityType._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AGENTIC_PLANNING');
  static const BotCapabilityMetadata_BotCapabilityType ACCOUNT_LINKING = BotCapabilityMetadata_BotCapabilityType._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCOUNT_LINKING');
  static const BotCapabilityMetadata_BotCapabilityType STREAMING_DISAGGREGATION = BotCapabilityMetadata_BotCapabilityType._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STREAMING_DISAGGREGATION');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_GRID_IMAGE_3P = BotCapabilityMetadata_BotCapabilityType._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_GRID_IMAGE_3P');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_LATEX_INLINE = BotCapabilityMetadata_BotCapabilityType._(31, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_LATEX_INLINE');
  static const BotCapabilityMetadata_BotCapabilityType QUERY_PLAN = BotCapabilityMetadata_BotCapabilityType._(32, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUERY_PLAN');
  static const BotCapabilityMetadata_BotCapabilityType PROACTIVE_MESSAGE = BotCapabilityMetadata_BotCapabilityType._(33, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROACTIVE_MESSAGE');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UNIFIED_RESPONSE = BotCapabilityMetadata_BotCapabilityType._(34, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UNIFIED_RESPONSE');
  static const BotCapabilityMetadata_BotCapabilityType PROMOTION_MESSAGE = BotCapabilityMetadata_BotCapabilityType._(35, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROMOTION_MESSAGE');
  static const BotCapabilityMetadata_BotCapabilityType SIMPLIFIED_PROFILE_PAGE = BotCapabilityMetadata_BotCapabilityType._(36, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SIMPLIFIED_PROFILE_PAGE');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_SOURCES_IN_MESSAGE = BotCapabilityMetadata_BotCapabilityType._(37, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_SOURCES_IN_MESSAGE');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_SIDE_BY_SIDE_SURVEY = BotCapabilityMetadata_BotCapabilityType._(38, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_SIDE_BY_SIDE_SURVEY');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UNIFIED_TEXT_COMPONENT = BotCapabilityMetadata_BotCapabilityType._(39, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UNIFIED_TEXT_COMPONENT');
  static const BotCapabilityMetadata_BotCapabilityType AI_SHARED_MEMORY = BotCapabilityMetadata_BotCapabilityType._(40, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_SHARED_MEMORY');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UNIFIED_SOURCES = BotCapabilityMetadata_BotCapabilityType._(41, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UNIFIED_SOURCES');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UNIFIED_DOMAIN_CITATIONS = BotCapabilityMetadata_BotCapabilityType._(42, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UNIFIED_DOMAIN_CITATIONS');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UR_INLINE_REELS_ENABLED = BotCapabilityMetadata_BotCapabilityType._(43, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UR_INLINE_REELS_ENABLED');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UR_MEDIA_GRID_ENABLED = BotCapabilityMetadata_BotCapabilityType._(44, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UR_MEDIA_GRID_ENABLED');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UR_TIMESTAMP_PLACEHOLDER = BotCapabilityMetadata_BotCapabilityType._(45, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UR_TIMESTAMP_PLACEHOLDER');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_IN_APP_SURVEY = BotCapabilityMetadata_BotCapabilityType._(46, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_IN_APP_SURVEY');
  static const BotCapabilityMetadata_BotCapabilityType AI_RESPONSE_MODEL_BRANDING = BotCapabilityMetadata_BotCapabilityType._(47, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_RESPONSE_MODEL_BRANDING');
  static const BotCapabilityMetadata_BotCapabilityType SESSION_TRANSPARENCY_SYSTEM_MESSAGE = BotCapabilityMetadata_BotCapabilityType._(48, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SESSION_TRANSPARENCY_SYSTEM_MESSAGE');
  static const BotCapabilityMetadata_BotCapabilityType RICH_RESPONSE_UR_REASONING = BotCapabilityMetadata_BotCapabilityType._(49, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RICH_RESPONSE_UR_REASONING');

  static const $core.List<BotCapabilityMetadata_BotCapabilityType> values = <BotCapabilityMetadata_BotCapabilityType> [
    UNKNOWN,
    PROGRESS_INDICATOR,
    RICH_RESPONSE_HEADING,
    RICH_RESPONSE_NESTED_LIST,
    AI_MEMORY,
    RICH_RESPONSE_THREAD_SURFING,
    RICH_RESPONSE_TABLE,
    RICH_RESPONSE_CODE,
    RICH_RESPONSE_STRUCTURED_RESPONSE,
    RICH_RESPONSE_INLINE_IMAGE,
    WA_IG_1P_PLUGIN_RANKING_CONTROL,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_1,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_2,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_3,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_4,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_5,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_6,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_7,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_8,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_9,
    WA_IG_1P_PLUGIN_RANKING_UPDATE_10,
    RICH_RESPONSE_SUB_HEADING,
    RICH_RESPONSE_GRID_IMAGE,
    AI_STUDIO_UGC_MEMORY,
    RICH_RESPONSE_LATEX,
    RICH_RESPONSE_MAPS,
    RICH_RESPONSE_INLINE_REELS,
    AGENTIC_PLANNING,
    ACCOUNT_LINKING,
    STREAMING_DISAGGREGATION,
    RICH_RESPONSE_GRID_IMAGE_3P,
    RICH_RESPONSE_LATEX_INLINE,
    QUERY_PLAN,
    PROACTIVE_MESSAGE,
    RICH_RESPONSE_UNIFIED_RESPONSE,
    PROMOTION_MESSAGE,
    SIMPLIFIED_PROFILE_PAGE,
    RICH_RESPONSE_SOURCES_IN_MESSAGE,
    RICH_RESPONSE_SIDE_BY_SIDE_SURVEY,
    RICH_RESPONSE_UNIFIED_TEXT_COMPONENT,
    AI_SHARED_MEMORY,
    RICH_RESPONSE_UNIFIED_SOURCES,
    RICH_RESPONSE_UNIFIED_DOMAIN_CITATIONS,
    RICH_RESPONSE_UR_INLINE_REELS_ENABLED,
    RICH_RESPONSE_UR_MEDIA_GRID_ENABLED,
    RICH_RESPONSE_UR_TIMESTAMP_PLACEHOLDER,
    RICH_RESPONSE_IN_APP_SURVEY,
    AI_RESPONSE_MODEL_BRANDING,
    SESSION_TRANSPARENCY_SYSTEM_MESSAGE,
    RICH_RESPONSE_UR_REASONING,
  ];

  static final $core.Map<$core.int, BotCapabilityMetadata_BotCapabilityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotCapabilityMetadata_BotCapabilityType? valueOf($core.int value) => _byValue[value];

  const BotCapabilityMetadata_BotCapabilityType._($core.int v, $core.String n) : super(v, n);
}

class BotFeedbackMessage_BotFeedbackKind extends $pb.ProtobufEnum {
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_POSITIVE = BotFeedbackMessage_BotFeedbackKind._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_POSITIVE');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_GENERIC = BotFeedbackMessage_BotFeedbackKind._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_GENERIC');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_HELPFUL = BotFeedbackMessage_BotFeedbackKind._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_HELPFUL');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_INTERESTING = BotFeedbackMessage_BotFeedbackKind._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_INTERESTING');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_ACCURATE = BotFeedbackMessage_BotFeedbackKind._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_ACCURATE');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_SAFE = BotFeedbackMessage_BotFeedbackKind._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_SAFE');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_OTHER = BotFeedbackMessage_BotFeedbackKind._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_OTHER');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_REFUSED = BotFeedbackMessage_BotFeedbackKind._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_REFUSED');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_NOT_VISUALLY_APPEALING = BotFeedbackMessage_BotFeedbackKind._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_NOT_VISUALLY_APPEALING');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_NOT_RELEVANT_TO_TEXT = BotFeedbackMessage_BotFeedbackKind._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_NOT_RELEVANT_TO_TEXT');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_PERSONALIZED = BotFeedbackMessage_BotFeedbackKind._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_PERSONALIZED');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_CLARITY = BotFeedbackMessage_BotFeedbackKind._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_CLARITY');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_DOESNT_LOOK_LIKE_THE_PERSON = BotFeedbackMessage_BotFeedbackKind._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_DOESNT_LOOK_LIKE_THE_PERSON');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE_HALLUCINATION_INTERNAL_ONLY = BotFeedbackMessage_BotFeedbackKind._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE_HALLUCINATION_INTERNAL_ONLY');
  static const BotFeedbackMessage_BotFeedbackKind BOT_FEEDBACK_NEGATIVE = BotFeedbackMessage_BotFeedbackKind._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_NEGATIVE');

  static const $core.List<BotFeedbackMessage_BotFeedbackKind> values = <BotFeedbackMessage_BotFeedbackKind> [
    BOT_FEEDBACK_POSITIVE,
    BOT_FEEDBACK_NEGATIVE_GENERIC,
    BOT_FEEDBACK_NEGATIVE_HELPFUL,
    BOT_FEEDBACK_NEGATIVE_INTERESTING,
    BOT_FEEDBACK_NEGATIVE_ACCURATE,
    BOT_FEEDBACK_NEGATIVE_SAFE,
    BOT_FEEDBACK_NEGATIVE_OTHER,
    BOT_FEEDBACK_NEGATIVE_REFUSED,
    BOT_FEEDBACK_NEGATIVE_NOT_VISUALLY_APPEALING,
    BOT_FEEDBACK_NEGATIVE_NOT_RELEVANT_TO_TEXT,
    BOT_FEEDBACK_NEGATIVE_PERSONALIZED,
    BOT_FEEDBACK_NEGATIVE_CLARITY,
    BOT_FEEDBACK_NEGATIVE_DOESNT_LOOK_LIKE_THE_PERSON,
    BOT_FEEDBACK_NEGATIVE_HALLUCINATION_INTERNAL_ONLY,
    BOT_FEEDBACK_NEGATIVE,
  ];

  static final $core.Map<$core.int, BotFeedbackMessage_BotFeedbackKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotFeedbackMessage_BotFeedbackKind? valueOf($core.int value) => _byValue[value];

  const BotFeedbackMessage_BotFeedbackKind._($core.int v, $core.String n) : super(v, n);
}

class BotFeedbackMessage_BotFeedbackKindMultipleNegative extends $pb.ProtobufEnum {
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative UNKNOWN_BOTFEEDBACKKINDMULTIPLENEGATIVE_ZERO = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_BOTFEEDBACKKINDMULTIPLENEGATIVE_ZERO');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_GENERIC = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_GENERIC');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_HELPFUL = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_HELPFUL');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_INTERESTING = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_INTERESTING');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_ACCURATE = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_ACCURATE');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_SAFE = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_SAFE');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_OTHER = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(32, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_OTHER');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_REFUSED = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(64, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_REFUSED');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_VISUALLY_APPEALING = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(128, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_VISUALLY_APPEALING');
  static const BotFeedbackMessage_BotFeedbackKindMultipleNegative BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_RELEVANT_TO_TEXT = BotFeedbackMessage_BotFeedbackKindMultipleNegative._(256, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_RELEVANT_TO_TEXT');

  static const $core.List<BotFeedbackMessage_BotFeedbackKindMultipleNegative> values = <BotFeedbackMessage_BotFeedbackKindMultipleNegative> [
    UNKNOWN_BOTFEEDBACKKINDMULTIPLENEGATIVE_ZERO,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_GENERIC,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_HELPFUL,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_INTERESTING,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_ACCURATE,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_SAFE,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_OTHER,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_REFUSED,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_VISUALLY_APPEALING,
    BOT_FEEDBACK_MULTIPLE_NEGATIVE_NOT_RELEVANT_TO_TEXT,
  ];

  static final $core.Map<$core.int, BotFeedbackMessage_BotFeedbackKindMultipleNegative> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotFeedbackMessage_BotFeedbackKindMultipleNegative? valueOf($core.int value) => _byValue[value];

  const BotFeedbackMessage_BotFeedbackKindMultipleNegative._($core.int v, $core.String n) : super(v, n);
}

class BotFeedbackMessage_BotFeedbackKindMultiplePositive extends $pb.ProtobufEnum {
  static const BotFeedbackMessage_BotFeedbackKindMultiplePositive UNKNOWN_BOTFEEDBACKKINDMULTIPLEPOSITIVE_ZERO = BotFeedbackMessage_BotFeedbackKindMultiplePositive._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_BOTFEEDBACKKINDMULTIPLEPOSITIVE_ZERO');
  static const BotFeedbackMessage_BotFeedbackKindMultiplePositive BOT_FEEDBACK_MULTIPLE_POSITIVE_GENERIC = BotFeedbackMessage_BotFeedbackKindMultiplePositive._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MULTIPLE_POSITIVE_GENERIC');

  static const $core.List<BotFeedbackMessage_BotFeedbackKindMultiplePositive> values = <BotFeedbackMessage_BotFeedbackKindMultiplePositive> [
    UNKNOWN_BOTFEEDBACKKINDMULTIPLEPOSITIVE_ZERO,
    BOT_FEEDBACK_MULTIPLE_POSITIVE_GENERIC,
  ];

  static final $core.Map<$core.int, BotFeedbackMessage_BotFeedbackKindMultiplePositive> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotFeedbackMessage_BotFeedbackKindMultiplePositive? valueOf($core.int value) => _byValue[value];

  const BotFeedbackMessage_BotFeedbackKindMultiplePositive._($core.int v, $core.String n) : super(v, n);
}

class BotFeedbackMessage_ReportKind extends $pb.ProtobufEnum {
  static const BotFeedbackMessage_ReportKind NONE = BotFeedbackMessage_ReportKind._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const BotFeedbackMessage_ReportKind GENERIC = BotFeedbackMessage_ReportKind._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERIC');

  static const $core.List<BotFeedbackMessage_ReportKind> values = <BotFeedbackMessage_ReportKind> [
    NONE,
    GENERIC,
  ];

  static final $core.Map<$core.int, BotFeedbackMessage_ReportKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotFeedbackMessage_ReportKind? valueOf($core.int value) => _byValue[value];

  const BotFeedbackMessage_ReportKind._($core.int v, $core.String n) : super(v, n);
}

class BotImagineMetadata_ImagineType extends $pb.ProtobufEnum {
  static const BotImagineMetadata_ImagineType UNKNOWN = BotImagineMetadata_ImagineType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const BotImagineMetadata_ImagineType IMAGINE = BotImagineMetadata_ImagineType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGINE');
  static const BotImagineMetadata_ImagineType MEMU = BotImagineMetadata_ImagineType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MEMU');
  static const BotImagineMetadata_ImagineType FLASH = BotImagineMetadata_ImagineType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FLASH');
  static const BotImagineMetadata_ImagineType EDIT = BotImagineMetadata_ImagineType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EDIT');

  static const $core.List<BotImagineMetadata_ImagineType> values = <BotImagineMetadata_ImagineType> [
    UNKNOWN,
    IMAGINE,
    MEMU,
    FLASH,
    EDIT,
  ];

  static final $core.Map<$core.int, BotImagineMetadata_ImagineType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotImagineMetadata_ImagineType? valueOf($core.int value) => _byValue[value];

  const BotImagineMetadata_ImagineType._($core.int v, $core.String n) : super(v, n);
}

class BotLinkedAccount_BotLinkedAccountType extends $pb.ProtobufEnum {
  static const BotLinkedAccount_BotLinkedAccountType BOT_LINKED_ACCOUNT_TYPE_1P = BotLinkedAccount_BotLinkedAccountType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_LINKED_ACCOUNT_TYPE_1P');

  static const $core.List<BotLinkedAccount_BotLinkedAccountType> values = <BotLinkedAccount_BotLinkedAccountType> [
    BOT_LINKED_ACCOUNT_TYPE_1P,
  ];

  static final $core.Map<$core.int, BotLinkedAccount_BotLinkedAccountType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotLinkedAccount_BotLinkedAccountType? valueOf($core.int value) => _byValue[value];

  const BotLinkedAccount_BotLinkedAccountType._($core.int v, $core.String n) : super(v, n);
}

class BotMediaMetadata_OrientationType extends $pb.ProtobufEnum {
  static const BotMediaMetadata_OrientationType UNKNOWN_ORIENTATIONTYPE_ZERO = BotMediaMetadata_OrientationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_ORIENTATIONTYPE_ZERO');
  static const BotMediaMetadata_OrientationType CENTER = BotMediaMetadata_OrientationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CENTER');
  static const BotMediaMetadata_OrientationType LEFT = BotMediaMetadata_OrientationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LEFT');
  static const BotMediaMetadata_OrientationType RIGHT = BotMediaMetadata_OrientationType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RIGHT');

  static const $core.List<BotMediaMetadata_OrientationType> values = <BotMediaMetadata_OrientationType> [
    UNKNOWN_ORIENTATIONTYPE_ZERO,
    CENTER,
    LEFT,
    RIGHT,
  ];

  static final $core.Map<$core.int, BotMediaMetadata_OrientationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotMediaMetadata_OrientationType? valueOf($core.int value) => _byValue[value];

  const BotMediaMetadata_OrientationType._($core.int v, $core.String n) : super(v, n);
}

class BotMessageOrigin_BotMessageOriginType extends $pb.ProtobufEnum {
  static const BotMessageOrigin_BotMessageOriginType BOT_MESSAGE_ORIGIN_TYPE_AI_INITIATED = BotMessageOrigin_BotMessageOriginType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_MESSAGE_ORIGIN_TYPE_AI_INITIATED');

  static const $core.List<BotMessageOrigin_BotMessageOriginType> values = <BotMessageOrigin_BotMessageOriginType> [
    BOT_MESSAGE_ORIGIN_TYPE_AI_INITIATED,
  ];

  static final $core.Map<$core.int, BotMessageOrigin_BotMessageOriginType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotMessageOrigin_BotMessageOriginType? valueOf($core.int value) => _byValue[value];

  const BotMessageOrigin_BotMessageOriginType._($core.int v, $core.String n) : super(v, n);
}

class BotModeSelectionMetadata_BotUserSelectionMode extends $pb.ProtobufEnum {
  static const BotModeSelectionMetadata_BotUserSelectionMode UNKNOWN_MODE = BotModeSelectionMetadata_BotUserSelectionMode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_MODE');
  static const BotModeSelectionMetadata_BotUserSelectionMode REASONING_MODE = BotModeSelectionMetadata_BotUserSelectionMode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REASONING_MODE');

  static const $core.List<BotModeSelectionMetadata_BotUserSelectionMode> values = <BotModeSelectionMetadata_BotUserSelectionMode> [
    UNKNOWN_MODE,
    REASONING_MODE,
  ];

  static final $core.Map<$core.int, BotModeSelectionMetadata_BotUserSelectionMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotModeSelectionMetadata_BotUserSelectionMode? valueOf($core.int value) => _byValue[value];

  const BotModeSelectionMetadata_BotUserSelectionMode._($core.int v, $core.String n) : super(v, n);
}

class BotModelMetadata_ModelType extends $pb.ProtobufEnum {
  static const BotModelMetadata_ModelType UNKNOWN_TYPE = BotModelMetadata_ModelType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_TYPE');
  static const BotModelMetadata_ModelType LLAMA_PROD = BotModelMetadata_ModelType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LLAMA_PROD');
  static const BotModelMetadata_ModelType LLAMA_PROD_PREMIUM = BotModelMetadata_ModelType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LLAMA_PROD_PREMIUM');

  static const $core.List<BotModelMetadata_ModelType> values = <BotModelMetadata_ModelType> [
    UNKNOWN_TYPE,
    LLAMA_PROD,
    LLAMA_PROD_PREMIUM,
  ];

  static final $core.Map<$core.int, BotModelMetadata_ModelType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotModelMetadata_ModelType? valueOf($core.int value) => _byValue[value];

  const BotModelMetadata_ModelType._($core.int v, $core.String n) : super(v, n);
}

class BotModelMetadata_PremiumModelStatus extends $pb.ProtobufEnum {
  static const BotModelMetadata_PremiumModelStatus UNKNOWN_STATUS = BotModelMetadata_PremiumModelStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_STATUS');
  static const BotModelMetadata_PremiumModelStatus AVAILABLE = BotModelMetadata_PremiumModelStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AVAILABLE');
  static const BotModelMetadata_PremiumModelStatus QUOTA_EXCEED_LIMIT = BotModelMetadata_PremiumModelStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUOTA_EXCEED_LIMIT');

  static const $core.List<BotModelMetadata_PremiumModelStatus> values = <BotModelMetadata_PremiumModelStatus> [
    UNKNOWN_STATUS,
    AVAILABLE,
    QUOTA_EXCEED_LIMIT,
  ];

  static final $core.Map<$core.int, BotModelMetadata_PremiumModelStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotModelMetadata_PremiumModelStatus? valueOf($core.int value) => _byValue[value];

  const BotModelMetadata_PremiumModelStatus._($core.int v, $core.String n) : super(v, n);
}

class BotPluginMetadata_PluginType extends $pb.ProtobufEnum {
  static const BotPluginMetadata_PluginType UNKNOWN_PLUGIN = BotPluginMetadata_PluginType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_PLUGIN');
  static const BotPluginMetadata_PluginType REELS = BotPluginMetadata_PluginType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REELS');
  static const BotPluginMetadata_PluginType SEARCH = BotPluginMetadata_PluginType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEARCH');

  static const $core.List<BotPluginMetadata_PluginType> values = <BotPluginMetadata_PluginType> [
    UNKNOWN_PLUGIN,
    REELS,
    SEARCH,
  ];

  static final $core.Map<$core.int, BotPluginMetadata_PluginType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotPluginMetadata_PluginType? valueOf($core.int value) => _byValue[value];

  const BotPluginMetadata_PluginType._($core.int v, $core.String n) : super(v, n);
}

class BotPluginMetadata_SearchProvider extends $pb.ProtobufEnum {
  static const BotPluginMetadata_SearchProvider UNKNOWN = BotPluginMetadata_SearchProvider._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const BotPluginMetadata_SearchProvider BING = BotPluginMetadata_SearchProvider._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BING');
  static const BotPluginMetadata_SearchProvider GOOGLE = BotPluginMetadata_SearchProvider._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE');
  static const BotPluginMetadata_SearchProvider SUPPORT = BotPluginMetadata_SearchProvider._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUPPORT');

  static const $core.List<BotPluginMetadata_SearchProvider> values = <BotPluginMetadata_SearchProvider> [
    UNKNOWN,
    BING,
    GOOGLE,
    SUPPORT,
  ];

  static final $core.Map<$core.int, BotPluginMetadata_SearchProvider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotPluginMetadata_SearchProvider? valueOf($core.int value) => _byValue[value];

  const BotPluginMetadata_SearchProvider._($core.int v, $core.String n) : super(v, n);
}

class BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider extends $pb.ProtobufEnum {
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider UNKNOWN_PROVIDER = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_PROVIDER');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider OTHER = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTHER');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider GOOGLE = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider BING = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BING');

  static const $core.List<BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider> values = <BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider> [
    UNKNOWN_PROVIDER,
    OTHER,
    GOOGLE,
    BING,
  ];

  static final $core.Map<$core.int, BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider? valueOf($core.int value) => _byValue[value];

  const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotSearchSourceProvider._($core.int v, $core.String n) : super(v, n);
}

class BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus extends $pb.ProtobufEnum {
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus UNKNOWN = BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus PLANNED = BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLANNED');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus EXECUTING = BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXECUTING');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus FINISHED = BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FINISHED');

  static const $core.List<BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus> values = <BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus> [
    UNKNOWN,
    PLANNED,
    EXECUTING,
    FINISHED,
  ];

  static final $core.Map<$core.int, BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus? valueOf($core.int value) => _byValue[value];

  const BotProgressIndicatorMetadata_BotPlanningStepMetadata_PlanningStepStatus._($core.int v, $core.String n) : super(v, n);
}

class BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider extends $pb.ProtobufEnum {
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider UNKNOWN = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider OTHER = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTHER');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider GOOGLE = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE');
  static const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider BING = BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BING');

  static const $core.List<BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider> values = <BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider> [
    UNKNOWN,
    OTHER,
    GOOGLE,
    BING,
  ];

  static final $core.Map<$core.int, BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider? valueOf($core.int value) => _byValue[value];

  const BotProgressIndicatorMetadata_BotPlanningStepMetadata_BotPlanningSearchSourcesMetadata_BotPlanningSearchSourceProvider._($core.int v, $core.String n) : super(v, n);
}

class BotPromotionMessageMetadata_BotPromotionType extends $pb.ProtobufEnum {
  static const BotPromotionMessageMetadata_BotPromotionType UNKNOWN_TYPE = BotPromotionMessageMetadata_BotPromotionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_TYPE');
  static const BotPromotionMessageMetadata_BotPromotionType C50 = BotPromotionMessageMetadata_BotPromotionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'C50');
  static const BotPromotionMessageMetadata_BotPromotionType SURVEY_PLATFORM = BotPromotionMessageMetadata_BotPromotionType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SURVEY_PLATFORM');

  static const $core.List<BotPromotionMessageMetadata_BotPromotionType> values = <BotPromotionMessageMetadata_BotPromotionType> [
    UNKNOWN_TYPE,
    C50,
    SURVEY_PLATFORM,
  ];

  static final $core.Map<$core.int, BotPromotionMessageMetadata_BotPromotionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotPromotionMessageMetadata_BotPromotionType? valueOf($core.int value) => _byValue[value];

  const BotPromotionMessageMetadata_BotPromotionType._($core.int v, $core.String n) : super(v, n);
}

class BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType extends $pb.ProtobufEnum {
  static const BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType UNKNOWN_FEATURE = BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_FEATURE');
  static const BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType REASONING_FEATURE = BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REASONING_FEATURE');

  static const $core.List<BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType> values = <BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType> [
    UNKNOWN_FEATURE,
    REASONING_FEATURE,
  ];

  static final $core.Map<$core.int, BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType? valueOf($core.int value) => _byValue[value];

  const BotQuotaMetadata_BotFeatureQuotaMetadata_BotFeatureType._($core.int v, $core.String n) : super(v, n);
}

class BotReminderMetadata_ReminderAction extends $pb.ProtobufEnum {
  static const BotReminderMetadata_ReminderAction UNKNOWN_REMINDERACTION_ZERO = BotReminderMetadata_ReminderAction._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_REMINDERACTION_ZERO');
  static const BotReminderMetadata_ReminderAction NOTIFY = BotReminderMetadata_ReminderAction._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOTIFY');
  static const BotReminderMetadata_ReminderAction CREATE = BotReminderMetadata_ReminderAction._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CREATE');
  static const BotReminderMetadata_ReminderAction DELETE = BotReminderMetadata_ReminderAction._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETE');
  static const BotReminderMetadata_ReminderAction UPDATE = BotReminderMetadata_ReminderAction._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPDATE');

  static const $core.List<BotReminderMetadata_ReminderAction> values = <BotReminderMetadata_ReminderAction> [
    UNKNOWN_REMINDERACTION_ZERO,
    NOTIFY,
    CREATE,
    DELETE,
    UPDATE,
  ];

  static final $core.Map<$core.int, BotReminderMetadata_ReminderAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotReminderMetadata_ReminderAction? valueOf($core.int value) => _byValue[value];

  const BotReminderMetadata_ReminderAction._($core.int v, $core.String n) : super(v, n);
}

class BotReminderMetadata_ReminderFrequency extends $pb.ProtobufEnum {
  static const BotReminderMetadata_ReminderFrequency UNKNOWN_REMINDERFREQUENCY_ZERO = BotReminderMetadata_ReminderFrequency._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_REMINDERFREQUENCY_ZERO');
  static const BotReminderMetadata_ReminderFrequency ONCE = BotReminderMetadata_ReminderFrequency._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ONCE');
  static const BotReminderMetadata_ReminderFrequency DAILY = BotReminderMetadata_ReminderFrequency._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DAILY');
  static const BotReminderMetadata_ReminderFrequency WEEKLY = BotReminderMetadata_ReminderFrequency._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEEKLY');
  static const BotReminderMetadata_ReminderFrequency BIWEEKLY = BotReminderMetadata_ReminderFrequency._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIWEEKLY');
  static const BotReminderMetadata_ReminderFrequency MONTHLY = BotReminderMetadata_ReminderFrequency._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MONTHLY');

  static const $core.List<BotReminderMetadata_ReminderFrequency> values = <BotReminderMetadata_ReminderFrequency> [
    UNKNOWN_REMINDERFREQUENCY_ZERO,
    ONCE,
    DAILY,
    WEEKLY,
    BIWEEKLY,
    MONTHLY,
  ];

  static final $core.Map<$core.int, BotReminderMetadata_ReminderFrequency> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotReminderMetadata_ReminderFrequency? valueOf($core.int value) => _byValue[value];

  const BotReminderMetadata_ReminderFrequency._($core.int v, $core.String n) : super(v, n);
}

class BotSignatureVerificationUseCaseProof_BotSignatureUseCase extends $pb.ProtobufEnum {
  static const BotSignatureVerificationUseCaseProof_BotSignatureUseCase UNSPECIFIED = BotSignatureVerificationUseCaseProof_BotSignatureUseCase._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSPECIFIED');
  static const BotSignatureVerificationUseCaseProof_BotSignatureUseCase WA_BOT_MSG = BotSignatureVerificationUseCaseProof_BotSignatureUseCase._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA_BOT_MSG');

  static const $core.List<BotSignatureVerificationUseCaseProof_BotSignatureUseCase> values = <BotSignatureVerificationUseCaseProof_BotSignatureUseCase> [
    UNSPECIFIED,
    WA_BOT_MSG,
  ];

  static final $core.Map<$core.int, BotSignatureVerificationUseCaseProof_BotSignatureUseCase> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotSignatureVerificationUseCaseProof_BotSignatureUseCase? valueOf($core.int value) => _byValue[value];

  const BotSignatureVerificationUseCaseProof_BotSignatureUseCase._($core.int v, $core.String n) : super(v, n);
}

class BotSourcesMetadata_BotSourceItem_SourceProvider extends $pb.ProtobufEnum {
  static const BotSourcesMetadata_BotSourceItem_SourceProvider UNKNOWN = BotSourcesMetadata_BotSourceItem_SourceProvider._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const BotSourcesMetadata_BotSourceItem_SourceProvider BING = BotSourcesMetadata_BotSourceItem_SourceProvider._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BING');
  static const BotSourcesMetadata_BotSourceItem_SourceProvider GOOGLE = BotSourcesMetadata_BotSourceItem_SourceProvider._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE');
  static const BotSourcesMetadata_BotSourceItem_SourceProvider SUPPORT = BotSourcesMetadata_BotSourceItem_SourceProvider._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUPPORT');
  static const BotSourcesMetadata_BotSourceItem_SourceProvider OTHER = BotSourcesMetadata_BotSourceItem_SourceProvider._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OTHER');

  static const $core.List<BotSourcesMetadata_BotSourceItem_SourceProvider> values = <BotSourcesMetadata_BotSourceItem_SourceProvider> [
    UNKNOWN,
    BING,
    GOOGLE,
    SUPPORT,
    OTHER,
  ];

  static final $core.Map<$core.int, BotSourcesMetadata_BotSourceItem_SourceProvider> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BotSourcesMetadata_BotSourceItem_SourceProvider? valueOf($core.int value) => _byValue[value];

  const BotSourcesMetadata_BotSourceItem_SourceProvider._($core.int v, $core.String n) : super(v, n);
}

class CallLogRecord_CallResult extends $pb.ProtobufEnum {
  static const CallLogRecord_CallResult CONNECTED = CallLogRecord_CallResult._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONNECTED');
  static const CallLogRecord_CallResult REJECTED = CallLogRecord_CallResult._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REJECTED');
  static const CallLogRecord_CallResult CANCELLED = CallLogRecord_CallResult._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCELLED');
  static const CallLogRecord_CallResult ACCEPTEDELSEWHERE = CallLogRecord_CallResult._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCEPTEDELSEWHERE');
  static const CallLogRecord_CallResult MISSED = CallLogRecord_CallResult._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MISSED');
  static const CallLogRecord_CallResult INVALID = CallLogRecord_CallResult._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID');
  static const CallLogRecord_CallResult UNAVAILABLE = CallLogRecord_CallResult._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNAVAILABLE');
  static const CallLogRecord_CallResult UPCOMING = CallLogRecord_CallResult._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPCOMING');
  static const CallLogRecord_CallResult FAILED = CallLogRecord_CallResult._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED');
  static const CallLogRecord_CallResult ABANDONED = CallLogRecord_CallResult._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ABANDONED');
  static const CallLogRecord_CallResult ONGOING = CallLogRecord_CallResult._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ONGOING');

  static const $core.List<CallLogRecord_CallResult> values = <CallLogRecord_CallResult> [
    CONNECTED,
    REJECTED,
    CANCELLED,
    ACCEPTEDELSEWHERE,
    MISSED,
    INVALID,
    UNAVAILABLE,
    UPCOMING,
    FAILED,
    ABANDONED,
    ONGOING,
  ];

  static final $core.Map<$core.int, CallLogRecord_CallResult> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CallLogRecord_CallResult? valueOf($core.int value) => _byValue[value];

  const CallLogRecord_CallResult._($core.int v, $core.String n) : super(v, n);
}

class CallLogRecord_CallType extends $pb.ProtobufEnum {
  static const CallLogRecord_CallType REGULAR = CallLogRecord_CallType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGULAR');
  static const CallLogRecord_CallType SCHEDULED_CALL = CallLogRecord_CallType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED_CALL');
  static const CallLogRecord_CallType VOICE_CHAT = CallLogRecord_CallType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOICE_CHAT');

  static const $core.List<CallLogRecord_CallType> values = <CallLogRecord_CallType> [
    REGULAR,
    SCHEDULED_CALL,
    VOICE_CHAT,
  ];

  static final $core.Map<$core.int, CallLogRecord_CallType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CallLogRecord_CallType? valueOf($core.int value) => _byValue[value];

  const CallLogRecord_CallType._($core.int v, $core.String n) : super(v, n);
}

class CallLogRecord_SilenceReason extends $pb.ProtobufEnum {
  static const CallLogRecord_SilenceReason NONE = CallLogRecord_SilenceReason._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const CallLogRecord_SilenceReason SCHEDULED = CallLogRecord_SilenceReason._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED');
  static const CallLogRecord_SilenceReason PRIVACY = CallLogRecord_SilenceReason._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRIVACY');
  static const CallLogRecord_SilenceReason LIGHTWEIGHT = CallLogRecord_SilenceReason._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LIGHTWEIGHT');

  static const $core.List<CallLogRecord_SilenceReason> values = <CallLogRecord_SilenceReason> [
    NONE,
    SCHEDULED,
    PRIVACY,
    LIGHTWEIGHT,
  ];

  static final $core.Map<$core.int, CallLogRecord_SilenceReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CallLogRecord_SilenceReason? valueOf($core.int value) => _byValue[value];

  const CallLogRecord_SilenceReason._($core.int v, $core.String n) : super(v, n);
}

class ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType extends $pb.ProtobufEnum {
  static const ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType NONE = ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType IMAGE = ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType VIDEO = ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');

  static const $core.List<ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType> values = <ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType> [
    NONE,
    IMAGE,
    VIDEO,
  ];

  static final $core.Map<$core.int, ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType? valueOf($core.int value) => _byValue[value];

  const ChatRowOpaqueData_DraftMessage_CtwaContextData_ContextInfoExternalAdReplyInfoMediaType._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_AccountType extends $pb.ProtobufEnum {
  static const ClientPayload_AccountType DEFAULT = ClientPayload_AccountType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');
  static const ClientPayload_AccountType GUEST = ClientPayload_AccountType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GUEST');

  static const $core.List<ClientPayload_AccountType> values = <ClientPayload_AccountType> [
    DEFAULT,
    GUEST,
  ];

  static final $core.Map<$core.int, ClientPayload_AccountType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_AccountType? valueOf($core.int value) => _byValue[value];

  const ClientPayload_AccountType._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_ConnectReason extends $pb.ProtobufEnum {
  static const ClientPayload_ConnectReason PUSH = ClientPayload_ConnectReason._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUSH');
  static const ClientPayload_ConnectReason USER_ACTIVATED = ClientPayload_ConnectReason._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_ACTIVATED');
  static const ClientPayload_ConnectReason SCHEDULED = ClientPayload_ConnectReason._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED');
  static const ClientPayload_ConnectReason ERROR_RECONNECT = ClientPayload_ConnectReason._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERROR_RECONNECT');
  static const ClientPayload_ConnectReason NETWORK_SWITCH = ClientPayload_ConnectReason._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NETWORK_SWITCH');
  static const ClientPayload_ConnectReason PING_RECONNECT = ClientPayload_ConnectReason._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PING_RECONNECT');
  static const ClientPayload_ConnectReason UNKNOWN = ClientPayload_ConnectReason._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');

  static const $core.List<ClientPayload_ConnectReason> values = <ClientPayload_ConnectReason> [
    PUSH,
    USER_ACTIVATED,
    SCHEDULED,
    ERROR_RECONNECT,
    NETWORK_SWITCH,
    PING_RECONNECT,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, ClientPayload_ConnectReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_ConnectReason? valueOf($core.int value) => _byValue[value];

  const ClientPayload_ConnectReason._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_ConnectType extends $pb.ProtobufEnum {
  static const ClientPayload_ConnectType CELLULAR_UNKNOWN = ClientPayload_ConnectType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_UNKNOWN');
  static const ClientPayload_ConnectType WIFI_UNKNOWN = ClientPayload_ConnectType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WIFI_UNKNOWN');
  static const ClientPayload_ConnectType CELLULAR_EDGE = ClientPayload_ConnectType._(100, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_EDGE');
  static const ClientPayload_ConnectType CELLULAR_IDEN = ClientPayload_ConnectType._(101, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_IDEN');
  static const ClientPayload_ConnectType CELLULAR_UMTS = ClientPayload_ConnectType._(102, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_UMTS');
  static const ClientPayload_ConnectType CELLULAR_EVDO = ClientPayload_ConnectType._(103, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_EVDO');
  static const ClientPayload_ConnectType CELLULAR_GPRS = ClientPayload_ConnectType._(104, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_GPRS');
  static const ClientPayload_ConnectType CELLULAR_HSDPA = ClientPayload_ConnectType._(105, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_HSDPA');
  static const ClientPayload_ConnectType CELLULAR_HSUPA = ClientPayload_ConnectType._(106, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_HSUPA');
  static const ClientPayload_ConnectType CELLULAR_HSPA = ClientPayload_ConnectType._(107, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_HSPA');
  static const ClientPayload_ConnectType CELLULAR_CDMA = ClientPayload_ConnectType._(108, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_CDMA');
  static const ClientPayload_ConnectType CELLULAR_1XRTT = ClientPayload_ConnectType._(109, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_1XRTT');
  static const ClientPayload_ConnectType CELLULAR_EHRPD = ClientPayload_ConnectType._(110, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_EHRPD');
  static const ClientPayload_ConnectType CELLULAR_LTE = ClientPayload_ConnectType._(111, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_LTE');
  static const ClientPayload_ConnectType CELLULAR_HSPAP = ClientPayload_ConnectType._(112, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CELLULAR_HSPAP');

  static const $core.List<ClientPayload_ConnectType> values = <ClientPayload_ConnectType> [
    CELLULAR_UNKNOWN,
    WIFI_UNKNOWN,
    CELLULAR_EDGE,
    CELLULAR_IDEN,
    CELLULAR_UMTS,
    CELLULAR_EVDO,
    CELLULAR_GPRS,
    CELLULAR_HSDPA,
    CELLULAR_HSUPA,
    CELLULAR_HSPA,
    CELLULAR_CDMA,
    CELLULAR_1XRTT,
    CELLULAR_EHRPD,
    CELLULAR_LTE,
    CELLULAR_HSPAP,
  ];

  static final $core.Map<$core.int, ClientPayload_ConnectType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_ConnectType? valueOf($core.int value) => _byValue[value];

  const ClientPayload_ConnectType._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_IOSAppExtension extends $pb.ProtobufEnum {
  static const ClientPayload_IOSAppExtension SHARE_EXTENSION = ClientPayload_IOSAppExtension._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHARE_EXTENSION');
  static const ClientPayload_IOSAppExtension SERVICE_EXTENSION = ClientPayload_IOSAppExtension._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SERVICE_EXTENSION');
  static const ClientPayload_IOSAppExtension INTENTS_EXTENSION = ClientPayload_IOSAppExtension._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTENTS_EXTENSION');

  static const $core.List<ClientPayload_IOSAppExtension> values = <ClientPayload_IOSAppExtension> [
    SHARE_EXTENSION,
    SERVICE_EXTENSION,
    INTENTS_EXTENSION,
  ];

  static final $core.Map<$core.int, ClientPayload_IOSAppExtension> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_IOSAppExtension? valueOf($core.int value) => _byValue[value];

  const ClientPayload_IOSAppExtension._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_Product extends $pb.ProtobufEnum {
  static const ClientPayload_Product WHATSAPP = ClientPayload_Product._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WHATSAPP');
  static const ClientPayload_Product MESSENGER = ClientPayload_Product._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSENGER');
  static const ClientPayload_Product INTEROP = ClientPayload_Product._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTEROP');
  static const ClientPayload_Product INTEROP_MSGR = ClientPayload_Product._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTEROP_MSGR');
  static const ClientPayload_Product WHATSAPP_LID = ClientPayload_Product._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WHATSAPP_LID');

  static const $core.List<ClientPayload_Product> values = <ClientPayload_Product> [
    WHATSAPP,
    MESSENGER,
    INTEROP,
    INTEROP_MSGR,
    WHATSAPP_LID,
  ];

  static final $core.Map<$core.int, ClientPayload_Product> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_Product? valueOf($core.int value) => _byValue[value];

  const ClientPayload_Product._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_TrafficAnonymization extends $pb.ProtobufEnum {
  static const ClientPayload_TrafficAnonymization OFF = ClientPayload_TrafficAnonymization._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OFF');
  static const ClientPayload_TrafficAnonymization STANDARD = ClientPayload_TrafficAnonymization._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STANDARD');

  static const $core.List<ClientPayload_TrafficAnonymization> values = <ClientPayload_TrafficAnonymization> [
    OFF,
    STANDARD,
  ];

  static final $core.Map<$core.int, ClientPayload_TrafficAnonymization> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_TrafficAnonymization? valueOf($core.int value) => _byValue[value];

  const ClientPayload_TrafficAnonymization._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_DNSSource_DNSResolutionMethod extends $pb.ProtobufEnum {
  static const ClientPayload_DNSSource_DNSResolutionMethod SYSTEM = ClientPayload_DNSSource_DNSResolutionMethod._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYSTEM');
  static const ClientPayload_DNSSource_DNSResolutionMethod GOOGLE = ClientPayload_DNSSource_DNSResolutionMethod._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE');
  static const ClientPayload_DNSSource_DNSResolutionMethod HARDCODED = ClientPayload_DNSSource_DNSResolutionMethod._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HARDCODED');
  static const ClientPayload_DNSSource_DNSResolutionMethod OVERRIDE = ClientPayload_DNSSource_DNSResolutionMethod._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OVERRIDE');
  static const ClientPayload_DNSSource_DNSResolutionMethod FALLBACK = ClientPayload_DNSSource_DNSResolutionMethod._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FALLBACK');
  static const ClientPayload_DNSSource_DNSResolutionMethod MNS = ClientPayload_DNSSource_DNSResolutionMethod._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MNS');

  static const $core.List<ClientPayload_DNSSource_DNSResolutionMethod> values = <ClientPayload_DNSSource_DNSResolutionMethod> [
    SYSTEM,
    GOOGLE,
    HARDCODED,
    OVERRIDE,
    FALLBACK,
    MNS,
  ];

  static final $core.Map<$core.int, ClientPayload_DNSSource_DNSResolutionMethod> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_DNSSource_DNSResolutionMethod? valueOf($core.int value) => _byValue[value];

  const ClientPayload_DNSSource_DNSResolutionMethod._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_UserAgent_DeviceType extends $pb.ProtobufEnum {
  static const ClientPayload_UserAgent_DeviceType PHONE = ClientPayload_UserAgent_DeviceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHONE');
  static const ClientPayload_UserAgent_DeviceType TABLET = ClientPayload_UserAgent_DeviceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TABLET');
  static const ClientPayload_UserAgent_DeviceType DESKTOP = ClientPayload_UserAgent_DeviceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DESKTOP');
  static const ClientPayload_UserAgent_DeviceType WEARABLE = ClientPayload_UserAgent_DeviceType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEARABLE');
  static const ClientPayload_UserAgent_DeviceType VR = ClientPayload_UserAgent_DeviceType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VR');

  static const $core.List<ClientPayload_UserAgent_DeviceType> values = <ClientPayload_UserAgent_DeviceType> [
    PHONE,
    TABLET,
    DESKTOP,
    WEARABLE,
    VR,
  ];

  static final $core.Map<$core.int, ClientPayload_UserAgent_DeviceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_UserAgent_DeviceType? valueOf($core.int value) => _byValue[value];

  const ClientPayload_UserAgent_DeviceType._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_UserAgent_Platform extends $pb.ProtobufEnum {
  static const ClientPayload_UserAgent_Platform ANDROID = ClientPayload_UserAgent_Platform._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANDROID');
  static const ClientPayload_UserAgent_Platform IOS = ClientPayload_UserAgent_Platform._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IOS');
  static const ClientPayload_UserAgent_Platform WINDOWS_PHONE = ClientPayload_UserAgent_Platform._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WINDOWS_PHONE');
  static const ClientPayload_UserAgent_Platform BLACKBERRY = ClientPayload_UserAgent_Platform._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLACKBERRY');
  static const ClientPayload_UserAgent_Platform BLACKBERRYX = ClientPayload_UserAgent_Platform._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLACKBERRYX');
  static const ClientPayload_UserAgent_Platform S40 = ClientPayload_UserAgent_Platform._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S40');
  static const ClientPayload_UserAgent_Platform S60 = ClientPayload_UserAgent_Platform._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'S60');
  static const ClientPayload_UserAgent_Platform PYTHON_CLIENT = ClientPayload_UserAgent_Platform._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PYTHON_CLIENT');
  static const ClientPayload_UserAgent_Platform TIZEN = ClientPayload_UserAgent_Platform._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIZEN');
  static const ClientPayload_UserAgent_Platform ENTERPRISE = ClientPayload_UserAgent_Platform._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ENTERPRISE');
  static const ClientPayload_UserAgent_Platform SMB_ANDROID = ClientPayload_UserAgent_Platform._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SMB_ANDROID');
  static const ClientPayload_UserAgent_Platform KAIOS = ClientPayload_UserAgent_Platform._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KAIOS');
  static const ClientPayload_UserAgent_Platform SMB_IOS = ClientPayload_UserAgent_Platform._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SMB_IOS');
  static const ClientPayload_UserAgent_Platform WINDOWS = ClientPayload_UserAgent_Platform._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WINDOWS');
  static const ClientPayload_UserAgent_Platform WEB = ClientPayload_UserAgent_Platform._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEB');
  static const ClientPayload_UserAgent_Platform PORTAL = ClientPayload_UserAgent_Platform._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PORTAL');
  static const ClientPayload_UserAgent_Platform GREEN_ANDROID = ClientPayload_UserAgent_Platform._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GREEN_ANDROID');
  static const ClientPayload_UserAgent_Platform GREEN_IPHONE = ClientPayload_UserAgent_Platform._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GREEN_IPHONE');
  static const ClientPayload_UserAgent_Platform BLUE_ANDROID = ClientPayload_UserAgent_Platform._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_ANDROID');
  static const ClientPayload_UserAgent_Platform BLUE_IPHONE = ClientPayload_UserAgent_Platform._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_IPHONE');
  static const ClientPayload_UserAgent_Platform FBLITE_ANDROID = ClientPayload_UserAgent_Platform._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FBLITE_ANDROID');
  static const ClientPayload_UserAgent_Platform MLITE_ANDROID = ClientPayload_UserAgent_Platform._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MLITE_ANDROID');
  static const ClientPayload_UserAgent_Platform IGLITE_ANDROID = ClientPayload_UserAgent_Platform._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IGLITE_ANDROID');
  static const ClientPayload_UserAgent_Platform PAGE = ClientPayload_UserAgent_Platform._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAGE');
  static const ClientPayload_UserAgent_Platform MACOS = ClientPayload_UserAgent_Platform._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MACOS');
  static const ClientPayload_UserAgent_Platform OCULUS_MSG = ClientPayload_UserAgent_Platform._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OCULUS_MSG');
  static const ClientPayload_UserAgent_Platform OCULUS_CALL = ClientPayload_UserAgent_Platform._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OCULUS_CALL');
  static const ClientPayload_UserAgent_Platform MILAN = ClientPayload_UserAgent_Platform._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MILAN');
  static const ClientPayload_UserAgent_Platform CAPI = ClientPayload_UserAgent_Platform._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAPI');
  static const ClientPayload_UserAgent_Platform WEAROS = ClientPayload_UserAgent_Platform._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEAROS');
  static const ClientPayload_UserAgent_Platform ARDEVICE = ClientPayload_UserAgent_Platform._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ARDEVICE');
  static const ClientPayload_UserAgent_Platform VRDEVICE = ClientPayload_UserAgent_Platform._(31, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VRDEVICE');
  static const ClientPayload_UserAgent_Platform BLUE_WEB = ClientPayload_UserAgent_Platform._(32, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_WEB');
  static const ClientPayload_UserAgent_Platform IPAD = ClientPayload_UserAgent_Platform._(33, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IPAD');
  static const ClientPayload_UserAgent_Platform TEST = ClientPayload_UserAgent_Platform._(34, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEST');
  static const ClientPayload_UserAgent_Platform SMART_GLASSES = ClientPayload_UserAgent_Platform._(35, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SMART_GLASSES');
  static const ClientPayload_UserAgent_Platform BLUE_VR = ClientPayload_UserAgent_Platform._(36, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_VR');
  static const ClientPayload_UserAgent_Platform AR_WRIST = ClientPayload_UserAgent_Platform._(37, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AR_WRIST');

  static const $core.List<ClientPayload_UserAgent_Platform> values = <ClientPayload_UserAgent_Platform> [
    ANDROID,
    IOS,
    WINDOWS_PHONE,
    BLACKBERRY,
    BLACKBERRYX,
    S40,
    S60,
    PYTHON_CLIENT,
    TIZEN,
    ENTERPRISE,
    SMB_ANDROID,
    KAIOS,
    SMB_IOS,
    WINDOWS,
    WEB,
    PORTAL,
    GREEN_ANDROID,
    GREEN_IPHONE,
    BLUE_ANDROID,
    BLUE_IPHONE,
    FBLITE_ANDROID,
    MLITE_ANDROID,
    IGLITE_ANDROID,
    PAGE,
    MACOS,
    OCULUS_MSG,
    OCULUS_CALL,
    MILAN,
    CAPI,
    WEAROS,
    ARDEVICE,
    VRDEVICE,
    BLUE_WEB,
    IPAD,
    TEST,
    SMART_GLASSES,
    BLUE_VR,
    AR_WRIST,
  ];

  static final $core.Map<$core.int, ClientPayload_UserAgent_Platform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_UserAgent_Platform? valueOf($core.int value) => _byValue[value];

  const ClientPayload_UserAgent_Platform._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_UserAgent_ReleaseChannel extends $pb.ProtobufEnum {
  static const ClientPayload_UserAgent_ReleaseChannel RELEASE = ClientPayload_UserAgent_ReleaseChannel._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RELEASE');
  static const ClientPayload_UserAgent_ReleaseChannel BETA = ClientPayload_UserAgent_ReleaseChannel._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BETA');
  static const ClientPayload_UserAgent_ReleaseChannel ALPHA = ClientPayload_UserAgent_ReleaseChannel._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALPHA');
  static const ClientPayload_UserAgent_ReleaseChannel DEBUG = ClientPayload_UserAgent_ReleaseChannel._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEBUG');

  static const $core.List<ClientPayload_UserAgent_ReleaseChannel> values = <ClientPayload_UserAgent_ReleaseChannel> [
    RELEASE,
    BETA,
    ALPHA,
    DEBUG,
  ];

  static final $core.Map<$core.int, ClientPayload_UserAgent_ReleaseChannel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_UserAgent_ReleaseChannel? valueOf($core.int value) => _byValue[value];

  const ClientPayload_UserAgent_ReleaseChannel._($core.int v, $core.String n) : super(v, n);
}

class ClientPayload_WebInfo_WebSubPlatform extends $pb.ProtobufEnum {
  static const ClientPayload_WebInfo_WebSubPlatform WEB_BROWSER = ClientPayload_WebInfo_WebSubPlatform._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEB_BROWSER');
  static const ClientPayload_WebInfo_WebSubPlatform APP_STORE = ClientPayload_WebInfo_WebSubPlatform._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APP_STORE');
  static const ClientPayload_WebInfo_WebSubPlatform WIN_STORE = ClientPayload_WebInfo_WebSubPlatform._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WIN_STORE');
  static const ClientPayload_WebInfo_WebSubPlatform DARWIN = ClientPayload_WebInfo_WebSubPlatform._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DARWIN');
  static const ClientPayload_WebInfo_WebSubPlatform WIN32 = ClientPayload_WebInfo_WebSubPlatform._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WIN32');
  static const ClientPayload_WebInfo_WebSubPlatform WIN_HYBRID = ClientPayload_WebInfo_WebSubPlatform._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WIN_HYBRID');

  static const $core.List<ClientPayload_WebInfo_WebSubPlatform> values = <ClientPayload_WebInfo_WebSubPlatform> [
    WEB_BROWSER,
    APP_STORE,
    WIN_STORE,
    DARWIN,
    WIN32,
    WIN_HYBRID,
  ];

  static final $core.Map<$core.int, ClientPayload_WebInfo_WebSubPlatform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientPayload_WebInfo_WebSubPlatform? valueOf($core.int value) => _byValue[value];

  const ClientPayload_WebInfo_WebSubPlatform._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_ForwardOrigin extends $pb.ProtobufEnum {
  static const ContextInfo_ForwardOrigin UNKNOWN = ContextInfo_ForwardOrigin._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const ContextInfo_ForwardOrigin CHAT = ContextInfo_ForwardOrigin._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT');
  static const ContextInfo_ForwardOrigin STATUS = ContextInfo_ForwardOrigin._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS');
  static const ContextInfo_ForwardOrigin CHANNELS = ContextInfo_ForwardOrigin._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANNELS');
  static const ContextInfo_ForwardOrigin META_AI = ContextInfo_ForwardOrigin._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'META_AI');
  static const ContextInfo_ForwardOrigin UGC = ContextInfo_ForwardOrigin._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UGC');

  static const $core.List<ContextInfo_ForwardOrigin> values = <ContextInfo_ForwardOrigin> [
    UNKNOWN,
    CHAT,
    STATUS,
    CHANNELS,
    META_AI,
    UGC,
  ];

  static final $core.Map<$core.int, ContextInfo_ForwardOrigin> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_ForwardOrigin? valueOf($core.int value) => _byValue[value];

  const ContextInfo_ForwardOrigin._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_PairedMediaType extends $pb.ProtobufEnum {
  static const ContextInfo_PairedMediaType NOT_PAIRED_MEDIA = ContextInfo_PairedMediaType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_PAIRED_MEDIA');
  static const ContextInfo_PairedMediaType SD_VIDEO_PARENT = ContextInfo_PairedMediaType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SD_VIDEO_PARENT');
  static const ContextInfo_PairedMediaType HD_VIDEO_CHILD = ContextInfo_PairedMediaType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HD_VIDEO_CHILD');
  static const ContextInfo_PairedMediaType SD_IMAGE_PARENT = ContextInfo_PairedMediaType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SD_IMAGE_PARENT');
  static const ContextInfo_PairedMediaType HD_IMAGE_CHILD = ContextInfo_PairedMediaType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HD_IMAGE_CHILD');
  static const ContextInfo_PairedMediaType MOTION_PHOTO_PARENT = ContextInfo_PairedMediaType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MOTION_PHOTO_PARENT');
  static const ContextInfo_PairedMediaType MOTION_PHOTO_CHILD = ContextInfo_PairedMediaType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MOTION_PHOTO_CHILD');
  static const ContextInfo_PairedMediaType HEVC_VIDEO_PARENT = ContextInfo_PairedMediaType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HEVC_VIDEO_PARENT');
  static const ContextInfo_PairedMediaType HEVC_VIDEO_CHILD = ContextInfo_PairedMediaType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HEVC_VIDEO_CHILD');

  static const $core.List<ContextInfo_PairedMediaType> values = <ContextInfo_PairedMediaType> [
    NOT_PAIRED_MEDIA,
    SD_VIDEO_PARENT,
    HD_VIDEO_CHILD,
    SD_IMAGE_PARENT,
    HD_IMAGE_CHILD,
    MOTION_PHOTO_PARENT,
    MOTION_PHOTO_CHILD,
    HEVC_VIDEO_PARENT,
    HEVC_VIDEO_CHILD,
  ];

  static final $core.Map<$core.int, ContextInfo_PairedMediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_PairedMediaType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_PairedMediaType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_QuotedType extends $pb.ProtobufEnum {
  static const ContextInfo_QuotedType EXPLICIT = ContextInfo_QuotedType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXPLICIT');
  static const ContextInfo_QuotedType AUTO = ContextInfo_QuotedType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTO');

  static const $core.List<ContextInfo_QuotedType> values = <ContextInfo_QuotedType> [
    EXPLICIT,
    AUTO,
  ];

  static final $core.Map<$core.int, ContextInfo_QuotedType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_QuotedType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_QuotedType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_StatusAttributionType extends $pb.ProtobufEnum {
  static const ContextInfo_StatusAttributionType NONE = ContextInfo_StatusAttributionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const ContextInfo_StatusAttributionType RESHARED_FROM_MENTION = ContextInfo_StatusAttributionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RESHARED_FROM_MENTION');
  static const ContextInfo_StatusAttributionType RESHARED_FROM_POST = ContextInfo_StatusAttributionType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RESHARED_FROM_POST');
  static const ContextInfo_StatusAttributionType RESHARED_FROM_POST_MANY_TIMES = ContextInfo_StatusAttributionType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RESHARED_FROM_POST_MANY_TIMES');
  static const ContextInfo_StatusAttributionType FORWARDED_FROM_STATUS = ContextInfo_StatusAttributionType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FORWARDED_FROM_STATUS');

  static const $core.List<ContextInfo_StatusAttributionType> values = <ContextInfo_StatusAttributionType> [
    NONE,
    RESHARED_FROM_MENTION,
    RESHARED_FROM_POST,
    RESHARED_FROM_POST_MANY_TIMES,
    FORWARDED_FROM_STATUS,
  ];

  static final $core.Map<$core.int, ContextInfo_StatusAttributionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_StatusAttributionType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_StatusAttributionType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_StatusSourceType extends $pb.ProtobufEnum {
  static const ContextInfo_StatusSourceType IMAGE = ContextInfo_StatusSourceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const ContextInfo_StatusSourceType VIDEO = ContextInfo_StatusSourceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');
  static const ContextInfo_StatusSourceType GIF = ContextInfo_StatusSourceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIF');
  static const ContextInfo_StatusSourceType AUDIO = ContextInfo_StatusSourceType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUDIO');
  static const ContextInfo_StatusSourceType TEXT = ContextInfo_StatusSourceType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEXT');
  static const ContextInfo_StatusSourceType MUSIC_STANDALONE = ContextInfo_StatusSourceType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUSIC_STANDALONE');

  static const $core.List<ContextInfo_StatusSourceType> values = <ContextInfo_StatusSourceType> [
    IMAGE,
    VIDEO,
    GIF,
    AUDIO,
    TEXT,
    MUSIC_STANDALONE,
  ];

  static final $core.Map<$core.int, ContextInfo_StatusSourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_StatusSourceType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_StatusSourceType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_AdReplyInfo_MediaType extends $pb.ProtobufEnum {
  static const ContextInfo_AdReplyInfo_MediaType NONE = ContextInfo_AdReplyInfo_MediaType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const ContextInfo_AdReplyInfo_MediaType IMAGE = ContextInfo_AdReplyInfo_MediaType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const ContextInfo_AdReplyInfo_MediaType VIDEO = ContextInfo_AdReplyInfo_MediaType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');

  static const $core.List<ContextInfo_AdReplyInfo_MediaType> values = <ContextInfo_AdReplyInfo_MediaType> [
    NONE,
    IMAGE,
    VIDEO,
  ];

  static final $core.Map<$core.int, ContextInfo_AdReplyInfo_MediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_AdReplyInfo_MediaType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_AdReplyInfo_MediaType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_DataSharingContext_DataSharingFlags extends $pb.ProtobufEnum {
  static const ContextInfo_DataSharingContext_DataSharingFlags UNKNOWN_DATASHARINGFLAGS_ZERO = ContextInfo_DataSharingContext_DataSharingFlags._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_DATASHARINGFLAGS_ZERO');
  static const ContextInfo_DataSharingContext_DataSharingFlags SHOW_MM_DISCLOSURE_ON_CLICK = ContextInfo_DataSharingContext_DataSharingFlags._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHOW_MM_DISCLOSURE_ON_CLICK');
  static const ContextInfo_DataSharingContext_DataSharingFlags SHOW_MM_DISCLOSURE_ON_READ = ContextInfo_DataSharingContext_DataSharingFlags._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHOW_MM_DISCLOSURE_ON_READ');

  static const $core.List<ContextInfo_DataSharingContext_DataSharingFlags> values = <ContextInfo_DataSharingContext_DataSharingFlags> [
    UNKNOWN_DATASHARINGFLAGS_ZERO,
    SHOW_MM_DISCLOSURE_ON_CLICK,
    SHOW_MM_DISCLOSURE_ON_READ,
  ];

  static final $core.Map<$core.int, ContextInfo_DataSharingContext_DataSharingFlags> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_DataSharingContext_DataSharingFlags? valueOf($core.int value) => _byValue[value];

  const ContextInfo_DataSharingContext_DataSharingFlags._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_ExternalAdReplyInfo_AdType extends $pb.ProtobufEnum {
  static const ContextInfo_ExternalAdReplyInfo_AdType CTWA = ContextInfo_ExternalAdReplyInfo_AdType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CTWA');
  static const ContextInfo_ExternalAdReplyInfo_AdType CAWC = ContextInfo_ExternalAdReplyInfo_AdType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAWC');

  static const $core.List<ContextInfo_ExternalAdReplyInfo_AdType> values = <ContextInfo_ExternalAdReplyInfo_AdType> [
    CTWA,
    CAWC,
  ];

  static final $core.Map<$core.int, ContextInfo_ExternalAdReplyInfo_AdType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_ExternalAdReplyInfo_AdType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_ExternalAdReplyInfo_AdType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_ExternalAdReplyInfo_MediaType extends $pb.ProtobufEnum {
  static const ContextInfo_ExternalAdReplyInfo_MediaType NONE = ContextInfo_ExternalAdReplyInfo_MediaType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const ContextInfo_ExternalAdReplyInfo_MediaType IMAGE = ContextInfo_ExternalAdReplyInfo_MediaType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const ContextInfo_ExternalAdReplyInfo_MediaType VIDEO = ContextInfo_ExternalAdReplyInfo_MediaType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');

  static const $core.List<ContextInfo_ExternalAdReplyInfo_MediaType> values = <ContextInfo_ExternalAdReplyInfo_MediaType> [
    NONE,
    IMAGE,
    VIDEO,
  ];

  static final $core.Map<$core.int, ContextInfo_ExternalAdReplyInfo_MediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_ExternalAdReplyInfo_MediaType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_ExternalAdReplyInfo_MediaType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_ForwardedNewsletterMessageInfo_ContentType extends $pb.ProtobufEnum {
  static const ContextInfo_ForwardedNewsletterMessageInfo_ContentType UNKNOWN_CONTENTTYPE_ZERO = ContextInfo_ForwardedNewsletterMessageInfo_ContentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_CONTENTTYPE_ZERO');
  static const ContextInfo_ForwardedNewsletterMessageInfo_ContentType UPDATE = ContextInfo_ForwardedNewsletterMessageInfo_ContentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPDATE');
  static const ContextInfo_ForwardedNewsletterMessageInfo_ContentType UPDATE_CARD = ContextInfo_ForwardedNewsletterMessageInfo_ContentType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPDATE_CARD');
  static const ContextInfo_ForwardedNewsletterMessageInfo_ContentType LINK_CARD = ContextInfo_ForwardedNewsletterMessageInfo_ContentType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LINK_CARD');

  static const $core.List<ContextInfo_ForwardedNewsletterMessageInfo_ContentType> values = <ContextInfo_ForwardedNewsletterMessageInfo_ContentType> [
    UNKNOWN_CONTENTTYPE_ZERO,
    UPDATE,
    UPDATE_CARD,
    LINK_CARD,
  ];

  static final $core.Map<$core.int, ContextInfo_ForwardedNewsletterMessageInfo_ContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_ForwardedNewsletterMessageInfo_ContentType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_ForwardedNewsletterMessageInfo_ContentType._($core.int v, $core.String n) : super(v, n);
}

class ContextInfo_StatusAudienceMetadata_AudienceType extends $pb.ProtobufEnum {
  static const ContextInfo_StatusAudienceMetadata_AudienceType UNKNOWN = ContextInfo_StatusAudienceMetadata_AudienceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const ContextInfo_StatusAudienceMetadata_AudienceType CLOSE_FRIENDS = ContextInfo_StatusAudienceMetadata_AudienceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLOSE_FRIENDS');

  static const $core.List<ContextInfo_StatusAudienceMetadata_AudienceType> values = <ContextInfo_StatusAudienceMetadata_AudienceType> [
    UNKNOWN,
    CLOSE_FRIENDS,
  ];

  static final $core.Map<$core.int, ContextInfo_StatusAudienceMetadata_AudienceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ContextInfo_StatusAudienceMetadata_AudienceType? valueOf($core.int value) => _byValue[value];

  const ContextInfo_StatusAudienceMetadata_AudienceType._($core.int v, $core.String n) : super(v, n);
}

class Conversation_EndOfHistoryTransferType extends $pb.ProtobufEnum {
  static const Conversation_EndOfHistoryTransferType COMPLETE_BUT_MORE_MESSAGES_REMAIN_ON_PRIMARY = Conversation_EndOfHistoryTransferType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPLETE_BUT_MORE_MESSAGES_REMAIN_ON_PRIMARY');
  static const Conversation_EndOfHistoryTransferType COMPLETE_AND_NO_MORE_MESSAGE_REMAIN_ON_PRIMARY = Conversation_EndOfHistoryTransferType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPLETE_AND_NO_MORE_MESSAGE_REMAIN_ON_PRIMARY');
  static const Conversation_EndOfHistoryTransferType COMPLETE_ON_DEMAND_SYNC_BUT_MORE_MSG_REMAIN_ON_PRIMARY = Conversation_EndOfHistoryTransferType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPLETE_ON_DEMAND_SYNC_BUT_MORE_MSG_REMAIN_ON_PRIMARY');

  static const $core.List<Conversation_EndOfHistoryTransferType> values = <Conversation_EndOfHistoryTransferType> [
    COMPLETE_BUT_MORE_MESSAGES_REMAIN_ON_PRIMARY,
    COMPLETE_AND_NO_MORE_MESSAGE_REMAIN_ON_PRIMARY,
    COMPLETE_ON_DEMAND_SYNC_BUT_MORE_MSG_REMAIN_ON_PRIMARY,
  ];

  static final $core.Map<$core.int, Conversation_EndOfHistoryTransferType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Conversation_EndOfHistoryTransferType? valueOf($core.int value) => _byValue[value];

  const Conversation_EndOfHistoryTransferType._($core.int v, $core.String n) : super(v, n);
}

class DeviceCapabilities_ChatLockSupportLevel extends $pb.ProtobufEnum {
  static const DeviceCapabilities_ChatLockSupportLevel NONE = DeviceCapabilities_ChatLockSupportLevel._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const DeviceCapabilities_ChatLockSupportLevel MINIMAL = DeviceCapabilities_ChatLockSupportLevel._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MINIMAL');
  static const DeviceCapabilities_ChatLockSupportLevel FULL = DeviceCapabilities_ChatLockSupportLevel._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FULL');

  static const $core.List<DeviceCapabilities_ChatLockSupportLevel> values = <DeviceCapabilities_ChatLockSupportLevel> [
    NONE,
    MINIMAL,
    FULL,
  ];

  static final $core.Map<$core.int, DeviceCapabilities_ChatLockSupportLevel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DeviceCapabilities_ChatLockSupportLevel? valueOf($core.int value) => _byValue[value];

  const DeviceCapabilities_ChatLockSupportLevel._($core.int v, $core.String n) : super(v, n);
}

class DeviceCapabilities_MemberNameTagPrimarySupport extends $pb.ProtobufEnum {
  static const DeviceCapabilities_MemberNameTagPrimarySupport DISABLED = DeviceCapabilities_MemberNameTagPrimarySupport._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DISABLED');
  static const DeviceCapabilities_MemberNameTagPrimarySupport RECEIVER_ENABLED = DeviceCapabilities_MemberNameTagPrimarySupport._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECEIVER_ENABLED');
  static const DeviceCapabilities_MemberNameTagPrimarySupport SENDER_ENABLED = DeviceCapabilities_MemberNameTagPrimarySupport._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SENDER_ENABLED');

  static const $core.List<DeviceCapabilities_MemberNameTagPrimarySupport> values = <DeviceCapabilities_MemberNameTagPrimarySupport> [
    DISABLED,
    RECEIVER_ENABLED,
    SENDER_ENABLED,
  ];

  static final $core.Map<$core.int, DeviceCapabilities_MemberNameTagPrimarySupport> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DeviceCapabilities_MemberNameTagPrimarySupport? valueOf($core.int value) => _byValue[value];

  const DeviceCapabilities_MemberNameTagPrimarySupport._($core.int v, $core.String n) : super(v, n);
}

class DeviceProps_PlatformType extends $pb.ProtobufEnum {
  static const DeviceProps_PlatformType UNKNOWN = DeviceProps_PlatformType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const DeviceProps_PlatformType CHROME = DeviceProps_PlatformType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHROME');
  static const DeviceProps_PlatformType FIREFOX = DeviceProps_PlatformType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FIREFOX');
  static const DeviceProps_PlatformType IE = DeviceProps_PlatformType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IE');
  static const DeviceProps_PlatformType OPERA = DeviceProps_PlatformType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OPERA');
  static const DeviceProps_PlatformType SAFARI = DeviceProps_PlatformType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SAFARI');
  static const DeviceProps_PlatformType EDGE = DeviceProps_PlatformType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EDGE');
  static const DeviceProps_PlatformType DESKTOP = DeviceProps_PlatformType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DESKTOP');
  static const DeviceProps_PlatformType IPAD = DeviceProps_PlatformType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IPAD');
  static const DeviceProps_PlatformType ANDROID_TABLET = DeviceProps_PlatformType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANDROID_TABLET');
  static const DeviceProps_PlatformType OHANA = DeviceProps_PlatformType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OHANA');
  static const DeviceProps_PlatformType ALOHA = DeviceProps_PlatformType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALOHA');
  static const DeviceProps_PlatformType CATALINA = DeviceProps_PlatformType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATALINA');
  static const DeviceProps_PlatformType TCL_TV = DeviceProps_PlatformType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TCL_TV');
  static const DeviceProps_PlatformType IOS_PHONE = DeviceProps_PlatformType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IOS_PHONE');
  static const DeviceProps_PlatformType IOS_CATALYST = DeviceProps_PlatformType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IOS_CATALYST');
  static const DeviceProps_PlatformType ANDROID_PHONE = DeviceProps_PlatformType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANDROID_PHONE');
  static const DeviceProps_PlatformType ANDROID_AMBIGUOUS = DeviceProps_PlatformType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANDROID_AMBIGUOUS');
  static const DeviceProps_PlatformType WEAR_OS = DeviceProps_PlatformType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEAR_OS');
  static const DeviceProps_PlatformType AR_WRIST = DeviceProps_PlatformType._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AR_WRIST');
  static const DeviceProps_PlatformType AR_DEVICE = DeviceProps_PlatformType._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AR_DEVICE');
  static const DeviceProps_PlatformType UWP = DeviceProps_PlatformType._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UWP');
  static const DeviceProps_PlatformType VR = DeviceProps_PlatformType._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VR');
  static const DeviceProps_PlatformType CLOUD_API = DeviceProps_PlatformType._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLOUD_API');
  static const DeviceProps_PlatformType SMARTGLASSES = DeviceProps_PlatformType._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SMARTGLASSES');

  static const $core.List<DeviceProps_PlatformType> values = <DeviceProps_PlatformType> [
    UNKNOWN,
    CHROME,
    FIREFOX,
    IE,
    OPERA,
    SAFARI,
    EDGE,
    DESKTOP,
    IPAD,
    ANDROID_TABLET,
    OHANA,
    ALOHA,
    CATALINA,
    TCL_TV,
    IOS_PHONE,
    IOS_CATALYST,
    ANDROID_PHONE,
    ANDROID_AMBIGUOUS,
    WEAR_OS,
    AR_WRIST,
    AR_DEVICE,
    UWP,
    VR,
    CLOUD_API,
    SMARTGLASSES,
  ];

  static final $core.Map<$core.int, DeviceProps_PlatformType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DeviceProps_PlatformType? valueOf($core.int value) => _byValue[value];

  const DeviceProps_PlatformType._($core.int v, $core.String n) : super(v, n);
}

class DisappearingMode_Initiator extends $pb.ProtobufEnum {
  static const DisappearingMode_Initiator CHANGED_IN_CHAT = DisappearingMode_Initiator._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGED_IN_CHAT');
  static const DisappearingMode_Initiator INITIATED_BY_ME = DisappearingMode_Initiator._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INITIATED_BY_ME');
  static const DisappearingMode_Initiator INITIATED_BY_OTHER = DisappearingMode_Initiator._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INITIATED_BY_OTHER');
  static const DisappearingMode_Initiator BIZ_UPGRADE_FB_HOSTING = DisappearingMode_Initiator._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_UPGRADE_FB_HOSTING');

  static const $core.List<DisappearingMode_Initiator> values = <DisappearingMode_Initiator> [
    CHANGED_IN_CHAT,
    INITIATED_BY_ME,
    INITIATED_BY_OTHER,
    BIZ_UPGRADE_FB_HOSTING,
  ];

  static final $core.Map<$core.int, DisappearingMode_Initiator> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DisappearingMode_Initiator? valueOf($core.int value) => _byValue[value];

  const DisappearingMode_Initiator._($core.int v, $core.String n) : super(v, n);
}

class DisappearingMode_Trigger extends $pb.ProtobufEnum {
  static const DisappearingMode_Trigger UNKNOWN = DisappearingMode_Trigger._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const DisappearingMode_Trigger CHAT_SETTING = DisappearingMode_Trigger._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT_SETTING');
  static const DisappearingMode_Trigger ACCOUNT_SETTING = DisappearingMode_Trigger._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCOUNT_SETTING');
  static const DisappearingMode_Trigger BULK_CHANGE = DisappearingMode_Trigger._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BULK_CHANGE');
  static const DisappearingMode_Trigger BIZ_SUPPORTS_FB_HOSTING = DisappearingMode_Trigger._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_SUPPORTS_FB_HOSTING');
  static const DisappearingMode_Trigger UNKNOWN_GROUPS = DisappearingMode_Trigger._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_GROUPS');

  static const $core.List<DisappearingMode_Trigger> values = <DisappearingMode_Trigger> [
    UNKNOWN,
    CHAT_SETTING,
    ACCOUNT_SETTING,
    BULK_CHANGE,
    BIZ_SUPPORTS_FB_HOSTING,
    UNKNOWN_GROUPS,
  ];

  static final $core.Map<$core.int, DisappearingMode_Trigger> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DisappearingMode_Trigger? valueOf($core.int value) => _byValue[value];

  const DisappearingMode_Trigger._($core.int v, $core.String n) : super(v, n);
}

class GroupHistoryBundleInfo_ProcessState extends $pb.ProtobufEnum {
  static const GroupHistoryBundleInfo_ProcessState NOT_INJECTED = GroupHistoryBundleInfo_ProcessState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_INJECTED');
  static const GroupHistoryBundleInfo_ProcessState INJECTED = GroupHistoryBundleInfo_ProcessState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INJECTED');
  static const GroupHistoryBundleInfo_ProcessState INJECTED_PARTIAL = GroupHistoryBundleInfo_ProcessState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INJECTED_PARTIAL');
  static const GroupHistoryBundleInfo_ProcessState INJECTION_FAILED = GroupHistoryBundleInfo_ProcessState._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INJECTION_FAILED');
  static const GroupHistoryBundleInfo_ProcessState INJECTION_FAILED_NO_RETRY = GroupHistoryBundleInfo_ProcessState._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INJECTION_FAILED_NO_RETRY');

  static const $core.List<GroupHistoryBundleInfo_ProcessState> values = <GroupHistoryBundleInfo_ProcessState> [
    NOT_INJECTED,
    INJECTED,
    INJECTED_PARTIAL,
    INJECTION_FAILED,
    INJECTION_FAILED_NO_RETRY,
  ];

  static final $core.Map<$core.int, GroupHistoryBundleInfo_ProcessState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GroupHistoryBundleInfo_ProcessState? valueOf($core.int value) => _byValue[value];

  const GroupHistoryBundleInfo_ProcessState._($core.int v, $core.String n) : super(v, n);
}

class GroupParticipant_Rank extends $pb.ProtobufEnum {
  static const GroupParticipant_Rank REGULAR = GroupParticipant_Rank._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGULAR');
  static const GroupParticipant_Rank ADMIN = GroupParticipant_Rank._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ADMIN');
  static const GroupParticipant_Rank SUPERADMIN = GroupParticipant_Rank._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUPERADMIN');

  static const $core.List<GroupParticipant_Rank> values = <GroupParticipant_Rank> [
    REGULAR,
    ADMIN,
    SUPERADMIN,
  ];

  static final $core.Map<$core.int, GroupParticipant_Rank> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GroupParticipant_Rank? valueOf($core.int value) => _byValue[value];

  const GroupParticipant_Rank._($core.int v, $core.String n) : super(v, n);
}

class HistorySync_BotAIWaitListState extends $pb.ProtobufEnum {
  static const HistorySync_BotAIWaitListState IN_WAITLIST = HistorySync_BotAIWaitListState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IN_WAITLIST');
  static const HistorySync_BotAIWaitListState AI_AVAILABLE = HistorySync_BotAIWaitListState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_AVAILABLE');

  static const $core.List<HistorySync_BotAIWaitListState> values = <HistorySync_BotAIWaitListState> [
    IN_WAITLIST,
    AI_AVAILABLE,
  ];

  static final $core.Map<$core.int, HistorySync_BotAIWaitListState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HistorySync_BotAIWaitListState? valueOf($core.int value) => _byValue[value];

  const HistorySync_BotAIWaitListState._($core.int v, $core.String n) : super(v, n);
}

class HistorySync_HistorySyncType extends $pb.ProtobufEnum {
  static const HistorySync_HistorySyncType INITIAL_BOOTSTRAP = HistorySync_HistorySyncType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INITIAL_BOOTSTRAP');
  static const HistorySync_HistorySyncType INITIAL_STATUS_V3 = HistorySync_HistorySyncType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INITIAL_STATUS_V3');
  static const HistorySync_HistorySyncType FULL = HistorySync_HistorySyncType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FULL');
  static const HistorySync_HistorySyncType RECENT = HistorySync_HistorySyncType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECENT');
  static const HistorySync_HistorySyncType PUSH_NAME = HistorySync_HistorySyncType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUSH_NAME');
  static const HistorySync_HistorySyncType NON_BLOCKING_DATA = HistorySync_HistorySyncType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NON_BLOCKING_DATA');
  static const HistorySync_HistorySyncType ON_DEMAND = HistorySync_HistorySyncType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ON_DEMAND');

  static const $core.List<HistorySync_HistorySyncType> values = <HistorySync_HistorySyncType> [
    INITIAL_BOOTSTRAP,
    INITIAL_STATUS_V3,
    FULL,
    RECENT,
    PUSH_NAME,
    NON_BLOCKING_DATA,
    ON_DEMAND,
  ];

  static final $core.Map<$core.int, HistorySync_HistorySyncType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HistorySync_HistorySyncType? valueOf($core.int value) => _byValue[value];

  const HistorySync_HistorySyncType._($core.int v, $core.String n) : super(v, n);
}

class HydratedTemplateButton_HydratedURLButton_WebviewPresentationType extends $pb.ProtobufEnum {
  static const HydratedTemplateButton_HydratedURLButton_WebviewPresentationType UNKNOWN_WEBVIEWPRESENTATIONTYPE_ZERO = HydratedTemplateButton_HydratedURLButton_WebviewPresentationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_WEBVIEWPRESENTATIONTYPE_ZERO');
  static const HydratedTemplateButton_HydratedURLButton_WebviewPresentationType FULL = HydratedTemplateButton_HydratedURLButton_WebviewPresentationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FULL');
  static const HydratedTemplateButton_HydratedURLButton_WebviewPresentationType TALL = HydratedTemplateButton_HydratedURLButton_WebviewPresentationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TALL');
  static const HydratedTemplateButton_HydratedURLButton_WebviewPresentationType COMPACT = HydratedTemplateButton_HydratedURLButton_WebviewPresentationType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPACT');

  static const $core.List<HydratedTemplateButton_HydratedURLButton_WebviewPresentationType> values = <HydratedTemplateButton_HydratedURLButton_WebviewPresentationType> [
    UNKNOWN_WEBVIEWPRESENTATIONTYPE_ZERO,
    FULL,
    TALL,
    COMPACT,
  ];

  static final $core.Map<$core.int, HydratedTemplateButton_HydratedURLButton_WebviewPresentationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HydratedTemplateButton_HydratedURLButton_WebviewPresentationType? valueOf($core.int value) => _byValue[value];

  const HydratedTemplateButton_HydratedURLButton_WebviewPresentationType._($core.int v, $core.String n) : super(v, n);
}

class InteractiveAnnotation_StatusLinkType extends $pb.ProtobufEnum {
  static const InteractiveAnnotation_StatusLinkType UNKNOWN_STATUSLINKTYPE_ZERO = InteractiveAnnotation_StatusLinkType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_STATUSLINKTYPE_ZERO');
  static const InteractiveAnnotation_StatusLinkType RASTERIZED_LINK_PREVIEW = InteractiveAnnotation_StatusLinkType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RASTERIZED_LINK_PREVIEW');
  static const InteractiveAnnotation_StatusLinkType RASTERIZED_LINK_TRUNCATED = InteractiveAnnotation_StatusLinkType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RASTERIZED_LINK_TRUNCATED');
  static const InteractiveAnnotation_StatusLinkType RASTERIZED_LINK_FULL_URL = InteractiveAnnotation_StatusLinkType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RASTERIZED_LINK_FULL_URL');

  static const $core.List<InteractiveAnnotation_StatusLinkType> values = <InteractiveAnnotation_StatusLinkType> [
    UNKNOWN_STATUSLINKTYPE_ZERO,
    RASTERIZED_LINK_PREVIEW,
    RASTERIZED_LINK_TRUNCATED,
    RASTERIZED_LINK_FULL_URL,
  ];

  static final $core.Map<$core.int, InteractiveAnnotation_StatusLinkType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static InteractiveAnnotation_StatusLinkType? valueOf($core.int value) => _byValue[value];

  const InteractiveAnnotation_StatusLinkType._($core.int v, $core.String n) : super(v, n);
}

class LimitSharing_TriggerType extends $pb.ProtobufEnum {
  static const LimitSharing_TriggerType UNKNOWN = LimitSharing_TriggerType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const LimitSharing_TriggerType CHAT_SETTING = LimitSharing_TriggerType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT_SETTING');
  static const LimitSharing_TriggerType BIZ_SUPPORTS_FB_HOSTING = LimitSharing_TriggerType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_SUPPORTS_FB_HOSTING');
  static const LimitSharing_TriggerType UNKNOWN_GROUP = LimitSharing_TriggerType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_GROUP');

  static const $core.List<LimitSharing_TriggerType> values = <LimitSharing_TriggerType> [
    UNKNOWN,
    CHAT_SETTING,
    BIZ_SUPPORTS_FB_HOSTING,
    UNKNOWN_GROUP,
  ];

  static final $core.Map<$core.int, LimitSharing_TriggerType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LimitSharing_TriggerType? valueOf($core.int value) => _byValue[value];

  const LimitSharing_TriggerType._($core.int v, $core.String n) : super(v, n);
}

class MediaRetryNotification_ResultType extends $pb.ProtobufEnum {
  static const MediaRetryNotification_ResultType GENERAL_ERROR = MediaRetryNotification_ResultType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERAL_ERROR');
  static const MediaRetryNotification_ResultType SUCCESS = MediaRetryNotification_ResultType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUCCESS');
  static const MediaRetryNotification_ResultType NOT_FOUND = MediaRetryNotification_ResultType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_FOUND');
  static const MediaRetryNotification_ResultType DECRYPTION_ERROR = MediaRetryNotification_ResultType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DECRYPTION_ERROR');

  static const $core.List<MediaRetryNotification_ResultType> values = <MediaRetryNotification_ResultType> [
    GENERAL_ERROR,
    SUCCESS,
    NOT_FOUND,
    DECRYPTION_ERROR,
  ];

  static final $core.Map<$core.int, MediaRetryNotification_ResultType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MediaRetryNotification_ResultType? valueOf($core.int value) => _byValue[value];

  const MediaRetryNotification_ResultType._($core.int v, $core.String n) : super(v, n);
}

class Message_HistorySyncType extends $pb.ProtobufEnum {
  static const Message_HistorySyncType INITIAL_BOOTSTRAP = Message_HistorySyncType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INITIAL_BOOTSTRAP');
  static const Message_HistorySyncType INITIAL_STATUS_V3 = Message_HistorySyncType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INITIAL_STATUS_V3');
  static const Message_HistorySyncType FULL = Message_HistorySyncType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FULL');
  static const Message_HistorySyncType RECENT = Message_HistorySyncType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECENT');
  static const Message_HistorySyncType PUSH_NAME = Message_HistorySyncType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PUSH_NAME');
  static const Message_HistorySyncType NON_BLOCKING_DATA = Message_HistorySyncType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NON_BLOCKING_DATA');
  static const Message_HistorySyncType ON_DEMAND = Message_HistorySyncType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ON_DEMAND');
  static const Message_HistorySyncType NO_HISTORY = Message_HistorySyncType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NO_HISTORY');
  static const Message_HistorySyncType MESSAGE_ACCESS_STATUS = Message_HistorySyncType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSAGE_ACCESS_STATUS');

  static const $core.List<Message_HistorySyncType> values = <Message_HistorySyncType> [
    INITIAL_BOOTSTRAP,
    INITIAL_STATUS_V3,
    FULL,
    RECENT,
    PUSH_NAME,
    NON_BLOCKING_DATA,
    ON_DEMAND,
    NO_HISTORY,
    MESSAGE_ACCESS_STATUS,
  ];

  static final $core.Map<$core.int, Message_HistorySyncType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_HistorySyncType? valueOf($core.int value) => _byValue[value];

  const Message_HistorySyncType._($core.int v, $core.String n) : super(v, n);
}

class Message_MediaKeyDomain extends $pb.ProtobufEnum {
  static const Message_MediaKeyDomain UNSET = Message_MediaKeyDomain._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSET');
  static const Message_MediaKeyDomain E2EE_CHAT = Message_MediaKeyDomain._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2EE_CHAT');
  static const Message_MediaKeyDomain STATUS = Message_MediaKeyDomain._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS');
  static const Message_MediaKeyDomain CAPI = Message_MediaKeyDomain._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAPI');
  static const Message_MediaKeyDomain BOT = Message_MediaKeyDomain._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT');

  static const $core.List<Message_MediaKeyDomain> values = <Message_MediaKeyDomain> [
    UNSET,
    E2EE_CHAT,
    STATUS,
    CAPI,
    BOT,
  ];

  static final $core.Map<$core.int, Message_MediaKeyDomain> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_MediaKeyDomain? valueOf($core.int value) => _byValue[value];

  const Message_MediaKeyDomain._($core.int v, $core.String n) : super(v, n);
}

class Message_PeerDataOperationRequestType extends $pb.ProtobufEnum {
  static const Message_PeerDataOperationRequestType UPLOAD_STICKER = Message_PeerDataOperationRequestType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPLOAD_STICKER');
  static const Message_PeerDataOperationRequestType SEND_RECENT_STICKER_BOOTSTRAP = Message_PeerDataOperationRequestType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SEND_RECENT_STICKER_BOOTSTRAP');
  static const Message_PeerDataOperationRequestType GENERATE_LINK_PREVIEW = Message_PeerDataOperationRequestType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERATE_LINK_PREVIEW');
  static const Message_PeerDataOperationRequestType HISTORY_SYNC_ON_DEMAND = Message_PeerDataOperationRequestType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HISTORY_SYNC_ON_DEMAND');
  static const Message_PeerDataOperationRequestType PLACEHOLDER_MESSAGE_RESEND = Message_PeerDataOperationRequestType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLACEHOLDER_MESSAGE_RESEND');
  static const Message_PeerDataOperationRequestType WAFFLE_LINKING_NONCE_FETCH = Message_PeerDataOperationRequestType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WAFFLE_LINKING_NONCE_FETCH');
  static const Message_PeerDataOperationRequestType FULL_HISTORY_SYNC_ON_DEMAND = Message_PeerDataOperationRequestType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FULL_HISTORY_SYNC_ON_DEMAND');
  static const Message_PeerDataOperationRequestType COMPANION_META_NONCE_FETCH = Message_PeerDataOperationRequestType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPANION_META_NONCE_FETCH');
  static const Message_PeerDataOperationRequestType COMPANION_SYNCD_SNAPSHOT_FATAL_RECOVERY = Message_PeerDataOperationRequestType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPANION_SYNCD_SNAPSHOT_FATAL_RECOVERY');
  static const Message_PeerDataOperationRequestType COMPANION_CANONICAL_USER_NONCE_FETCH = Message_PeerDataOperationRequestType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPANION_CANONICAL_USER_NONCE_FETCH');
  static const Message_PeerDataOperationRequestType HISTORY_SYNC_CHUNK_RETRY = Message_PeerDataOperationRequestType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HISTORY_SYNC_CHUNK_RETRY');
  static const Message_PeerDataOperationRequestType GALAXY_FLOW_ACTION = Message_PeerDataOperationRequestType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GALAXY_FLOW_ACTION');

  static const $core.List<Message_PeerDataOperationRequestType> values = <Message_PeerDataOperationRequestType> [
    UPLOAD_STICKER,
    SEND_RECENT_STICKER_BOOTSTRAP,
    GENERATE_LINK_PREVIEW,
    HISTORY_SYNC_ON_DEMAND,
    PLACEHOLDER_MESSAGE_RESEND,
    WAFFLE_LINKING_NONCE_FETCH,
    FULL_HISTORY_SYNC_ON_DEMAND,
    COMPANION_META_NONCE_FETCH,
    COMPANION_SYNCD_SNAPSHOT_FATAL_RECOVERY,
    COMPANION_CANONICAL_USER_NONCE_FETCH,
    HISTORY_SYNC_CHUNK_RETRY,
    GALAXY_FLOW_ACTION,
  ];

  static final $core.Map<$core.int, Message_PeerDataOperationRequestType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PeerDataOperationRequestType? valueOf($core.int value) => _byValue[value];

  const Message_PeerDataOperationRequestType._($core.int v, $core.String n) : super(v, n);
}

class Message_PollContentType extends $pb.ProtobufEnum {
  static const Message_PollContentType UNKNOWN = Message_PollContentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_PollContentType TEXT = Message_PollContentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEXT');
  static const Message_PollContentType IMAGE = Message_PollContentType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');

  static const $core.List<Message_PollContentType> values = <Message_PollContentType> [
    UNKNOWN,
    TEXT,
    IMAGE,
  ];

  static final $core.Map<$core.int, Message_PollContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PollContentType? valueOf($core.int value) => _byValue[value];

  const Message_PollContentType._($core.int v, $core.String n) : super(v, n);
}

class Message_PollType extends $pb.ProtobufEnum {
  static const Message_PollType POLL = Message_PollType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POLL');
  static const Message_PollType QUIZ = Message_PollType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUIZ');

  static const $core.List<Message_PollType> values = <Message_PollType> [
    POLL,
    QUIZ,
  ];

  static final $core.Map<$core.int, Message_PollType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PollType? valueOf($core.int value) => _byValue[value];

  const Message_PollType._($core.int v, $core.String n) : super(v, n);
}

class Message_BCallMessage_MediaType extends $pb.ProtobufEnum {
  static const Message_BCallMessage_MediaType UNKNOWN = Message_BCallMessage_MediaType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_BCallMessage_MediaType AUDIO = Message_BCallMessage_MediaType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUDIO');
  static const Message_BCallMessage_MediaType VIDEO = Message_BCallMessage_MediaType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');

  static const $core.List<Message_BCallMessage_MediaType> values = <Message_BCallMessage_MediaType> [
    UNKNOWN,
    AUDIO,
    VIDEO,
  ];

  static final $core.Map<$core.int, Message_BCallMessage_MediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_BCallMessage_MediaType? valueOf($core.int value) => _byValue[value];

  const Message_BCallMessage_MediaType._($core.int v, $core.String n) : super(v, n);
}

class Message_ButtonsMessage_HeaderType extends $pb.ProtobufEnum {
  static const Message_ButtonsMessage_HeaderType UNKNOWN = Message_ButtonsMessage_HeaderType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_ButtonsMessage_HeaderType EMPTY = Message_ButtonsMessage_HeaderType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMPTY');
  static const Message_ButtonsMessage_HeaderType TEXT = Message_ButtonsMessage_HeaderType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEXT');
  static const Message_ButtonsMessage_HeaderType DOCUMENT = Message_ButtonsMessage_HeaderType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DOCUMENT');
  static const Message_ButtonsMessage_HeaderType IMAGE = Message_ButtonsMessage_HeaderType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const Message_ButtonsMessage_HeaderType VIDEO = Message_ButtonsMessage_HeaderType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');
  static const Message_ButtonsMessage_HeaderType LOCATION = Message_ButtonsMessage_HeaderType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOCATION');

  static const $core.List<Message_ButtonsMessage_HeaderType> values = <Message_ButtonsMessage_HeaderType> [
    UNKNOWN,
    EMPTY,
    TEXT,
    DOCUMENT,
    IMAGE,
    VIDEO,
    LOCATION,
  ];

  static final $core.Map<$core.int, Message_ButtonsMessage_HeaderType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ButtonsMessage_HeaderType? valueOf($core.int value) => _byValue[value];

  const Message_ButtonsMessage_HeaderType._($core.int v, $core.String n) : super(v, n);
}

class Message_ButtonsMessage_Button_Type extends $pb.ProtobufEnum {
  static const Message_ButtonsMessage_Button_Type UNKNOWN = Message_ButtonsMessage_Button_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_ButtonsMessage_Button_Type RESPONSE = Message_ButtonsMessage_Button_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RESPONSE');
  static const Message_ButtonsMessage_Button_Type NATIVE_FLOW = Message_ButtonsMessage_Button_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NATIVE_FLOW');

  static const $core.List<Message_ButtonsMessage_Button_Type> values = <Message_ButtonsMessage_Button_Type> [
    UNKNOWN,
    RESPONSE,
    NATIVE_FLOW,
  ];

  static final $core.Map<$core.int, Message_ButtonsMessage_Button_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ButtonsMessage_Button_Type? valueOf($core.int value) => _byValue[value];

  const Message_ButtonsMessage_Button_Type._($core.int v, $core.String n) : super(v, n);
}

class Message_ButtonsResponseMessage_Type extends $pb.ProtobufEnum {
  static const Message_ButtonsResponseMessage_Type UNKNOWN = Message_ButtonsResponseMessage_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_ButtonsResponseMessage_Type DISPLAY_TEXT = Message_ButtonsResponseMessage_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DISPLAY_TEXT');

  static const $core.List<Message_ButtonsResponseMessage_Type> values = <Message_ButtonsResponseMessage_Type> [
    UNKNOWN,
    DISPLAY_TEXT,
  ];

  static final $core.Map<$core.int, Message_ButtonsResponseMessage_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ButtonsResponseMessage_Type? valueOf($core.int value) => _byValue[value];

  const Message_ButtonsResponseMessage_Type._($core.int v, $core.String n) : super(v, n);
}

class Message_CallLogMessage_CallOutcome extends $pb.ProtobufEnum {
  static const Message_CallLogMessage_CallOutcome CONNECTED = Message_CallLogMessage_CallOutcome._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONNECTED');
  static const Message_CallLogMessage_CallOutcome MISSED = Message_CallLogMessage_CallOutcome._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MISSED');
  static const Message_CallLogMessage_CallOutcome FAILED = Message_CallLogMessage_CallOutcome._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED');
  static const Message_CallLogMessage_CallOutcome REJECTED = Message_CallLogMessage_CallOutcome._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REJECTED');
  static const Message_CallLogMessage_CallOutcome ACCEPTED_ELSEWHERE = Message_CallLogMessage_CallOutcome._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCEPTED_ELSEWHERE');
  static const Message_CallLogMessage_CallOutcome ONGOING = Message_CallLogMessage_CallOutcome._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ONGOING');
  static const Message_CallLogMessage_CallOutcome SILENCED_BY_DND = Message_CallLogMessage_CallOutcome._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SILENCED_BY_DND');
  static const Message_CallLogMessage_CallOutcome SILENCED_UNKNOWN_CALLER = Message_CallLogMessage_CallOutcome._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SILENCED_UNKNOWN_CALLER');

  static const $core.List<Message_CallLogMessage_CallOutcome> values = <Message_CallLogMessage_CallOutcome> [
    CONNECTED,
    MISSED,
    FAILED,
    REJECTED,
    ACCEPTED_ELSEWHERE,
    ONGOING,
    SILENCED_BY_DND,
    SILENCED_UNKNOWN_CALLER,
  ];

  static final $core.Map<$core.int, Message_CallLogMessage_CallOutcome> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_CallLogMessage_CallOutcome? valueOf($core.int value) => _byValue[value];

  const Message_CallLogMessage_CallOutcome._($core.int v, $core.String n) : super(v, n);
}

class Message_CallLogMessage_CallType extends $pb.ProtobufEnum {
  static const Message_CallLogMessage_CallType REGULAR = Message_CallLogMessage_CallType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REGULAR');
  static const Message_CallLogMessage_CallType SCHEDULED_CALL = Message_CallLogMessage_CallType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED_CALL');
  static const Message_CallLogMessage_CallType VOICE_CHAT = Message_CallLogMessage_CallType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOICE_CHAT');

  static const $core.List<Message_CallLogMessage_CallType> values = <Message_CallLogMessage_CallType> [
    REGULAR,
    SCHEDULED_CALL,
    VOICE_CHAT,
  ];

  static final $core.Map<$core.int, Message_CallLogMessage_CallType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_CallLogMessage_CallType? valueOf($core.int value) => _byValue[value];

  const Message_CallLogMessage_CallType._($core.int v, $core.String n) : super(v, n);
}

class Message_CloudAPIThreadControlNotification_CloudAPIThreadControl extends $pb.ProtobufEnum {
  static const Message_CloudAPIThreadControlNotification_CloudAPIThreadControl UNKNOWN = Message_CloudAPIThreadControlNotification_CloudAPIThreadControl._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_CloudAPIThreadControlNotification_CloudAPIThreadControl CONTROL_PASSED = Message_CloudAPIThreadControlNotification_CloudAPIThreadControl._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONTROL_PASSED');
  static const Message_CloudAPIThreadControlNotification_CloudAPIThreadControl CONTROL_TAKEN = Message_CloudAPIThreadControlNotification_CloudAPIThreadControl._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONTROL_TAKEN');

  static const $core.List<Message_CloudAPIThreadControlNotification_CloudAPIThreadControl> values = <Message_CloudAPIThreadControlNotification_CloudAPIThreadControl> [
    UNKNOWN,
    CONTROL_PASSED,
    CONTROL_TAKEN,
  ];

  static final $core.Map<$core.int, Message_CloudAPIThreadControlNotification_CloudAPIThreadControl> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_CloudAPIThreadControlNotification_CloudAPIThreadControl? valueOf($core.int value) => _byValue[value];

  const Message_CloudAPIThreadControlNotification_CloudAPIThreadControl._($core.int v, $core.String n) : super(v, n);
}

class Message_EventResponseMessage_EventResponseType extends $pb.ProtobufEnum {
  static const Message_EventResponseMessage_EventResponseType UNKNOWN = Message_EventResponseMessage_EventResponseType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_EventResponseMessage_EventResponseType GOING = Message_EventResponseMessage_EventResponseType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOING');
  static const Message_EventResponseMessage_EventResponseType NOT_GOING = Message_EventResponseMessage_EventResponseType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_GOING');
  static const Message_EventResponseMessage_EventResponseType MAYBE = Message_EventResponseMessage_EventResponseType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MAYBE');

  static const $core.List<Message_EventResponseMessage_EventResponseType> values = <Message_EventResponseMessage_EventResponseType> [
    UNKNOWN,
    GOING,
    NOT_GOING,
    MAYBE,
  ];

  static final $core.Map<$core.int, Message_EventResponseMessage_EventResponseType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_EventResponseMessage_EventResponseType? valueOf($core.int value) => _byValue[value];

  const Message_EventResponseMessage_EventResponseType._($core.int v, $core.String n) : super(v, n);
}

class Message_ExtendedTextMessage_FontType extends $pb.ProtobufEnum {
  static const Message_ExtendedTextMessage_FontType SYSTEM = Message_ExtendedTextMessage_FontType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYSTEM');
  static const Message_ExtendedTextMessage_FontType SYSTEM_TEXT = Message_ExtendedTextMessage_FontType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYSTEM_TEXT');
  static const Message_ExtendedTextMessage_FontType FB_SCRIPT = Message_ExtendedTextMessage_FontType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FB_SCRIPT');
  static const Message_ExtendedTextMessage_FontType SYSTEM_BOLD = Message_ExtendedTextMessage_FontType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYSTEM_BOLD');
  static const Message_ExtendedTextMessage_FontType MORNINGBREEZE_REGULAR = Message_ExtendedTextMessage_FontType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MORNINGBREEZE_REGULAR');
  static const Message_ExtendedTextMessage_FontType CALISTOGA_REGULAR = Message_ExtendedTextMessage_FontType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CALISTOGA_REGULAR');
  static const Message_ExtendedTextMessage_FontType EXO2_EXTRABOLD = Message_ExtendedTextMessage_FontType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXO2_EXTRABOLD');
  static const Message_ExtendedTextMessage_FontType COURIERPRIME_BOLD = Message_ExtendedTextMessage_FontType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COURIERPRIME_BOLD');

  static const $core.List<Message_ExtendedTextMessage_FontType> values = <Message_ExtendedTextMessage_FontType> [
    SYSTEM,
    SYSTEM_TEXT,
    FB_SCRIPT,
    SYSTEM_BOLD,
    MORNINGBREEZE_REGULAR,
    CALISTOGA_REGULAR,
    EXO2_EXTRABOLD,
    COURIERPRIME_BOLD,
  ];

  static final $core.Map<$core.int, Message_ExtendedTextMessage_FontType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ExtendedTextMessage_FontType? valueOf($core.int value) => _byValue[value];

  const Message_ExtendedTextMessage_FontType._($core.int v, $core.String n) : super(v, n);
}

class Message_ExtendedTextMessage_InviteLinkGroupType extends $pb.ProtobufEnum {
  static const Message_ExtendedTextMessage_InviteLinkGroupType DEFAULT = Message_ExtendedTextMessage_InviteLinkGroupType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');
  static const Message_ExtendedTextMessage_InviteLinkGroupType PARENT = Message_ExtendedTextMessage_InviteLinkGroupType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PARENT');
  static const Message_ExtendedTextMessage_InviteLinkGroupType SUB = Message_ExtendedTextMessage_InviteLinkGroupType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUB');
  static const Message_ExtendedTextMessage_InviteLinkGroupType DEFAULT_SUB = Message_ExtendedTextMessage_InviteLinkGroupType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT_SUB');

  static const $core.List<Message_ExtendedTextMessage_InviteLinkGroupType> values = <Message_ExtendedTextMessage_InviteLinkGroupType> [
    DEFAULT,
    PARENT,
    SUB,
    DEFAULT_SUB,
  ];

  static final $core.Map<$core.int, Message_ExtendedTextMessage_InviteLinkGroupType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ExtendedTextMessage_InviteLinkGroupType? valueOf($core.int value) => _byValue[value];

  const Message_ExtendedTextMessage_InviteLinkGroupType._($core.int v, $core.String n) : super(v, n);
}

class Message_ExtendedTextMessage_PreviewType extends $pb.ProtobufEnum {
  static const Message_ExtendedTextMessage_PreviewType NONE = Message_ExtendedTextMessage_PreviewType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const Message_ExtendedTextMessage_PreviewType VIDEO = Message_ExtendedTextMessage_PreviewType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');
  static const Message_ExtendedTextMessage_PreviewType PLACEHOLDER = Message_ExtendedTextMessage_PreviewType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLACEHOLDER');
  static const Message_ExtendedTextMessage_PreviewType IMAGE = Message_ExtendedTextMessage_PreviewType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const Message_ExtendedTextMessage_PreviewType PAYMENT_LINKS = Message_ExtendedTextMessage_PreviewType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_LINKS');
  static const Message_ExtendedTextMessage_PreviewType PROFILE = Message_ExtendedTextMessage_PreviewType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROFILE');

  static const $core.List<Message_ExtendedTextMessage_PreviewType> values = <Message_ExtendedTextMessage_PreviewType> [
    NONE,
    VIDEO,
    PLACEHOLDER,
    IMAGE,
    PAYMENT_LINKS,
    PROFILE,
  ];

  static final $core.Map<$core.int, Message_ExtendedTextMessage_PreviewType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ExtendedTextMessage_PreviewType? valueOf($core.int value) => _byValue[value];

  const Message_ExtendedTextMessage_PreviewType._($core.int v, $core.String n) : super(v, n);
}

class Message_GroupInviteMessage_GroupType extends $pb.ProtobufEnum {
  static const Message_GroupInviteMessage_GroupType DEFAULT = Message_GroupInviteMessage_GroupType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');
  static const Message_GroupInviteMessage_GroupType PARENT = Message_GroupInviteMessage_GroupType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PARENT');

  static const $core.List<Message_GroupInviteMessage_GroupType> values = <Message_GroupInviteMessage_GroupType> [
    DEFAULT,
    PARENT,
  ];

  static final $core.Map<$core.int, Message_GroupInviteMessage_GroupType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_GroupInviteMessage_GroupType? valueOf($core.int value) => _byValue[value];

  const Message_GroupInviteMessage_GroupType._($core.int v, $core.String n) : super(v, n);
}

class Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType extends $pb.ProtobufEnum {
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType UNKNOWN_CALENDARTYPE_ZERO = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_CALENDARTYPE_ZERO');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType GREGORIAN = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GREGORIAN');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType SOLAR_HIJRI = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SOLAR_HIJRI');

  static const $core.List<Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType> values = <Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType> [
    UNKNOWN_CALENDARTYPE_ZERO,
    GREGORIAN,
    SOLAR_HIJRI,
  ];

  static final $core.Map<$core.int, Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType? valueOf($core.int value) => _byValue[value];

  const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_CalendarType._($core.int v, $core.String n) : super(v, n);
}

class Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType extends $pb.ProtobufEnum {
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType UNKNOWN_DAYOFWEEKTYPE_ZERO = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_DAYOFWEEKTYPE_ZERO');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType MONDAY = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MONDAY');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType TUESDAY = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TUESDAY');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType WEDNESDAY = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEDNESDAY');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType THURSDAY = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'THURSDAY');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType FRIDAY = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FRIDAY');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType SATURDAY = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SATURDAY');
  static const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType SUNDAY = Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUNDAY');

  static const $core.List<Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType> values = <Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType> [
    UNKNOWN_DAYOFWEEKTYPE_ZERO,
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY,
  ];

  static final $core.Map<$core.int, Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType? valueOf($core.int value) => _byValue[value];

  const Message_HighlyStructuredMessage_HSMLocalizableParameter_HSMDateTime_HSMDateTimeComponent_DayOfWeekType._($core.int v, $core.String n) : super(v, n);
}

class Message_ImageMessage_ImageSourceType extends $pb.ProtobufEnum {
  static const Message_ImageMessage_ImageSourceType USER_IMAGE = Message_ImageMessage_ImageSourceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_IMAGE');
  static const Message_ImageMessage_ImageSourceType AI_GENERATED = Message_ImageMessage_ImageSourceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_GENERATED');
  static const Message_ImageMessage_ImageSourceType AI_MODIFIED = Message_ImageMessage_ImageSourceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_MODIFIED');
  static const Message_ImageMessage_ImageSourceType RASTERIZED_TEXT_STATUS = Message_ImageMessage_ImageSourceType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RASTERIZED_TEXT_STATUS');

  static const $core.List<Message_ImageMessage_ImageSourceType> values = <Message_ImageMessage_ImageSourceType> [
    USER_IMAGE,
    AI_GENERATED,
    AI_MODIFIED,
    RASTERIZED_TEXT_STATUS,
  ];

  static final $core.Map<$core.int, Message_ImageMessage_ImageSourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ImageMessage_ImageSourceType? valueOf($core.int value) => _byValue[value];

  const Message_ImageMessage_ImageSourceType._($core.int v, $core.String n) : super(v, n);
}

class Message_InteractiveMessage_CarouselMessage_CarouselCardType extends $pb.ProtobufEnum {
  static const Message_InteractiveMessage_CarouselMessage_CarouselCardType UNKNOWN = Message_InteractiveMessage_CarouselMessage_CarouselCardType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_InteractiveMessage_CarouselMessage_CarouselCardType HSCROLL_CARDS = Message_InteractiveMessage_CarouselMessage_CarouselCardType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HSCROLL_CARDS');
  static const Message_InteractiveMessage_CarouselMessage_CarouselCardType ALBUM_IMAGE = Message_InteractiveMessage_CarouselMessage_CarouselCardType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALBUM_IMAGE');

  static const $core.List<Message_InteractiveMessage_CarouselMessage_CarouselCardType> values = <Message_InteractiveMessage_CarouselMessage_CarouselCardType> [
    UNKNOWN,
    HSCROLL_CARDS,
    ALBUM_IMAGE,
  ];

  static final $core.Map<$core.int, Message_InteractiveMessage_CarouselMessage_CarouselCardType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_InteractiveMessage_CarouselMessage_CarouselCardType? valueOf($core.int value) => _byValue[value];

  const Message_InteractiveMessage_CarouselMessage_CarouselCardType._($core.int v, $core.String n) : super(v, n);
}

class Message_InteractiveMessage_ShopMessage_Surface extends $pb.ProtobufEnum {
  static const Message_InteractiveMessage_ShopMessage_Surface UNKNOWN_SURFACE = Message_InteractiveMessage_ShopMessage_Surface._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_SURFACE');
  static const Message_InteractiveMessage_ShopMessage_Surface FB = Message_InteractiveMessage_ShopMessage_Surface._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FB');
  static const Message_InteractiveMessage_ShopMessage_Surface IG = Message_InteractiveMessage_ShopMessage_Surface._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IG');
  static const Message_InteractiveMessage_ShopMessage_Surface WA = Message_InteractiveMessage_ShopMessage_Surface._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WA');

  static const $core.List<Message_InteractiveMessage_ShopMessage_Surface> values = <Message_InteractiveMessage_ShopMessage_Surface> [
    UNKNOWN_SURFACE,
    FB,
    IG,
    WA,
  ];

  static final $core.Map<$core.int, Message_InteractiveMessage_ShopMessage_Surface> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_InteractiveMessage_ShopMessage_Surface? valueOf($core.int value) => _byValue[value];

  const Message_InteractiveMessage_ShopMessage_Surface._($core.int v, $core.String n) : super(v, n);
}

class Message_InteractiveResponseMessage_Body_Format extends $pb.ProtobufEnum {
  static const Message_InteractiveResponseMessage_Body_Format DEFAULT = Message_InteractiveResponseMessage_Body_Format._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');
  static const Message_InteractiveResponseMessage_Body_Format EXTENSIONS_1 = Message_InteractiveResponseMessage_Body_Format._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXTENSIONS_1');

  static const $core.List<Message_InteractiveResponseMessage_Body_Format> values = <Message_InteractiveResponseMessage_Body_Format> [
    DEFAULT,
    EXTENSIONS_1,
  ];

  static final $core.Map<$core.int, Message_InteractiveResponseMessage_Body_Format> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_InteractiveResponseMessage_Body_Format? valueOf($core.int value) => _byValue[value];

  const Message_InteractiveResponseMessage_Body_Format._($core.int v, $core.String n) : super(v, n);
}

class Message_InvoiceMessage_AttachmentType extends $pb.ProtobufEnum {
  static const Message_InvoiceMessage_AttachmentType IMAGE = Message_InvoiceMessage_AttachmentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');
  static const Message_InvoiceMessage_AttachmentType PDF = Message_InvoiceMessage_AttachmentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PDF');

  static const $core.List<Message_InvoiceMessage_AttachmentType> values = <Message_InvoiceMessage_AttachmentType> [
    IMAGE,
    PDF,
  ];

  static final $core.Map<$core.int, Message_InvoiceMessage_AttachmentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_InvoiceMessage_AttachmentType? valueOf($core.int value) => _byValue[value];

  const Message_InvoiceMessage_AttachmentType._($core.int v, $core.String n) : super(v, n);
}

class Message_LinkPreviewMetadata_SocialMediaPostType extends $pb.ProtobufEnum {
  static const Message_LinkPreviewMetadata_SocialMediaPostType NONE = Message_LinkPreviewMetadata_SocialMediaPostType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const Message_LinkPreviewMetadata_SocialMediaPostType REEL = Message_LinkPreviewMetadata_SocialMediaPostType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REEL');
  static const Message_LinkPreviewMetadata_SocialMediaPostType LIVE_VIDEO = Message_LinkPreviewMetadata_SocialMediaPostType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LIVE_VIDEO');
  static const Message_LinkPreviewMetadata_SocialMediaPostType LONG_VIDEO = Message_LinkPreviewMetadata_SocialMediaPostType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LONG_VIDEO');
  static const Message_LinkPreviewMetadata_SocialMediaPostType SINGLE_IMAGE = Message_LinkPreviewMetadata_SocialMediaPostType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SINGLE_IMAGE');
  static const Message_LinkPreviewMetadata_SocialMediaPostType CAROUSEL = Message_LinkPreviewMetadata_SocialMediaPostType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAROUSEL');

  static const $core.List<Message_LinkPreviewMetadata_SocialMediaPostType> values = <Message_LinkPreviewMetadata_SocialMediaPostType> [
    NONE,
    REEL,
    LIVE_VIDEO,
    LONG_VIDEO,
    SINGLE_IMAGE,
    CAROUSEL,
  ];

  static final $core.Map<$core.int, Message_LinkPreviewMetadata_SocialMediaPostType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_LinkPreviewMetadata_SocialMediaPostType? valueOf($core.int value) => _byValue[value];

  const Message_LinkPreviewMetadata_SocialMediaPostType._($core.int v, $core.String n) : super(v, n);
}

class Message_ListMessage_ListType extends $pb.ProtobufEnum {
  static const Message_ListMessage_ListType UNKNOWN = Message_ListMessage_ListType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_ListMessage_ListType SINGLE_SELECT = Message_ListMessage_ListType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SINGLE_SELECT');
  static const Message_ListMessage_ListType PRODUCT_LIST = Message_ListMessage_ListType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRODUCT_LIST');

  static const $core.List<Message_ListMessage_ListType> values = <Message_ListMessage_ListType> [
    UNKNOWN,
    SINGLE_SELECT,
    PRODUCT_LIST,
  ];

  static final $core.Map<$core.int, Message_ListMessage_ListType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ListMessage_ListType? valueOf($core.int value) => _byValue[value];

  const Message_ListMessage_ListType._($core.int v, $core.String n) : super(v, n);
}

class Message_ListResponseMessage_ListType extends $pb.ProtobufEnum {
  static const Message_ListResponseMessage_ListType UNKNOWN = Message_ListResponseMessage_ListType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_ListResponseMessage_ListType SINGLE_SELECT = Message_ListResponseMessage_ListType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SINGLE_SELECT');

  static const $core.List<Message_ListResponseMessage_ListType> values = <Message_ListResponseMessage_ListType> [
    UNKNOWN,
    SINGLE_SELECT,
  ];

  static final $core.Map<$core.int, Message_ListResponseMessage_ListType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ListResponseMessage_ListType? valueOf($core.int value) => _byValue[value];

  const Message_ListResponseMessage_ListType._($core.int v, $core.String n) : super(v, n);
}

class Message_OrderMessage_OrderStatus extends $pb.ProtobufEnum {
  static const Message_OrderMessage_OrderStatus UNKNOWN_ORDERSTATUS_ZERO = Message_OrderMessage_OrderStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_ORDERSTATUS_ZERO');
  static const Message_OrderMessage_OrderStatus INQUIRY = Message_OrderMessage_OrderStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INQUIRY');
  static const Message_OrderMessage_OrderStatus ACCEPTED = Message_OrderMessage_OrderStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACCEPTED');
  static const Message_OrderMessage_OrderStatus DECLINED = Message_OrderMessage_OrderStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DECLINED');

  static const $core.List<Message_OrderMessage_OrderStatus> values = <Message_OrderMessage_OrderStatus> [
    UNKNOWN_ORDERSTATUS_ZERO,
    INQUIRY,
    ACCEPTED,
    DECLINED,
  ];

  static final $core.Map<$core.int, Message_OrderMessage_OrderStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_OrderMessage_OrderStatus? valueOf($core.int value) => _byValue[value];

  const Message_OrderMessage_OrderStatus._($core.int v, $core.String n) : super(v, n);
}

class Message_OrderMessage_OrderSurface extends $pb.ProtobufEnum {
  static const Message_OrderMessage_OrderSurface UNKNOWN_ORDERSURFACE_ZERO = Message_OrderMessage_OrderSurface._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_ORDERSURFACE_ZERO');
  static const Message_OrderMessage_OrderSurface CATALOG = Message_OrderMessage_OrderSurface._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATALOG');

  static const $core.List<Message_OrderMessage_OrderSurface> values = <Message_OrderMessage_OrderSurface> [
    UNKNOWN_ORDERSURFACE_ZERO,
    CATALOG,
  ];

  static final $core.Map<$core.int, Message_OrderMessage_OrderSurface> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_OrderMessage_OrderSurface? valueOf($core.int value) => _byValue[value];

  const Message_OrderMessage_OrderSurface._($core.int v, $core.String n) : super(v, n);
}

class Message_PaymentInviteMessage_ServiceType extends $pb.ProtobufEnum {
  static const Message_PaymentInviteMessage_ServiceType UNKNOWN = Message_PaymentInviteMessage_ServiceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_PaymentInviteMessage_ServiceType FBPAY = Message_PaymentInviteMessage_ServiceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FBPAY');
  static const Message_PaymentInviteMessage_ServiceType NOVI = Message_PaymentInviteMessage_ServiceType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOVI');
  static const Message_PaymentInviteMessage_ServiceType UPI = Message_PaymentInviteMessage_ServiceType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPI');

  static const $core.List<Message_PaymentInviteMessage_ServiceType> values = <Message_PaymentInviteMessage_ServiceType> [
    UNKNOWN,
    FBPAY,
    NOVI,
    UPI,
  ];

  static final $core.Map<$core.int, Message_PaymentInviteMessage_ServiceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PaymentInviteMessage_ServiceType? valueOf($core.int value) => _byValue[value];

  const Message_PaymentInviteMessage_ServiceType._($core.int v, $core.String n) : super(v, n);
}

class Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType extends $pb.ProtobufEnum {
  static const Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType LINK_PREVIEW = Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LINK_PREVIEW');
  static const Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType ORDER = Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ORDER');

  static const $core.List<Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType> values = <Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType> [
    LINK_PREVIEW,
    ORDER,
  ];

  static final $core.Map<$core.int, Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType? valueOf($core.int value) => _byValue[value];

  const Message_PaymentLinkMetadata_PaymentLinkHeader_PaymentLinkHeaderType._($core.int v, $core.String n) : super(v, n);
}

class Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType extends $pb.ProtobufEnum {
  static const Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType UNKNOWN_GALAXYFLOWACTIONTYPE_ZERO = Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_GALAXYFLOWACTIONTYPE_ZERO');
  static const Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType NOTIFY_LAUNCH = Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOTIFY_LAUNCH');

  static const $core.List<Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType> values = <Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType> [
    UNKNOWN_GALAXYFLOWACTIONTYPE_ZERO,
    NOTIFY_LAUNCH,
  ];

  static final $core.Map<$core.int, Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType? valueOf($core.int value) => _byValue[value];

  const Message_PeerDataOperationRequestMessage_GalaxyFlowAction_GalaxyFlowActionType._($core.int v, $core.String n) : super(v, n);
}

class Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode extends $pb.ProtobufEnum {
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode REQUEST_SUCCESS = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REQUEST_SUCCESS');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode REQUEST_TIME_EXPIRED = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REQUEST_TIME_EXPIRED');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode DECLINED_SHARING_HISTORY = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DECLINED_SHARING_HISTORY');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode GENERIC_ERROR = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERIC_ERROR');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode ERROR_REQUEST_ON_NON_SMB_PRIMARY = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERROR_REQUEST_ON_NON_SMB_PRIMARY');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode ERROR_HOSTED_DEVICE_NOT_CONNECTED = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERROR_HOSTED_DEVICE_NOT_CONNECTED');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode ERROR_HOSTED_DEVICE_LOGIN_TIME_NOT_SET = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERROR_HOSTED_DEVICE_LOGIN_TIME_NOT_SET');

  static const $core.List<Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode> values = <Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode> [
    REQUEST_SUCCESS,
    REQUEST_TIME_EXPIRED,
    DECLINED_SHARING_HISTORY,
    GENERIC_ERROR,
    ERROR_REQUEST_ON_NON_SMB_PRIMARY,
    ERROR_HOSTED_DEVICE_NOT_CONNECTED,
    ERROR_HOSTED_DEVICE_LOGIN_TIME_NOT_SET,
  ];

  static final $core.Map<$core.int, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode? valueOf($core.int value) => _byValue[value];

  const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_FullHistorySyncOnDemandResponseCode._($core.int v, $core.String n) : super(v, n);
}

class Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode extends $pb.ProtobufEnum {
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode UNKNOWN_HISTORYSYNCCHUNKRETRYRESPONSECODE_ZERO = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_HISTORYSYNCCHUNKRETRYRESPONSECODE_ZERO');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode GENERATION_ERROR = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERATION_ERROR');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode CHUNK_CONSUMED = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHUNK_CONSUMED');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode TIMEOUT = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TIMEOUT');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode SESSION_EXHAUSTED = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SESSION_EXHAUSTED');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode CHUNK_EXHAUSTED = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHUNK_EXHAUSTED');
  static const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode DUPLICATED_REQUEST = Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DUPLICATED_REQUEST');

  static const $core.List<Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode> values = <Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode> [
    UNKNOWN_HISTORYSYNCCHUNKRETRYRESPONSECODE_ZERO,
    GENERATION_ERROR,
    CHUNK_CONSUMED,
    TIMEOUT,
    SESSION_EXHAUSTED,
    CHUNK_EXHAUSTED,
    DUPLICATED_REQUEST,
  ];

  static final $core.Map<$core.int, Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode? valueOf($core.int value) => _byValue[value];

  const Message_PeerDataOperationRequestResponseMessage_PeerDataOperationResult_HistorySyncChunkRetryResponseCode._($core.int v, $core.String n) : super(v, n);
}

class Message_PinInChatMessage_Type extends $pb.ProtobufEnum {
  static const Message_PinInChatMessage_Type UNKNOWN_TYPE = Message_PinInChatMessage_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_TYPE');
  static const Message_PinInChatMessage_Type PIN_FOR_ALL = Message_PinInChatMessage_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PIN_FOR_ALL');
  static const Message_PinInChatMessage_Type UNPIN_FOR_ALL = Message_PinInChatMessage_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNPIN_FOR_ALL');

  static const $core.List<Message_PinInChatMessage_Type> values = <Message_PinInChatMessage_Type> [
    UNKNOWN_TYPE,
    PIN_FOR_ALL,
    UNPIN_FOR_ALL,
  ];

  static final $core.Map<$core.int, Message_PinInChatMessage_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PinInChatMessage_Type? valueOf($core.int value) => _byValue[value];

  const Message_PinInChatMessage_Type._($core.int v, $core.String n) : super(v, n);
}

class Message_PlaceholderMessage_PlaceholderType extends $pb.ProtobufEnum {
  static const Message_PlaceholderMessage_PlaceholderType MASK_LINKED_DEVICES = Message_PlaceholderMessage_PlaceholderType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MASK_LINKED_DEVICES');

  static const $core.List<Message_PlaceholderMessage_PlaceholderType> values = <Message_PlaceholderMessage_PlaceholderType> [
    MASK_LINKED_DEVICES,
  ];

  static final $core.Map<$core.int, Message_PlaceholderMessage_PlaceholderType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_PlaceholderMessage_PlaceholderType? valueOf($core.int value) => _byValue[value];

  const Message_PlaceholderMessage_PlaceholderType._($core.int v, $core.String n) : super(v, n);
}

class Message_ProtocolMessage_Type extends $pb.ProtobufEnum {
  static const Message_ProtocolMessage_Type REVOKE = Message_ProtocolMessage_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REVOKE');
  static const Message_ProtocolMessage_Type EPHEMERAL_SETTING = Message_ProtocolMessage_Type._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EPHEMERAL_SETTING');
  static const Message_ProtocolMessage_Type EPHEMERAL_SYNC_RESPONSE = Message_ProtocolMessage_Type._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EPHEMERAL_SYNC_RESPONSE');
  static const Message_ProtocolMessage_Type HISTORY_SYNC_NOTIFICATION = Message_ProtocolMessage_Type._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HISTORY_SYNC_NOTIFICATION');
  static const Message_ProtocolMessage_Type APP_STATE_SYNC_KEY_SHARE = Message_ProtocolMessage_Type._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APP_STATE_SYNC_KEY_SHARE');
  static const Message_ProtocolMessage_Type APP_STATE_SYNC_KEY_REQUEST = Message_ProtocolMessage_Type._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APP_STATE_SYNC_KEY_REQUEST');
  static const Message_ProtocolMessage_Type MSG_FANOUT_BACKFILL_REQUEST = Message_ProtocolMessage_Type._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MSG_FANOUT_BACKFILL_REQUEST');
  static const Message_ProtocolMessage_Type INITIAL_SECURITY_NOTIFICATION_SETTING_SYNC = Message_ProtocolMessage_Type._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INITIAL_SECURITY_NOTIFICATION_SETTING_SYNC');
  static const Message_ProtocolMessage_Type APP_STATE_FATAL_EXCEPTION_NOTIFICATION = Message_ProtocolMessage_Type._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APP_STATE_FATAL_EXCEPTION_NOTIFICATION');
  static const Message_ProtocolMessage_Type SHARE_PHONE_NUMBER = Message_ProtocolMessage_Type._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHARE_PHONE_NUMBER');
  static const Message_ProtocolMessage_Type MESSAGE_EDIT = Message_ProtocolMessage_Type._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSAGE_EDIT');
  static const Message_ProtocolMessage_Type PEER_DATA_OPERATION_REQUEST_MESSAGE = Message_ProtocolMessage_Type._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PEER_DATA_OPERATION_REQUEST_MESSAGE');
  static const Message_ProtocolMessage_Type PEER_DATA_OPERATION_REQUEST_RESPONSE_MESSAGE = Message_ProtocolMessage_Type._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PEER_DATA_OPERATION_REQUEST_RESPONSE_MESSAGE');
  static const Message_ProtocolMessage_Type REQUEST_WELCOME_MESSAGE = Message_ProtocolMessage_Type._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REQUEST_WELCOME_MESSAGE');
  static const Message_ProtocolMessage_Type BOT_FEEDBACK_MESSAGE = Message_ProtocolMessage_Type._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_FEEDBACK_MESSAGE');
  static const Message_ProtocolMessage_Type MEDIA_NOTIFY_MESSAGE = Message_ProtocolMessage_Type._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MEDIA_NOTIFY_MESSAGE');
  static const Message_ProtocolMessage_Type CLOUD_API_THREAD_CONTROL_NOTIFICATION = Message_ProtocolMessage_Type._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLOUD_API_THREAD_CONTROL_NOTIFICATION');
  static const Message_ProtocolMessage_Type LID_MIGRATION_MAPPING_SYNC = Message_ProtocolMessage_Type._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LID_MIGRATION_MAPPING_SYNC');
  static const Message_ProtocolMessage_Type REMINDER_MESSAGE = Message_ProtocolMessage_Type._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REMINDER_MESSAGE');
  static const Message_ProtocolMessage_Type BOT_MEMU_ONBOARDING_MESSAGE = Message_ProtocolMessage_Type._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_MEMU_ONBOARDING_MESSAGE');
  static const Message_ProtocolMessage_Type STATUS_MENTION_MESSAGE = Message_ProtocolMessage_Type._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_MENTION_MESSAGE');
  static const Message_ProtocolMessage_Type STOP_GENERATION_MESSAGE = Message_ProtocolMessage_Type._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STOP_GENERATION_MESSAGE');
  static const Message_ProtocolMessage_Type LIMIT_SHARING = Message_ProtocolMessage_Type._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LIMIT_SHARING');
  static const Message_ProtocolMessage_Type AI_PSI_METADATA = Message_ProtocolMessage_Type._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_PSI_METADATA');
  static const Message_ProtocolMessage_Type AI_QUERY_FANOUT = Message_ProtocolMessage_Type._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_QUERY_FANOUT');
  static const Message_ProtocolMessage_Type GROUP_MEMBER_LABEL_CHANGE = Message_ProtocolMessage_Type._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_MEMBER_LABEL_CHANGE');

  static const $core.List<Message_ProtocolMessage_Type> values = <Message_ProtocolMessage_Type> [
    REVOKE,
    EPHEMERAL_SETTING,
    EPHEMERAL_SYNC_RESPONSE,
    HISTORY_SYNC_NOTIFICATION,
    APP_STATE_SYNC_KEY_SHARE,
    APP_STATE_SYNC_KEY_REQUEST,
    MSG_FANOUT_BACKFILL_REQUEST,
    INITIAL_SECURITY_NOTIFICATION_SETTING_SYNC,
    APP_STATE_FATAL_EXCEPTION_NOTIFICATION,
    SHARE_PHONE_NUMBER,
    MESSAGE_EDIT,
    PEER_DATA_OPERATION_REQUEST_MESSAGE,
    PEER_DATA_OPERATION_REQUEST_RESPONSE_MESSAGE,
    REQUEST_WELCOME_MESSAGE,
    BOT_FEEDBACK_MESSAGE,
    MEDIA_NOTIFY_MESSAGE,
    CLOUD_API_THREAD_CONTROL_NOTIFICATION,
    LID_MIGRATION_MAPPING_SYNC,
    REMINDER_MESSAGE,
    BOT_MEMU_ONBOARDING_MESSAGE,
    STATUS_MENTION_MESSAGE,
    STOP_GENERATION_MESSAGE,
    LIMIT_SHARING,
    AI_PSI_METADATA,
    AI_QUERY_FANOUT,
    GROUP_MEMBER_LABEL_CHANGE,
  ];

  static final $core.Map<$core.int, Message_ProtocolMessage_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ProtocolMessage_Type? valueOf($core.int value) => _byValue[value];

  const Message_ProtocolMessage_Type._($core.int v, $core.String n) : super(v, n);
}

class Message_RequestWelcomeMessageMetadata_LocalChatState extends $pb.ProtobufEnum {
  static const Message_RequestWelcomeMessageMetadata_LocalChatState EMPTY = Message_RequestWelcomeMessageMetadata_LocalChatState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMPTY');
  static const Message_RequestWelcomeMessageMetadata_LocalChatState NON_EMPTY = Message_RequestWelcomeMessageMetadata_LocalChatState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NON_EMPTY');

  static const $core.List<Message_RequestWelcomeMessageMetadata_LocalChatState> values = <Message_RequestWelcomeMessageMetadata_LocalChatState> [
    EMPTY,
    NON_EMPTY,
  ];

  static final $core.Map<$core.int, Message_RequestWelcomeMessageMetadata_LocalChatState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_RequestWelcomeMessageMetadata_LocalChatState? valueOf($core.int value) => _byValue[value];

  const Message_RequestWelcomeMessageMetadata_LocalChatState._($core.int v, $core.String n) : super(v, n);
}

class Message_ScheduledCallCreationMessage_CallType extends $pb.ProtobufEnum {
  static const Message_ScheduledCallCreationMessage_CallType UNKNOWN = Message_ScheduledCallCreationMessage_CallType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_ScheduledCallCreationMessage_CallType VOICE = Message_ScheduledCallCreationMessage_CallType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VOICE');
  static const Message_ScheduledCallCreationMessage_CallType VIDEO = Message_ScheduledCallCreationMessage_CallType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIDEO');

  static const $core.List<Message_ScheduledCallCreationMessage_CallType> values = <Message_ScheduledCallCreationMessage_CallType> [
    UNKNOWN,
    VOICE,
    VIDEO,
  ];

  static final $core.Map<$core.int, Message_ScheduledCallCreationMessage_CallType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ScheduledCallCreationMessage_CallType? valueOf($core.int value) => _byValue[value];

  const Message_ScheduledCallCreationMessage_CallType._($core.int v, $core.String n) : super(v, n);
}

class Message_ScheduledCallEditMessage_EditType extends $pb.ProtobufEnum {
  static const Message_ScheduledCallEditMessage_EditType UNKNOWN = Message_ScheduledCallEditMessage_EditType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_ScheduledCallEditMessage_EditType CANCEL = Message_ScheduledCallEditMessage_EditType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCEL');

  static const $core.List<Message_ScheduledCallEditMessage_EditType> values = <Message_ScheduledCallEditMessage_EditType> [
    UNKNOWN,
    CANCEL,
  ];

  static final $core.Map<$core.int, Message_ScheduledCallEditMessage_EditType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_ScheduledCallEditMessage_EditType? valueOf($core.int value) => _byValue[value];

  const Message_ScheduledCallEditMessage_EditType._($core.int v, $core.String n) : super(v, n);
}

class Message_SecretEncryptedMessage_SecretEncType extends $pb.ProtobufEnum {
  static const Message_SecretEncryptedMessage_SecretEncType UNKNOWN = Message_SecretEncryptedMessage_SecretEncType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_SecretEncryptedMessage_SecretEncType EVENT_EDIT = Message_SecretEncryptedMessage_SecretEncType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_EDIT');
  static const Message_SecretEncryptedMessage_SecretEncType MESSAGE_EDIT = Message_SecretEncryptedMessage_SecretEncType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSAGE_EDIT');

  static const $core.List<Message_SecretEncryptedMessage_SecretEncType> values = <Message_SecretEncryptedMessage_SecretEncType> [
    UNKNOWN,
    EVENT_EDIT,
    MESSAGE_EDIT,
  ];

  static final $core.Map<$core.int, Message_SecretEncryptedMessage_SecretEncType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_SecretEncryptedMessage_SecretEncType? valueOf($core.int value) => _byValue[value];

  const Message_SecretEncryptedMessage_SecretEncType._($core.int v, $core.String n) : super(v, n);
}

class Message_StatusNotificationMessage_StatusNotificationType extends $pb.ProtobufEnum {
  static const Message_StatusNotificationMessage_StatusNotificationType UNKNOWN = Message_StatusNotificationMessage_StatusNotificationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_StatusNotificationMessage_StatusNotificationType STATUS_ADD_YOURS = Message_StatusNotificationMessage_StatusNotificationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_ADD_YOURS');
  static const Message_StatusNotificationMessage_StatusNotificationType STATUS_RESHARE = Message_StatusNotificationMessage_StatusNotificationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_RESHARE');
  static const Message_StatusNotificationMessage_StatusNotificationType STATUS_QUESTION_ANSWER_RESHARE = Message_StatusNotificationMessage_StatusNotificationType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_QUESTION_ANSWER_RESHARE');

  static const $core.List<Message_StatusNotificationMessage_StatusNotificationType> values = <Message_StatusNotificationMessage_StatusNotificationType> [
    UNKNOWN,
    STATUS_ADD_YOURS,
    STATUS_RESHARE,
    STATUS_QUESTION_ANSWER_RESHARE,
  ];

  static final $core.Map<$core.int, Message_StatusNotificationMessage_StatusNotificationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_StatusNotificationMessage_StatusNotificationType? valueOf($core.int value) => _byValue[value];

  const Message_StatusNotificationMessage_StatusNotificationType._($core.int v, $core.String n) : super(v, n);
}

class Message_StatusQuotedMessage_StatusQuotedMessageType extends $pb.ProtobufEnum {
  static const Message_StatusQuotedMessage_StatusQuotedMessageType UNKNOWN_STATUSQUOTEDMESSAGETYPE_ZERO = Message_StatusQuotedMessage_StatusQuotedMessageType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_STATUSQUOTEDMESSAGETYPE_ZERO');
  static const Message_StatusQuotedMessage_StatusQuotedMessageType QUESTION_ANSWER = Message_StatusQuotedMessage_StatusQuotedMessageType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUESTION_ANSWER');

  static const $core.List<Message_StatusQuotedMessage_StatusQuotedMessageType> values = <Message_StatusQuotedMessage_StatusQuotedMessageType> [
    UNKNOWN_STATUSQUOTEDMESSAGETYPE_ZERO,
    QUESTION_ANSWER,
  ];

  static final $core.Map<$core.int, Message_StatusQuotedMessage_StatusQuotedMessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_StatusQuotedMessage_StatusQuotedMessageType? valueOf($core.int value) => _byValue[value];

  const Message_StatusQuotedMessage_StatusQuotedMessageType._($core.int v, $core.String n) : super(v, n);
}

class Message_StatusStickerInteractionMessage_StatusStickerType extends $pb.ProtobufEnum {
  static const Message_StatusStickerInteractionMessage_StatusStickerType UNKNOWN = Message_StatusStickerInteractionMessage_StatusStickerType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const Message_StatusStickerInteractionMessage_StatusStickerType REACTION = Message_StatusStickerInteractionMessage_StatusStickerType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REACTION');

  static const $core.List<Message_StatusStickerInteractionMessage_StatusStickerType> values = <Message_StatusStickerInteractionMessage_StatusStickerType> [
    UNKNOWN,
    REACTION,
  ];

  static final $core.Map<$core.int, Message_StatusStickerInteractionMessage_StatusStickerType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_StatusStickerInteractionMessage_StatusStickerType? valueOf($core.int value) => _byValue[value];

  const Message_StatusStickerInteractionMessage_StatusStickerType._($core.int v, $core.String n) : super(v, n);
}

class Message_StickerPackMessage_StickerPackOrigin extends $pb.ProtobufEnum {
  static const Message_StickerPackMessage_StickerPackOrigin FIRST_PARTY = Message_StickerPackMessage_StickerPackOrigin._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FIRST_PARTY');
  static const Message_StickerPackMessage_StickerPackOrigin THIRD_PARTY = Message_StickerPackMessage_StickerPackOrigin._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'THIRD_PARTY');
  static const Message_StickerPackMessage_StickerPackOrigin USER_CREATED = Message_StickerPackMessage_StickerPackOrigin._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_CREATED');

  static const $core.List<Message_StickerPackMessage_StickerPackOrigin> values = <Message_StickerPackMessage_StickerPackOrigin> [
    FIRST_PARTY,
    THIRD_PARTY,
    USER_CREATED,
  ];

  static final $core.Map<$core.int, Message_StickerPackMessage_StickerPackOrigin> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_StickerPackMessage_StickerPackOrigin? valueOf($core.int value) => _byValue[value];

  const Message_StickerPackMessage_StickerPackOrigin._($core.int v, $core.String n) : super(v, n);
}

class Message_VideoMessage_Attribution extends $pb.ProtobufEnum {
  static const Message_VideoMessage_Attribution NONE = Message_VideoMessage_Attribution._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const Message_VideoMessage_Attribution GIPHY = Message_VideoMessage_Attribution._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GIPHY');
  static const Message_VideoMessage_Attribution TENOR = Message_VideoMessage_Attribution._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TENOR');
  static const Message_VideoMessage_Attribution KLIPY = Message_VideoMessage_Attribution._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'KLIPY');

  static const $core.List<Message_VideoMessage_Attribution> values = <Message_VideoMessage_Attribution> [
    NONE,
    GIPHY,
    TENOR,
    KLIPY,
  ];

  static final $core.Map<$core.int, Message_VideoMessage_Attribution> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_VideoMessage_Attribution? valueOf($core.int value) => _byValue[value];

  const Message_VideoMessage_Attribution._($core.int v, $core.String n) : super(v, n);
}

class Message_VideoMessage_VideoSourceType extends $pb.ProtobufEnum {
  static const Message_VideoMessage_VideoSourceType USER_VIDEO = Message_VideoMessage_VideoSourceType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_VIDEO');
  static const Message_VideoMessage_VideoSourceType AI_GENERATED = Message_VideoMessage_VideoSourceType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_GENERATED');

  static const $core.List<Message_VideoMessage_VideoSourceType> values = <Message_VideoMessage_VideoSourceType> [
    USER_VIDEO,
    AI_GENERATED,
  ];

  static final $core.Map<$core.int, Message_VideoMessage_VideoSourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_VideoMessage_VideoSourceType? valueOf($core.int value) => _byValue[value];

  const Message_VideoMessage_VideoSourceType._($core.int v, $core.String n) : super(v, n);
}

class MessageAddOn_MessageAddOnType extends $pb.ProtobufEnum {
  static const MessageAddOn_MessageAddOnType UNDEFINED = MessageAddOn_MessageAddOnType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNDEFINED');
  static const MessageAddOn_MessageAddOnType REACTION = MessageAddOn_MessageAddOnType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REACTION');
  static const MessageAddOn_MessageAddOnType EVENT_RESPONSE = MessageAddOn_MessageAddOnType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_RESPONSE');
  static const MessageAddOn_MessageAddOnType POLL_UPDATE = MessageAddOn_MessageAddOnType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POLL_UPDATE');
  static const MessageAddOn_MessageAddOnType PIN_IN_CHAT = MessageAddOn_MessageAddOnType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PIN_IN_CHAT');

  static const $core.List<MessageAddOn_MessageAddOnType> values = <MessageAddOn_MessageAddOnType> [
    UNDEFINED,
    REACTION,
    EVENT_RESPONSE,
    POLL_UPDATE,
    PIN_IN_CHAT,
  ];

  static final $core.Map<$core.int, MessageAddOn_MessageAddOnType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageAddOn_MessageAddOnType? valueOf($core.int value) => _byValue[value];

  const MessageAddOn_MessageAddOnType._($core.int v, $core.String n) : super(v, n);
}

class MessageAssociation_AssociationType extends $pb.ProtobufEnum {
  static const MessageAssociation_AssociationType UNKNOWN = MessageAssociation_AssociationType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const MessageAssociation_AssociationType MEDIA_ALBUM = MessageAssociation_AssociationType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MEDIA_ALBUM');
  static const MessageAssociation_AssociationType BOT_PLUGIN = MessageAssociation_AssociationType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOT_PLUGIN');
  static const MessageAssociation_AssociationType EVENT_COVER_IMAGE = MessageAssociation_AssociationType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_COVER_IMAGE');
  static const MessageAssociation_AssociationType STATUS_POLL = MessageAssociation_AssociationType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_POLL');
  static const MessageAssociation_AssociationType HD_VIDEO_DUAL_UPLOAD = MessageAssociation_AssociationType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HD_VIDEO_DUAL_UPLOAD');
  static const MessageAssociation_AssociationType STATUS_EXTERNAL_RESHARE = MessageAssociation_AssociationType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_EXTERNAL_RESHARE');
  static const MessageAssociation_AssociationType MEDIA_POLL = MessageAssociation_AssociationType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MEDIA_POLL');
  static const MessageAssociation_AssociationType STATUS_ADD_YOURS = MessageAssociation_AssociationType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_ADD_YOURS');
  static const MessageAssociation_AssociationType STATUS_NOTIFICATION = MessageAssociation_AssociationType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_NOTIFICATION');
  static const MessageAssociation_AssociationType HD_IMAGE_DUAL_UPLOAD = MessageAssociation_AssociationType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HD_IMAGE_DUAL_UPLOAD');
  static const MessageAssociation_AssociationType STICKER_ANNOTATION = MessageAssociation_AssociationType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STICKER_ANNOTATION');
  static const MessageAssociation_AssociationType MOTION_PHOTO = MessageAssociation_AssociationType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MOTION_PHOTO');
  static const MessageAssociation_AssociationType STATUS_LINK_ACTION = MessageAssociation_AssociationType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_LINK_ACTION');
  static const MessageAssociation_AssociationType VIEW_ALL_REPLIES = MessageAssociation_AssociationType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIEW_ALL_REPLIES');
  static const MessageAssociation_AssociationType STATUS_ADD_YOURS_AI_IMAGINE = MessageAssociation_AssociationType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_ADD_YOURS_AI_IMAGINE');
  static const MessageAssociation_AssociationType STATUS_QUESTION = MessageAssociation_AssociationType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_QUESTION');
  static const MessageAssociation_AssociationType STATUS_ADD_YOURS_DIWALI = MessageAssociation_AssociationType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_ADD_YOURS_DIWALI');
  static const MessageAssociation_AssociationType STATUS_REACTION = MessageAssociation_AssociationType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_REACTION');
  static const MessageAssociation_AssociationType HEVC_VIDEO_DUAL_UPLOAD = MessageAssociation_AssociationType._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HEVC_VIDEO_DUAL_UPLOAD');

  static const $core.List<MessageAssociation_AssociationType> values = <MessageAssociation_AssociationType> [
    UNKNOWN,
    MEDIA_ALBUM,
    BOT_PLUGIN,
    EVENT_COVER_IMAGE,
    STATUS_POLL,
    HD_VIDEO_DUAL_UPLOAD,
    STATUS_EXTERNAL_RESHARE,
    MEDIA_POLL,
    STATUS_ADD_YOURS,
    STATUS_NOTIFICATION,
    HD_IMAGE_DUAL_UPLOAD,
    STICKER_ANNOTATION,
    MOTION_PHOTO,
    STATUS_LINK_ACTION,
    VIEW_ALL_REPLIES,
    STATUS_ADD_YOURS_AI_IMAGINE,
    STATUS_QUESTION,
    STATUS_ADD_YOURS_DIWALI,
    STATUS_REACTION,
    HEVC_VIDEO_DUAL_UPLOAD,
  ];

  static final $core.Map<$core.int, MessageAssociation_AssociationType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageAssociation_AssociationType? valueOf($core.int value) => _byValue[value];

  const MessageAssociation_AssociationType._($core.int v, $core.String n) : super(v, n);
}

class MessageContextInfo_MessageAddonExpiryType extends $pb.ProtobufEnum {
  static const MessageContextInfo_MessageAddonExpiryType UNKNOWN_MESSAGEADDONEXPIRYTYPE_ZERO = MessageContextInfo_MessageAddonExpiryType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_MESSAGEADDONEXPIRYTYPE_ZERO');
  static const MessageContextInfo_MessageAddonExpiryType STATIC = MessageContextInfo_MessageAddonExpiryType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATIC');
  static const MessageContextInfo_MessageAddonExpiryType DEPENDENT_ON_PARENT = MessageContextInfo_MessageAddonExpiryType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEPENDENT_ON_PARENT');

  static const $core.List<MessageContextInfo_MessageAddonExpiryType> values = <MessageContextInfo_MessageAddonExpiryType> [
    UNKNOWN_MESSAGEADDONEXPIRYTYPE_ZERO,
    STATIC,
    DEPENDENT_ON_PARENT,
  ];

  static final $core.Map<$core.int, MessageContextInfo_MessageAddonExpiryType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageContextInfo_MessageAddonExpiryType? valueOf($core.int value) => _byValue[value];

  const MessageContextInfo_MessageAddonExpiryType._($core.int v, $core.String n) : super(v, n);
}

class MsgOpaqueData_PollContentType extends $pb.ProtobufEnum {
  static const MsgOpaqueData_PollContentType UNKNOWN = MsgOpaqueData_PollContentType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const MsgOpaqueData_PollContentType TEXT = MsgOpaqueData_PollContentType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'TEXT');
  static const MsgOpaqueData_PollContentType IMAGE = MsgOpaqueData_PollContentType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IMAGE');

  static const $core.List<MsgOpaqueData_PollContentType> values = <MsgOpaqueData_PollContentType> [
    UNKNOWN,
    TEXT,
    IMAGE,
  ];

  static final $core.Map<$core.int, MsgOpaqueData_PollContentType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MsgOpaqueData_PollContentType? valueOf($core.int value) => _byValue[value];

  const MsgOpaqueData_PollContentType._($core.int v, $core.String n) : super(v, n);
}

class MsgOpaqueData_PollType extends $pb.ProtobufEnum {
  static const MsgOpaqueData_PollType POLL = MsgOpaqueData_PollType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POLL');
  static const MsgOpaqueData_PollType QUIZ = MsgOpaqueData_PollType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUIZ');

  static const $core.List<MsgOpaqueData_PollType> values = <MsgOpaqueData_PollType> [
    POLL,
    QUIZ,
  ];

  static final $core.Map<$core.int, MsgOpaqueData_PollType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MsgOpaqueData_PollType? valueOf($core.int value) => _byValue[value];

  const MsgOpaqueData_PollType._($core.int v, $core.String n) : super(v, n);
}

class PastParticipant_LeaveReason extends $pb.ProtobufEnum {
  static const PastParticipant_LeaveReason LEFT = PastParticipant_LeaveReason._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LEFT');
  static const PastParticipant_LeaveReason REMOVED = PastParticipant_LeaveReason._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REMOVED');

  static const $core.List<PastParticipant_LeaveReason> values = <PastParticipant_LeaveReason> [
    LEFT,
    REMOVED,
  ];

  static final $core.Map<$core.int, PastParticipant_LeaveReason> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PastParticipant_LeaveReason? valueOf($core.int value) => _byValue[value];

  const PastParticipant_LeaveReason._($core.int v, $core.String n) : super(v, n);
}

class PatchDebugData_Platform extends $pb.ProtobufEnum {
  static const PatchDebugData_Platform ANDROID = PatchDebugData_Platform._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANDROID');
  static const PatchDebugData_Platform SMBA = PatchDebugData_Platform._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SMBA');
  static const PatchDebugData_Platform IPHONE = PatchDebugData_Platform._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IPHONE');
  static const PatchDebugData_Platform SMBI = PatchDebugData_Platform._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SMBI');
  static const PatchDebugData_Platform WEB = PatchDebugData_Platform._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEB');
  static const PatchDebugData_Platform UWP = PatchDebugData_Platform._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UWP');
  static const PatchDebugData_Platform DARWIN = PatchDebugData_Platform._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DARWIN');
  static const PatchDebugData_Platform IPAD = PatchDebugData_Platform._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IPAD');
  static const PatchDebugData_Platform WEAROS = PatchDebugData_Platform._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEAROS');
  static const PatchDebugData_Platform WASG = PatchDebugData_Platform._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WASG');
  static const PatchDebugData_Platform WEARM = PatchDebugData_Platform._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WEARM');
  static const PatchDebugData_Platform CAPI = PatchDebugData_Platform._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAPI');

  static const $core.List<PatchDebugData_Platform> values = <PatchDebugData_Platform> [
    ANDROID,
    SMBA,
    IPHONE,
    SMBI,
    WEB,
    UWP,
    DARWIN,
    IPAD,
    WEAROS,
    WASG,
    WEARM,
    CAPI,
  ];

  static final $core.Map<$core.int, PatchDebugData_Platform> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PatchDebugData_Platform? valueOf($core.int value) => _byValue[value];

  const PatchDebugData_Platform._($core.int v, $core.String n) : super(v, n);
}

class PaymentBackground_Type extends $pb.ProtobufEnum {
  static const PaymentBackground_Type UNKNOWN = PaymentBackground_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const PaymentBackground_Type DEFAULT = PaymentBackground_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT');

  static const $core.List<PaymentBackground_Type> values = <PaymentBackground_Type> [
    UNKNOWN,
    DEFAULT,
  ];

  static final $core.Map<$core.int, PaymentBackground_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentBackground_Type? valueOf($core.int value) => _byValue[value];

  const PaymentBackground_Type._($core.int v, $core.String n) : super(v, n);
}

class PaymentInfo_Currency extends $pb.ProtobufEnum {
  static const PaymentInfo_Currency UNKNOWN_CURRENCY = PaymentInfo_Currency._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_CURRENCY');
  static const PaymentInfo_Currency INR = PaymentInfo_Currency._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INR');

  static const $core.List<PaymentInfo_Currency> values = <PaymentInfo_Currency> [
    UNKNOWN_CURRENCY,
    INR,
  ];

  static final $core.Map<$core.int, PaymentInfo_Currency> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentInfo_Currency? valueOf($core.int value) => _byValue[value];

  const PaymentInfo_Currency._($core.int v, $core.String n) : super(v, n);
}

class PaymentInfo_Status extends $pb.ProtobufEnum {
  static const PaymentInfo_Status UNKNOWN_STATUS = PaymentInfo_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_STATUS');
  static const PaymentInfo_Status PROCESSING = PaymentInfo_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PROCESSING');
  static const PaymentInfo_Status SENT = PaymentInfo_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SENT');
  static const PaymentInfo_Status NEED_TO_ACCEPT = PaymentInfo_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NEED_TO_ACCEPT');
  static const PaymentInfo_Status COMPLETE = PaymentInfo_Status._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPLETE');
  static const PaymentInfo_Status COULD_NOT_COMPLETE = PaymentInfo_Status._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COULD_NOT_COMPLETE');
  static const PaymentInfo_Status REFUNDED = PaymentInfo_Status._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REFUNDED');
  static const PaymentInfo_Status EXPIRED = PaymentInfo_Status._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXPIRED');
  static const PaymentInfo_Status REJECTED = PaymentInfo_Status._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REJECTED');
  static const PaymentInfo_Status CANCELLED = PaymentInfo_Status._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CANCELLED');
  static const PaymentInfo_Status WAITING_FOR_PAYER = PaymentInfo_Status._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WAITING_FOR_PAYER');
  static const PaymentInfo_Status WAITING = PaymentInfo_Status._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'WAITING');

  static const $core.List<PaymentInfo_Status> values = <PaymentInfo_Status> [
    UNKNOWN_STATUS,
    PROCESSING,
    SENT,
    NEED_TO_ACCEPT,
    COMPLETE,
    COULD_NOT_COMPLETE,
    REFUNDED,
    EXPIRED,
    REJECTED,
    CANCELLED,
    WAITING_FOR_PAYER,
    WAITING,
  ];

  static final $core.Map<$core.int, PaymentInfo_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentInfo_Status? valueOf($core.int value) => _byValue[value];

  const PaymentInfo_Status._($core.int v, $core.String n) : super(v, n);
}

class PaymentInfo_TxnStatus extends $pb.ProtobufEnum {
  static const PaymentInfo_TxnStatus UNKNOWN = PaymentInfo_TxnStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const PaymentInfo_TxnStatus PENDING_SETUP = PaymentInfo_TxnStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PENDING_SETUP');
  static const PaymentInfo_TxnStatus PENDING_RECEIVER_SETUP = PaymentInfo_TxnStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PENDING_RECEIVER_SETUP');
  static const PaymentInfo_TxnStatus INIT = PaymentInfo_TxnStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INIT');
  static const PaymentInfo_TxnStatus SUCCESS = PaymentInfo_TxnStatus._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUCCESS');
  static const PaymentInfo_TxnStatus COMPLETED = PaymentInfo_TxnStatus._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMPLETED');
  static const PaymentInfo_TxnStatus FAILED = PaymentInfo_TxnStatus._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED');
  static const PaymentInfo_TxnStatus FAILED_RISK = PaymentInfo_TxnStatus._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED_RISK');
  static const PaymentInfo_TxnStatus FAILED_PROCESSING = PaymentInfo_TxnStatus._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED_PROCESSING');
  static const PaymentInfo_TxnStatus FAILED_RECEIVER_PROCESSING = PaymentInfo_TxnStatus._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED_RECEIVER_PROCESSING');
  static const PaymentInfo_TxnStatus FAILED_DA = PaymentInfo_TxnStatus._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED_DA');
  static const PaymentInfo_TxnStatus FAILED_DA_FINAL = PaymentInfo_TxnStatus._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAILED_DA_FINAL');
  static const PaymentInfo_TxnStatus REFUNDED_TXN = PaymentInfo_TxnStatus._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REFUNDED_TXN');
  static const PaymentInfo_TxnStatus REFUND_FAILED = PaymentInfo_TxnStatus._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REFUND_FAILED');
  static const PaymentInfo_TxnStatus REFUND_FAILED_PROCESSING = PaymentInfo_TxnStatus._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REFUND_FAILED_PROCESSING');
  static const PaymentInfo_TxnStatus REFUND_FAILED_DA = PaymentInfo_TxnStatus._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REFUND_FAILED_DA');
  static const PaymentInfo_TxnStatus EXPIRED_TXN = PaymentInfo_TxnStatus._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXPIRED_TXN');
  static const PaymentInfo_TxnStatus AUTH_CANCELED = PaymentInfo_TxnStatus._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTH_CANCELED');
  static const PaymentInfo_TxnStatus AUTH_CANCEL_FAILED_PROCESSING = PaymentInfo_TxnStatus._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTH_CANCEL_FAILED_PROCESSING');
  static const PaymentInfo_TxnStatus AUTH_CANCEL_FAILED = PaymentInfo_TxnStatus._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTH_CANCEL_FAILED');
  static const PaymentInfo_TxnStatus COLLECT_INIT = PaymentInfo_TxnStatus._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_INIT');
  static const PaymentInfo_TxnStatus COLLECT_SUCCESS = PaymentInfo_TxnStatus._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_SUCCESS');
  static const PaymentInfo_TxnStatus COLLECT_FAILED = PaymentInfo_TxnStatus._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_FAILED');
  static const PaymentInfo_TxnStatus COLLECT_FAILED_RISK = PaymentInfo_TxnStatus._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_FAILED_RISK');
  static const PaymentInfo_TxnStatus COLLECT_REJECTED = PaymentInfo_TxnStatus._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_REJECTED');
  static const PaymentInfo_TxnStatus COLLECT_EXPIRED = PaymentInfo_TxnStatus._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_EXPIRED');
  static const PaymentInfo_TxnStatus COLLECT_CANCELED = PaymentInfo_TxnStatus._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_CANCELED');
  static const PaymentInfo_TxnStatus COLLECT_CANCELLING = PaymentInfo_TxnStatus._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COLLECT_CANCELLING');
  static const PaymentInfo_TxnStatus IN_REVIEW = PaymentInfo_TxnStatus._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'IN_REVIEW');
  static const PaymentInfo_TxnStatus REVERSAL_SUCCESS = PaymentInfo_TxnStatus._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REVERSAL_SUCCESS');
  static const PaymentInfo_TxnStatus REVERSAL_PENDING = PaymentInfo_TxnStatus._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REVERSAL_PENDING');
  static const PaymentInfo_TxnStatus REFUND_PENDING = PaymentInfo_TxnStatus._(31, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REFUND_PENDING');

  static const $core.List<PaymentInfo_TxnStatus> values = <PaymentInfo_TxnStatus> [
    UNKNOWN,
    PENDING_SETUP,
    PENDING_RECEIVER_SETUP,
    INIT,
    SUCCESS,
    COMPLETED,
    FAILED,
    FAILED_RISK,
    FAILED_PROCESSING,
    FAILED_RECEIVER_PROCESSING,
    FAILED_DA,
    FAILED_DA_FINAL,
    REFUNDED_TXN,
    REFUND_FAILED,
    REFUND_FAILED_PROCESSING,
    REFUND_FAILED_DA,
    EXPIRED_TXN,
    AUTH_CANCELED,
    AUTH_CANCEL_FAILED_PROCESSING,
    AUTH_CANCEL_FAILED,
    COLLECT_INIT,
    COLLECT_SUCCESS,
    COLLECT_FAILED,
    COLLECT_FAILED_RISK,
    COLLECT_REJECTED,
    COLLECT_EXPIRED,
    COLLECT_CANCELED,
    COLLECT_CANCELLING,
    IN_REVIEW,
    REVERSAL_SUCCESS,
    REVERSAL_PENDING,
    REFUND_PENDING,
  ];

  static final $core.Map<$core.int, PaymentInfo_TxnStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PaymentInfo_TxnStatus? valueOf($core.int value) => _byValue[value];

  const PaymentInfo_TxnStatus._($core.int v, $core.String n) : super(v, n);
}

class PinInChat_Type extends $pb.ProtobufEnum {
  static const PinInChat_Type UNKNOWN_TYPE = PinInChat_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_TYPE');
  static const PinInChat_Type PIN_FOR_ALL = PinInChat_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PIN_FOR_ALL');
  static const PinInChat_Type UNPIN_FOR_ALL = PinInChat_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNPIN_FOR_ALL');

  static const $core.List<PinInChat_Type> values = <PinInChat_Type> [
    UNKNOWN_TYPE,
    PIN_FOR_ALL,
    UNPIN_FOR_ALL,
  ];

  static final $core.Map<$core.int, PinInChat_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PinInChat_Type? valueOf($core.int value) => _byValue[value];

  const PinInChat_Type._($core.int v, $core.String n) : super(v, n);
}

class ProcessedVideo_VideoQuality extends $pb.ProtobufEnum {
  static const ProcessedVideo_VideoQuality UNDEFINED = ProcessedVideo_VideoQuality._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNDEFINED');
  static const ProcessedVideo_VideoQuality LOW = ProcessedVideo_VideoQuality._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LOW');
  static const ProcessedVideo_VideoQuality MID = ProcessedVideo_VideoQuality._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MID');
  static const ProcessedVideo_VideoQuality HIGH = ProcessedVideo_VideoQuality._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HIGH');

  static const $core.List<ProcessedVideo_VideoQuality> values = <ProcessedVideo_VideoQuality> [
    UNDEFINED,
    LOW,
    MID,
    HIGH,
  ];

  static final $core.Map<$core.int, ProcessedVideo_VideoQuality> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProcessedVideo_VideoQuality? valueOf($core.int value) => _byValue[value];

  const ProcessedVideo_VideoQuality._($core.int v, $core.String n) : super(v, n);
}

class StatusAttribution_Type extends $pb.ProtobufEnum {
  static const StatusAttribution_Type UNKNOWN = StatusAttribution_Type._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const StatusAttribution_Type RESHARE = StatusAttribution_Type._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RESHARE');
  static const StatusAttribution_Type EXTERNAL_SHARE = StatusAttribution_Type._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EXTERNAL_SHARE');
  static const StatusAttribution_Type MUSIC = StatusAttribution_Type._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MUSIC');
  static const StatusAttribution_Type STATUS_MENTION = StatusAttribution_Type._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_MENTION');
  static const StatusAttribution_Type GROUP_STATUS = StatusAttribution_Type._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_STATUS');
  static const StatusAttribution_Type RL_ATTRIBUTION = StatusAttribution_Type._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RL_ATTRIBUTION');
  static const StatusAttribution_Type AI_CREATED = StatusAttribution_Type._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_CREATED');
  static const StatusAttribution_Type LAYOUTS = StatusAttribution_Type._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LAYOUTS');

  static const $core.List<StatusAttribution_Type> values = <StatusAttribution_Type> [
    UNKNOWN,
    RESHARE,
    EXTERNAL_SHARE,
    MUSIC,
    STATUS_MENTION,
    GROUP_STATUS,
    RL_ATTRIBUTION,
    AI_CREATED,
    LAYOUTS,
  ];

  static final $core.Map<$core.int, StatusAttribution_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StatusAttribution_Type? valueOf($core.int value) => _byValue[value];

  const StatusAttribution_Type._($core.int v, $core.String n) : super(v, n);
}

class StatusAttribution_AiCreatedAttribution_Source extends $pb.ProtobufEnum {
  static const StatusAttribution_AiCreatedAttribution_Source UNKNOWN = StatusAttribution_AiCreatedAttribution_Source._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const StatusAttribution_AiCreatedAttribution_Source STATUS_MIMICRY = StatusAttribution_AiCreatedAttribution_Source._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_MIMICRY');

  static const $core.List<StatusAttribution_AiCreatedAttribution_Source> values = <StatusAttribution_AiCreatedAttribution_Source> [
    UNKNOWN,
    STATUS_MIMICRY,
  ];

  static final $core.Map<$core.int, StatusAttribution_AiCreatedAttribution_Source> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StatusAttribution_AiCreatedAttribution_Source? valueOf($core.int value) => _byValue[value];

  const StatusAttribution_AiCreatedAttribution_Source._($core.int v, $core.String n) : super(v, n);
}

class StatusAttribution_ExternalShare_Source extends $pb.ProtobufEnum {
  static const StatusAttribution_ExternalShare_Source UNKNOWN = StatusAttribution_ExternalShare_Source._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const StatusAttribution_ExternalShare_Source INSTAGRAM = StatusAttribution_ExternalShare_Source._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INSTAGRAM');
  static const StatusAttribution_ExternalShare_Source FACEBOOK = StatusAttribution_ExternalShare_Source._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FACEBOOK');
  static const StatusAttribution_ExternalShare_Source MESSENGER = StatusAttribution_ExternalShare_Source._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MESSENGER');
  static const StatusAttribution_ExternalShare_Source SPOTIFY = StatusAttribution_ExternalShare_Source._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SPOTIFY');
  static const StatusAttribution_ExternalShare_Source YOUTUBE = StatusAttribution_ExternalShare_Source._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'YOUTUBE');
  static const StatusAttribution_ExternalShare_Source PINTEREST = StatusAttribution_ExternalShare_Source._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PINTEREST');
  static const StatusAttribution_ExternalShare_Source THREADS = StatusAttribution_ExternalShare_Source._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'THREADS');
  static const StatusAttribution_ExternalShare_Source APPLE_MUSIC = StatusAttribution_ExternalShare_Source._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'APPLE_MUSIC');
  static const StatusAttribution_ExternalShare_Source SHARECHAT = StatusAttribution_ExternalShare_Source._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SHARECHAT');
  static const StatusAttribution_ExternalShare_Source GOOGLE_PHOTOS = StatusAttribution_ExternalShare_Source._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GOOGLE_PHOTOS');

  static const $core.List<StatusAttribution_ExternalShare_Source> values = <StatusAttribution_ExternalShare_Source> [
    UNKNOWN,
    INSTAGRAM,
    FACEBOOK,
    MESSENGER,
    SPOTIFY,
    YOUTUBE,
    PINTEREST,
    THREADS,
    APPLE_MUSIC,
    SHARECHAT,
    GOOGLE_PHOTOS,
  ];

  static final $core.Map<$core.int, StatusAttribution_ExternalShare_Source> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StatusAttribution_ExternalShare_Source? valueOf($core.int value) => _byValue[value];

  const StatusAttribution_ExternalShare_Source._($core.int v, $core.String n) : super(v, n);
}

class StatusAttribution_RLAttribution_Source extends $pb.ProtobufEnum {
  static const StatusAttribution_RLAttribution_Source UNKNOWN = StatusAttribution_RLAttribution_Source._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const StatusAttribution_RLAttribution_Source RAY_BAN_META_GLASSES = StatusAttribution_RLAttribution_Source._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RAY_BAN_META_GLASSES');
  static const StatusAttribution_RLAttribution_Source OAKLEY_META_GLASSES = StatusAttribution_RLAttribution_Source._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OAKLEY_META_GLASSES');
  static const StatusAttribution_RLAttribution_Source HYPERNOVA_GLASSES = StatusAttribution_RLAttribution_Source._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HYPERNOVA_GLASSES');

  static const $core.List<StatusAttribution_RLAttribution_Source> values = <StatusAttribution_RLAttribution_Source> [
    UNKNOWN,
    RAY_BAN_META_GLASSES,
    OAKLEY_META_GLASSES,
    HYPERNOVA_GLASSES,
  ];

  static final $core.Map<$core.int, StatusAttribution_RLAttribution_Source> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StatusAttribution_RLAttribution_Source? valueOf($core.int value) => _byValue[value];

  const StatusAttribution_RLAttribution_Source._($core.int v, $core.String n) : super(v, n);
}

class StatusAttribution_StatusReshare_Source extends $pb.ProtobufEnum {
  static const StatusAttribution_StatusReshare_Source UNKNOWN = StatusAttribution_StatusReshare_Source._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const StatusAttribution_StatusReshare_Source INTERNAL_RESHARE = StatusAttribution_StatusReshare_Source._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTERNAL_RESHARE');
  static const StatusAttribution_StatusReshare_Source MENTION_RESHARE = StatusAttribution_StatusReshare_Source._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MENTION_RESHARE');
  static const StatusAttribution_StatusReshare_Source CHANNEL_RESHARE = StatusAttribution_StatusReshare_Source._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANNEL_RESHARE');
  static const StatusAttribution_StatusReshare_Source FORWARD = StatusAttribution_StatusReshare_Source._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FORWARD');

  static const $core.List<StatusAttribution_StatusReshare_Source> values = <StatusAttribution_StatusReshare_Source> [
    UNKNOWN,
    INTERNAL_RESHARE,
    MENTION_RESHARE,
    CHANNEL_RESHARE,
    FORWARD,
  ];

  static final $core.Map<$core.int, StatusAttribution_StatusReshare_Source> _byValue = $pb.ProtobufEnum.initByValue(values);
  static StatusAttribution_StatusReshare_Source? valueOf($core.int value) => _byValue[value];

  const StatusAttribution_StatusReshare_Source._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_AvatarUpdatedAction_AvatarEventType extends $pb.ProtobufEnum {
  static const SyncActionValue_AvatarUpdatedAction_AvatarEventType UPDATED = SyncActionValue_AvatarUpdatedAction_AvatarEventType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UPDATED');
  static const SyncActionValue_AvatarUpdatedAction_AvatarEventType CREATED = SyncActionValue_AvatarUpdatedAction_AvatarEventType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CREATED');
  static const SyncActionValue_AvatarUpdatedAction_AvatarEventType DELETED = SyncActionValue_AvatarUpdatedAction_AvatarEventType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELETED');

  static const $core.List<SyncActionValue_AvatarUpdatedAction_AvatarEventType> values = <SyncActionValue_AvatarUpdatedAction_AvatarEventType> [
    UPDATED,
    CREATED,
    DELETED,
  ];

  static final $core.Map<$core.int, SyncActionValue_AvatarUpdatedAction_AvatarEventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_AvatarUpdatedAction_AvatarEventType? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_AvatarUpdatedAction_AvatarEventType._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode extends $pb.ProtobufEnum {
  static const SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode UNKNOWN_INTERACTIVEMESSAGEACTIONMODE_ZERO = SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_INTERACTIVEMESSAGEACTIONMODE_ZERO');
  static const SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode DISABLE_CTA = SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DISABLE_CTA');

  static const $core.List<SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode> values = <SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode> [
    UNKNOWN_INTERACTIVEMESSAGEACTIONMODE_ZERO,
    DISABLE_CTA,
  ];

  static final $core.Map<$core.int, SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_InteractiveMessageAction_InteractiveMessageActionMode._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_LabelEditAction_ListType extends $pb.ProtobufEnum {
  static const SyncActionValue_LabelEditAction_ListType NONE = SyncActionValue_LabelEditAction_ListType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const SyncActionValue_LabelEditAction_ListType UNREAD = SyncActionValue_LabelEditAction_ListType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNREAD');
  static const SyncActionValue_LabelEditAction_ListType GROUPS = SyncActionValue_LabelEditAction_ListType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUPS');
  static const SyncActionValue_LabelEditAction_ListType FAVORITES = SyncActionValue_LabelEditAction_ListType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FAVORITES');
  static const SyncActionValue_LabelEditAction_ListType PREDEFINED = SyncActionValue_LabelEditAction_ListType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PREDEFINED');
  static const SyncActionValue_LabelEditAction_ListType CUSTOM = SyncActionValue_LabelEditAction_ListType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CUSTOM');
  static const SyncActionValue_LabelEditAction_ListType COMMUNITY = SyncActionValue_LabelEditAction_ListType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY');
  static const SyncActionValue_LabelEditAction_ListType SERVER_ASSIGNED = SyncActionValue_LabelEditAction_ListType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SERVER_ASSIGNED');
  static const SyncActionValue_LabelEditAction_ListType DRAFTED = SyncActionValue_LabelEditAction_ListType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DRAFTED');
  static const SyncActionValue_LabelEditAction_ListType AI_HANDOFF = SyncActionValue_LabelEditAction_ListType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_HANDOFF');

  static const $core.List<SyncActionValue_LabelEditAction_ListType> values = <SyncActionValue_LabelEditAction_ListType> [
    NONE,
    UNREAD,
    GROUPS,
    FAVORITES,
    PREDEFINED,
    CUSTOM,
    COMMUNITY,
    SERVER_ASSIGNED,
    DRAFTED,
    AI_HANDOFF,
  ];

  static final $core.Map<$core.int, SyncActionValue_LabelEditAction_ListType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_LabelEditAction_ListType? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_LabelEditAction_ListType._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus extends $pb.ProtobufEnum {
  static const SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus ENABLED = SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ENABLED');
  static const SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus ENABLED_HAS_LEARNING = SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ENABLED_HAS_LEARNING');
  static const SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus DISABLED = SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DISABLED');

  static const $core.List<SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus> values = <SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus> [
    ENABLED,
    ENABLED_HAS_LEARNING,
    DISABLED,
  ];

  static final $core.Map<$core.int, SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_MaibaAIFeaturesControlAction_MaibaAIFeatureStatus._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType extends $pb.ProtobufEnum {
  static const SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType PERSONALIZED = SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PERSONALIZED');

  static const $core.List<SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType> values = <SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType> [
    PERSONALIZED,
  ];

  static final $core.Map<$core.int, SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_MarketingMessageAction_MarketingMessagePrototypeType._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_MerchantPaymentPartnerAction_Status extends $pb.ProtobufEnum {
  static const SyncActionValue_MerchantPaymentPartnerAction_Status ACTIVE = SyncActionValue_MerchantPaymentPartnerAction_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACTIVE');
  static const SyncActionValue_MerchantPaymentPartnerAction_Status INACTIVE = SyncActionValue_MerchantPaymentPartnerAction_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INACTIVE');

  static const $core.List<SyncActionValue_MerchantPaymentPartnerAction_Status> values = <SyncActionValue_MerchantPaymentPartnerAction_Status> [
    ACTIVE,
    INACTIVE,
  ];

  static final $core.Map<$core.int, SyncActionValue_MerchantPaymentPartnerAction_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_MerchantPaymentPartnerAction_Status? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_MerchantPaymentPartnerAction_Status._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_NoteEditAction_NoteType extends $pb.ProtobufEnum {
  static const SyncActionValue_NoteEditAction_NoteType UNKNOWN_NOTETYPE_ZERO = SyncActionValue_NoteEditAction_NoteType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_NOTETYPE_ZERO');
  static const SyncActionValue_NoteEditAction_NoteType UNSTRUCTURED = SyncActionValue_NoteEditAction_NoteType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNSTRUCTURED');
  static const SyncActionValue_NoteEditAction_NoteType STRUCTURED = SyncActionValue_NoteEditAction_NoteType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STRUCTURED');

  static const $core.List<SyncActionValue_NoteEditAction_NoteType> values = <SyncActionValue_NoteEditAction_NoteType> [
    UNKNOWN_NOTETYPE_ZERO,
    UNSTRUCTURED,
    STRUCTURED,
  ];

  static final $core.Map<$core.int, SyncActionValue_NoteEditAction_NoteType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_NoteEditAction_NoteType? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_NoteEditAction_NoteType._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting extends $pb.ProtobufEnum {
  static const SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting DEFAULT_ALL_MESSAGES = SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT_ALL_MESSAGES');
  static const SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting ALL_MESSAGES = SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALL_MESSAGES');
  static const SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting HIGHLIGHTS = SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HIGHLIGHTS');
  static const SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting DEFAULT_HIGHLIGHTS = SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEFAULT_HIGHLIGHTS');

  static const $core.List<SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting> values = <SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting> [
    DEFAULT_ALL_MESSAGES,
    ALL_MESSAGES,
    HIGHLIGHTS,
    DEFAULT_HIGHLIGHTS,
  ];

  static final $core.Map<$core.int, SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_NotificationActivitySettingAction_NotificationActivitySetting._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_PaymentTosAction_PaymentNotice extends $pb.ProtobufEnum {
  static const SyncActionValue_PaymentTosAction_PaymentNotice BR_PAY_PRIVACY_POLICY = SyncActionValue_PaymentTosAction_PaymentNotice._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BR_PAY_PRIVACY_POLICY');

  static const $core.List<SyncActionValue_PaymentTosAction_PaymentNotice> values = <SyncActionValue_PaymentTosAction_PaymentNotice> [
    BR_PAY_PRIVACY_POLICY,
  ];

  static final $core.Map<$core.int, SyncActionValue_PaymentTosAction_PaymentNotice> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_PaymentTosAction_PaymentNotice? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_PaymentTosAction_PaymentNotice._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus extends $pb.ProtobufEnum {
  static const SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus UNDEFINED = SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNDEFINED');
  static const SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus ENABLED = SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ENABLED');
  static const SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus DISABLED = SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DISABLED');

  static const $core.List<SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus> values = <SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus> [
    UNDEFINED,
    ENABLED,
    DISABLED,
  ];

  static final $core.Map<$core.int, SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_PrivateProcessingSettingAction_PrivateProcessingStatus._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_StatusPrivacyAction_StatusDistributionMode extends $pb.ProtobufEnum {
  static const SyncActionValue_StatusPrivacyAction_StatusDistributionMode ALLOW_LIST = SyncActionValue_StatusPrivacyAction_StatusDistributionMode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALLOW_LIST');
  static const SyncActionValue_StatusPrivacyAction_StatusDistributionMode DENY_LIST = SyncActionValue_StatusPrivacyAction_StatusDistributionMode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DENY_LIST');
  static const SyncActionValue_StatusPrivacyAction_StatusDistributionMode CONTACTS = SyncActionValue_StatusPrivacyAction_StatusDistributionMode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CONTACTS');
  static const SyncActionValue_StatusPrivacyAction_StatusDistributionMode CLOSE_FRIENDS = SyncActionValue_StatusPrivacyAction_StatusDistributionMode._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLOSE_FRIENDS');

  static const $core.List<SyncActionValue_StatusPrivacyAction_StatusDistributionMode> values = <SyncActionValue_StatusPrivacyAction_StatusDistributionMode> [
    ALLOW_LIST,
    DENY_LIST,
    CONTACTS,
    CLOSE_FRIENDS,
  ];

  static final $core.Map<$core.int, SyncActionValue_StatusPrivacyAction_StatusDistributionMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_StatusPrivacyAction_StatusDistributionMode? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_StatusPrivacyAction_StatusDistributionMode._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_UsernameChatStartModeAction_ChatStartMode extends $pb.ProtobufEnum {
  static const SyncActionValue_UsernameChatStartModeAction_ChatStartMode UNKNOWN_CHATSTARTMODE_ZERO = SyncActionValue_UsernameChatStartModeAction_ChatStartMode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN_CHATSTARTMODE_ZERO');
  static const SyncActionValue_UsernameChatStartModeAction_ChatStartMode LID = SyncActionValue_UsernameChatStartModeAction_ChatStartMode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LID');
  static const SyncActionValue_UsernameChatStartModeAction_ChatStartMode PN = SyncActionValue_UsernameChatStartModeAction_ChatStartMode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PN');

  static const $core.List<SyncActionValue_UsernameChatStartModeAction_ChatStartMode> values = <SyncActionValue_UsernameChatStartModeAction_ChatStartMode> [
    UNKNOWN_CHATSTARTMODE_ZERO,
    LID,
    PN,
  ];

  static final $core.Map<$core.int, SyncActionValue_UsernameChatStartModeAction_ChatStartMode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_UsernameChatStartModeAction_ChatStartMode? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_UsernameChatStartModeAction_ChatStartMode._($core.int v, $core.String n) : super(v, n);
}

class SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState extends $pb.ProtobufEnum {
  static const SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState ACTIVE = SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ACTIVE');
  static const SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState PAUSED = SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAUSED');
  static const SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState UNLINKED = SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNLINKED');

  static const $core.List<SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState> values = <SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState> [
    ACTIVE,
    PAUSED,
    UNLINKED,
  ];

  static final $core.Map<$core.int, SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState? valueOf($core.int value) => _byValue[value];

  const SyncActionValue_WaffleAccountLinkStateAction_AccountLinkState._($core.int v, $core.String n) : super(v, n);
}

class SyncdMutation_SyncdOperation extends $pb.ProtobufEnum {
  static const SyncdMutation_SyncdOperation SET = SyncdMutation_SyncdOperation._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SET');
  static const SyncdMutation_SyncdOperation REMOVE = SyncdMutation_SyncdOperation._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REMOVE');

  static const $core.List<SyncdMutation_SyncdOperation> values = <SyncdMutation_SyncdOperation> [
    SET,
    REMOVE,
  ];

  static final $core.Map<$core.int, SyncdMutation_SyncdOperation> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncdMutation_SyncdOperation? valueOf($core.int value) => _byValue[value];

  const SyncdMutation_SyncdOperation._($core.int v, $core.String n) : super(v, n);
}

class ThreadID_ThreadType extends $pb.ProtobufEnum {
  static const ThreadID_ThreadType UNKNOWN = ThreadID_ThreadType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const ThreadID_ThreadType VIEW_REPLIES = ThreadID_ThreadType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIEW_REPLIES');
  static const ThreadID_ThreadType AI_THREAD = ThreadID_ThreadType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AI_THREAD');

  static const $core.List<ThreadID_ThreadType> values = <ThreadID_ThreadType> [
    UNKNOWN,
    VIEW_REPLIES,
    AI_THREAD,
  ];

  static final $core.Map<$core.int, ThreadID_ThreadType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ThreadID_ThreadType? valueOf($core.int value) => _byValue[value];

  const ThreadID_ThreadType._($core.int v, $core.String n) : super(v, n);
}

class UserPassword_Encoding extends $pb.ProtobufEnum {
  static const UserPassword_Encoding UTF8 = UserPassword_Encoding._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UTF8');
  static const UserPassword_Encoding UTF8_BROKEN = UserPassword_Encoding._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UTF8_BROKEN');

  static const $core.List<UserPassword_Encoding> values = <UserPassword_Encoding> [
    UTF8,
    UTF8_BROKEN,
  ];

  static final $core.Map<$core.int, UserPassword_Encoding> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserPassword_Encoding? valueOf($core.int value) => _byValue[value];

  const UserPassword_Encoding._($core.int v, $core.String n) : super(v, n);
}

class UserPassword_Transformer extends $pb.ProtobufEnum {
  static const UserPassword_Transformer NONE = UserPassword_Transformer._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONE');
  static const UserPassword_Transformer PBKDF2_HMAC_SHA512 = UserPassword_Transformer._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PBKDF2_HMAC_SHA512');
  static const UserPassword_Transformer PBKDF2_HMAC_SHA384 = UserPassword_Transformer._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PBKDF2_HMAC_SHA384');

  static const $core.List<UserPassword_Transformer> values = <UserPassword_Transformer> [
    NONE,
    PBKDF2_HMAC_SHA512,
    PBKDF2_HMAC_SHA384,
  ];

  static final $core.Map<$core.int, UserPassword_Transformer> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserPassword_Transformer? valueOf($core.int value) => _byValue[value];

  const UserPassword_Transformer._($core.int v, $core.String n) : super(v, n);
}

class WebFeatures_Flag extends $pb.ProtobufEnum {
  static const WebFeatures_Flag NOT_STARTED = WebFeatures_Flag._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_STARTED');
  static const WebFeatures_Flag FORCE_UPGRADE = WebFeatures_Flag._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FORCE_UPGRADE');
  static const WebFeatures_Flag DEVELOPMENT = WebFeatures_Flag._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DEVELOPMENT');
  static const WebFeatures_Flag PRODUCTION = WebFeatures_Flag._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PRODUCTION');

  static const $core.List<WebFeatures_Flag> values = <WebFeatures_Flag> [
    NOT_STARTED,
    FORCE_UPGRADE,
    DEVELOPMENT,
    PRODUCTION,
  ];

  static final $core.Map<$core.int, WebFeatures_Flag> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WebFeatures_Flag? valueOf($core.int value) => _byValue[value];

  const WebFeatures_Flag._($core.int v, $core.String n) : super(v, n);
}

class WebMessageInfo_BizPrivacyStatus extends $pb.ProtobufEnum {
  static const WebMessageInfo_BizPrivacyStatus E2EE = WebMessageInfo_BizPrivacyStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2EE');
  static const WebMessageInfo_BizPrivacyStatus FB = WebMessageInfo_BizPrivacyStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FB');
  static const WebMessageInfo_BizPrivacyStatus BSP = WebMessageInfo_BizPrivacyStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BSP');
  static const WebMessageInfo_BizPrivacyStatus BSP_AND_FB = WebMessageInfo_BizPrivacyStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BSP_AND_FB');

  static const $core.List<WebMessageInfo_BizPrivacyStatus> values = <WebMessageInfo_BizPrivacyStatus> [
    E2EE,
    FB,
    BSP,
    BSP_AND_FB,
  ];

  static final $core.Map<$core.int, WebMessageInfo_BizPrivacyStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WebMessageInfo_BizPrivacyStatus? valueOf($core.int value) => _byValue[value];

  const WebMessageInfo_BizPrivacyStatus._($core.int v, $core.String n) : super(v, n);
}

class WebMessageInfo_Status extends $pb.ProtobufEnum {
  static const WebMessageInfo_Status ERROR = WebMessageInfo_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERROR');
  static const WebMessageInfo_Status PENDING = WebMessageInfo_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PENDING');
  static const WebMessageInfo_Status SERVER_ACK = WebMessageInfo_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SERVER_ACK');
  static const WebMessageInfo_Status DELIVERY_ACK = WebMessageInfo_Status._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DELIVERY_ACK');
  static const WebMessageInfo_Status READ = WebMessageInfo_Status._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'READ');
  static const WebMessageInfo_Status PLAYED = WebMessageInfo_Status._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PLAYED');

  static const $core.List<WebMessageInfo_Status> values = <WebMessageInfo_Status> [
    ERROR,
    PENDING,
    SERVER_ACK,
    DELIVERY_ACK,
    READ,
    PLAYED,
  ];

  static final $core.Map<$core.int, WebMessageInfo_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WebMessageInfo_Status? valueOf($core.int value) => _byValue[value];

  const WebMessageInfo_Status._($core.int v, $core.String n) : super(v, n);
}

class WebMessageInfo_StubType extends $pb.ProtobufEnum {
  static const WebMessageInfo_StubType UNKNOWN = WebMessageInfo_StubType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const WebMessageInfo_StubType REVOKE = WebMessageInfo_StubType._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REVOKE');
  static const WebMessageInfo_StubType CIPHERTEXT = WebMessageInfo_StubType._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CIPHERTEXT');
  static const WebMessageInfo_StubType FUTUREPROOF = WebMessageInfo_StubType._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FUTUREPROOF');
  static const WebMessageInfo_StubType NON_VERIFIED_TRANSITION = WebMessageInfo_StubType._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NON_VERIFIED_TRANSITION');
  static const WebMessageInfo_StubType UNVERIFIED_TRANSITION = WebMessageInfo_StubType._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNVERIFIED_TRANSITION');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION = WebMessageInfo_StubType._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION');
  static const WebMessageInfo_StubType VERIFIED_LOW_UNKNOWN = WebMessageInfo_StubType._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_LOW_UNKNOWN');
  static const WebMessageInfo_StubType VERIFIED_HIGH = WebMessageInfo_StubType._(8, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_HIGH');
  static const WebMessageInfo_StubType VERIFIED_INITIAL_UNKNOWN = WebMessageInfo_StubType._(9, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_INITIAL_UNKNOWN');
  static const WebMessageInfo_StubType VERIFIED_INITIAL_LOW = WebMessageInfo_StubType._(10, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_INITIAL_LOW');
  static const WebMessageInfo_StubType VERIFIED_INITIAL_HIGH = WebMessageInfo_StubType._(11, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_INITIAL_HIGH');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_ANY_TO_NONE = WebMessageInfo_StubType._(12, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_ANY_TO_NONE');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_ANY_TO_HIGH = WebMessageInfo_StubType._(13, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_ANY_TO_HIGH');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_HIGH_TO_LOW = WebMessageInfo_StubType._(14, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_HIGH_TO_LOW');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_HIGH_TO_UNKNOWN = WebMessageInfo_StubType._(15, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_HIGH_TO_UNKNOWN');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_UNKNOWN_TO_LOW = WebMessageInfo_StubType._(16, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_UNKNOWN_TO_LOW');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_LOW_TO_UNKNOWN = WebMessageInfo_StubType._(17, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_LOW_TO_UNKNOWN');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_NONE_TO_LOW = WebMessageInfo_StubType._(18, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_NONE_TO_LOW');
  static const WebMessageInfo_StubType VERIFIED_TRANSITION_NONE_TO_UNKNOWN = WebMessageInfo_StubType._(19, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VERIFIED_TRANSITION_NONE_TO_UNKNOWN');
  static const WebMessageInfo_StubType GROUP_CREATE = WebMessageInfo_StubType._(20, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CREATE');
  static const WebMessageInfo_StubType GROUP_CHANGE_SUBJECT = WebMessageInfo_StubType._(21, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_SUBJECT');
  static const WebMessageInfo_StubType GROUP_CHANGE_ICON = WebMessageInfo_StubType._(22, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_ICON');
  static const WebMessageInfo_StubType GROUP_CHANGE_INVITE_LINK = WebMessageInfo_StubType._(23, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_INVITE_LINK');
  static const WebMessageInfo_StubType GROUP_CHANGE_DESCRIPTION = WebMessageInfo_StubType._(24, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_DESCRIPTION');
  static const WebMessageInfo_StubType GROUP_CHANGE_RESTRICT = WebMessageInfo_StubType._(25, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_RESTRICT');
  static const WebMessageInfo_StubType GROUP_CHANGE_ANNOUNCE = WebMessageInfo_StubType._(26, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_ANNOUNCE');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_ADD = WebMessageInfo_StubType._(27, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_ADD');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_REMOVE = WebMessageInfo_StubType._(28, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_REMOVE');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_PROMOTE = WebMessageInfo_StubType._(29, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_PROMOTE');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_DEMOTE = WebMessageInfo_StubType._(30, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_DEMOTE');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_INVITE = WebMessageInfo_StubType._(31, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_INVITE');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_LEAVE = WebMessageInfo_StubType._(32, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_LEAVE');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_CHANGE_NUMBER = WebMessageInfo_StubType._(33, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_CHANGE_NUMBER');
  static const WebMessageInfo_StubType BROADCAST_CREATE = WebMessageInfo_StubType._(34, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BROADCAST_CREATE');
  static const WebMessageInfo_StubType BROADCAST_ADD = WebMessageInfo_StubType._(35, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BROADCAST_ADD');
  static const WebMessageInfo_StubType BROADCAST_REMOVE = WebMessageInfo_StubType._(36, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BROADCAST_REMOVE');
  static const WebMessageInfo_StubType GENERIC_NOTIFICATION = WebMessageInfo_StubType._(37, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERIC_NOTIFICATION');
  static const WebMessageInfo_StubType E2E_IDENTITY_CHANGED = WebMessageInfo_StubType._(38, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2E_IDENTITY_CHANGED');
  static const WebMessageInfo_StubType E2E_ENCRYPTED = WebMessageInfo_StubType._(39, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2E_ENCRYPTED');
  static const WebMessageInfo_StubType CALL_MISSED_VOICE = WebMessageInfo_StubType._(40, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CALL_MISSED_VOICE');
  static const WebMessageInfo_StubType CALL_MISSED_VIDEO = WebMessageInfo_StubType._(41, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CALL_MISSED_VIDEO');
  static const WebMessageInfo_StubType INDIVIDUAL_CHANGE_NUMBER = WebMessageInfo_StubType._(42, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INDIVIDUAL_CHANGE_NUMBER');
  static const WebMessageInfo_StubType GROUP_DELETE = WebMessageInfo_StubType._(43, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_DELETE');
  static const WebMessageInfo_StubType GROUP_ANNOUNCE_MODE_MESSAGE_BOUNCE = WebMessageInfo_StubType._(44, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_ANNOUNCE_MODE_MESSAGE_BOUNCE');
  static const WebMessageInfo_StubType CALL_MISSED_GROUP_VOICE = WebMessageInfo_StubType._(45, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CALL_MISSED_GROUP_VOICE');
  static const WebMessageInfo_StubType CALL_MISSED_GROUP_VIDEO = WebMessageInfo_StubType._(46, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CALL_MISSED_GROUP_VIDEO');
  static const WebMessageInfo_StubType PAYMENT_CIPHERTEXT = WebMessageInfo_StubType._(47, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_CIPHERTEXT');
  static const WebMessageInfo_StubType PAYMENT_FUTUREPROOF = WebMessageInfo_StubType._(48, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_FUTUREPROOF');
  static const WebMessageInfo_StubType PAYMENT_TRANSACTION_STATUS_UPDATE_FAILED = WebMessageInfo_StubType._(49, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_TRANSACTION_STATUS_UPDATE_FAILED');
  static const WebMessageInfo_StubType PAYMENT_TRANSACTION_STATUS_UPDATE_REFUNDED = WebMessageInfo_StubType._(50, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_TRANSACTION_STATUS_UPDATE_REFUNDED');
  static const WebMessageInfo_StubType PAYMENT_TRANSACTION_STATUS_UPDATE_REFUND_FAILED = WebMessageInfo_StubType._(51, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_TRANSACTION_STATUS_UPDATE_REFUND_FAILED');
  static const WebMessageInfo_StubType PAYMENT_TRANSACTION_STATUS_RECEIVER_PENDING_SETUP = WebMessageInfo_StubType._(52, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_TRANSACTION_STATUS_RECEIVER_PENDING_SETUP');
  static const WebMessageInfo_StubType PAYMENT_TRANSACTION_STATUS_RECEIVER_SUCCESS_AFTER_HICCUP = WebMessageInfo_StubType._(53, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_TRANSACTION_STATUS_RECEIVER_SUCCESS_AFTER_HICCUP');
  static const WebMessageInfo_StubType PAYMENT_ACTION_ACCOUNT_SETUP_REMINDER = WebMessageInfo_StubType._(54, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_ACTION_ACCOUNT_SETUP_REMINDER');
  static const WebMessageInfo_StubType PAYMENT_ACTION_SEND_PAYMENT_REMINDER = WebMessageInfo_StubType._(55, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_ACTION_SEND_PAYMENT_REMINDER');
  static const WebMessageInfo_StubType PAYMENT_ACTION_SEND_PAYMENT_INVITATION = WebMessageInfo_StubType._(56, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_ACTION_SEND_PAYMENT_INVITATION');
  static const WebMessageInfo_StubType PAYMENT_ACTION_REQUEST_DECLINED = WebMessageInfo_StubType._(57, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_ACTION_REQUEST_DECLINED');
  static const WebMessageInfo_StubType PAYMENT_ACTION_REQUEST_EXPIRED = WebMessageInfo_StubType._(58, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_ACTION_REQUEST_EXPIRED');
  static const WebMessageInfo_StubType PAYMENT_ACTION_REQUEST_CANCELLED = WebMessageInfo_StubType._(59, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_ACTION_REQUEST_CANCELLED');
  static const WebMessageInfo_StubType BIZ_VERIFIED_TRANSITION_TOP_TO_BOTTOM = WebMessageInfo_StubType._(60, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_VERIFIED_TRANSITION_TOP_TO_BOTTOM');
  static const WebMessageInfo_StubType BIZ_VERIFIED_TRANSITION_BOTTOM_TO_TOP = WebMessageInfo_StubType._(61, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_VERIFIED_TRANSITION_BOTTOM_TO_TOP');
  static const WebMessageInfo_StubType BIZ_INTRO_TOP = WebMessageInfo_StubType._(62, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_INTRO_TOP');
  static const WebMessageInfo_StubType BIZ_INTRO_BOTTOM = WebMessageInfo_StubType._(63, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_INTRO_BOTTOM');
  static const WebMessageInfo_StubType BIZ_NAME_CHANGE = WebMessageInfo_StubType._(64, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_NAME_CHANGE');
  static const WebMessageInfo_StubType BIZ_MOVE_TO_CONSUMER_APP = WebMessageInfo_StubType._(65, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_MOVE_TO_CONSUMER_APP');
  static const WebMessageInfo_StubType BIZ_TWO_TIER_MIGRATION_TOP = WebMessageInfo_StubType._(66, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_TWO_TIER_MIGRATION_TOP');
  static const WebMessageInfo_StubType BIZ_TWO_TIER_MIGRATION_BOTTOM = WebMessageInfo_StubType._(67, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_TWO_TIER_MIGRATION_BOTTOM');
  static const WebMessageInfo_StubType OVERSIZED = WebMessageInfo_StubType._(68, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OVERSIZED');
  static const WebMessageInfo_StubType GROUP_CHANGE_NO_FREQUENTLY_FORWARDED = WebMessageInfo_StubType._(69, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_NO_FREQUENTLY_FORWARDED');
  static const WebMessageInfo_StubType GROUP_V4_ADD_INVITE_SENT = WebMessageInfo_StubType._(70, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_V4_ADD_INVITE_SENT');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_ADD_REQUEST_JOIN = WebMessageInfo_StubType._(71, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_ADD_REQUEST_JOIN');
  static const WebMessageInfo_StubType CHANGE_EPHEMERAL_SETTING = WebMessageInfo_StubType._(72, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGE_EPHEMERAL_SETTING');
  static const WebMessageInfo_StubType E2E_DEVICE_CHANGED = WebMessageInfo_StubType._(73, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2E_DEVICE_CHANGED');
  static const WebMessageInfo_StubType VIEWED_ONCE = WebMessageInfo_StubType._(74, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VIEWED_ONCE');
  static const WebMessageInfo_StubType E2E_ENCRYPTED_NOW = WebMessageInfo_StubType._(75, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2E_ENCRYPTED_NOW');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_TO_BSP_PREMISE = WebMessageInfo_StubType._(76, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_TO_BSP_PREMISE');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_TO_SELF_FB = WebMessageInfo_StubType._(77, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_TO_SELF_FB');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_TO_SELF_PREMISE = WebMessageInfo_StubType._(78, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_TO_SELF_PREMISE');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_UNVERIFIED = WebMessageInfo_StubType._(79, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED = WebMessageInfo_StubType._(80, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_VERIFIED = WebMessageInfo_StubType._(81, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(82, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_PREMISE_TO_SELF_PREMISE = WebMessageInfo_StubType._(83, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_PREMISE_TO_SELF_PREMISE');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(84, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_PREMISE_UNVERIFIED_TO_SELF_PREMISE_VERIFIED = WebMessageInfo_StubType._(85, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_PREMISE_UNVERIFIED_TO_SELF_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_PREMISE_VERIFIED = WebMessageInfo_StubType._(86, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_PREMISE_VERIFIED_TO_SELF_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(87, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_PREMISE_VERIFIED_TO_SELF_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_CONSUMER_TO_BSP_FB_UNVERIFIED = WebMessageInfo_StubType._(88, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_CONSUMER_TO_BSP_FB_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_CONSUMER_TO_BSP_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(89, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_CONSUMER_TO_BSP_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_CONSUMER_TO_SELF_FB_UNVERIFIED = WebMessageInfo_StubType._(90, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_CONSUMER_TO_SELF_FB_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_CONSUMER_TO_SELF_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(91, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_CONSUMER_TO_SELF_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_TO_BSP_PREMISE = WebMessageInfo_StubType._(92, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_TO_BSP_PREMISE');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_TO_SELF_PREMISE = WebMessageInfo_StubType._(93, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_TO_SELF_PREMISE');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_UNVERIFIED = WebMessageInfo_StubType._(94, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED = WebMessageInfo_StubType._(95, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_VERIFIED = WebMessageInfo_StubType._(96, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(97, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_PREMISE_TO_BSP_PREMISE = WebMessageInfo_StubType._(98, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_PREMISE_TO_BSP_PREMISE');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(99, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_PREMISE_VERIFIED = WebMessageInfo_StubType._(100, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_TO_BSP_FB = WebMessageInfo_StubType._(101, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_TO_BSP_FB');
  static const WebMessageInfo_StubType BLUE_MSG_TO_CONSUMER = WebMessageInfo_StubType._(102, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_TO_CONSUMER');
  static const WebMessageInfo_StubType BLUE_MSG_TO_SELF_FB = WebMessageInfo_StubType._(103, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_TO_SELF_FB');
  static const WebMessageInfo_StubType BLUE_MSG_UNVERIFIED_TO_BSP_FB_VERIFIED = WebMessageInfo_StubType._(104, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_UNVERIFIED_TO_BSP_FB_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_UNVERIFIED_TO_BSP_PREMISE_VERIFIED = WebMessageInfo_StubType._(105, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_UNVERIFIED_TO_BSP_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_UNVERIFIED_TO_SELF_FB_VERIFIED = WebMessageInfo_StubType._(106, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_UNVERIFIED_TO_SELF_FB_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_UNVERIFIED_TO_VERIFIED = WebMessageInfo_StubType._(107, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_UNVERIFIED_TO_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_VERIFIED_TO_BSP_FB_UNVERIFIED = WebMessageInfo_StubType._(108, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_VERIFIED_TO_BSP_FB_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_VERIFIED_TO_BSP_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(109, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_VERIFIED_TO_BSP_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_VERIFIED_TO_SELF_FB_UNVERIFIED = WebMessageInfo_StubType._(110, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_VERIFIED_TO_SELF_FB_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_VERIFIED_TO_UNVERIFIED = WebMessageInfo_StubType._(111, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_VERIFIED_TO_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED = WebMessageInfo_StubType._(112, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_FB_VERIFIED = WebMessageInfo_StubType._(113, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_FB_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(114, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_FB_UNVERIFIED = WebMessageInfo_StubType._(115, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_FB_UNVERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED = WebMessageInfo_StubType._(116, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED');
  static const WebMessageInfo_StubType BLUE_MSG_SELF_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED = WebMessageInfo_StubType._(117, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLUE_MSG_SELF_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED');
  static const WebMessageInfo_StubType E2E_IDENTITY_UNAVAILABLE = WebMessageInfo_StubType._(118, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2E_IDENTITY_UNAVAILABLE');
  static const WebMessageInfo_StubType GROUP_CREATING = WebMessageInfo_StubType._(119, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CREATING');
  static const WebMessageInfo_StubType GROUP_CREATE_FAILED = WebMessageInfo_StubType._(120, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CREATE_FAILED');
  static const WebMessageInfo_StubType GROUP_BOUNCED = WebMessageInfo_StubType._(121, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_BOUNCED');
  static const WebMessageInfo_StubType BLOCK_CONTACT = WebMessageInfo_StubType._(122, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BLOCK_CONTACT');
  static const WebMessageInfo_StubType EPHEMERAL_SETTING_NOT_APPLIED = WebMessageInfo_StubType._(123, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EPHEMERAL_SETTING_NOT_APPLIED');
  static const WebMessageInfo_StubType SYNC_FAILED = WebMessageInfo_StubType._(124, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYNC_FAILED');
  static const WebMessageInfo_StubType SYNCING = WebMessageInfo_StubType._(125, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYNCING');
  static const WebMessageInfo_StubType BIZ_PRIVACY_MODE_INIT_FB = WebMessageInfo_StubType._(126, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_PRIVACY_MODE_INIT_FB');
  static const WebMessageInfo_StubType BIZ_PRIVACY_MODE_INIT_BSP = WebMessageInfo_StubType._(127, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_PRIVACY_MODE_INIT_BSP');
  static const WebMessageInfo_StubType BIZ_PRIVACY_MODE_TO_FB = WebMessageInfo_StubType._(128, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_PRIVACY_MODE_TO_FB');
  static const WebMessageInfo_StubType BIZ_PRIVACY_MODE_TO_BSP = WebMessageInfo_StubType._(129, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_PRIVACY_MODE_TO_BSP');
  static const WebMessageInfo_StubType DISAPPEARING_MODE = WebMessageInfo_StubType._(130, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DISAPPEARING_MODE');
  static const WebMessageInfo_StubType E2E_DEVICE_FETCH_FAILED = WebMessageInfo_StubType._(131, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'E2E_DEVICE_FETCH_FAILED');
  static const WebMessageInfo_StubType ADMIN_REVOKE = WebMessageInfo_StubType._(132, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ADMIN_REVOKE');
  static const WebMessageInfo_StubType GROUP_INVITE_LINK_GROWTH_LOCKED = WebMessageInfo_StubType._(133, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_INVITE_LINK_GROWTH_LOCKED');
  static const WebMessageInfo_StubType COMMUNITY_LINK_PARENT_GROUP = WebMessageInfo_StubType._(134, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_LINK_PARENT_GROUP');
  static const WebMessageInfo_StubType COMMUNITY_LINK_SIBLING_GROUP = WebMessageInfo_StubType._(135, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_LINK_SIBLING_GROUP');
  static const WebMessageInfo_StubType COMMUNITY_LINK_SUB_GROUP = WebMessageInfo_StubType._(136, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_LINK_SUB_GROUP');
  static const WebMessageInfo_StubType COMMUNITY_UNLINK_PARENT_GROUP = WebMessageInfo_StubType._(137, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_UNLINK_PARENT_GROUP');
  static const WebMessageInfo_StubType COMMUNITY_UNLINK_SIBLING_GROUP = WebMessageInfo_StubType._(138, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_UNLINK_SIBLING_GROUP');
  static const WebMessageInfo_StubType COMMUNITY_UNLINK_SUB_GROUP = WebMessageInfo_StubType._(139, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_UNLINK_SUB_GROUP');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_ACCEPT = WebMessageInfo_StubType._(140, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_ACCEPT');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_LINKED_GROUP_JOIN = WebMessageInfo_StubType._(141, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_LINKED_GROUP_JOIN');
  static const WebMessageInfo_StubType COMMUNITY_CREATE = WebMessageInfo_StubType._(142, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_CREATE');
  static const WebMessageInfo_StubType EPHEMERAL_KEEP_IN_CHAT = WebMessageInfo_StubType._(143, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EPHEMERAL_KEEP_IN_CHAT');
  static const WebMessageInfo_StubType GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST = WebMessageInfo_StubType._(144, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST');
  static const WebMessageInfo_StubType GROUP_MEMBERSHIP_JOIN_APPROVAL_MODE = WebMessageInfo_StubType._(145, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_MEMBERSHIP_JOIN_APPROVAL_MODE');
  static const WebMessageInfo_StubType INTEGRITY_UNLINK_PARENT_GROUP = WebMessageInfo_StubType._(146, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INTEGRITY_UNLINK_PARENT_GROUP');
  static const WebMessageInfo_StubType COMMUNITY_PARTICIPANT_PROMOTE = WebMessageInfo_StubType._(147, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_PARTICIPANT_PROMOTE');
  static const WebMessageInfo_StubType COMMUNITY_PARTICIPANT_DEMOTE = WebMessageInfo_StubType._(148, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_PARTICIPANT_DEMOTE');
  static const WebMessageInfo_StubType COMMUNITY_PARENT_GROUP_DELETED = WebMessageInfo_StubType._(149, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_PARENT_GROUP_DELETED');
  static const WebMessageInfo_StubType COMMUNITY_LINK_PARENT_GROUP_MEMBERSHIP_APPROVAL = WebMessageInfo_StubType._(150, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_LINK_PARENT_GROUP_MEMBERSHIP_APPROVAL');
  static const WebMessageInfo_StubType GROUP_PARTICIPANT_JOINED_GROUP_AND_PARENT_GROUP = WebMessageInfo_StubType._(151, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_PARTICIPANT_JOINED_GROUP_AND_PARENT_GROUP');
  static const WebMessageInfo_StubType MASKED_THREAD_CREATED = WebMessageInfo_StubType._(152, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MASKED_THREAD_CREATED');
  static const WebMessageInfo_StubType MASKED_THREAD_UNMASKED = WebMessageInfo_StubType._(153, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MASKED_THREAD_UNMASKED');
  static const WebMessageInfo_StubType BIZ_CHAT_ASSIGNMENT = WebMessageInfo_StubType._(154, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_CHAT_ASSIGNMENT');
  static const WebMessageInfo_StubType CHAT_PSA = WebMessageInfo_StubType._(155, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT_PSA');
  static const WebMessageInfo_StubType CHAT_POLL_CREATION_MESSAGE = WebMessageInfo_StubType._(156, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHAT_POLL_CREATION_MESSAGE');
  static const WebMessageInfo_StubType CAG_MASKED_THREAD_CREATED = WebMessageInfo_StubType._(157, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAG_MASKED_THREAD_CREATED');
  static const WebMessageInfo_StubType COMMUNITY_PARENT_GROUP_SUBJECT_CHANGED = WebMessageInfo_StubType._(158, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_PARENT_GROUP_SUBJECT_CHANGED');
  static const WebMessageInfo_StubType CAG_INVITE_AUTO_ADD = WebMessageInfo_StubType._(159, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAG_INVITE_AUTO_ADD');
  static const WebMessageInfo_StubType BIZ_CHAT_ASSIGNMENT_UNASSIGN = WebMessageInfo_StubType._(160, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_CHAT_ASSIGNMENT_UNASSIGN');
  static const WebMessageInfo_StubType CAG_INVITE_AUTO_JOINED = WebMessageInfo_StubType._(161, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAG_INVITE_AUTO_JOINED');
  static const WebMessageInfo_StubType SCHEDULED_CALL_START_MESSAGE = WebMessageInfo_StubType._(162, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED_CALL_START_MESSAGE');
  static const WebMessageInfo_StubType COMMUNITY_INVITE_RICH = WebMessageInfo_StubType._(163, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_INVITE_RICH');
  static const WebMessageInfo_StubType COMMUNITY_INVITE_AUTO_ADD_RICH = WebMessageInfo_StubType._(164, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_INVITE_AUTO_ADD_RICH');
  static const WebMessageInfo_StubType SUB_GROUP_INVITE_RICH = WebMessageInfo_StubType._(165, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUB_GROUP_INVITE_RICH');
  static const WebMessageInfo_StubType SUB_GROUP_PARTICIPANT_ADD_RICH = WebMessageInfo_StubType._(166, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUB_GROUP_PARTICIPANT_ADD_RICH');
  static const WebMessageInfo_StubType COMMUNITY_LINK_PARENT_GROUP_RICH = WebMessageInfo_StubType._(167, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_LINK_PARENT_GROUP_RICH');
  static const WebMessageInfo_StubType COMMUNITY_PARTICIPANT_ADD_RICH = WebMessageInfo_StubType._(168, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_PARTICIPANT_ADD_RICH');
  static const WebMessageInfo_StubType SILENCED_UNKNOWN_CALLER_AUDIO = WebMessageInfo_StubType._(169, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SILENCED_UNKNOWN_CALLER_AUDIO');
  static const WebMessageInfo_StubType SILENCED_UNKNOWN_CALLER_VIDEO = WebMessageInfo_StubType._(170, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SILENCED_UNKNOWN_CALLER_VIDEO');
  static const WebMessageInfo_StubType GROUP_MEMBER_ADD_MODE = WebMessageInfo_StubType._(171, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_MEMBER_ADD_MODE');
  static const WebMessageInfo_StubType GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST_NON_ADMIN_ADD = WebMessageInfo_StubType._(172, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST_NON_ADMIN_ADD');
  static const WebMessageInfo_StubType COMMUNITY_CHANGE_DESCRIPTION = WebMessageInfo_StubType._(173, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_CHANGE_DESCRIPTION');
  static const WebMessageInfo_StubType SENDER_INVITE = WebMessageInfo_StubType._(174, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SENDER_INVITE');
  static const WebMessageInfo_StubType RECEIVER_INVITE = WebMessageInfo_StubType._(175, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'RECEIVER_INVITE');
  static const WebMessageInfo_StubType COMMUNITY_ALLOW_MEMBER_ADDED_GROUPS = WebMessageInfo_StubType._(176, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_ALLOW_MEMBER_ADDED_GROUPS');
  static const WebMessageInfo_StubType PINNED_MESSAGE_IN_CHAT = WebMessageInfo_StubType._(177, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PINNED_MESSAGE_IN_CHAT');
  static const WebMessageInfo_StubType PAYMENT_INVITE_SETUP_INVITER = WebMessageInfo_StubType._(178, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_INVITE_SETUP_INVITER');
  static const WebMessageInfo_StubType PAYMENT_INVITE_SETUP_INVITEE_RECEIVE_ONLY = WebMessageInfo_StubType._(179, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_INVITE_SETUP_INVITEE_RECEIVE_ONLY');
  static const WebMessageInfo_StubType PAYMENT_INVITE_SETUP_INVITEE_SEND_AND_RECEIVE = WebMessageInfo_StubType._(180, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAYMENT_INVITE_SETUP_INVITEE_SEND_AND_RECEIVE');
  static const WebMessageInfo_StubType LINKED_GROUP_CALL_START = WebMessageInfo_StubType._(181, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LINKED_GROUP_CALL_START');
  static const WebMessageInfo_StubType REPORT_TO_ADMIN_ENABLED_STATUS = WebMessageInfo_StubType._(182, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REPORT_TO_ADMIN_ENABLED_STATUS');
  static const WebMessageInfo_StubType EMPTY_SUBGROUP_CREATE = WebMessageInfo_StubType._(183, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EMPTY_SUBGROUP_CREATE');
  static const WebMessageInfo_StubType SCHEDULED_CALL_CANCEL = WebMessageInfo_StubType._(184, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SCHEDULED_CALL_CANCEL');
  static const WebMessageInfo_StubType SUBGROUP_ADMIN_TRIGGERED_AUTO_ADD_RICH = WebMessageInfo_StubType._(185, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUBGROUP_ADMIN_TRIGGERED_AUTO_ADD_RICH');
  static const WebMessageInfo_StubType GROUP_CHANGE_RECENT_HISTORY_SHARING = WebMessageInfo_StubType._(186, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_CHANGE_RECENT_HISTORY_SHARING');
  static const WebMessageInfo_StubType PAID_MESSAGE_SERVER_CAMPAIGN_ID = WebMessageInfo_StubType._(187, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PAID_MESSAGE_SERVER_CAMPAIGN_ID');
  static const WebMessageInfo_StubType GENERAL_CHAT_CREATE = WebMessageInfo_StubType._(188, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERAL_CHAT_CREATE');
  static const WebMessageInfo_StubType GENERAL_CHAT_ADD = WebMessageInfo_StubType._(189, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERAL_CHAT_ADD');
  static const WebMessageInfo_StubType GENERAL_CHAT_AUTO_ADD_DISABLED = WebMessageInfo_StubType._(190, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GENERAL_CHAT_AUTO_ADD_DISABLED');
  static const WebMessageInfo_StubType SUGGESTED_SUBGROUP_ANNOUNCE = WebMessageInfo_StubType._(191, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUGGESTED_SUBGROUP_ANNOUNCE');
  static const WebMessageInfo_StubType BIZ_BOT_1P_MESSAGING_ENABLED = WebMessageInfo_StubType._(192, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_BOT_1P_MESSAGING_ENABLED');
  static const WebMessageInfo_StubType CHANGE_USERNAME = WebMessageInfo_StubType._(193, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGE_USERNAME');
  static const WebMessageInfo_StubType BIZ_COEX_PRIVACY_INIT_SELF = WebMessageInfo_StubType._(194, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_COEX_PRIVACY_INIT_SELF');
  static const WebMessageInfo_StubType BIZ_COEX_PRIVACY_TRANSITION_SELF = WebMessageInfo_StubType._(195, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_COEX_PRIVACY_TRANSITION_SELF');
  static const WebMessageInfo_StubType SUPPORT_AI_EDUCATION = WebMessageInfo_StubType._(196, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUPPORT_AI_EDUCATION');
  static const WebMessageInfo_StubType BIZ_BOT_3P_MESSAGING_ENABLED = WebMessageInfo_StubType._(197, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_BOT_3P_MESSAGING_ENABLED');
  static const WebMessageInfo_StubType REMINDER_SETUP_MESSAGE = WebMessageInfo_StubType._(198, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REMINDER_SETUP_MESSAGE');
  static const WebMessageInfo_StubType REMINDER_SENT_MESSAGE = WebMessageInfo_StubType._(199, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REMINDER_SENT_MESSAGE');
  static const WebMessageInfo_StubType REMINDER_CANCEL_MESSAGE = WebMessageInfo_StubType._(200, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'REMINDER_CANCEL_MESSAGE');
  static const WebMessageInfo_StubType BIZ_COEX_PRIVACY_INIT = WebMessageInfo_StubType._(201, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_COEX_PRIVACY_INIT');
  static const WebMessageInfo_StubType BIZ_COEX_PRIVACY_TRANSITION = WebMessageInfo_StubType._(202, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_COEX_PRIVACY_TRANSITION');
  static const WebMessageInfo_StubType GROUP_DEACTIVATED = WebMessageInfo_StubType._(203, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_DEACTIVATED');
  static const WebMessageInfo_StubType COMMUNITY_DEACTIVATE_SIBLING_GROUP = WebMessageInfo_StubType._(204, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_DEACTIVATE_SIBLING_GROUP');
  static const WebMessageInfo_StubType EVENT_UPDATED = WebMessageInfo_StubType._(205, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_UPDATED');
  static const WebMessageInfo_StubType EVENT_CANCELED = WebMessageInfo_StubType._(206, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'EVENT_CANCELED');
  static const WebMessageInfo_StubType COMMUNITY_OWNER_UPDATED = WebMessageInfo_StubType._(207, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_OWNER_UPDATED');
  static const WebMessageInfo_StubType COMMUNITY_SUB_GROUP_VISIBILITY_HIDDEN = WebMessageInfo_StubType._(208, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'COMMUNITY_SUB_GROUP_VISIBILITY_HIDDEN');
  static const WebMessageInfo_StubType CAPI_GROUP_NE2EE_SYSTEM_MESSAGE = WebMessageInfo_StubType._(209, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CAPI_GROUP_NE2EE_SYSTEM_MESSAGE');
  static const WebMessageInfo_StubType STATUS_MENTION = WebMessageInfo_StubType._(210, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'STATUS_MENTION');
  static const WebMessageInfo_StubType USER_CONTROLS_SYSTEM_MESSAGE = WebMessageInfo_StubType._(211, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'USER_CONTROLS_SYSTEM_MESSAGE');
  static const WebMessageInfo_StubType SUPPORT_SYSTEM_MESSAGE = WebMessageInfo_StubType._(212, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SUPPORT_SYSTEM_MESSAGE');
  static const WebMessageInfo_StubType CHANGE_LID = WebMessageInfo_StubType._(213, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGE_LID');
  static const WebMessageInfo_StubType BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_IN_MESSAGE = WebMessageInfo_StubType._(214, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_IN_MESSAGE');
  static const WebMessageInfo_StubType BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_OUT_MESSAGE = WebMessageInfo_StubType._(215, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_OUT_MESSAGE');
  static const WebMessageInfo_StubType CHANGE_LIMIT_SHARING = WebMessageInfo_StubType._(216, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CHANGE_LIMIT_SHARING');
  static const WebMessageInfo_StubType GROUP_MEMBER_LINK_MODE = WebMessageInfo_StubType._(217, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_MEMBER_LINK_MODE');
  static const WebMessageInfo_StubType BIZ_AUTOMATICALLY_LABELED_CHAT_SYSTEM_MESSAGE = WebMessageInfo_StubType._(218, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BIZ_AUTOMATICALLY_LABELED_CHAT_SYSTEM_MESSAGE');
  static const WebMessageInfo_StubType PHONE_NUMBER_HIDING_CHAT_DEPRECATED_MESSAGE = WebMessageInfo_StubType._(219, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PHONE_NUMBER_HIDING_CHAT_DEPRECATED_MESSAGE');
  static const WebMessageInfo_StubType QUARANTINED_MESSAGE = WebMessageInfo_StubType._(220, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'QUARANTINED_MESSAGE');
  static const WebMessageInfo_StubType GROUP_MEMBER_SHARE_GROUP_HISTORY_MODE = WebMessageInfo_StubType._(221, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GROUP_MEMBER_SHARE_GROUP_HISTORY_MODE');

  static const $core.List<WebMessageInfo_StubType> values = <WebMessageInfo_StubType> [
    UNKNOWN,
    REVOKE,
    CIPHERTEXT,
    FUTUREPROOF,
    NON_VERIFIED_TRANSITION,
    UNVERIFIED_TRANSITION,
    VERIFIED_TRANSITION,
    VERIFIED_LOW_UNKNOWN,
    VERIFIED_HIGH,
    VERIFIED_INITIAL_UNKNOWN,
    VERIFIED_INITIAL_LOW,
    VERIFIED_INITIAL_HIGH,
    VERIFIED_TRANSITION_ANY_TO_NONE,
    VERIFIED_TRANSITION_ANY_TO_HIGH,
    VERIFIED_TRANSITION_HIGH_TO_LOW,
    VERIFIED_TRANSITION_HIGH_TO_UNKNOWN,
    VERIFIED_TRANSITION_UNKNOWN_TO_LOW,
    VERIFIED_TRANSITION_LOW_TO_UNKNOWN,
    VERIFIED_TRANSITION_NONE_TO_LOW,
    VERIFIED_TRANSITION_NONE_TO_UNKNOWN,
    GROUP_CREATE,
    GROUP_CHANGE_SUBJECT,
    GROUP_CHANGE_ICON,
    GROUP_CHANGE_INVITE_LINK,
    GROUP_CHANGE_DESCRIPTION,
    GROUP_CHANGE_RESTRICT,
    GROUP_CHANGE_ANNOUNCE,
    GROUP_PARTICIPANT_ADD,
    GROUP_PARTICIPANT_REMOVE,
    GROUP_PARTICIPANT_PROMOTE,
    GROUP_PARTICIPANT_DEMOTE,
    GROUP_PARTICIPANT_INVITE,
    GROUP_PARTICIPANT_LEAVE,
    GROUP_PARTICIPANT_CHANGE_NUMBER,
    BROADCAST_CREATE,
    BROADCAST_ADD,
    BROADCAST_REMOVE,
    GENERIC_NOTIFICATION,
    E2E_IDENTITY_CHANGED,
    E2E_ENCRYPTED,
    CALL_MISSED_VOICE,
    CALL_MISSED_VIDEO,
    INDIVIDUAL_CHANGE_NUMBER,
    GROUP_DELETE,
    GROUP_ANNOUNCE_MODE_MESSAGE_BOUNCE,
    CALL_MISSED_GROUP_VOICE,
    CALL_MISSED_GROUP_VIDEO,
    PAYMENT_CIPHERTEXT,
    PAYMENT_FUTUREPROOF,
    PAYMENT_TRANSACTION_STATUS_UPDATE_FAILED,
    PAYMENT_TRANSACTION_STATUS_UPDATE_REFUNDED,
    PAYMENT_TRANSACTION_STATUS_UPDATE_REFUND_FAILED,
    PAYMENT_TRANSACTION_STATUS_RECEIVER_PENDING_SETUP,
    PAYMENT_TRANSACTION_STATUS_RECEIVER_SUCCESS_AFTER_HICCUP,
    PAYMENT_ACTION_ACCOUNT_SETUP_REMINDER,
    PAYMENT_ACTION_SEND_PAYMENT_REMINDER,
    PAYMENT_ACTION_SEND_PAYMENT_INVITATION,
    PAYMENT_ACTION_REQUEST_DECLINED,
    PAYMENT_ACTION_REQUEST_EXPIRED,
    PAYMENT_ACTION_REQUEST_CANCELLED,
    BIZ_VERIFIED_TRANSITION_TOP_TO_BOTTOM,
    BIZ_VERIFIED_TRANSITION_BOTTOM_TO_TOP,
    BIZ_INTRO_TOP,
    BIZ_INTRO_BOTTOM,
    BIZ_NAME_CHANGE,
    BIZ_MOVE_TO_CONSUMER_APP,
    BIZ_TWO_TIER_MIGRATION_TOP,
    BIZ_TWO_TIER_MIGRATION_BOTTOM,
    OVERSIZED,
    GROUP_CHANGE_NO_FREQUENTLY_FORWARDED,
    GROUP_V4_ADD_INVITE_SENT,
    GROUP_PARTICIPANT_ADD_REQUEST_JOIN,
    CHANGE_EPHEMERAL_SETTING,
    E2E_DEVICE_CHANGED,
    VIEWED_ONCE,
    E2E_ENCRYPTED_NOW,
    BLUE_MSG_BSP_FB_TO_BSP_PREMISE,
    BLUE_MSG_BSP_FB_TO_SELF_FB,
    BLUE_MSG_BSP_FB_TO_SELF_PREMISE,
    BLUE_MSG_BSP_FB_UNVERIFIED,
    BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED,
    BLUE_MSG_BSP_FB_VERIFIED,
    BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED,
    BLUE_MSG_BSP_PREMISE_TO_SELF_PREMISE,
    BLUE_MSG_BSP_PREMISE_UNVERIFIED,
    BLUE_MSG_BSP_PREMISE_UNVERIFIED_TO_SELF_PREMISE_VERIFIED,
    BLUE_MSG_BSP_PREMISE_VERIFIED,
    BLUE_MSG_BSP_PREMISE_VERIFIED_TO_SELF_PREMISE_UNVERIFIED,
    BLUE_MSG_CONSUMER_TO_BSP_FB_UNVERIFIED,
    BLUE_MSG_CONSUMER_TO_BSP_PREMISE_UNVERIFIED,
    BLUE_MSG_CONSUMER_TO_SELF_FB_UNVERIFIED,
    BLUE_MSG_CONSUMER_TO_SELF_PREMISE_UNVERIFIED,
    BLUE_MSG_SELF_FB_TO_BSP_PREMISE,
    BLUE_MSG_SELF_FB_TO_SELF_PREMISE,
    BLUE_MSG_SELF_FB_UNVERIFIED,
    BLUE_MSG_SELF_FB_UNVERIFIED_TO_SELF_PREMISE_VERIFIED,
    BLUE_MSG_SELF_FB_VERIFIED,
    BLUE_MSG_SELF_FB_VERIFIED_TO_SELF_PREMISE_UNVERIFIED,
    BLUE_MSG_SELF_PREMISE_TO_BSP_PREMISE,
    BLUE_MSG_SELF_PREMISE_UNVERIFIED,
    BLUE_MSG_SELF_PREMISE_VERIFIED,
    BLUE_MSG_TO_BSP_FB,
    BLUE_MSG_TO_CONSUMER,
    BLUE_MSG_TO_SELF_FB,
    BLUE_MSG_UNVERIFIED_TO_BSP_FB_VERIFIED,
    BLUE_MSG_UNVERIFIED_TO_BSP_PREMISE_VERIFIED,
    BLUE_MSG_UNVERIFIED_TO_SELF_FB_VERIFIED,
    BLUE_MSG_UNVERIFIED_TO_VERIFIED,
    BLUE_MSG_VERIFIED_TO_BSP_FB_UNVERIFIED,
    BLUE_MSG_VERIFIED_TO_BSP_PREMISE_UNVERIFIED,
    BLUE_MSG_VERIFIED_TO_SELF_FB_UNVERIFIED,
    BLUE_MSG_VERIFIED_TO_UNVERIFIED,
    BLUE_MSG_BSP_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED,
    BLUE_MSG_BSP_FB_UNVERIFIED_TO_SELF_FB_VERIFIED,
    BLUE_MSG_BSP_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED,
    BLUE_MSG_BSP_FB_VERIFIED_TO_SELF_FB_UNVERIFIED,
    BLUE_MSG_SELF_FB_UNVERIFIED_TO_BSP_PREMISE_VERIFIED,
    BLUE_MSG_SELF_FB_VERIFIED_TO_BSP_PREMISE_UNVERIFIED,
    E2E_IDENTITY_UNAVAILABLE,
    GROUP_CREATING,
    GROUP_CREATE_FAILED,
    GROUP_BOUNCED,
    BLOCK_CONTACT,
    EPHEMERAL_SETTING_NOT_APPLIED,
    SYNC_FAILED,
    SYNCING,
    BIZ_PRIVACY_MODE_INIT_FB,
    BIZ_PRIVACY_MODE_INIT_BSP,
    BIZ_PRIVACY_MODE_TO_FB,
    BIZ_PRIVACY_MODE_TO_BSP,
    DISAPPEARING_MODE,
    E2E_DEVICE_FETCH_FAILED,
    ADMIN_REVOKE,
    GROUP_INVITE_LINK_GROWTH_LOCKED,
    COMMUNITY_LINK_PARENT_GROUP,
    COMMUNITY_LINK_SIBLING_GROUP,
    COMMUNITY_LINK_SUB_GROUP,
    COMMUNITY_UNLINK_PARENT_GROUP,
    COMMUNITY_UNLINK_SIBLING_GROUP,
    COMMUNITY_UNLINK_SUB_GROUP,
    GROUP_PARTICIPANT_ACCEPT,
    GROUP_PARTICIPANT_LINKED_GROUP_JOIN,
    COMMUNITY_CREATE,
    EPHEMERAL_KEEP_IN_CHAT,
    GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST,
    GROUP_MEMBERSHIP_JOIN_APPROVAL_MODE,
    INTEGRITY_UNLINK_PARENT_GROUP,
    COMMUNITY_PARTICIPANT_PROMOTE,
    COMMUNITY_PARTICIPANT_DEMOTE,
    COMMUNITY_PARENT_GROUP_DELETED,
    COMMUNITY_LINK_PARENT_GROUP_MEMBERSHIP_APPROVAL,
    GROUP_PARTICIPANT_JOINED_GROUP_AND_PARENT_GROUP,
    MASKED_THREAD_CREATED,
    MASKED_THREAD_UNMASKED,
    BIZ_CHAT_ASSIGNMENT,
    CHAT_PSA,
    CHAT_POLL_CREATION_MESSAGE,
    CAG_MASKED_THREAD_CREATED,
    COMMUNITY_PARENT_GROUP_SUBJECT_CHANGED,
    CAG_INVITE_AUTO_ADD,
    BIZ_CHAT_ASSIGNMENT_UNASSIGN,
    CAG_INVITE_AUTO_JOINED,
    SCHEDULED_CALL_START_MESSAGE,
    COMMUNITY_INVITE_RICH,
    COMMUNITY_INVITE_AUTO_ADD_RICH,
    SUB_GROUP_INVITE_RICH,
    SUB_GROUP_PARTICIPANT_ADD_RICH,
    COMMUNITY_LINK_PARENT_GROUP_RICH,
    COMMUNITY_PARTICIPANT_ADD_RICH,
    SILENCED_UNKNOWN_CALLER_AUDIO,
    SILENCED_UNKNOWN_CALLER_VIDEO,
    GROUP_MEMBER_ADD_MODE,
    GROUP_MEMBERSHIP_JOIN_APPROVAL_REQUEST_NON_ADMIN_ADD,
    COMMUNITY_CHANGE_DESCRIPTION,
    SENDER_INVITE,
    RECEIVER_INVITE,
    COMMUNITY_ALLOW_MEMBER_ADDED_GROUPS,
    PINNED_MESSAGE_IN_CHAT,
    PAYMENT_INVITE_SETUP_INVITER,
    PAYMENT_INVITE_SETUP_INVITEE_RECEIVE_ONLY,
    PAYMENT_INVITE_SETUP_INVITEE_SEND_AND_RECEIVE,
    LINKED_GROUP_CALL_START,
    REPORT_TO_ADMIN_ENABLED_STATUS,
    EMPTY_SUBGROUP_CREATE,
    SCHEDULED_CALL_CANCEL,
    SUBGROUP_ADMIN_TRIGGERED_AUTO_ADD_RICH,
    GROUP_CHANGE_RECENT_HISTORY_SHARING,
    PAID_MESSAGE_SERVER_CAMPAIGN_ID,
    GENERAL_CHAT_CREATE,
    GENERAL_CHAT_ADD,
    GENERAL_CHAT_AUTO_ADD_DISABLED,
    SUGGESTED_SUBGROUP_ANNOUNCE,
    BIZ_BOT_1P_MESSAGING_ENABLED,
    CHANGE_USERNAME,
    BIZ_COEX_PRIVACY_INIT_SELF,
    BIZ_COEX_PRIVACY_TRANSITION_SELF,
    SUPPORT_AI_EDUCATION,
    BIZ_BOT_3P_MESSAGING_ENABLED,
    REMINDER_SETUP_MESSAGE,
    REMINDER_SENT_MESSAGE,
    REMINDER_CANCEL_MESSAGE,
    BIZ_COEX_PRIVACY_INIT,
    BIZ_COEX_PRIVACY_TRANSITION,
    GROUP_DEACTIVATED,
    COMMUNITY_DEACTIVATE_SIBLING_GROUP,
    EVENT_UPDATED,
    EVENT_CANCELED,
    COMMUNITY_OWNER_UPDATED,
    COMMUNITY_SUB_GROUP_VISIBILITY_HIDDEN,
    CAPI_GROUP_NE2EE_SYSTEM_MESSAGE,
    STATUS_MENTION,
    USER_CONTROLS_SYSTEM_MESSAGE,
    SUPPORT_SYSTEM_MESSAGE,
    CHANGE_LID,
    BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_IN_MESSAGE,
    BIZ_CUSTOMER_3PD_DATA_SHARING_OPT_OUT_MESSAGE,
    CHANGE_LIMIT_SHARING,
    GROUP_MEMBER_LINK_MODE,
    BIZ_AUTOMATICALLY_LABELED_CHAT_SYSTEM_MESSAGE,
    PHONE_NUMBER_HIDING_CHAT_DEPRECATED_MESSAGE,
    QUARANTINED_MESSAGE,
    GROUP_MEMBER_SHARE_GROUP_HISTORY_MODE,
  ];

  static final $core.Map<$core.int, WebMessageInfo_StubType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WebMessageInfo_StubType? valueOf($core.int value) => _byValue[value];

  const WebMessageInfo_StubType._($core.int v, $core.String n) : super(v, n);
}

