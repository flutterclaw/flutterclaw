// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Sohbet';

  @override
  String get channels => 'Kanallar';

  @override
  String get agent => 'Ajan';

  @override
  String get settings => 'Ayarlar';

  @override
  String get getStarted => 'Başla';

  @override
  String get yourPersonalAssistant => 'Kişisel AI asistanınız';

  @override
  String get multiChannelChat => 'Çok kanallı sohbet';

  @override
  String get multiChannelChatDesc =>
      'Telegram, Discord, WebChat ve daha fazlası';

  @override
  String get powerfulAIModels => 'Güçlü AI modelleri';

  @override
  String get powerfulAIModelsDesc =>
      'OpenAI, Anthropic, Grok ve ücretsiz modeller';

  @override
  String get localGateway => 'Yerel ağ geçidi';

  @override
  String get localGatewayDesc => 'Cihazınızda çalışır, verileriniz sizin kalır';

  @override
  String get chooseProvider => 'Sağlayıcı Seç';

  @override
  String get selectProviderDesc =>
      'AI modellerine nasıl bağlanmak istediğinizi seçin.';

  @override
  String get startForFree => 'Ücretsiz Başla';

  @override
  String get freeProvidersDesc =>
      'Bu sağlayıcılar ücretsiz modeller sunarak başlamanızı sağlar.';

  @override
  String get free => 'ÜCRETSİZ';

  @override
  String get otherProviders => 'Diğer Sağlayıcılar';

  @override
  String connectToProvider(String provider) {
    return '$provider\'a bağlan';
  }

  @override
  String get enterApiKeyDesc => 'API anahtarınızı girin ve bir model seçin.';

  @override
  String get dontHaveApiKey => 'API anahtarınız yok mu?';

  @override
  String get createAccountCopyKey =>
      'Bir hesap oluşturun ve anahtarınızı kopyalayın.';

  @override
  String get signUp => 'Kayıt Ol';

  @override
  String get apiKey => 'API Anahtarı';

  @override
  String get pasteFromClipboard => 'Panodan yapıştır';

  @override
  String get apiBaseUrl => 'API Temel URL';

  @override
  String get selectModel => 'Model Seç';

  @override
  String get modelId => 'Model ID';

  @override
  String get validateKey => 'Anahtarı Doğrula';

  @override
  String get validating => 'Doğrulanıyor...';

  @override
  String get invalidApiKey => 'Geçersiz API anahtarı';

  @override
  String get gatewayConfiguration => 'Ağ Geçidi Yapılandırması';

  @override
  String get gatewayConfigDesc =>
      'Ağ geçidi, asistanınız için yerel kontrol düzlemidir.';

  @override
  String get defaultSettingsNote =>
      'Varsayılan ayarlar çoğu kullanıcı için çalışır. Yalnızca neye ihtiyacınız olduğunu biliyorsanız değiştirin.';

  @override
  String get host => 'Ana Bilgisayar';

  @override
  String get port => 'Port';

  @override
  String get autoStartGateway => 'Ağ geçidini otomatik başlat';

  @override
  String get autoStartGatewayDesc =>
      'Uygulama başlatıldığında ağ geçidini otomatik olarak başlat.';

  @override
  String get channelsPageTitle => 'Kanallar';

  @override
  String get channelsPageDesc =>
      'İsteğe bağlı olarak mesajlaşma kanallarını bağlayın. Bunları daha sonra Ayarlar\'da her zaman yapılandırabilirsiniz.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Bir Telegram botu bağlayın.';

  @override
  String get openBotFather => 'BotFather\'ı Aç';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Bir Discord botu bağlayın.';

  @override
  String get developerPortal => 'Geliştirici Portalı';

  @override
  String get botToken => 'Bot Tokeni';

  @override
  String telegramBotToken(String platform) {
    return '$platform Bot Tokeni';
  }

  @override
  String get readyToGo => 'Başlamaya Hazır';

  @override
  String get reviewConfiguration =>
      'Yapılandırmanızı gözden geçirin ve FlutterClaw\'ı başlatın.';

  @override
  String get model => 'Model';

  @override
  String viaProvider(String provider) {
    return '$provider üzerinden';
  }

  @override
  String get gateway => 'Ağ Geçidi';

  @override
  String get webChatOnly =>
      'Yalnızca WebChat (daha sonra daha fazla ekleyebilirsiniz)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Başlatılıyor...';

  @override
  String get startFlutterClaw => 'FlutterClaw\'ı Başlat';

  @override
  String get newSession => 'Yeni oturum';

  @override
  String get photoLibrary => 'Fotoğraf Kitaplığı';

  @override
  String get camera => 'Kamera';

  @override
  String get whatDoYouSeeInImage => 'Bu resimde ne görüyorsunuz?';

  @override
  String get imagePickerNotAvailable =>
      'Simülatörde resim seçici kullanılamıyor. Gerçek bir cihaz kullanın.';

  @override
  String get couldNotOpenImagePicker => 'Resim seçici açılamadı.';

  @override
  String get copiedToClipboard => 'Panoya kopyalandı';

  @override
  String get attachImage => 'Resim ekle';

  @override
  String get messageFlutterClaw => 'FlutterClaw\'a mesaj...';

  @override
  String get channelsAndGateway => 'Kanallar ve Ağ Geçidi';

  @override
  String get stop => 'Durdur';

  @override
  String get start => 'Başlat';

  @override
  String status(String status) {
    return 'Durum: $status';
  }

  @override
  String get builtInChatInterface => 'Yerleşik sohbet arayüzü';

  @override
  String get notConfigured => 'Yapılandırılmamış';

  @override
  String get connected => 'Bağlı';

  @override
  String get configuredStarting => 'Yapılandırıldı (başlatılıyor...)';

  @override
  String get telegramConfiguration => 'Telegram Yapılandırması';

  @override
  String get fromBotFather => '@BotFather\'dan';

  @override
  String get allowedUserIds =>
      'İzin Verilen Kullanıcı ID\'leri (virgülle ayrılmış)';

  @override
  String get leaveEmptyToAllowAll => 'Herkese izin vermek için boş bırakın';

  @override
  String get cancel => 'İptal';

  @override
  String get saveAndConnect => 'Kaydet ve Bağlan';

  @override
  String get discordConfiguration => 'Discord Yapılandırması';

  @override
  String get pendingPairingRequests => 'Bekleyen Eşleştirme İstekleri';

  @override
  String get approve => 'Onayla';

  @override
  String get reject => 'Reddet';

  @override
  String get expired => 'Süresi Doldu';

  @override
  String minutesLeft(int minutes) {
    return '${minutes}dk kaldı';
  }

  @override
  String get workspaceFiles => 'Çalışma Alanı Dosyaları';

  @override
  String get personalAIAssistant => 'Kişisel AI Asistanı';

  @override
  String sessionsCount(int count) {
    return 'Oturumlar ($count)';
  }

  @override
  String get noActiveSessions => 'Aktif oturum yok';

  @override
  String get startConversationToCreate => 'Oluşturmak için bir sohbet başlatın';

  @override
  String get startConversationToSee =>
      'Oturumları görmek için bir sohbet başlatın';

  @override
  String get reset => 'Sıfırla';

  @override
  String get cronJobs => 'Zamanlanmış Görevler';

  @override
  String get noCronJobs => 'Zamanlanmış görev yok';

  @override
  String get addScheduledTasks => 'Ajanınız için zamanlanmış görevler ekleyin';

  @override
  String get runNow => 'Şimdi Çalıştır';

  @override
  String get enable => 'Etkinleştir';

  @override
  String get disable => 'Devre Dışı Bırak';

  @override
  String get delete => 'Sil';

  @override
  String get skills => 'Beceriler';

  @override
  String get browseClawHub => 'ClawHub\'a Göz At';

  @override
  String get noSkillsInstalled => 'Yüklü beceri yok';

  @override
  String get browseClawHubToAdd => 'Beceri eklemek için ClawHub\'a göz atın';

  @override
  String removeSkillConfirm(String name) {
    return '\"$name\" becerilerinizden kaldırılsın mı?';
  }

  @override
  String get clawHubSkills => 'ClawHub Becerileri';

  @override
  String get searchSkills => 'Becerileri ara...';

  @override
  String get noSkillsFound => 'Beceri bulunamadı. Farklı bir arama deneyin.';

  @override
  String installedSkill(String name) {
    return '$name yüklendi';
  }

  @override
  String failedToInstallSkill(String name) {
    return '$name yüklenemedi';
  }

  @override
  String get addCronJob => 'Zamanlanmış Görev Ekle';

  @override
  String get jobName => 'Görev Adı';

  @override
  String get dailySummaryExample => 'ör. Günlük Özet';

  @override
  String get taskPrompt => 'Görev İstemi';

  @override
  String get whatShouldAgentDo => 'Ajan ne yapmalı?';

  @override
  String get interval => 'Aralık';

  @override
  String get every5Minutes => 'Her 5 dakika';

  @override
  String get every15Minutes => 'Her 15 dakika';

  @override
  String get every30Minutes => 'Her 30 dakika';

  @override
  String get everyHour => 'Her saat';

  @override
  String get every6Hours => 'Her 6 saat';

  @override
  String get every12Hours => 'Her 12 saat';

  @override
  String get every24Hours => 'Her 24 saat';

  @override
  String get add => 'Ekle';

  @override
  String get save => 'Kaydet';

  @override
  String get sessions => 'Oturumlar';

  @override
  String messagesCount(int count) {
    return '$count mesaj';
  }

  @override
  String tokensCount(int count) {
    return '$count token';
  }

  @override
  String get compact => 'Sıkıştır';

  @override
  String get models => 'Modeller';

  @override
  String get noModelsConfigured => 'Yapılandırılmış model yok';

  @override
  String get addModelToStartChatting =>
      'Sohbete başlamak için bir model ekleyin';

  @override
  String get addModel => 'Model Ekle';

  @override
  String get default_ => 'VARSAYILAN';

  @override
  String get autoStart => 'Otomatik başlatma';

  @override
  String get startGatewayWhenLaunches =>
      'Uygulama başladığında ağ geçidini başlat';

  @override
  String get heartbeat => 'Kalp Atışı';

  @override
  String get enabled => 'Etkin';

  @override
  String get periodicAgentTasks => 'HEARTBEAT.md\'den periyodik ajan görevleri';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes dk';
  }

  @override
  String get about => 'Hakkında';

  @override
  String get personalAIAssistantForIOS =>
      'iOS ve Android için Kişisel AI Asistanı';

  @override
  String get version => 'Sürüm';

  @override
  String get basedOnOpenClaw => 'OpenClaw tabanlı';

  @override
  String get removeModel => 'Model kaldırılsın mı?';

  @override
  String removeModelConfirm(String name) {
    return '\"$name\" modellerinizden kaldırılsın mı?';
  }

  @override
  String get remove => 'Kaldır';

  @override
  String get setAsDefault => 'Varsayılan Olarak Ayarla';

  @override
  String get paste => 'Yapıştır';

  @override
  String get chooseProviderStep => '1. Sağlayıcı Seç';

  @override
  String get selectModelStep => '2. Model Seç';

  @override
  String get apiKeyStep => '3. API Anahtarı';

  @override
  String getApiKeyAt(String provider) {
    return '$provider adresinden API anahtarı alın';
  }

  @override
  String get justNow => 'şimdi';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}dk önce';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}sa önce';
  }

  @override
  String daysAgo(int days) {
    return '${days}g önce';
  }

  @override
  String get microphonePermissionDenied => 'Mikrofon izni reddedildi';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Canlı transkript kullanılamıyor: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Kayıt başlatılamadı: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Cihaz üzerinde transkript kullanılıyor';

  @override
  String get transcribingWithWhisper =>
      'Whisper API ile transkript yapılıyor...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API başarısız: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Transkript yakalanmadı';

  @override
  String failedToStopRecording(String error) {
    return 'Kayıt durdurulamadı: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return '$action başarısız: $error';
  }

  @override
  String get pause => 'Duraklat';

  @override
  String get resume => 'Devam Et';

  @override
  String get send => 'Gönder';

  @override
  String get liveActivityActive => 'Canlı Etkinlik aktif';

  @override
  String get restartGateway => 'Gateway\'i Yeniden Başlat';

  @override
  String modelLabel(String model) {
    return 'Model: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Çalışma süresi: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Arka plan desteği etkin - gateway yanıt vermeye devam edebilir';

  @override
  String get webChatBuiltIn => 'Yerleşik sohbet arayüzü';

  @override
  String get configure => 'Yapılandır';

  @override
  String get disconnect => 'Bağlantıyı Kes';

  @override
  String get agents => 'Ajanlar';

  @override
  String get agentFiles => 'Ajan Dosyaları';

  @override
  String get createAgent => 'Ajan Oluştur';

  @override
  String get editAgent => 'Ajanı Düzenle';

  @override
  String get noAgentsYet => 'Henüz ajan yok';

  @override
  String get createYourFirstAgent => 'İlk ajanınızı oluşturun!';

  @override
  String get active => 'Aktif';

  @override
  String get agentName => 'Ajan Adı';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Emoji Seç';

  @override
  String get vibe => 'Tarz';

  @override
  String get vibeHint => 'ör. arkadaşça, resmi, alaycı';

  @override
  String get modelConfiguration => 'Model Yapılandırması';

  @override
  String get advancedSettings => 'Gelişmiş Ayarlar';

  @override
  String get agentCreated => 'Ajan oluşturuldu';

  @override
  String get agentUpdated => 'Ajan güncellendi';

  @override
  String get agentDeleted => 'Ajan silindi';

  @override
  String switchedToAgent(String name) {
    return '$name ajanına geçildi';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '$name silinsin mi? Tüm çalışma alanı verileri kaldırılacak.';
  }

  @override
  String get agentDetails => 'Ajan Ayrıntıları';

  @override
  String get createdAt => 'Oluşturulma';

  @override
  String get lastUsed => 'Son Kullanım';

  @override
  String get basicInformation => 'Temel Bilgiler';

  @override
  String get switchToAgent => 'Ajan Değiştir';

  @override
  String get providers => 'Sağlayıcılar';

  @override
  String get addProvider => 'Sağlayıcı ekle';

  @override
  String get noProvidersConfigured => 'Yapılandırılmış sağlayıcı yok.';

  @override
  String get editCredentials => 'Kimlik bilgilerini düzenle';

  @override
  String get defaultModelHint =>
      'Varsayılan model, kendi modelini belirtmeyen ajanlar tarafından kullanılır.';

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
  String get firstHatchModeChoiceTitle => 'Nasıl başlamak istersiniz?';

  @override
  String get firstHatchModeChoiceBody =>
      'Asistanınızla yazılı sohbet edebilir veya kısa bir arama gibi sesli konuşmaya başlayabilirsiniz. Size en kolay geleni seçin.';

  @override
  String get firstHatchModeChoiceChatButton => 'Sohbette yaz';

  @override
  String get firstHatchModeChoiceVoiceButton => 'Sesle konuş';

  @override
  String get liveVoiceBargeInHint =>
      'Speak after the assistant stops (echo was interrupting them mid-speech).';

  @override
  String get cannotAddLiveModelAsChat =>
      'This model is for voice calls only. Choose a chat model from the list.';

  @override
  String get holdToSetAsDefault =>
      'Varsayılan olarak ayarlamak için basılı tutun';

  @override
  String get integrations => 'Entegrasyonlar';

  @override
  String get shortcutsIntegrations => 'Shortcuts Entegrasyonları';

  @override
  String get shortcutsIntegrationsDesc =>
      'Üçüncü taraf uygulama eylemlerini çalıştırmak için iOS Shortcuts yükleyin';

  @override
  String get dangerZone => 'Tehlikeli bölge';

  @override
  String get resetOnboarding => 'Kurulumu sıfırla ve yeniden çalıştır';

  @override
  String get resetOnboardingDesc =>
      'Tüm yapılandırmayı siler ve kurulum sihirbazına döner.';

  @override
  String get resetAllConfiguration => 'Tüm yapılandırma sıfırlansın mı?';

  @override
  String get resetAllConfigurationDesc =>
      'Bu işlem API anahtarlarınızı, modellerinizi ve tüm ayarlarınızı silecektir. Uygulama kurulum sihirbazına dönecektir.\n\nSohbet geçmişiniz silinmez.';

  @override
  String get removeProvider => 'Sağlayıcıyı kaldır';

  @override
  String removeProviderConfirm(String provider) {
    return '$provider kimlik bilgileri kaldırılsın mı?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name varsayılan model olarak ayarlandı';
  }

  @override
  String get photoImage => 'Fotoğraf / Görsel';

  @override
  String get documentPdfTxt => 'Belge (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Belge açılamadı: $error';
  }

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get gatewayStopped => 'Ağ geçidi durduruldu';

  @override
  String get gatewayStarted => 'Ağ geçidi başarıyla başlatıldı!';

  @override
  String gatewayFailed(String error) {
    return 'Ağ geçidi başarısız: $error';
  }

  @override
  String exceptionError(String error) {
    return 'İstisna: $error';
  }

  @override
  String get pairingRequestApproved => 'Eşleştirme isteği onaylandı';

  @override
  String get pairingRequestRejected => 'Eşleştirme isteği reddedildi';

  @override
  String get addDevice => 'Cihaz Ekle';

  @override
  String get telegramConfigSaved => 'Telegram yapılandırması kaydedildi';

  @override
  String get discordConfigSaved => 'Discord yapılandırması kaydedildi';

  @override
  String get securityMethod => 'Güvenlik Yöntemi';

  @override
  String get pairingRecommended => 'Eşleştirme (Önerilen)';

  @override
  String get pairingDescription =>
      'Yeni kullanıcılara eşleştirme kodu verilir. Siz onaylar veya reddedersiniz.';

  @override
  String get allowlistTitle => 'İzin Listesi';

  @override
  String get allowlistDescription =>
      'Yalnızca belirli kullanıcı ID\'leri bota erişebilir.';

  @override
  String get openAccess => 'Açık Erişim';

  @override
  String get openAccessDescription =>
      'Herkes botu hemen kullanabilir (önerilmez).';

  @override
  String get disabledAccess => 'Devre Dışı';

  @override
  String get disabledAccessDescription =>
      'DM\'lere izin verilmez. Bot hiçbir mesaja yanıt vermez.';

  @override
  String get approvedDevices => 'Onaylı Cihazlar';

  @override
  String get noApprovedDevicesYet => 'Henüz onaylı cihaz yok';

  @override
  String get devicesAppearAfterApproval =>
      'Eşleştirme isteklerini onayladıktan sonra cihazlar burada görünecektir';

  @override
  String get noAllowedUsersConfigured =>
      'İzin verilen kullanıcı yapılandırılmamış';

  @override
  String get addUserIdsHint =>
      'Botu kullanmalarına izin vermek için kullanıcı ID\'lerini ekleyin';

  @override
  String get removeDevice => 'Cihaz kaldırılsın mı?';

  @override
  String removeAccessFor(String name) {
    return '$name için erişim kaldırılsın mı?';
  }

  @override
  String get saving => 'Kaydediliyor...';

  @override
  String get channelsLabel => 'Kanallar';

  @override
  String get clawHubAccount => 'ClawHub Hesabı';

  @override
  String get loggedInToClawHub =>
      'Şu anda ClawHub\'a giriş yapmış durumdasınız.';

  @override
  String get loggedOutFromClawHub => 'ClawHub\'dan çıkış yapıldı';

  @override
  String get login => 'Giriş Yap';

  @override
  String get logout => 'Çıkış Yap';

  @override
  String get connect => 'Bağlan';

  @override
  String get pasteClawHubToken => 'ClawHub API tokeninizi yapıştırın';

  @override
  String get pleaseEnterApiToken => 'Lütfen bir API tokeni girin';

  @override
  String get successfullyConnected => 'ClawHub\'a başarıyla bağlanıldı';

  @override
  String get browseSkillsButton => 'Becerilere Göz At';

  @override
  String get installSkill => 'Beceri Yükle';

  @override
  String get incompatibleSkill => 'Uyumsuz Beceri';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Bu beceri mobilde (iOS/Android) çalışamaz.\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Uyumluluk Uyarısı';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Bu beceri masaüstü için tasarlanmıştır ve mobilde çalışmayabilir.\n\n$reason\n\nMobil için optimize edilmiş uyarlanmış bir sürüm yüklemek ister misiniz?';
  }

  @override
  String get ok => 'Tamam';

  @override
  String get installOriginal => 'Orijinali Yükle';

  @override
  String get installAdapted => 'Uyarlanmışı Yükle';

  @override
  String get resetSession => 'Oturumu Sıfırla';

  @override
  String resetSessionConfirm(String key) {
    return '\"$key\" oturumu sıfırlansın mı? Tüm mesajlar silinecektir.';
  }

  @override
  String get sessionReset => 'Oturum sıfırlandı';

  @override
  String get activeSessions => 'Aktif Oturumlar';

  @override
  String get scheduledTasks => 'Zamanlanmış Görevler';

  @override
  String get defaultBadge => 'Varsayılan';

  @override
  String errorGeneric(String error) {
    return 'Hata: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName kaydedildi';
  }

  @override
  String errorSavingFile(String error) {
    return 'Dosya kaydetme hatası: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Son ajan silinemez';

  @override
  String get close => 'Kapat';

  @override
  String get nameIsRequired => 'Ad gereklidir';

  @override
  String get pleaseSelectModel => 'Lütfen bir model seçin';

  @override
  String temperatureLabel(String value) {
    return 'Sıcaklık: $value';
  }

  @override
  String get maxTokens => 'Maksimum Token';

  @override
  String get maxTokensRequired => 'Maksimum token gereklidir';

  @override
  String get mustBePositiveNumber => 'Pozitif bir sayı olmalıdır';

  @override
  String get maxToolIterations => 'Maksimum Araç Tekrarı';

  @override
  String get maxIterationsRequired => 'Maksimum tekrar gereklidir';

  @override
  String get restrictToWorkspace => 'Çalışma Alanıyla Sınırla';

  @override
  String get restrictToWorkspaceDesc =>
      'Dosya işlemlerini ajan çalışma alanıyla sınırla';

  @override
  String get noModelsConfiguredLong =>
      'Lütfen ajan oluşturmadan önce Ayarlar\'da en az bir model ekleyin.';

  @override
  String get selectProviderFirst => 'Önce bir sağlayıcı seçin';

  @override
  String get skip => 'Atla';

  @override
  String get continueButton => 'Devam';

  @override
  String get uiAutomation => 'UI Otomasyon';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw sizin adınıza ekranınızı kontrol edebilir — düğmelere dokunma, formları doldurma, kaydırma ve herhangi bir uygulamada tekrarlayan görevleri otomatikleştirme.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Bu, Android Ayarları\'nda Erişilebilirlik Hizmeti\'ni etkinleştirmeyi gerektirir. Bunu atlayabilir ve daha sonra etkinleştirebilirsiniz.';

  @override
  String get openAccessibilitySettings => 'Erişilebilirlik Ayarlarını Aç';

  @override
  String get skipForNow => 'Şimdilik atla';

  @override
  String get checkingPermission => 'İzin kontrol ediliyor…';

  @override
  String get accessibilityEnabled => 'Erişilebilirlik Hizmeti etkin';

  @override
  String get accessibilityNotEnabled => 'Erişilebilirlik Hizmeti etkin değil';

  @override
  String get exploreIntegrations => 'Entegrasyonları Keşfet';

  @override
  String get requestTimedOut => 'İstek zaman aşımına uğradı';

  @override
  String get myShortcuts => 'Kısayollarım';

  @override
  String get addShortcut => 'Kısayol Ekle';

  @override
  String get noShortcutsYet => 'Henüz kısayol yok';

  @override
  String get shortcutsInstructions =>
      'iOS Shortcuts uygulamasında bir kısayol oluşturun, sonuna geri arama eylemini ekleyin, ardından AI\'nin çalıştırabilmesi için buraya kaydedin.';

  @override
  String get shortcutName => 'Kısayol adı';

  @override
  String get shortcutNameHint => 'Shortcuts uygulamasındaki tam ad';

  @override
  String get descriptionOptional => 'Açıklama (isteğe bağlı)';

  @override
  String get whatDoesShortcutDo => 'Bu kısayol ne yapar?';

  @override
  String get callbackSetup => 'Geri arama kurulumu';

  @override
  String get callbackInstructions =>
      'Her kısayol şu şekilde bitmelidir:\n① Get Value for Key → \"callbackUrl\" (Shortcut Input\'tan sözlük olarak ayrıştırılmış)\n② Open URLs ← ①\'in çıktısı';

  @override
  String get channelApp => 'Uygulama';

  @override
  String get channelHeartbeat => 'Kalp Atışı';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Alt Ajan';

  @override
  String get channelSystem => 'Sistem';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}sn önce';
  }

  @override
  String get messagesAbbrev => 'msj';

  @override
  String get modelAlreadyAdded => 'Bu model zaten listenizde';

  @override
  String get bothTokensRequired => 'Her iki token de gereklidir';

  @override
  String get slackSavedRestart =>
      'Slack kaydedildi — bağlanmak için gateway\'i yeniden başlatın';

  @override
  String get slackConfiguration => 'Slack Yapılandırması';

  @override
  String get setupTitle => 'Kurulum';

  @override
  String get slackSetupInstructions =>
      '1. api.slack.com/apps adresinde bir Slack Uygulaması oluşturun\n2. Socket Mode\'u etkinleştirin → App-Level Token (xapp-…) oluşturun\n   kapsam ile: connections:write\n3. Bot Token Kapsamları ekleyin: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. Uygulamayı workspace\'e yükleyin → Bot Token\'ı kopyalayın (xoxb-…)';

  @override
  String get botTokenXoxb => 'Bot Token (xoxb-…)';

  @override
  String get appLevelToken => 'App-Level Token (xapp-…)';

  @override
  String get apiUrlPhoneRequired =>
      'API URL\'si ve telefon numarası gereklidir';

  @override
  String get signalSavedRestart =>
      'Signal kaydedildi — bağlanmak için gateway\'i yeniden başlatın';

  @override
  String get signalConfiguration => 'Signal Yapılandırması';

  @override
  String get requirementsTitle => 'Gereksinimler';

  @override
  String get signalRequirements =>
      'Bir sunucuda signal-cli-rest-api çalıştırmayı gerektirir:\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nREST API aracılığıyla Signal numaranızı kaydedin/bağlayın, ardından aşağıya URL\'yi ve telefon numaranızı girin.';

  @override
  String get signalApiUrl => 'signal-cli-rest-api URL\'si';

  @override
  String get signalPhoneNumber => 'Signal telefon numaranız';

  @override
  String get userIdLabel => 'Kullanıcı ID\'si';

  @override
  String get enterDiscordUserId => 'Discord kullanıcı ID\'sini girin';

  @override
  String get enterTelegramUserId => 'Telegram kullanıcı ID\'sini girin';

  @override
  String get fromDiscordDevPortal => 'Discord Geliştirici Portalından';

  @override
  String get allowedUserIdsTitle => 'İzin Verilen Kullanıcı ID\'leri';

  @override
  String get approvedDevice => 'Onaylı cihaz';

  @override
  String get allowedUser => 'İzin verilen kullanıcı';

  @override
  String get howToGetBotToken => 'Bot tokeninizi nasıl alırsınız';

  @override
  String get discordTokenInstructions =>
      '1. Discord Geliştirici Portalına gidin\n2. Yeni bir uygulama ve bot oluşturun\n3. Tokeni kopyalayın ve yukarı yapıştırın\n4. Message Content Intent\'i etkinleştirin';

  @override
  String get telegramTokenInstructions =>
      '1. Telegram\'ı açın ve @BotFather\'ı arayın\n2. /newbot gönderin ve talimatları izleyin\n3. Tokeni kopyalayın ve yukarı yapıştırın';

  @override
  String get fromBotFatherHint => '@BotFather\'dan alın';

  @override
  String get accessTokenLabel => 'Erişim tokeni';

  @override
  String get notSetOpenAccess =>
      'Ayarlanmadı — açık erişim (yalnızca loopback)';

  @override
  String get gatewayAccessToken => 'Gateway erişim tokeni';

  @override
  String get tokenFieldLabel => 'Token';

  @override
  String get leaveEmptyDisableAuth =>
      'Kimlik doğrulamayı devre dışı bırakmak için boş bırakın';

  @override
  String get toolPolicies => 'Araç Politikaları';

  @override
  String get toolPoliciesDesc =>
      'Ajanın nelere erişebileceğini kontrol edin. Devre dışı bırakılan araçlar AI\'den gizlidir ve çalışma zamanında engellenir.';

  @override
  String get privacySensors => 'Gizlilik ve Sensörler';

  @override
  String get networkCategory => 'Ağ';

  @override
  String get systemCategory => 'Sistem';

  @override
  String get toolTakePhotos => 'Fotoğraf Çek';

  @override
  String get toolTakePhotosDesc =>
      'Ajanın kamera kullanarak fotoğraf çekmesine izin ver';

  @override
  String get toolRecordVideo => 'Video Kaydet';

  @override
  String get toolRecordVideoDesc => 'Ajanın video kaydetmesine izin ver';

  @override
  String get toolLocation => 'Konum';

  @override
  String get toolLocationDesc =>
      'Ajanın mevcut GPS konumunuzu okumasına izin ver';

  @override
  String get toolHealthData => 'Sağlık Verileri';

  @override
  String get toolHealthDataDesc =>
      'Ajanın sağlık/fitness verilerini okumasına izin ver';

  @override
  String get toolContacts => 'Kişiler';

  @override
  String get toolContactsDesc => 'Ajanın kişilerinizi aramasına izin ver';

  @override
  String get toolScreenshots => 'Ekran Görüntüleri';

  @override
  String get toolScreenshotsDesc => 'Ajanın ekran görüntüsü almasına izin ver';

  @override
  String get toolWebFetch => 'Web Getirme';

  @override
  String get toolWebFetchDesc =>
      'Ajanın URL\'lerden içerik getirmesine izin ver';

  @override
  String get toolWebSearch => 'Web Araması';

  @override
  String get toolWebSearchDesc => 'Ajanın web\'de arama yapmasına izin ver';

  @override
  String get toolHttpRequests => 'HTTP İstekleri';

  @override
  String get toolHttpRequestsDesc =>
      'Ajanın rastgele HTTP istekleri yapmasına izin ver';

  @override
  String get toolSandboxShell => 'Sandbox Kabuğu';

  @override
  String get toolSandboxShellDesc =>
      'Ajanın sandbox\'ta kabuk komutları çalıştırmasına izin ver';

  @override
  String get toolImageGeneration => 'Görsel Oluşturma';

  @override
  String get toolImageGenerationDesc =>
      'Ajanın AI ile görsel oluşturmasına izin ver';

  @override
  String get toolLaunchApps => 'Uygulama Başlatma';

  @override
  String get toolLaunchAppsDesc =>
      'Ajanın yüklü uygulamaları açmasına izin ver';

  @override
  String get toolLaunchIntents => 'Intent Başlatma';

  @override
  String get toolLaunchIntentsDesc =>
      'Ajanın Android intent\'leri başlatmasına izin ver (derin bağlantılar, sistem ekranları)';

  @override
  String get renameSession => 'Oturumu yeniden adlandır';

  @override
  String get myConversationName => 'Sohbet adım';

  @override
  String get renameAction => 'Yeniden Adlandır';

  @override
  String get couldNotTranscribeAudio => 'Ses yazıya dökülememedi';

  @override
  String get stopRecording => 'Kaydı durdur';

  @override
  String get voiceInput => 'Sesli giriş';

  @override
  String get speakMessage => 'Sesli oku';

  @override
  String get stopSpeaking => 'Okumayı durdur';

  @override
  String get selectText => 'Metin seç';

  @override
  String get messageCopied => 'Mesaj kopyalandı';

  @override
  String get copyTooltip => 'Kopyala';

  @override
  String get commandsTooltip => 'Komutlar';

  @override
  String get providersAndModels => 'Sağlayıcılar ve Modeller';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count model yapılandırıldı',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => 'Otomatik başlatma etkin';

  @override
  String get autoStartOffLabel => 'Otomatik başlatma kapalı';

  @override
  String get allToolsEnabled => 'Tüm araçlar etkin';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count araç devre dışı',
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
  String get officialWebsite => 'Resmi web sitesi';

  @override
  String get noPendingPairingRequests => 'Bekleyen eşleştirme isteği yok';

  @override
  String get pairingRequestsTitle => 'Eşleştirme İstekleri';

  @override
  String get gatewayStartingStatus => 'Gateway başlatılıyor...';

  @override
  String get gatewayRetryingStatus => 'Gateway başlatma yeniden deneniyor...';

  @override
  String get errorStartingGateway => 'Gateway başlatma hatası';

  @override
  String get runningStatus => 'Çalışıyor';

  @override
  String get stoppedStatus => 'Durduruldu';

  @override
  String get notSetUpStatus => 'Kurulmamış';

  @override
  String get configuredStatus => 'Yapılandırıldı';

  @override
  String get whatsAppConfigSaved => 'WhatsApp yapılandırması kaydedildi';

  @override
  String get whatsAppDisconnected => 'WhatsApp bağlantısı kesildi';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => 'Uygulanıyor...';

  @override
  String get reconnectWhatsApp => 'WhatsApp\'ı Yeniden Bağla';

  @override
  String get saveSettingsLabel => 'Ayarları Kaydet';

  @override
  String get applySettingsRestart => 'Ayarları Uygula ve Yeniden Başlat';

  @override
  String get whatsAppMode => 'WhatsApp Modu';

  @override
  String get myPersonalNumber => 'Kişisel numaram';

  @override
  String get myPersonalNumberDesc =>
      'Kendi WhatsApp sohbetinize gönderdiğiniz mesajlar ajanı uyandırır.';

  @override
  String get dedicatedBotAccount => 'Özel bot hesabı';

  @override
  String get dedicatedBotAccountDesc =>
      'Bağlı hesabın kendisinden gönderilen mesajlar giden olarak yoksayılır.';

  @override
  String get allowedNumbers => 'İzin Verilen Numaralar';

  @override
  String get addNumberTitle => 'Numara Ekle';

  @override
  String get phoneNumberJid => 'Telefon numarası / JID';

  @override
  String get noAllowedNumbersConfigured =>
      'İzin verilen numara yapılandırılmamış';

  @override
  String get devicesAppearAfterPairing =>
      'Eşleştirme isteklerini onayladıktan sonra cihazlar burada görünür';

  @override
  String get addPhoneNumbersHint =>
      'Botu kullanmalarına izin vermek için telefon numaraları ekleyin';

  @override
  String get allowedNumber => 'İzin verilen numara';

  @override
  String get howToConnect => 'Nasıl bağlanılır';

  @override
  String get whatsAppConnectInstructions =>
      '1. Yukarıdaki \"WhatsApp\'ı Bağla\"ya dokunun\n2. Bir QR kod görünecek — WhatsApp ile tarayın\n   (Ayarlar → Bağlı Cihazlar → Cihaz Bağla)\n3. Bağlandıktan sonra gelen mesajlar otomatik olarak\n   aktif AI ajanınıza yönlendirilir';

  @override
  String get whatsAppPairingDesc =>
      'Yeni gönderenler eşleştirme kodu alır. Siz onaylarsınız.';

  @override
  String get whatsAppAllowlistDesc =>
      'Yalnızca belirli telefon numaraları bota mesaj gönderebilir.';

  @override
  String get whatsAppOpenDesc =>
      'Size mesaj gönderen herkes botu kullanabilir.';

  @override
  String get whatsAppDisabledDesc => 'Bot gelen hiçbir mesaja yanıt vermez.';

  @override
  String get sessionExpiredRelink =>
      'Oturum süresi doldu. Yeni bir QR kod taramak için aşağıdaki \"Yeniden Bağlan\"a dokunun.';

  @override
  String get connectWhatsAppBelow =>
      'Hesabınızı bağlamak için aşağıdaki \"WhatsApp\'ı Bağla\"ya dokunun.';

  @override
  String get whatsAppAcceptedQr =>
      'WhatsApp QR\'ı kabul etti. Bağlantı tamamlanıyor...';

  @override
  String get waitingForWhatsApp =>
      'WhatsApp\'ın bağlantıyı tamamlaması bekleniyor...';

  @override
  String get focusedLabel => 'Odaklanmış';

  @override
  String get balancedLabel => 'Dengeli';

  @override
  String get creativeLabel => 'Yaratıcı';

  @override
  String get preciseLabel => 'Kesin';

  @override
  String get expressiveLabel => 'Etkileyici';

  @override
  String get browseLabel => 'Gözat';

  @override
  String get apiTokenLabel => 'API Token';

  @override
  String get connectToClawHub => 'ClawHub\'a Bağlan';

  @override
  String get clawHubLoginHint =>
      'Premium becerilere erişmek ve paketler yüklemek için ClawHub\'a giriş yapın';

  @override
  String get howToGetApiToken => 'API tokeninizi nasıl alırsınız:';

  @override
  String get clawHubApiTokenInstructions =>
      '1. clawhub.ai\'yi ziyaret edin ve GitHub ile giriş yapın\n2. Terminalde \"clawhub login\" çalıştırın\n3. Tokeninizi kopyalayın ve buraya yapıştırın';

  @override
  String connectionFailed(String error) {
    return 'Bağlantı başarısız: $error';
  }

  @override
  String cronJobRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count çalıştırma',
    );
    return '$_temp0';
  }

  @override
  String nextRunLabel(String time) {
    return 'Sonraki çalıştırma: $time';
  }

  @override
  String lastErrorLabel(String error) {
    return 'Son hata: $error';
  }

  @override
  String get cronJobHintText => 'Bu iş tetiklendiğinde ajan için talimatlar…';

  @override
  String get androidPermissions => 'Android İzinleri';

  @override
  String get androidPermissionsDesc =>
      'FlutterClaw sizin adınıza ekranınızı kontrol edebilir — düğmelere dokunma, formları doldurma, kaydırma ve herhangi bir uygulamada tekrarlayan görevleri otomatikleştirme.';

  @override
  String get twoPermissionsNeeded =>
      'Tam deneyim için iki izin gereklidir. Bunu atlayabilir ve daha sonra Ayarlar\'da etkinleştirebilirsiniz.';

  @override
  String get accessibilityService => 'Erişilebilirlik Hizmeti';

  @override
  String get accessibilityServiceDesc =>
      'Dokunmaya, kaydırmaya, yazmaya ve ekran içeriğini okumaya izin verir';

  @override
  String get displayOverOtherApps => 'Diğer Uygulamaların Üzerinde Görüntüle';

  @override
  String get displayOverOtherAppsDesc =>
      'Ajanın ne yaptığını görebilmeniz için kayan bir durum chip\'i gösterir';

  @override
  String get changeDefaultModel => 'Varsayılan modeli değiştir';

  @override
  String setModelAsDefault(String name) {
    return '$name modelini varsayılan model olarak ayarla.';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ajanı',
    );
    return 'Ayrıca $_temp0 güncelle';
  }

  @override
  String get startNewSessions => 'Yeni oturumlar başlat';

  @override
  String get currentConversationsArchived => 'Mevcut konuşmalar arşivlenecek';

  @override
  String get applyAction => 'Uygula';

  @override
  String applyModelQuestion(String name) {
    return '$name uygulansın mı?';
  }

  @override
  String get setAsDefaultModel => 'Varsayılan model olarak ayarla';

  @override
  String get usedByAgentsWithout =>
      'Belirli bir modeli olmayan ajanlar tarafından kullanılır';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ajana',
    );
    return '$_temp0 uygula';
  }

  @override
  String get providerAlreadyAuth =>
      'Sağlayıcı zaten kimlik doğrulandı — API anahtarı gerekmiyor.';

  @override
  String get selectFromList => 'Listeden seç';

  @override
  String get enterCustomModelId => 'Özel model ID\'si gir';

  @override
  String get removeSkillTitle => 'Beceri kaldırılsın mı?';

  @override
  String get browseClawHubToDiscover =>
      'Beceriler keşfetmek ve yüklemek için ClawHub\'a göz atın';

  @override
  String get addDeviceTooltip => 'Cihaz ekle';

  @override
  String get addNumberTooltip => 'Numara ekle';

  @override
  String get searchSkillsHint => 'Becerileri ara...';

  @override
  String get loginToClawHub => 'ClawHub\'a giriş yap';

  @override
  String get accountTooltip => 'Hesap';

  @override
  String get editAction => 'Düzenle';

  @override
  String get setAsDefaultAction => 'Varsayılan olarak ayarla';

  @override
  String get chooseProviderTitle => 'Sağlayıcı seç';

  @override
  String get apiKeyTitle => 'API Anahtarı';

  @override
  String get slackConfigSaved =>
      'Slack kaydedildi — bağlanmak için gateway\'i yeniden başlatın';

  @override
  String get signalConfigSaved =>
      'Signal kaydedildi — bağlanmak için gateway\'i yeniden başlatın';

  @override
  String idPrefix(String id) {
    return 'ID: $id';
  }

  @override
  String get addDeviceHint => 'Cihaz ekle';

  @override
  String get skipAction => 'Atla';

  @override
  String get mcpServers => 'MCP Sunucuları';

  @override
  String get noMcpServersConfigured => 'Yapılandırılmış MCP sunucusu yok';

  @override
  String get mcpServersEmptyHint =>
      'Ajanınıza GitHub, Notion, Slack, veritabanları ve daha fazlasından araçlara erişim sağlamak için MCP sunucuları ekleyin.';

  @override
  String get addMcpServer => 'MCP Sunucusu Ekle';

  @override
  String get editMcpServer => 'MCP Sunucusunu Düzenle';

  @override
  String get removeMcpServer => 'MCP Sunucusunu Kaldır';

  @override
  String removeMcpServerConfirm(String name) {
    return '\"$name\" kaldırılsın mı? Araçları artık kullanılamayacak.';
  }

  @override
  String get mcpTransport => 'Aktarım';

  @override
  String get testConnection => 'Bağlantıyı Test Et';

  @override
  String get mcpServerNameLabel => 'Sunucu adı';

  @override
  String get mcpServerNameHint => 'örn. GitHub, Notion, Veritabanım';

  @override
  String get mcpServerUrlLabel => 'Sunucu URL\'si';

  @override
  String get mcpBearerTokenLabel => 'Bearer Token (isteğe bağlı)';

  @override
  String get mcpBearerTokenHint => 'Kimlik doğrulama gerekmiyorsa boş bırakın';

  @override
  String get mcpCommandLabel => 'Komut';

  @override
  String get mcpArgumentsLabel => 'Argümanlar (boşlukla ayrılmış)';

  @override
  String get mcpEnvVarsLabel =>
      'Ortam değişkenleri (ANAHTAR=DEĞER, her satıra bir tane)';

  @override
  String get mcpStdioNotOnIos =>
      'stdio iOS\'ta kullanılamaz. HTTP veya SSE kullanın.';

  @override
  String get connectedStatus => 'Bağlandı';

  @override
  String get mcpConnecting => 'Bağlanıyor...';

  @override
  String get mcpConnectionError => 'Bağlantı hatası';

  @override
  String get mcpDisconnected => 'Bağlantı kesildi';

  @override
  String mcpToolsCount(int count) {
    return '$count araç';
  }

  @override
  String mcpTestOkTools(int count) {
    return 'Tamam — $count araç bulundu';
  }

  @override
  String get mcpTestOkNoTools => 'Tamam — Bağlandı (0 araç)';

  @override
  String get mcpTestFailed =>
      'Bağlantı başarısız. Sunucu URL/token\'ını kontrol edin.';

  @override
  String get mcpAddServer => 'Sunucu ekle';

  @override
  String get mcpSaveChanges => 'Değişiklikleri kaydet';

  @override
  String get urlIsRequired => 'URL zorunludur';

  @override
  String get enterValidUrl => 'Geçerli bir URL girin';

  @override
  String get commandIsRequired => 'Komut zorunludur';

  @override
  String skillRemoved(String name) {
    return '\"$name\" becerisi kaldırıldı';
  }

  @override
  String get editFileContentHint => 'Dosya içeriğini düzenle...';

  @override
  String get whatsAppPairSubtitle =>
      'Kişisel WhatsApp hesabınızı QR koduyla eşleştirin';

  @override
  String get whatsAppPairingOptional =>
      'Eşleştirme isteğe bağlıdır. Şimdi kurulumu tamamlayıp bağlantıyı daha sonra kurabilirsiniz.';

  @override
  String get whatsAppEnableToLink =>
      'Bu cihazı bağlamaya başlamak için WhatsApp\'ı etkinleştirin.';

  @override
  String get whatsAppLinkedOnboarding =>
      'WhatsApp bağlandı. FlutterClaw kurulum sonrasında yanıt verebilecek.';

  @override
  String get cancelLink => 'Bağlantıyı iptal et';
}
