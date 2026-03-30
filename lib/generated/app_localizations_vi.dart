// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Trò chuyện';

  @override
  String get channels => 'Kênh';

  @override
  String get agent => 'Tác nhân';

  @override
  String get settings => 'Cài đặt';

  @override
  String get getStarted => 'Bắt đầu';

  @override
  String get yourPersonalAssistant => 'Trợ lý AI cá nhân của bạn';

  @override
  String get multiChannelChat => 'Trò chuyện đa kênh';

  @override
  String get multiChannelChatDesc =>
      'Telegram, Discord, WebChat và hơn thế nữa';

  @override
  String get powerfulAIModels => 'Mô hình AI mạnh mẽ';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok và mô hình miễn phí';

  @override
  String get localGateway => 'Cổng cục bộ';

  @override
  String get localGatewayDesc =>
      'Chạy trên thiết bị của bạn, dữ liệu của bạn thuộc về bạn';

  @override
  String get chooseProvider => 'Chọn Nhà cung cấp';

  @override
  String get selectProviderDesc => 'Chọn cách bạn muốn kết nối với mô hình AI.';

  @override
  String get startForFree => 'Bắt đầu Miễn phí';

  @override
  String get freeProvidersDesc =>
      'Các nhà cung cấp này cung cấp mô hình miễn phí để bạn bắt đầu không mất chi phí.';

  @override
  String get free => 'MIỄN PHÍ';

  @override
  String get otherProviders => 'Nhà cung cấp Khác';

  @override
  String connectToProvider(String provider) {
    return 'Kết nối với $provider';
  }

  @override
  String get enterApiKeyDesc => 'Nhập khóa API của bạn và chọn mô hình.';

  @override
  String get dontHaveApiKey => 'Không có khóa API?';

  @override
  String get createAccountCopyKey => 'Tạo tài khoản và sao chép khóa của bạn.';

  @override
  String get signUp => 'Đăng ký';

  @override
  String get apiKey => 'Khóa API';

  @override
  String get pasteFromClipboard => 'Dán từ khay nhớ tạm';

  @override
  String get apiBaseUrl => 'URL Cơ sở API';

  @override
  String get selectModel => 'Chọn Mô hình';

  @override
  String get modelId => 'ID Mô hình';

  @override
  String get validateKey => 'Xác thực Khóa';

  @override
  String get validating => 'Đang xác thực...';

  @override
  String get invalidApiKey => 'Khóa API không hợp lệ';

  @override
  String get gatewayConfiguration => 'Cấu hình Cổng';

  @override
  String get gatewayConfigDesc =>
      'Cổng là mặt phẳng điều khiển cục bộ cho trợ lý của bạn.';

  @override
  String get defaultSettingsNote =>
      'Cài đặt mặc định hoạt động cho hầu hết người dùng. Chỉ thay đổi nếu bạn biết bạn cần gì.';

  @override
  String get host => 'Máy chủ';

  @override
  String get port => 'Cổng';

  @override
  String get autoStartGateway => 'Tự động khởi động cổng';

  @override
  String get autoStartGatewayDesc =>
      'Khởi động cổng tự động khi ứng dụng khởi chạy.';

  @override
  String get channelsPageTitle => 'Kênh';

  @override
  String get channelsPageDesc =>
      'Tùy chọn kết nối các kênh nhắn tin. Bạn luôn có thể thiết lập chúng sau trong Cài đặt.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Kết nối bot Telegram.';

  @override
  String get openBotFather => 'Mở BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Kết nối bot Discord.';

  @override
  String get developerPortal => 'Cổng Nhà phát triển';

  @override
  String get botToken => 'Token Bot';

  @override
  String telegramBotToken(String platform) {
    return 'Token Bot $platform';
  }

  @override
  String get readyToGo => 'Sẵn sàng Bắt đầu';

  @override
  String get reviewConfiguration =>
      'Xem lại cấu hình của bạn và khởi động FlutterClaw.';

  @override
  String get model => 'Mô hình';

  @override
  String viaProvider(String provider) {
    return 'qua $provider';
  }

  @override
  String get gateway => 'Cổng';

  @override
  String get webChatOnly => 'Chỉ WebChat (bạn có thể thêm sau)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Đang khởi động...';

  @override
  String get startFlutterClaw => 'Khởi động FlutterClaw';

  @override
  String get newSession => 'Phiên mới';

  @override
  String get photoLibrary => 'Thư viện Ảnh';

  @override
  String get camera => 'Máy ảnh';

  @override
  String get whatDoYouSeeInImage => 'Bạn thấy gì trong hình ảnh này?';

  @override
  String get imagePickerNotAvailable =>
      'Trình chọn hình ảnh không khả dụng trên Trình mô phỏng. Sử dụng thiết bị thật.';

  @override
  String get couldNotOpenImagePicker => 'Không thể mở trình chọn hình ảnh.';

  @override
  String get copiedToClipboard => 'Đã sao chép vào khay nhớ tạm';

  @override
  String get attachImage => 'Đính kèm hình ảnh';

  @override
  String get messageFlutterClaw => 'Tin nhắn cho FlutterClaw...';

  @override
  String get channelsAndGateway => 'Kênh và Cổng';

  @override
  String get stop => 'Dừng';

  @override
  String get start => 'Bắt đầu';

  @override
  String status(String status) {
    return 'Trạng thái: $status';
  }

  @override
  String get builtInChatInterface => 'Giao diện trò chuyện tích hợp';

  @override
  String get notConfigured => 'Chưa được cấu hình';

  @override
  String get connected => 'Đã kết nối';

  @override
  String get configuredStarting => 'Đã cấu hình (đang khởi động...)';

  @override
  String get telegramConfiguration => 'Cấu hình Telegram';

  @override
  String get fromBotFather => 'Từ @BotFather';

  @override
  String get allowedUserIds =>
      'ID Người dùng được phép (phân cách bằng dấu phẩy)';

  @override
  String get leaveEmptyToAllowAll => 'Để trống để cho phép tất cả';

  @override
  String get cancel => 'Hủy';

  @override
  String get saveAndConnect => 'Lưu và Kết nối';

  @override
  String get discordConfiguration => 'Cấu hình Discord';

  @override
  String get pendingPairingRequests => 'Yêu cầu Ghép nối Đang chờ';

  @override
  String get approve => 'Phê duyệt';

  @override
  String get reject => 'Từ chối';

  @override
  String get expired => 'Đã hết hạn';

  @override
  String minutesLeft(int minutes) {
    return 'Còn $minutes phút';
  }

  @override
  String get workspaceFiles => 'Tệp Không gian làm việc';

  @override
  String get personalAIAssistant => 'Trợ lý AI Cá nhân';

  @override
  String sessionsCount(int count) {
    return 'Phiên ($count)';
  }

  @override
  String get noActiveSessions => 'Không có phiên hoạt động';

  @override
  String get startConversationToCreate => 'Bắt đầu cuộc trò chuyện để tạo';

  @override
  String get startConversationToSee =>
      'Bắt đầu cuộc trò chuyện để xem phiên ở đây';

  @override
  String get reset => 'Đặt lại';

  @override
  String get cronJobs => 'Công việc Đã lập lịch';

  @override
  String get noCronJobs => 'Không có công việc đã lập lịch';

  @override
  String get addScheduledTasks =>
      'Thêm công việc đã lập lịch cho tác nhân của bạn';

  @override
  String get runNow => 'Chạy Ngay';

  @override
  String get enable => 'Bật';

  @override
  String get disable => 'Tắt';

  @override
  String get delete => 'Xóa';

  @override
  String get skills => 'Kỹ năng';

  @override
  String get browseClawHub => 'Duyệt ClawHub';

  @override
  String get noSkillsInstalled => 'Không có kỹ năng nào được cài đặt';

  @override
  String get browseClawHubToAdd => 'Duyệt ClawHub để thêm kỹ năng';

  @override
  String removeSkillConfirm(String name) {
    return 'Xóa \"$name\" khỏi kỹ năng của bạn?';
  }

  @override
  String get clawHubSkills => 'Kỹ năng ClawHub';

  @override
  String get searchSkills => 'Tìm kiếm kỹ năng...';

  @override
  String get noSkillsFound => 'Không tìm thấy kỹ năng. Thử tìm kiếm khác.';

  @override
  String installedSkill(String name) {
    return 'Đã cài đặt $name';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Không cài đặt được $name';
  }

  @override
  String get addCronJob => 'Thêm Công việc Đã lập lịch';

  @override
  String get jobName => 'Tên Công việc';

  @override
  String get dailySummaryExample => 'ví dụ: Tóm tắt Hàng ngày';

  @override
  String get taskPrompt => 'Lời nhắc Nhiệm vụ';

  @override
  String get whatShouldAgentDo => 'Tác nhân nên làm gì?';

  @override
  String get interval => 'Khoảng thời gian';

  @override
  String get every5Minutes => 'Mỗi 5 phút';

  @override
  String get every15Minutes => 'Mỗi 15 phút';

  @override
  String get every30Minutes => 'Mỗi 30 phút';

  @override
  String get everyHour => 'Mỗi giờ';

  @override
  String get every6Hours => 'Mỗi 6 giờ';

  @override
  String get every12Hours => 'Mỗi 12 giờ';

  @override
  String get every24Hours => 'Mỗi 24 giờ';

  @override
  String get add => 'Thêm';

  @override
  String get save => 'Lưu';

  @override
  String get sessions => 'Phiên';

  @override
  String messagesCount(int count) {
    return '$count tin nhắn';
  }

  @override
  String tokensCount(int count) {
    return '$count token';
  }

  @override
  String get compact => 'Nén';

  @override
  String get models => 'Mô hình';

  @override
  String get noModelsConfigured => 'Không có mô hình nào được cấu hình';

  @override
  String get addModelToStartChatting => 'Thêm mô hình để bắt đầu trò chuyện';

  @override
  String get addModel => 'Thêm Mô hình';

  @override
  String get default_ => 'MẶC ĐỊNH';

  @override
  String get autoStart => 'Tự động khởi động';

  @override
  String get startGatewayWhenLaunches =>
      'Khởi động cổng khi ứng dụng khởi chạy';

  @override
  String get heartbeat => 'Nhịp tim';

  @override
  String get enabled => 'Đã bật';

  @override
  String get periodicAgentTasks => 'Công việc tác nhân định kỳ từ HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes phút';
  }

  @override
  String get about => 'Giới thiệu';

  @override
  String get personalAIAssistantForIOS =>
      'Trợ lý AI Cá nhân cho iOS và Android';

  @override
  String get version => 'Phiên bản';

  @override
  String get basedOnOpenClaw => 'Dựa trên OpenClaw';

  @override
  String get removeModel => 'Xóa mô hình?';

  @override
  String removeModelConfirm(String name) {
    return 'Xóa \"$name\" khỏi mô hình của bạn?';
  }

  @override
  String get remove => 'Xóa';

  @override
  String get setAsDefault => 'Đặt làm Mặc định';

  @override
  String get paste => 'Dán';

  @override
  String get chooseProviderStep => '1. Chọn Nhà cung cấp';

  @override
  String get selectModelStep => '2. Chọn Mô hình';

  @override
  String get apiKeyStep => '3. Khóa API';

  @override
  String getApiKeyAt(String provider) {
    return 'Lấy khóa API tại $provider';
  }

  @override
  String get justNow => 'vừa xong';

  @override
  String minutesAgo(int minutes) {
    return '$minutes phút trước';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours giờ trước';
  }

  @override
  String daysAgo(int days) {
    return '$days ngày trước';
  }

  @override
  String get microphonePermissionDenied => 'Quyền truy cập micrô bị từ chối';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Phiên âm trực tiếp không khả dụng: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Không thể bắt đầu ghi âm: $error';
  }

  @override
  String get usingOnDeviceTranscription => 'Sử dụng phiên âm trên thiết bị';

  @override
  String get transcribingWithWhisper => 'Đang phiên âm bằng Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API thất bại: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Không có phiên âm được ghi lại';

  @override
  String failedToStopRecording(String error) {
    return 'Không thể dừng ghi âm: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Không thể $action: $error';
  }

  @override
  String get pause => 'Tạm dừng';

  @override
  String get resume => 'Tiếp tục';

  @override
  String get send => 'Gửi';

  @override
  String get liveActivityActive => 'Hoạt động trực tiếp đang hoạt động';

  @override
  String get restartGateway => 'Khởi động lại Gateway';

  @override
  String modelLabel(String model) {
    return 'Mô hình: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Thời gian hoạt động: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Hỗ trợ chạy nền đã bật - gateway có thể tiếp tục phản hồi';

  @override
  String get webChatBuiltIn => 'Giao diện trò chuyện tích hợp';

  @override
  String get configure => 'Cấu hình';

  @override
  String get disconnect => 'Ngắt kết nối';

  @override
  String get agents => 'Tác nhân';

  @override
  String get agentFiles => 'Tệp Tác nhân';

  @override
  String get createAgent => 'Tạo Tác nhân';

  @override
  String get editAgent => 'Sửa Tác nhân';

  @override
  String get noAgentsYet => 'Chưa có tác nhân nào';

  @override
  String get createYourFirstAgent => 'Tạo tác nhân đầu tiên của bạn!';

  @override
  String get active => 'Đang hoạt động';

  @override
  String get agentName => 'Tên Tác nhân';

  @override
  String get emoji => 'Biểu tượng cảm xúc';

  @override
  String get selectEmoji => 'Chọn Biểu tượng cảm xúc';

  @override
  String get vibe => 'Phong cách';

  @override
  String get vibeHint => 'ví dụ: thân thiện, trang trọng, mỉa mai';

  @override
  String get modelConfiguration => 'Cấu hình Mô hình';

  @override
  String get advancedSettings => 'Cài đặt Nâng cao';

  @override
  String get agentCreated => 'Đã tạo tác nhân';

  @override
  String get agentUpdated => 'Đã cập nhật tác nhân';

  @override
  String get agentDeleted => 'Đã xóa tác nhân';

  @override
  String switchedToAgent(String name) {
    return 'Đã chuyển sang $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Xóa $name? Điều này sẽ xóa tất cả dữ liệu không gian làm việc.';
  }

  @override
  String get agentDetails => 'Chi tiết Tác nhân';

  @override
  String get createdAt => 'Ngày tạo';

  @override
  String get lastUsed => 'Lần sử dụng cuối';

  @override
  String get basicInformation => 'Thông tin Cơ bản';

  @override
  String get switchToAgent => 'Chuyển Tác nhân';

  @override
  String get providers => 'Nhà cung cấp';

  @override
  String get addProvider => 'Thêm nhà cung cấp';

  @override
  String get noProvidersConfigured => 'Chưa có nhà cung cấp nào được cấu hình.';

  @override
  String get editCredentials => 'Sửa thông tin xác thực';

  @override
  String get defaultModelHint =>
      'Mô hình mặc định được sử dụng bởi các tác nhân không chỉ định mô hình riêng.';

  @override
  String get voiceCallModelSection => 'Voice call (Live)';

  @override
  String get voiceCallModelDescription =>
      'Used only when you tap the call button. Chat, agents, and background tasks use your normal model.';

  @override
  String get voiceCallModelLabel => 'Live model';

  @override
  String get voiceCallModelAutomatic => 'Automatic';

  @override
  String get preferLiveVoiceBootstrapTitle => 'Bootstrap in voice call';

  @override
  String get preferLiveVoiceBootstrapSubtitle =>
      'On a new empty chat with BOOTSTRAP.md, start a voice call instead of a silent text hatch (when Live is available).';

  @override
  String get liveVoiceNameLabel => 'Voice';

  @override
  String get firstHatchModeChoiceTitle => 'Bạn muốn bắt đầu thế nào?';

  @override
  String get firstHatchModeChoiceBody =>
      'Bạn có thể nhắn chữ với trợ lý hoặc bắt đầu trò chuyện bằng giọng nói như một cuộc gọi ngắn. Hãy chọn cách bạn thấy dễ nhất.';

  @override
  String get firstHatchModeChoiceChatButton => 'Nhắn trong chat';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Nói chuyện bằng giọng nói';

  @override
  String get liveVoiceBargeInHint =>
      'Speak after the assistant stops (echo was interrupting them mid-speech).';

  @override
  String get cannotAddLiveModelAsChat =>
      'This model is for voice calls only. Choose a chat model from the list.';

  @override
  String get holdToSetAsDefault => 'Giữ để đặt làm mặc định';

  @override
  String get integrations => 'Tích hợp';

  @override
  String get shortcutsIntegrations => 'Tích hợp Phím tắt';

  @override
  String get shortcutsIntegrationsDesc =>
      'Cài đặt iOS Shortcuts để chạy các hành động ứng dụng bên thứ ba';

  @override
  String get dangerZone => 'Vùng nguy hiểm';

  @override
  String get resetOnboarding => 'Đặt lại và chạy lại hướng dẫn';

  @override
  String get resetOnboardingDesc =>
      'Xóa tất cả cấu hình và quay lại trình hướng dẫn thiết lập.';

  @override
  String get resetAllConfiguration => 'Đặt lại tất cả cấu hình?';

  @override
  String get resetAllConfigurationDesc =>
      'Điều này sẽ xóa khóa API, mô hình và tất cả cài đặt của bạn. Ứng dụng sẽ quay lại trình hướng dẫn thiết lập.\n\nLịch sử trò chuyện của bạn không bị xóa.';

  @override
  String get removeProvider => 'Xóa nhà cung cấp';

  @override
  String removeProviderConfirm(String provider) {
    return 'Xóa thông tin xác thực cho $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name đã được đặt làm mô hình mặc định';
  }

  @override
  String get photoImage => 'Ảnh / Hình ảnh';

  @override
  String get documentPdfTxt => 'Tài liệu (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Không thể mở tài liệu: $error';
  }

  @override
  String get retry => 'Thử lại';

  @override
  String get gatewayStopped => 'Cổng đã dừng';

  @override
  String get gatewayStarted => 'Cổng đã khởi động thành công!';

  @override
  String gatewayFailed(String error) {
    return 'Cổng thất bại: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Ngoại lệ: $error';
  }

  @override
  String get pairingRequestApproved => 'Yêu cầu ghép nối đã được phê duyệt';

  @override
  String get pairingRequestRejected => 'Yêu cầu ghép nối đã bị từ chối';

  @override
  String get addDevice => 'Thêm Thiết bị';

  @override
  String get telegramConfigSaved => 'Cấu hình Telegram đã được lưu';

  @override
  String get discordConfigSaved => 'Cấu hình Discord đã được lưu';

  @override
  String get securityMethod => 'Phương thức Bảo mật';

  @override
  String get pairingRecommended => 'Ghép nối (Khuyến nghị)';

  @override
  String get pairingDescription =>
      'Người dùng mới nhận được mã ghép nối. Bạn phê duyệt hoặc từ chối họ.';

  @override
  String get allowlistTitle => 'Danh sách cho phép';

  @override
  String get allowlistDescription =>
      'Chỉ các ID người dùng cụ thể mới có thể truy cập bot.';

  @override
  String get openAccess => 'Mở';

  @override
  String get openAccessDescription =>
      'Bất kỳ ai cũng có thể sử dụng bot ngay lập tức (không khuyến nghị).';

  @override
  String get disabledAccess => 'Đã tắt';

  @override
  String get disabledAccessDescription =>
      'Không cho phép DM. Bot sẽ không phản hồi bất kỳ tin nhắn nào.';

  @override
  String get approvedDevices => 'Thiết bị Đã phê duyệt';

  @override
  String get noApprovedDevicesYet => 'Chưa có thiết bị nào được phê duyệt';

  @override
  String get devicesAppearAfterApproval =>
      'Thiết bị sẽ xuất hiện ở đây sau khi bạn phê duyệt yêu cầu ghép nối';

  @override
  String get noAllowedUsersConfigured =>
      'Chưa có người dùng được phép nào được cấu hình';

  @override
  String get addUserIdsHint => 'Thêm ID người dùng để cho phép họ sử dụng bot';

  @override
  String get removeDevice => 'Xóa thiết bị?';

  @override
  String removeAccessFor(String name) {
    return 'Xóa quyền truy cập cho $name?';
  }

  @override
  String get saving => 'Đang lưu...';

  @override
  String get channelsLabel => 'Kênh';

  @override
  String get clawHubAccount => 'Tài khoản ClawHub';

  @override
  String get loggedInToClawHub => 'Bạn hiện đang đăng nhập vào ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Đã đăng xuất khỏi ClawHub';

  @override
  String get login => 'Đăng nhập';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get connect => 'Kết nối';

  @override
  String get pasteClawHubToken => 'Dán token API ClawHub của bạn';

  @override
  String get pleaseEnterApiToken => 'Vui lòng nhập token API';

  @override
  String get successfullyConnected => 'Đã kết nối thành công với ClawHub';

  @override
  String get browseSkillsButton => 'Duyệt Kỹ năng';

  @override
  String get installSkill => 'Cài đặt Kỹ năng';

  @override
  String get incompatibleSkill => 'Kỹ năng Không tương thích';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Kỹ năng này không thể chạy trên thiết bị di động (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Cảnh báo Tương thích';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Kỹ năng này được thiết kế cho máy tính để bàn và có thể không hoạt động trên thiết bị di động.\n\n$reason\n\nBạn có muốn cài đặt phiên bản tùy chỉnh được tối ưu hóa cho di động không?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Cài đặt Bản gốc';

  @override
  String get installAdapted => 'Cài đặt Bản tùy chỉnh';

  @override
  String get resetSession => 'Đặt lại Phiên';

  @override
  String resetSessionConfirm(String key) {
    return 'Đặt lại phiên \"$key\"? Điều này sẽ xóa tất cả tin nhắn.';
  }

  @override
  String get sessionReset => 'Phiên đã được đặt lại';

  @override
  String get activeSessions => 'Phiên Đang hoạt động';

  @override
  String get scheduledTasks => 'Công việc Đã lập lịch';

  @override
  String get defaultBadge => 'Mặc định';

  @override
  String errorGeneric(String error) {
    return 'Lỗi: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName đã lưu';
  }

  @override
  String errorSavingFile(String error) {
    return 'Lỗi khi lưu tệp: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Không thể xóa tác nhân cuối cùng';

  @override
  String get close => 'Đóng';

  @override
  String get nameIsRequired => 'Tên là bắt buộc';

  @override
  String get pleaseSelectModel => 'Vui lòng chọn mô hình';

  @override
  String temperatureLabel(String value) {
    return 'Nhiệt độ: $value';
  }

  @override
  String get maxTokens => 'Token Tối đa';

  @override
  String get maxTokensRequired => 'Token tối đa là bắt buộc';

  @override
  String get mustBePositiveNumber => 'Phải là số dương';

  @override
  String get maxToolIterations => 'Lượt Lặp Công cụ Tối đa';

  @override
  String get maxIterationsRequired => 'Lượt lặp tối đa là bắt buộc';

  @override
  String get restrictToWorkspace => 'Giới hạn trong Không gian làm việc';

  @override
  String get restrictToWorkspaceDesc =>
      'Giới hạn thao tác tệp trong không gian làm việc tác nhân';

  @override
  String get noModelsConfiguredLong =>
      'Vui lòng thêm ít nhất một mô hình trong Cài đặt trước khi tạo tác nhân.';

  @override
  String get selectProviderFirst => 'Chọn nhà cung cấp trước';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get continueButton => 'Tiếp tục';

  @override
  String get uiAutomation => 'Tự động hóa Giao diện';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw có thể điều khiển màn hình thay bạn — nhấn nút, điền biểu mẫu, cuộn và tự động hóa các tác vụ lặp đi lặp lại trên bất kỳ ứng dụng nào.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Điều này yêu cầu bật Dịch vụ Hỗ trợ tiếp cận trong Cài đặt Android. Bạn có thể bỏ qua và bật sau.';

  @override
  String get openAccessibilitySettings => 'Mở Cài đặt Hỗ trợ tiếp cận';

  @override
  String get skipForNow => 'Bỏ qua lúc này';

  @override
  String get checkingPermission => 'Đang kiểm tra quyền…';

  @override
  String get accessibilityEnabled => 'Dịch vụ Hỗ trợ tiếp cận đã được bật';

  @override
  String get accessibilityNotEnabled => 'Dịch vụ Hỗ trợ tiếp cận chưa được bật';

  @override
  String get exploreIntegrations => 'Khám phá Tích hợp';

  @override
  String get requestTimedOut => 'Yêu cầu đã hết thời gian';

  @override
  String get myShortcuts => 'Phím tắt của tôi';

  @override
  String get addShortcut => 'Thêm Phím tắt';

  @override
  String get noShortcutsYet => 'Chưa có phím tắt nào';

  @override
  String get shortcutsInstructions =>
      'Tạo phím tắt trong ứng dụng iOS Shortcuts, thêm hành động gọi lại ở cuối, sau đó đăng ký ở đây để AI có thể chạy.';

  @override
  String get shortcutName => 'Tên phím tắt';

  @override
  String get shortcutNameHint => 'Tên chính xác từ ứng dụng Shortcuts';

  @override
  String get descriptionOptional => 'Mô tả (tùy chọn)';

  @override
  String get whatDoesShortcutDo => 'Phím tắt này làm gì?';

  @override
  String get callbackSetup => 'Thiết lập gọi lại';

  @override
  String get callbackInstructions =>
      'Mỗi phím tắt phải kết thúc bằng:\n① Lấy Giá trị cho Khóa → \"callbackUrl\" (từ Đầu vào Phím tắt được phân tích dưới dạng dict)\n② Mở URL ← đầu ra của ①';

  @override
  String get channelApp => 'Ứng dụng';

  @override
  String get channelHeartbeat => 'Nhịp tim';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Tác nhân phụ';

  @override
  String get channelSystem => 'Hệ thống';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}s trước';
  }

  @override
  String get messagesAbbrev => 'tn';

  @override
  String get modelAlreadyAdded => 'Mô hình này đã có trong danh sách của bạn';

  @override
  String get bothTokensRequired => 'Cả hai token đều bắt buộc';

  @override
  String get slackSavedRestart =>
      'Slack đã lưu — khởi động lại cổng để kết nối';

  @override
  String get slackConfiguration => 'Cấu hình Slack';

  @override
  String get setupTitle => 'Thiết lập';

  @override
  String get slackSetupInstructions =>
      '1. Tạo ứng dụng Slack tại api.slack.com/apps\n2. Bật Socket Mode → tạo App-Level Token (xapp-…)\n   với phạm vi: connections:write\n3. Thêm Bot Token Scopes: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Cài đặt ứng dụng vào không gian làm việc → sao chép Bot Token (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'URL API và số điện thoại là bắt buộc';

  @override
  String get signalSavedRestart =>
      'Signal đã lưu — khởi động lại cổng để kết nối';

  @override
  String get signalConfiguration => 'Cấu hình Signal';

  @override
  String get requirementsTitle => 'Yêu cầu';

  @override
  String get signalRequirements =>
      'Yêu cầu signal-cli-rest-api đang chạy trên máy chủ:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nĐăng ký/liên kết số Signal của bạn qua REST API, sau đó nhập URL và số điện thoại bên dưới.';

  @override
  String get signalApiUrl => 'URL signal-cli-rest-api';

  @override
  String get signalPhoneNumber => 'Số điện thoại Signal của bạn';

  @override
  String get userIdLabel => 'ID Người dùng';

  @override
  String get enterDiscordUserId => 'Nhập ID người dùng Discord';

  @override
  String get enterTelegramUserId => 'Nhập ID người dùng Telegram';

  @override
  String get fromDiscordDevPortal => 'Từ Discord Developer Portal';

  @override
  String get allowedUserIdsTitle => 'ID Người dùng được phép';

  @override
  String get approvedDevice => 'Thiết bị đã phê duyệt';

  @override
  String get allowedUser => 'Người dùng được phép';

  @override
  String get howToGetBotToken => 'Cách lấy token bot của bạn';

  @override
  String get discordTokenInstructions =>
      '1. Truy cập Discord Developer Portal\n2. Tạo ứng dụng và bot mới\n3. Sao chép token và dán ở trên\n4. Bật Message Content Intent';

  @override
  String get telegramTokenInstructions =>
      '1. Mở Telegram và tìm kiếm @BotFather\n2. Gửi /newbot và làm theo hướng dẫn\n3. Sao chép token và dán ở trên';

  @override
  String get fromBotFatherHint => 'Lấy từ @BotFather';

  @override
  String get accessTokenLabel => 'Token truy cập';

  @override
  String get notSetOpenAccess => 'Chưa đặt — truy cập mở (chỉ loopback)';

  @override
  String get gatewayAccessToken => 'Token truy cập cổng';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth => 'Để trống để tắt xác thực';

  @override
  String get toolPolicies => 'Chính sách Công cụ';

  @override
  String get toolPoliciesDesc =>
      'Kiểm soát những gì tác nhân có thể truy cập. Công cụ bị tắt sẽ bị ẩn khỏi AI và bị chặn khi chạy.';

  @override
  String get privacySensors => 'Quyền riêng tư và Cảm biến';

  @override
  String get networkCategory => 'Mạng';

  @override
  String get systemCategory => 'Hệ thống';

  @override
  String get toolTakePhotos => 'Chụp Ảnh';

  @override
  String get toolTakePhotosDesc => 'Cho phép tác nhân chụp ảnh bằng máy ảnh';

  @override
  String get toolRecordVideo => 'Quay Video';

  @override
  String get toolRecordVideoDesc => 'Cho phép tác nhân quay video';

  @override
  String get toolLocation => 'Vị trí';

  @override
  String get toolLocationDesc =>
      'Cho phép tác nhân đọc vị trí GPS hiện tại của bạn';

  @override
  String get toolHealthData => 'Dữ liệu Sức khỏe';

  @override
  String get toolHealthDataDesc =>
      'Cho phép tác nhân đọc dữ liệu sức khỏe/thể dục';

  @override
  String get toolContacts => 'Danh bạ';

  @override
  String get toolContactsDesc => 'Cho phép tác nhân tìm kiếm danh bạ của bạn';

  @override
  String get toolScreenshots => 'Ảnh chụp màn hình';

  @override
  String get toolScreenshotsDesc => 'Cho phép tác nhân chụp ảnh màn hình';

  @override
  String get toolWebFetch => 'Tải Web';

  @override
  String get toolWebFetchDesc => 'Cho phép tác nhân tải nội dung từ URL';

  @override
  String get toolWebSearch => 'Tìm kiếm Web';

  @override
  String get toolWebSearchDesc => 'Cho phép tác nhân tìm kiếm trên web';

  @override
  String get toolHttpRequests => 'Yêu cầu HTTP';

  @override
  String get toolHttpRequestsDesc =>
      'Cho phép tác nhân thực hiện các yêu cầu HTTP tùy ý';

  @override
  String get toolSandboxShell => 'Shell Sandbox';

  @override
  String get toolSandboxShellDesc =>
      'Cho phép tác nhân chạy lệnh shell trong sandbox';

  @override
  String get toolImageGeneration => 'Tạo Hình ảnh';

  @override
  String get toolImageGenerationDesc => 'Cho phép tác nhân tạo hình ảnh qua AI';

  @override
  String get toolLaunchApps => 'Mở Ứng dụng';

  @override
  String get toolLaunchAppsDesc =>
      'Cho phép tác nhân mở các ứng dụng đã cài đặt';

  @override
  String get toolLaunchIntents => 'Khởi chạy Intent';

  @override
  String get toolLaunchIntentsDesc =>
      'Cho phép tác nhân kích hoạt Android intent (liên kết sâu, màn hình hệ thống)';

  @override
  String get renameSession => 'Đổi tên phiên';

  @override
  String get myConversationName => 'Tên cuộc trò chuyện của tôi';

  @override
  String get renameAction => 'Đổi tên';

  @override
  String get couldNotTranscribeAudio => 'Không thể phiên âm âm thanh';

  @override
  String get stopRecording => 'Dừng ghi âm';

  @override
  String get voiceInput => 'Nhập giọng nói';

  @override
  String get speakMessage => 'Đọc to';

  @override
  String get stopSpeaking => 'Dừng đọc';

  @override
  String get selectText => 'Chọn văn bản';

  @override
  String get messageCopied => 'Đã sao chép tin nhắn';

  @override
  String get copyTooltip => 'Sao chép';

  @override
  String get commandsTooltip => 'Lệnh';

  @override
  String get providersAndModels => 'Nhà cung cấp và Mô hình';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mô hình đã cấu hình',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Tự động khởi động đã bật';

  @override
  String get autoStartOffLabel => 'Tự động khởi động đã tắt';

  @override
  String get allToolsEnabled => 'Tất cả công cụ đã được bật';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count công cụ đã tắt',
    );
    return '$_temp0';
  }

  @override
  String appVersionSubtitle(
    String appName,
    String version,
    String buildNumber,
  ) {
    return '$appName v$version ($buildNumber)';
  }

  @override
  String get officialWebsite => 'Trang web chính thức';

  @override
  String get noPendingPairingRequests => 'Không có yêu cầu ghép nối đang chờ';

  @override
  String get pairingRequestsTitle => 'Yêu cầu Ghép nối';

  @override
  String get gatewayStartingStatus => 'Đang khởi động cổng...';

  @override
  String get gatewayRetryingStatus => 'Đang thử lại khởi động cổng...';

  @override
  String get errorStartingGateway => 'Lỗi khi khởi động cổng';

  @override
  String get runningStatus => 'Đang chạy';

  @override
  String get stoppedStatus => 'Đã dừng';

  @override
  String get notSetUpStatus => 'Chưa thiết lập';

  @override
  String get configuredStatus => 'Đã cấu hình';

  @override
  String get whatsAppConfigSaved => 'Cấu hình WhatsApp đã được lưu';

  @override
  String get whatsAppDisconnected => 'WhatsApp đã ngắt kết nối';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Đang áp dụng...';

  @override
  String get reconnectWhatsApp => 'Kết nối lại WhatsApp';

  @override
  String get saveSettingsLabel => 'Lưu Cài đặt';

  @override
  String get applySettingsRestart => 'Áp dụng Cài đặt và Khởi động lại';

  @override
  String get whatsAppMode => 'Chế độ WhatsApp';

  @override
  String get myPersonalNumber => 'Số cá nhân của tôi';

  @override
  String get myPersonalNumberDesc =>
      'Tin nhắn bạn gửi đến cuộc trò chuyện WhatsApp của riêng bạn sẽ đánh thức tác nhân.';

  @override
  String get dedicatedBotAccount => 'Tài khoản bot chuyên dụng';

  @override
  String get dedicatedBotAccountDesc =>
      'Tin nhắn được gửi từ chính tài khoản được liên kết sẽ bị bỏ qua như tin nhắn đi.';

  @override
  String get allowedNumbers => 'Số được phép';

  @override
  String get addNumberTitle => 'Thêm Số';

  @override
  String get phoneNumberJid => 'Số điện thoại / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'Chưa có số nào được phép được cấu hình';

  @override
  String get devicesAppearAfterPairing =>
      'Thiết bị xuất hiện ở đây sau khi bạn phê duyệt yêu cầu ghép nối';

  @override
  String get addPhoneNumbersHint =>
      'Thêm số điện thoại để cho phép họ sử dụng bot';

  @override
  String get allowedNumber => 'Số được phép';

  @override
  String get howToConnect => 'Cách kết nối';

  @override
  String get whatsAppConnectInstructions =>
      '1. Nhấn \"Kết nối WhatsApp\" ở trên\n2. Một mã QR sẽ xuất hiện — quét nó bằng WhatsApp\n   (Cài đặt → Thiết bị được liên kết → Liên kết Thiết bị)\n3. Sau khi kết nối, tin nhắn đến sẽ được định tuyến\n   đến tác nhân AI đang hoạt động của bạn tự động';

  @override
  String get whatsAppPairingDesc =>
      'Người gửi mới nhận được mã ghép nối. Bạn phê duyệt họ.';

  @override
  String get whatsAppAllowlistDesc =>
      'Chỉ những số điện thoại cụ thể mới có thể nhắn tin cho bot.';

  @override
  String get whatsAppOpenDesc =>
      'Bất kỳ ai nhắn tin cho bạn đều có thể sử dụng bot.';

  @override
  String get whatsAppDisabledDesc =>
      'Bot sẽ không phản hồi bất kỳ tin nhắn đến nào.';

  @override
  String get sessionExpiredRelink =>
      'Phiên đã hết hạn. Nhấn \"Kết nối lại\" bên dưới để quét mã QR mới.';

  @override
  String get connectWhatsAppBelow =>
      'Nhấn \"Kết nối WhatsApp\" bên dưới để liên kết tài khoản của bạn.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp đã chấp nhận mã QR. Đang hoàn tất liên kết...';

  @override
  String get waitingForWhatsApp => 'Đang chờ WhatsApp hoàn tất liên kết...';

  @override
  String get focusedLabel => 'Tập trung';

  @override
  String get balancedLabel => 'Cân bằng';

  @override
  String get creativeLabel => 'Sáng tạo';

  @override
  String get preciseLabel => 'Chính xác';

  @override
  String get expressiveLabel => 'Biểu cảm';

  @override
  String get browseLabel => 'Duyệt';

  @override
  String get apiTokenLabel => 'Token API';

  @override
  String get connectToClawHub => 'Kết nối với ClawHub';

  @override
  String get clawHubLoginHint =>
      'Đăng nhập vào ClawHub để truy cập các kỹ năng cao cấp và cài đặt gói';

  @override
  String get howToGetApiToken => 'Cách lấy token API của bạn:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. Truy cập clawhub.ai và đăng nhập bằng GitHub\n2. Chạy \"clawhub login\" trong terminal\n3. Sao chép token của bạn và dán ở đây';

  @override
  String connectionFailed(String error) {
    return 'Kết nối thất bại: $error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count lần chạy';
  }

  @override
  String nextRunLabel(String time) {
    return 'Lần chạy tiếp theo: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Lỗi gần nhất: $error';
  }

  @override
  String get cronJobHintText =>
      'Hướng dẫn cho tác nhân khi công việc này được kích hoạt…';

  @override
  String get androidPermissions => 'Quyền Android';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw có thể điều khiển màn hình thay bạn — nhấn nút, điền biểu mẫu, cuộn và tự động hóa các tác vụ lặp đi lặp lại trên bất kỳ ứng dụng nào.';

  @override
  String get twoPermissionsNeeded =>
      'Cần hai quyền để có trải nghiệm đầy đủ. Bạn có thể bỏ qua và bật sau trong Cài đặt.';

  @override
  String get accessibilityService => 'Dịch vụ Hỗ trợ tiếp cận';

  @override
  String get accessibilityServiceDesc =>
      'Cho phép nhấn, vuốt, nhập và đọc nội dung màn hình';

  @override
  String get displayOverOtherApps => 'Hiển thị Trên Ứng dụng Khác';

  @override
  String get displayOverOtherAppsDesc =>
      'Hiển thị chip trạng thái nổi để bạn có thể thấy tác nhân đang làm gì';

  @override
  String get changeDefaultModel => 'Thay đổi mô hình mặc định';

  @override
  String setModelAsDefault(String name) {
    return 'Đặt $name làm mô hình mặc định.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return 'Cũng cập nhật $count tác nhân$_temp0';
  }

  @override
  String get startNewSessions => 'Bắt đầu phiên mới';

  @override
  String get currentConversationsArchived =>
      'Các cuộc trò chuyện hiện tại sẽ được lưu trữ';

  @override
  String get applyAction => 'Áp dụng';

  @override
  String applyModelQuestion(String name) {
    return 'Áp dụng $name?';
  }

  @override
  String get setAsDefaultModel => 'Đặt làm mô hình mặc định';

  @override
  String get usedByAgentsWithout =>
      'Được sử dụng bởi các tác nhân không có mô hình cụ thể';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return 'Áp dụng cho $count tác nhân$_temp0';
  }

  @override
  String get providerAlreadyAuth =>
      'Nhà cung cấp đã được xác thực — không cần khóa API.';

  @override
  String get selectFromList => 'Chọn từ danh sách';

  @override
  String get enterCustomModelId => 'Nhập ID mô hình tùy chỉnh';

  @override
  String get removeSkillTitle => 'Xóa kỹ năng?';

  @override
  String get browseClawHubToDiscover =>
      'Duyệt ClawHub để khám phá và cài đặt kỹ năng';

  @override
  String get addDeviceTooltip => 'Thêm thiết bị';

  @override
  String get addNumberTooltip => 'Thêm số';

  @override
  String get searchSkillsHint => 'Tìm kiếm kỹ năng...';

  @override
  String get loginToClawHub => 'Đăng nhập vào ClawHub';

  @override
  String get accountTooltip => 'Tài khoản';

  @override
  String get editAction => 'Sửa';

  @override
  String get setAsDefaultAction => 'Đặt làm mặc định';

  @override
  String get chooseProviderTitle => 'Chọn nhà cung cấp';

  @override
  String get apiKeyTitle => 'Khóa API';

  @override
  String get slackConfigSaved => 'Slack đã lưu — khởi động lại cổng để kết nối';

  @override
  String get signalConfigSaved =>
      'Signal đã lưu — khởi động lại cổng để kết nối';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Thêm thiết bị';

  @override
  String get skipAction => 'Bỏ qua';

  @override
  String get mcpServers => 'Máy chủ MCP';

  @override
  String get noMcpServersConfigured => 'Chưa có máy chủ MCP nào được cấu hình';

  @override
  String get mcpServersEmptyHint =>
      'Thêm máy chủ MCP để cho phép trợ lý truy cập các công cụ từ GitHub, Notion, Slack, cơ sở dữ liệu và nhiều hơn nữa.';

  @override
  String get addMcpServer => 'Thêm máy chủ MCP';

  @override
  String get editMcpServer => 'Chỉnh sửa máy chủ MCP';

  @override
  String get removeMcpServer => 'Xóa máy chủ MCP';

  @override
  String removeMcpServerConfirm(String name) {
    return 'Xóa \"$name\"? Các công cụ của nó sẽ không còn khả dụng.';
  }

  @override
  String get mcpTransport => 'Giao thức';

  @override
  String get testConnection => 'Kiểm tra kết nối';

  @override
  String get mcpServerNameLabel => 'Tên máy chủ';

  @override
  String get mcpServerNameHint => 'vd. GitHub, Notion, CSDL của tôi';

  @override
  String get mcpServerUrlLabel => 'URL máy chủ';

  @override
  String get mcpBearerTokenLabel => 'Bearer Token (tùy chọn)';

  @override
  String get mcpBearerTokenHint => 'Để trống nếu không cần xác thực';

  @override
  String get mcpCommandLabel => 'Lệnh';

  @override
  String get mcpArgumentsLabel => 'Tham số (cách nhau bằng dấu cách)';

  @override
  String get mcpEnvVarsLabel =>
      'Biến môi trường (KHÓA=GIÁ_TRỊ, mỗi dòng một cái)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio không khả dụng trên iOS. Sử dụng HTTP hoặc SSE.';

  @override
  String get connectedStatus => 'Đã kết nối';

  @override
  String get mcpConnecting => 'Đang kết nối...';

  @override
  String get mcpConnectionError => 'Lỗi kết nối';

  @override
  String get mcpDisconnected => 'Đã ngắt kết nối';

  @override
  String mcpToolsCount(int count) {
    return '$count công cụ';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'OK — Phát hiện $count công cụ';
  }

  @override
  String get mcpTestOkNoTools => 'OK — Đã kết nối (0 công cụ)';

  @override
  String get mcpTestFailed => 'Kết nối thất bại. Kiểm tra URL/token máy chủ.';

  @override
  String get mcpAddServer => 'Thêm máy chủ';

  @override
  String get mcpSaveChanges => 'Lưu thay đổi';

  @override
  String get urlIsRequired => 'URL là bắt buộc';

  @override
  String get enterValidUrl => 'Nhập URL hợp lệ';

  @override
  String get commandIsRequired => 'Lệnh là bắt buộc';

  @override
  String skillRemoved(String name) {
    return 'Đã xóa kỹ năng \"$name\"';
  }

  @override
  String get editFileContentHint => 'Chỉnh sửa nội dung tệp...';

  @override
  String get whatsAppPairSubtitle =>
      'Ghép nối tài khoản WhatsApp cá nhân bằng mã QR';

  @override
  String get whatsAppPairingOptional =>
      'Ghép nối là tùy chọn. Bạn có thể hoàn tất thiết lập ngay bây giờ và kết nối sau.';

  @override
  String get whatsAppEnableToLink =>
      'Bật WhatsApp để bắt đầu liên kết thiết bị này.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp đã được liên kết. FlutterClaw có thể phản hồi sau khi hoàn tất thiết lập.';

  @override
  String get cancelLink => 'Hủy liên kết';
}
