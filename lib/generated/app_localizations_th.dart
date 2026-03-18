// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'แชท';

  @override
  String get channels => 'ช่องทาง';

  @override
  String get agent => 'ตัวแทน';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get getStarted => 'เริ่มต้น';

  @override
  String get yourPersonalAssistant => 'ผู้ช่วย AI ส่วนตัวของคุณ';

  @override
  String get multiChannelChat => 'แชทหลายช่องทาง';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat และอื่นๆ';

  @override
  String get powerfulAIModels => 'โมเดล AI ที่ทรงพลัง';

  @override
  String get powerfulAIModelsDesc => 'OpenAI, Anthropic, Grok และโมเดลฟรี';

  @override
  String get localGateway => 'เกตเวย์ในเครื่อง';

  @override
  String get localGatewayDesc => 'ทำงานบนอุปกรณ์ของคุณ ข้อมูลของคุณเป็นของคุณ';

  @override
  String get chooseProvider => 'เลือกผู้ให้บริการ';

  @override
  String get selectProviderDesc => 'เลือกวิธีการเชื่อมต่อกับโมเดล AI';

  @override
  String get startForFree => 'เริ่มใช้ฟรี';

  @override
  String get freeProvidersDesc =>
      'ผู้ให้บริการเหล่านี้เสนอโมเดลฟรีเพื่อเริ่มต้นโดยไม่มีค่าใช้จ่าย';

  @override
  String get free => 'ฟรี';

  @override
  String get otherProviders => 'ผู้ให้บริการอื่นๆ';

  @override
  String connectToProvider(String provider) {
    return 'เชื่อมต่อกับ $provider';
  }

  @override
  String get enterApiKeyDesc => 'ป้อนคีย์ API ของคุณและเลือกโมเดล';

  @override
  String get dontHaveApiKey => 'ไม่มีคีย์ API?';

  @override
  String get createAccountCopyKey => 'สร้างบัญชีและคัดลอกคีย์ของคุณ';

  @override
  String get signUp => 'ลงทะเบียน';

  @override
  String get apiKey => 'คีย์ API';

  @override
  String get pasteFromClipboard => 'วางจากคลิปบอร์ด';

  @override
  String get apiBaseUrl => 'URL ฐาน API';

  @override
  String get selectModel => 'เลือกโมเดล';

  @override
  String get modelId => 'ID โมเดล';

  @override
  String get validateKey => 'ตรวจสอบคีย์';

  @override
  String get validating => 'กำลังตรวจสอบ...';

  @override
  String get invalidApiKey => 'คีย์ API ไม่ถูกต้อง';

  @override
  String get gatewayConfiguration => 'การกำหนดค่าเกตเวย์';

  @override
  String get gatewayConfigDesc =>
      'เกตเวย์คือระดับควบคุมในเครื่องสำหรับผู้ช่วยของคุณ';

  @override
  String get defaultSettingsNote =>
      'การตั้งค่าเริ่มต้นใช้งานได้สำหรับผู้ใช้ส่วนใหญ่ เปลี่ยนเฉพาะเมื่อคุณรู้ว่าคุณต้องการอะไร';

  @override
  String get host => 'โฮสต์';

  @override
  String get port => 'พอร์ต';

  @override
  String get autoStartGateway => 'เริ่มเกตเวย์อัตโนมัติ';

  @override
  String get autoStartGatewayDesc => 'เริ่มเกตเวย์โดยอัตโนมัติเมื่อเปิดแอป';

  @override
  String get channelsPageTitle => 'ช่องทาง';

  @override
  String get channelsPageDesc =>
      'เชื่อมต่อช่องทางข้อความตามต้องการ คุณสามารถตั้งค่าได้ทีหลังในการตั้งค่า';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'เชื่อมต่อบอท Telegram';

  @override
  String get openBotFather => 'เปิด BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'เชื่อมต่อบอท Discord';

  @override
  String get developerPortal => 'พอร์ทัลนักพัฒนา';

  @override
  String get botToken => 'โทเค็นบอท';

  @override
  String telegramBotToken(String platform) {
    return 'โทเค็นบอท $platform';
  }

  @override
  String get readyToGo => 'พร้อมเริ่มต้น';

  @override
  String get reviewConfiguration =>
      'ตรวจสอบการกำหนดค่าของคุณและเริ่ม FlutterClaw';

  @override
  String get model => 'โมเดล';

  @override
  String viaProvider(String provider) {
    return 'ผ่าน $provider';
  }

  @override
  String get gateway => 'เกตเวย์';

  @override
  String get webChatOnly => 'WebChat เท่านั้น (คุณสามารถเพิ่มเติมได้ทีหลัง)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'กำลังเริ่มต้น...';

  @override
  String get startFlutterClaw => 'เริ่ม FlutterClaw';

  @override
  String get newSession => 'เซสชันใหม่';

  @override
  String get photoLibrary => 'ไลบรารีภาพถ่าย';

  @override
  String get camera => 'กล้อง';

  @override
  String get whatDoYouSeeInImage => 'คุณเห็นอะไรในภาพนี้?';

  @override
  String get imagePickerNotAvailable =>
      'ตัวเลือกภาพไม่พร้อมใช้งานบนซิมมูเลเตอร์ ใช้อุปกรณ์จริง';

  @override
  String get couldNotOpenImagePicker => 'ไม่สามารถเปิดตัวเลือกภาพได้';

  @override
  String get copiedToClipboard => 'คัดลอกไปยังคลิปบอร์ดแล้ว';

  @override
  String get attachImage => 'แนบภาพ';

  @override
  String get messageFlutterClaw => 'ส่งข้อความถึง FlutterClaw...';

  @override
  String get channelsAndGateway => 'ช่องทางและเกตเวย์';

  @override
  String get stop => 'หยุด';

  @override
  String get start => 'เริ่ม';

  @override
  String status(String status) {
    return 'สถานะ: $status';
  }

  @override
  String get builtInChatInterface => 'อินเทอร์เฟซแชทในตัว';

  @override
  String get notConfigured => 'ไม่ได้กำหนดค่า';

  @override
  String get connected => 'เชื่อมต่อแล้ว';

  @override
  String get configuredStarting => 'กำหนดค่าแล้ว (กำลังเริ่มต้น...)';

  @override
  String get telegramConfiguration => 'การกำหนดค่า Telegram';

  @override
  String get fromBotFather => 'จาก @BotFather';

  @override
  String get allowedUserIds => 'ID ผู้ใช้ที่อนุญาต (คั่นด้วยเครื่องหมายจุลภาค)';

  @override
  String get leaveEmptyToAllowAll => 'ปล่อยว่างเพื่ออนุญาตทั้งหมด';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get saveAndConnect => 'บันทึกและเชื่อมต่อ';

  @override
  String get discordConfiguration => 'การกำหนดค่า Discord';

  @override
  String get pendingPairingRequests => 'คำขอจับคู่ที่รอดำเนินการ';

  @override
  String get approve => 'อนุมัติ';

  @override
  String get reject => 'ปฏิเสธ';

  @override
  String get expired => 'หมดอายุ';

  @override
  String minutesLeft(int minutes) {
    return 'เหลืออีก $minutes นาที';
  }

  @override
  String get workspaceFiles => 'ไฟล์พื้นที่ทำงาน';

  @override
  String get personalAIAssistant => 'ผู้ช่วย AI ส่วนตัว';

  @override
  String sessionsCount(int count) {
    return 'เซสชัน ($count)';
  }

  @override
  String get noActiveSessions => 'ไม่มีเซสชันที่ใช้งานอยู่';

  @override
  String get startConversationToCreate => 'เริ่มการสนทนาเพื่อสร้าง';

  @override
  String get startConversationToSee => 'เริ่มการสนทนาเพื่อดูเซสชันที่นี่';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get cronJobs => 'งานที่กำหนดเวลา';

  @override
  String get noCronJobs => 'ไม่มีงานที่กำหนดเวลา';

  @override
  String get addScheduledTasks => 'เพิ่มงานที่กำหนดเวลาสำหรับตัวแทนของคุณ';

  @override
  String get runNow => 'เรียกใช้ตอนนี้';

  @override
  String get enable => 'เปิดใช้งาน';

  @override
  String get disable => 'ปิดใช้งาน';

  @override
  String get delete => 'ลบ';

  @override
  String get skills => 'ทักษะ';

  @override
  String get browseClawHub => 'เรียกดู ClawHub';

  @override
  String get noSkillsInstalled => 'ไม่มีทักษะที่ติดตั้ง';

  @override
  String get browseClawHubToAdd => 'เรียกดู ClawHub เพื่อเพิ่มทักษะ';

  @override
  String removeSkillConfirm(String name) {
    return 'ลบ \"$name\" ออกจากทักษะของคุณ?';
  }

  @override
  String get clawHubSkills => 'ทักษะ ClawHub';

  @override
  String get searchSkills => 'ค้นหาทักษะ...';

  @override
  String get noSkillsFound => 'ไม่พบทักษะ ลองค้นหาอื่น';

  @override
  String installedSkill(String name) {
    return 'ติดตั้ง $name แล้ว';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'ติดตั้ง $name ล้มเหลว';
  }

  @override
  String get addCronJob => 'เพิ่มงานที่กำหนดเวลา';

  @override
  String get jobName => 'ชื่องาน';

  @override
  String get dailySummaryExample => 'เช่น สรุปรายวัน';

  @override
  String get taskPrompt => 'คำสั่งงาน';

  @override
  String get whatShouldAgentDo => 'ตัวแทนควรทำอะไร?';

  @override
  String get interval => 'ช่วงเวลา';

  @override
  String get every5Minutes => 'ทุก 5 นาที';

  @override
  String get every15Minutes => 'ทุก 15 นาที';

  @override
  String get every30Minutes => 'ทุก 30 นาที';

  @override
  String get everyHour => 'ทุกชั่วโมง';

  @override
  String get every6Hours => 'ทุก 6 ชั่วโมง';

  @override
  String get every12Hours => 'ทุก 12 ชั่วโมง';

  @override
  String get every24Hours => 'ทุก 24 ชั่วโมง';

  @override
  String get add => 'เพิ่ม';

  @override
  String get save => 'บันทึก';

  @override
  String get sessions => 'เซสชัน';

  @override
  String messagesCount(int count) {
    return '$count ข้อความ';
  }

  @override
  String tokensCount(int count) {
    return '$count โทเค็น';
  }

  @override
  String get compact => 'บีบอัด';

  @override
  String get models => 'โมเดล';

  @override
  String get noModelsConfigured => 'ไม่มีโมเดลที่กำหนดค่า';

  @override
  String get addModelToStartChatting => 'เพิ่มโมเดลเพื่อเริ่มแชท';

  @override
  String get addModel => 'เพิ่มโมเดล';

  @override
  String get default_ => 'เริ่มต้น';

  @override
  String get autoStart => 'เริ่มอัตโนมัติ';

  @override
  String get startGatewayWhenLaunches => 'เริ่มเกตเวย์เมื่อเปิดแอป';

  @override
  String get heartbeat => 'ฮาร์ทบีท';

  @override
  String get enabled => 'เปิดใช้งาน';

  @override
  String get periodicAgentTasks => 'งานตัวแทนเป็นระยะจาก HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String get about => 'เกี่ยวกับ';

  @override
  String get personalAIAssistantForIOS =>
      'ผู้ช่วย AI ส่วนตัวสำหรับ iOS และ Android';

  @override
  String get version => 'เวอร์ชัน';

  @override
  String get basedOnOpenClaw => 'ใช้ OpenClaw เป็นฐาน';

  @override
  String get removeModel => 'ลบโมเดล?';

  @override
  String removeModelConfirm(String name) {
    return 'ลบ \"$name\" ออกจากโมเดลของคุณ?';
  }

  @override
  String get remove => 'ลบ';

  @override
  String get setAsDefault => 'ตั้งเป็นค่าเริ่มต้น';

  @override
  String get paste => 'วาง';

  @override
  String get chooseProviderStep => '1. เลือกผู้ให้บริการ';

  @override
  String get selectModelStep => '2. เลือกโมเดล';

  @override
  String get apiKeyStep => '3. คีย์ API';

  @override
  String getApiKeyAt(String provider) {
    return 'รับคีย์ API ที่ $provider';
  }

  @override
  String get justNow => 'เมื่อสักครู่';

  @override
  String minutesAgo(int minutes) {
    return '$minutes นาทีที่แล้ว';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours ชั่วโมงที่แล้ว';
  }

  @override
  String daysAgo(int days) {
    return '$days วันที่แล้ว';
  }

  @override
  String get microphonePermissionDenied => 'ปฏิเสธสิทธิ์ไมโครโฟน';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'การถอดความสดไม่พร้อมใช้งาน: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'ไม่สามารถเริ่มการบันทึก: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'ใช้การถอดความบนอุปกรณ์';

  @override
  String get transcribingWithWhisper => 'กำลังถอดความด้วย Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API ล้มเหลว: $error';
  }

  @override
  String get noTranscriptionCaptured => 'ไม่มีการจับภาพการถอดความ';

  @override
  String failedToStopRecording(String error) {
    return 'ไม่สามารถหยุดการบันทึก: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'ไม่สามารถ$action: $error';
  }

  @override
  String get pause => 'หยุดชั่วคราว';

  @override
  String get resume => 'ดำเนินการต่อ';

  @override
  String get send => 'ส่ง';

  @override
  String get liveActivityActive => 'กิจกรรมสดเปิดใช้งาน';

  @override
  String get restartGateway => 'รีสตาร์ทเกตเวย์';

  @override
  String modelLabel(String model) {
    return 'โมเดล: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'เวลาทำงาน: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: เปิดใช้งานการรองรับเบื้องหลังแล้ว - เกตเวย์สามารถตอบกลับต่อได้';

  @override
  String get webChatBuiltIn => 'อินเทอร์เฟซแชทในตัว';

  @override
  String get configure => 'กำหนดค่า';

  @override
  String get disconnect => 'ตัดการเชื่อมต่อ';

  @override
  String get agents => 'ตัวแทน';

  @override
  String get agentFiles => 'ไฟล์ตัวแทน';

  @override
  String get createAgent => 'สร้างตัวแทน';

  @override
  String get editAgent => 'แก้ไขตัวแทน';

  @override
  String get noAgentsYet => 'ยังไม่มีตัวแทน';

  @override
  String get createYourFirstAgent => 'สร้างตัวแทนแรกของคุณ!';

  @override
  String get active => 'ใช้งานอยู่';

  @override
  String get agentName => 'ชื่อตัวแทน';

  @override
  String get emoji => 'อีโมจิ';

  @override
  String get selectEmoji => 'เลือกอีโมจิ';

  @override
  String get vibe => 'บรรยากาศ';

  @override
  String get vibeHint => 'เช่น เป็นมิตร, เป็นทางการ, เสียดสี';

  @override
  String get modelConfiguration => 'การกำหนดค่าโมเดล';

  @override
  String get advancedSettings => 'การตั้งค่าขั้นสูง';

  @override
  String get agentCreated => 'สร้างตัวแทนแล้ว';

  @override
  String get agentUpdated => 'อัปเดตตัวแทนแล้ว';

  @override
  String get agentDeleted => 'ลบตัวแทนแล้ว';

  @override
  String switchedToAgent(String name) {
    return 'สลับไปยัง $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'ลบ $name? ข้อมูลพื้นที่ทำงานทั้งหมดจะถูกลบ';
  }

  @override
  String get agentDetails => 'รายละเอียดตัวแทน';

  @override
  String get createdAt => 'สร้างเมื่อ';

  @override
  String get lastUsed => 'ใช้ล่าสุด';

  @override
  String get basicInformation => 'ข้อมูลพื้นฐาน';

  @override
  String get switchToAgent => 'สลับตัวแทน';

  @override
  String get providers => 'ผู้ให้บริการ';

  @override
  String get addProvider => 'เพิ่มผู้ให้บริการ';

  @override
  String get noProvidersConfigured => 'ไม่มีผู้ให้บริการที่กำหนดค่า';

  @override
  String get editCredentials => 'แก้ไขข้อมูลรับรอง';

  @override
  String get defaultModelHint =>
      'โมเดลเริ่มต้นถูกใช้โดยตัวแทนที่ไม่ได้ระบุโมเดลของตัวเอง';

  @override
  String get holdToSetAsDefault => 'กดค้างเพื่อตั้งเป็นค่าเริ่มต้น';

  @override
  String get integrations => 'การผสานรวม';

  @override
  String get shortcutsIntegrations => 'การผสานรวม Shortcuts';

  @override
  String get shortcutsIntegrationsDesc =>
      'ติดตั้ง iOS Shortcuts เพื่อเรียกใช้การดำเนินการของแอปบุคคลที่สาม';

  @override
  String get dangerZone => 'โซนอันตราย';

  @override
  String get resetOnboarding => 'รีเซ็ตและเรียกใช้การตั้งค่าใหม่';

  @override
  String get resetOnboardingDesc =>
      'ลบการกำหนดค่าทั้งหมดและกลับไปยังตัวช่วยตั้งค่า';

  @override
  String get resetAllConfiguration => 'รีเซ็ตการกำหนดค่าทั้งหมด?';

  @override
  String get resetAllConfigurationDesc =>
      'การดำเนินการนี้จะลบคีย์ API โมเดล และการตั้งค่าทั้งหมดของคุณ แอปจะกลับไปยังตัวช่วยตั้งค่า\n\nประวัติการสนทนาของคุณจะไม่ถูกลบ';

  @override
  String get removeProvider => 'ลบผู้ให้บริการ';

  @override
  String removeProviderConfirm(String provider) {
    return 'ลบข้อมูลรับรองสำหรับ $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return 'ตั้ง $name เป็นโมเดลเริ่มต้นแล้ว';
  }

  @override
  String get photoImage => 'ภาพถ่าย / รูปภาพ';

  @override
  String get documentPdfTxt => 'เอกสาร (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'ไม่สามารถเปิดเอกสาร: $error';
  }

  @override
  String get retry => 'ลองใหม่';

  @override
  String get gatewayStopped => 'เกตเวย์หยุดทำงาน';

  @override
  String get gatewayStarted => 'เกตเวย์เริ่มทำงานสำเร็จ!';

  @override
  String gatewayFailed(String error) {
    return 'เกตเวย์ล้มเหลว: $error';
  }

  @override
  String exceptionError(String error) {
    return 'ข้อยกเว้น: $error';
  }

  @override
  String get pairingRequestApproved => 'อนุมัติคำขอจับคู่แล้ว';

  @override
  String get pairingRequestRejected => 'ปฏิเสธคำขอจับคู่แล้ว';

  @override
  String get addDevice => 'เพิ่มอุปกรณ์';

  @override
  String get telegramConfigSaved => 'บันทึกการกำหนดค่า Telegram แล้ว';

  @override
  String get discordConfigSaved => 'บันทึกการกำหนดค่า Discord แล้ว';

  @override
  String get securityMethod => 'วิธีการรักษาความปลอดภัย';

  @override
  String get pairingRecommended => 'การจับคู่ (แนะนำ)';

  @override
  String get pairingDescription =>
      'ผู้ใช้ใหม่จะได้รับรหัสจับคู่ คุณอนุมัติหรือปฏิเสธพวกเขา';

  @override
  String get allowlistTitle => 'รายชื่ออนุญาต';

  @override
  String get allowlistDescription =>
      'เฉพาะ ID ผู้ใช้ที่ระบุเท่านั้นที่สามารถเข้าถึงบอทได้';

  @override
  String get openAccess => 'เข้าถึงแบบเปิด';

  @override
  String get openAccessDescription => 'ทุกคนสามารถใช้บอทได้ทันที (ไม่แนะนำ)';

  @override
  String get disabledAccess => 'ปิดใช้งาน';

  @override
  String get disabledAccessDescription => 'ไม่อนุญาต DM บอทจะไม่ตอบข้อความใดๆ';

  @override
  String get approvedDevices => 'อุปกรณ์ที่อนุมัติ';

  @override
  String get noApprovedDevicesYet => 'ยังไม่มีอุปกรณ์ที่อนุมัติ';

  @override
  String get devicesAppearAfterApproval =>
      'อุปกรณ์จะปรากฏที่นี่หลังจากคุณอนุมัติคำขอจับคู่';

  @override
  String get noAllowedUsersConfigured => 'ไม่มีผู้ใช้ที่อนุญาตที่กำหนดค่า';

  @override
  String get addUserIdsHint => 'เพิ่ม ID ผู้ใช้เพื่ออนุญาตให้ใช้บอท';

  @override
  String get removeDevice => 'ลบอุปกรณ์?';

  @override
  String removeAccessFor(String name) {
    return 'ลบการเข้าถึงสำหรับ $name?';
  }

  @override
  String get saving => 'กำลังบันทึก...';

  @override
  String get channelsLabel => 'ช่องทาง';

  @override
  String get clawHubAccount => 'บัญชี ClawHub';

  @override
  String get loggedInToClawHub => 'คุณเข้าสู่ระบบ ClawHub อยู่ในขณะนี้';

  @override
  String get loggedOutFromClawHub => 'ออกจากระบบ ClawHub แล้ว';

  @override
  String get login => 'เข้าสู่ระบบ';

  @override
  String get logout => 'ออกจากระบบ';

  @override
  String get connect => 'เชื่อมต่อ';

  @override
  String get pasteClawHubToken => 'วางโทเค็น API ClawHub ของคุณ';

  @override
  String get pleaseEnterApiToken => 'กรุณาป้อนโทเค็น API';

  @override
  String get successfullyConnected => 'เชื่อมต่อกับ ClawHub สำเร็จ';

  @override
  String get browseSkillsButton => 'เรียกดูทักษะ';

  @override
  String get installSkill => 'ติดตั้งทักษะ';

  @override
  String get incompatibleSkill => 'ทักษะที่เข้ากันไม่ได้';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'ทักษะนี้ไม่สามารถทำงานบนมือถือ (iOS/Android) ได้\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'คำเตือนความเข้ากันได้';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'ทักษะนี้ออกแบบมาสำหรับเดสก์ท็อปและอาจไม่ทำงานบนมือถือ\n\n$reason\n\nคุณต้องการติดตั้งเวอร์ชันที่ปรับแต่งสำหรับมือถือหรือไม่?';
  }

  @override
  String get ok => 'ตกลง';

  @override
  String get installOriginal => 'ติดตั้งต้นฉบับ';

  @override
  String get installAdapted => 'ติดตั้งฉบับปรับแต่ง';

  @override
  String get resetSession => 'รีเซ็ตเซสชัน';

  @override
  String resetSessionConfirm(String key) {
    return 'รีเซ็ตเซสชัน \"$key\"? ข้อความทั้งหมดจะถูกล้าง';
  }

  @override
  String get sessionReset => 'รีเซ็ตเซสชันแล้ว';

  @override
  String get activeSessions => 'เซสชันที่ใช้งานอยู่';

  @override
  String get scheduledTasks => 'งานที่กำหนดเวลา';

  @override
  String get defaultBadge => 'ค่าเริ่มต้น';

  @override
  String errorGeneric(String error) {
    return 'ข้อผิดพลาด: $error';
  }

  @override
  String fileSaved(String fileName) {
    return 'บันทึก $fileName แล้ว';
  }

  @override
  String errorSavingFile(String error) {
    return 'ข้อผิดพลาดในการบันทึกไฟล์: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'ไม่สามารถลบตัวแทนสุดท้ายได้';

  @override
  String get close => 'ปิด';

  @override
  String get nameIsRequired => 'จำเป็นต้องมีชื่อ';

  @override
  String get pleaseSelectModel => 'กรุณาเลือกโมเดล';

  @override
  String temperatureLabel(String value) {
    return 'อุณหภูมิ: $value';
  }

  @override
  String get maxTokens => 'โทเค็นสูงสุด';

  @override
  String get maxTokensRequired => 'ต้องระบุโทเค็นสูงสุด';

  @override
  String get mustBePositiveNumber => 'ต้องเป็นจำนวนบวก';

  @override
  String get maxToolIterations => 'รอบการทำงานเครื่องมือสูงสุด';

  @override
  String get maxIterationsRequired => 'ต้องระบุรอบการทำงานสูงสุด';

  @override
  String get restrictToWorkspace => 'จำกัดเฉพาะพื้นที่ทำงาน';

  @override
  String get restrictToWorkspaceDesc =>
      'จำกัดการดำเนินการไฟล์ไว้ในพื้นที่ทำงานของตัวแทน';

  @override
  String get noModelsConfiguredLong =>
      'กรุณาเพิ่มโมเดลอย่างน้อยหนึ่งรายการในการตั้งค่าก่อนสร้างตัวแทน';

  @override
  String get selectProviderFirst => 'เลือกผู้ให้บริการก่อน';

  @override
  String get skip => 'ข้าม';

  @override
  String get continueButton => 'ดำเนินการต่อ';

  @override
  String get uiAutomation => 'การทำงานอัตโนมัติ UI';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw สามารถควบคุมหน้าจอของคุณแทนคุณ — แตะปุ่ม กรอกแบบฟอร์ม เลื่อน และทำงานซ้ำๆ โดยอัตโนมัติในแอปใดก็ได้';

  @override
  String get uiAutomationAccessibilityNote =>
      'สิ่งนี้ต้องเปิดใช้งานบริการการเข้าถึงในการตั้งค่า Android คุณสามารถข้ามและเปิดใช้งานภายหลัง';

  @override
  String get openAccessibilitySettings => 'เปิดการตั้งค่าการเข้าถึง';

  @override
  String get skipForNow => 'ข้ามไปก่อน';

  @override
  String get checkingPermission => 'กำลังตรวจสอบสิทธิ์…';

  @override
  String get accessibilityEnabled => 'เปิดใช้งานบริการการเข้าถึงแล้ว';

  @override
  String get accessibilityNotEnabled => 'ยังไม่ได้เปิดใช้งานบริการการเข้าถึง';

  @override
  String get exploreIntegrations => 'สำรวจการผสานรวม';

  @override
  String get requestTimedOut => 'คำขอหมดเวลา';

  @override
  String get myShortcuts => 'ทางลัดของฉัน';

  @override
  String get addShortcut => 'เพิ่มทางลัด';

  @override
  String get noShortcutsYet => 'ยังไม่มีทางลัด';

  @override
  String get shortcutsInstructions =>
      'สร้างทางลัดในแอป iOS Shortcuts เพิ่มการเรียกกลับที่ส่วนท้าย จากนั้นลงทะเบียนที่นี่เพื่อให้ AI เรียกใช้ได้';

  @override
  String get shortcutName => 'ชื่อทางลัด';

  @override
  String get shortcutNameHint => 'ชื่อที่ตรงกันจากแอป Shortcuts';

  @override
  String get descriptionOptional => 'คำอธิบาย (ไม่บังคับ)';

  @override
  String get whatDoesShortcutDo => 'ทางลัดนี้ทำอะไร?';

  @override
  String get callbackSetup => 'การตั้งค่าการเรียกกลับ';

  @override
  String get callbackInstructions =>
      'ทางลัดแต่ละอันต้องลงท้ายด้วย:\n① Get Value for Key → \"callbackUrl\" (จาก Shortcut Input แยกวิเคราะห์เป็น dict)\n② Open URLs ← ผลลัพธ์ของ ①';

  @override
  String get channelApp => 'แอป';

  @override
  String get channelHeartbeat => 'ฮาร์ทบีท';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'ตัวแทนย่อย';

  @override
  String get channelSystem => 'ระบบ';

  @override
  String secondsAgo(int seconds) {
    return '$secondsวินาทีที่แล้ว';
  }

  @override
  String get messagesAbbrev => 'ข้อความ';
}
