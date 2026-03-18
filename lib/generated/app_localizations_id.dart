// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'Obrolan';

  @override
  String get channels => 'Saluran';

  @override
  String get agent => 'Agen';

  @override
  String get settings => 'Pengaturan';

  @override
  String get getStarted => 'Mulai';

  @override
  String get yourPersonalAssistant => 'Asisten AI pribadi Anda';

  @override
  String get multiChannelChat => 'Obrolan multi-saluran';

  @override
  String get multiChannelChatDesc => 'Telegram, Discord, WebChat dan lainnya';

  @override
  String get powerfulAIModels => 'Model AI yang kuat';

  @override
  String get powerfulAIModelsDesc => 'OpenAI, Anthropic, Grok dan model gratis';

  @override
  String get localGateway => 'Gateway lokal';

  @override
  String get localGatewayDesc =>
      'Berjalan di perangkat Anda, data Anda tetap milik Anda';

  @override
  String get chooseProvider => 'Pilih Penyedia';

  @override
  String get selectProviderDesc =>
      'Pilih cara Anda ingin terhubung ke model AI.';

  @override
  String get startForFree => 'Mulai Gratis';

  @override
  String get freeProvidersDesc =>
      'Penyedia ini menawarkan model gratis untuk memulai tanpa biaya.';

  @override
  String get free => 'GRATIS';

  @override
  String get otherProviders => 'Penyedia Lain';

  @override
  String connectToProvider(String provider) {
    return 'Hubungkan ke $provider';
  }

  @override
  String get enterApiKeyDesc => 'Masukkan kunci API Anda dan pilih model.';

  @override
  String get dontHaveApiKey => 'Tidak punya kunci API?';

  @override
  String get createAccountCopyKey => 'Buat akun dan salin kunci Anda.';

  @override
  String get signUp => 'Daftar';

  @override
  String get apiKey => 'Kunci API';

  @override
  String get pasteFromClipboard => 'Tempel dari papan klip';

  @override
  String get apiBaseUrl => 'URL Dasar API';

  @override
  String get selectModel => 'Pilih Model';

  @override
  String get modelId => 'ID Model';

  @override
  String get validateKey => 'Validasi Kunci';

  @override
  String get validating => 'Memvalidasi...';

  @override
  String get invalidApiKey => 'Kunci API tidak valid';

  @override
  String get gatewayConfiguration => 'Konfigurasi Gateway';

  @override
  String get gatewayConfigDesc =>
      'Gateway adalah bidang kontrol lokal untuk asisten Anda.';

  @override
  String get defaultSettingsNote =>
      'Pengaturan default berfungsi untuk sebagian besar pengguna. Hanya ubah jika Anda tahu apa yang Anda butuhkan.';

  @override
  String get host => 'Host';

  @override
  String get port => 'Port';

  @override
  String get autoStartGateway => 'Mulai gateway otomatis';

  @override
  String get autoStartGatewayDesc =>
      'Mulai gateway secara otomatis saat aplikasi diluncurkan.';

  @override
  String get channelsPageTitle => 'Saluran';

  @override
  String get channelsPageDesc =>
      'Secara opsional hubungkan saluran pesan. Anda selalu dapat mengatur ini nanti di Pengaturan.';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Hubungkan bot Telegram.';

  @override
  String get openBotFather => 'Buka BotFather';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Hubungkan bot Discord.';

  @override
  String get developerPortal => 'Portal Pengembang';

  @override
  String get botToken => 'Token Bot';

  @override
  String telegramBotToken(String platform) {
    return 'Token Bot $platform';
  }

  @override
  String get readyToGo => 'Siap Memulai';

  @override
  String get reviewConfiguration =>
      'Tinjau konfigurasi Anda dan mulai FlutterClaw.';

  @override
  String get model => 'Model';

  @override
  String viaProvider(String provider) {
    return 'melalui $provider';
  }

  @override
  String get gateway => 'Gateway';

  @override
  String get webChatOnly =>
      'Hanya WebChat (Anda dapat menambah lebih banyak nanti)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => 'Memulai...';

  @override
  String get startFlutterClaw => 'Mulai FlutterClaw';

  @override
  String get newSession => 'Sesi baru';

  @override
  String get photoLibrary => 'Perpustakaan Foto';

  @override
  String get camera => 'Kamera';

  @override
  String get whatDoYouSeeInImage => 'Apa yang Anda lihat dalam gambar ini?';

  @override
  String get imagePickerNotAvailable =>
      'Pemilih gambar tidak tersedia di Simulator. Gunakan perangkat nyata.';

  @override
  String get couldNotOpenImagePicker => 'Tidak dapat membuka pemilih gambar.';

  @override
  String get copiedToClipboard => 'Disalin ke papan klip';

  @override
  String get attachImage => 'Lampirkan gambar';

  @override
  String get messageFlutterClaw => 'Pesan ke FlutterClaw...';

  @override
  String get channelsAndGateway => 'Saluran dan Gateway';

  @override
  String get stop => 'Berhenti';

  @override
  String get start => 'Mulai';

  @override
  String status(String status) {
    return 'Status: $status';
  }

  @override
  String get builtInChatInterface => 'Antarmuka obrolan bawaan';

  @override
  String get notConfigured => 'Tidak dikonfigurasi';

  @override
  String get connected => 'Terhubung';

  @override
  String get configuredStarting => 'Dikonfigurasi (memulai...)';

  @override
  String get telegramConfiguration => 'Konfigurasi Telegram';

  @override
  String get fromBotFather => 'Dari @BotFather';

  @override
  String get allowedUserIds => 'ID Pengguna yang Diizinkan (dipisahkan koma)';

  @override
  String get leaveEmptyToAllowAll => 'Biarkan kosong untuk mengizinkan semua';

  @override
  String get cancel => 'Batal';

  @override
  String get saveAndConnect => 'Simpan dan Hubungkan';

  @override
  String get discordConfiguration => 'Konfigurasi Discord';

  @override
  String get pendingPairingRequests => 'Permintaan Pemasangan Tertunda';

  @override
  String get approve => 'Setujui';

  @override
  String get reject => 'Tolak';

  @override
  String get expired => 'Kedaluwarsa';

  @override
  String minutesLeft(int minutes) {
    return 'Tersisa ${minutes}m';
  }

  @override
  String get workspaceFiles => 'File Ruang Kerja';

  @override
  String get personalAIAssistant => 'Asisten AI Pribadi';

  @override
  String sessionsCount(int count) {
    return 'Sesi ($count)';
  }

  @override
  String get noActiveSessions => 'Tidak ada sesi aktif';

  @override
  String get startConversationToCreate => 'Mulai percakapan untuk membuat';

  @override
  String get startConversationToSee =>
      'Mulai percakapan untuk melihat sesi di sini';

  @override
  String get reset => 'Atur Ulang';

  @override
  String get cronJobs => 'Tugas Terjadwal';

  @override
  String get noCronJobs => 'Tidak ada tugas terjadwal';

  @override
  String get addScheduledTasks => 'Tambahkan tugas terjadwal untuk agen Anda';

  @override
  String get runNow => 'Jalankan Sekarang';

  @override
  String get enable => 'Aktifkan';

  @override
  String get disable => 'Nonaktifkan';

  @override
  String get delete => 'Hapus';

  @override
  String get skills => 'Keterampilan';

  @override
  String get browseClawHub => 'Jelajahi ClawHub';

  @override
  String get noSkillsInstalled => 'Tidak ada keterampilan terinstal';

  @override
  String get browseClawHubToAdd =>
      'Jelajahi ClawHub untuk menambah keterampilan';

  @override
  String removeSkillConfirm(String name) {
    return 'Hapus \"$name\" dari keterampilan Anda?';
  }

  @override
  String get clawHubSkills => 'Keterampilan ClawHub';

  @override
  String get searchSkills => 'Cari keterampilan...';

  @override
  String get noSkillsFound =>
      'Tidak ditemukan keterampilan. Coba pencarian yang berbeda.';

  @override
  String installedSkill(String name) {
    return '$name terinstal';
  }

  @override
  String failedToInstallSkill(String name) {
    return 'Gagal menginstal $name';
  }

  @override
  String get addCronJob => 'Tambahkan Tugas Terjadwal';

  @override
  String get jobName => 'Nama Tugas';

  @override
  String get dailySummaryExample => 'mis. Ringkasan Harian';

  @override
  String get taskPrompt => 'Prompt Tugas';

  @override
  String get whatShouldAgentDo => 'Apa yang harus dilakukan agen?';

  @override
  String get interval => 'Interval';

  @override
  String get every5Minutes => 'Setiap 5 menit';

  @override
  String get every15Minutes => 'Setiap 15 menit';

  @override
  String get every30Minutes => 'Setiap 30 menit';

  @override
  String get everyHour => 'Setiap jam';

  @override
  String get every6Hours => 'Setiap 6 jam';

  @override
  String get every12Hours => 'Setiap 12 jam';

  @override
  String get every24Hours => 'Setiap 24 jam';

  @override
  String get add => 'Tambah';

  @override
  String get save => 'Simpan';

  @override
  String get sessions => 'Sesi';

  @override
  String messagesCount(int count) {
    return '$count pesan';
  }

  @override
  String tokensCount(int count) {
    return '$count token';
  }

  @override
  String get compact => 'Padatkan';

  @override
  String get models => 'Model';

  @override
  String get noModelsConfigured => 'Tidak ada model yang dikonfigurasi';

  @override
  String get addModelToStartChatting => 'Tambahkan model untuk mulai mengobrol';

  @override
  String get addModel => 'Tambah Model';

  @override
  String get default_ => 'DEFAULT';

  @override
  String get autoStart => 'Mulai otomatis';

  @override
  String get startGatewayWhenLaunches =>
      'Mulai gateway saat aplikasi diluncurkan';

  @override
  String get heartbeat => 'Detak Jantung';

  @override
  String get enabled => 'Diaktifkan';

  @override
  String get periodicAgentTasks => 'Tugas agen berkala dari HEARTBEAT.md';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes mnt';
  }

  @override
  String get about => 'Tentang';

  @override
  String get personalAIAssistantForIOS =>
      'Asisten AI Pribadi untuk iOS dan Android';

  @override
  String get version => 'Versi';

  @override
  String get basedOnOpenClaw => 'Berdasarkan OpenClaw';

  @override
  String get removeModel => 'Hapus model?';

  @override
  String removeModelConfirm(String name) {
    return 'Hapus \"$name\" dari model Anda?';
  }

  @override
  String get remove => 'Hapus';

  @override
  String get setAsDefault => 'Atur sebagai Default';

  @override
  String get paste => 'Tempel';

  @override
  String get chooseProviderStep => '1. Pilih Penyedia';

  @override
  String get selectModelStep => '2. Pilih Model';

  @override
  String get apiKeyStep => '3. Kunci API';

  @override
  String getApiKeyAt(String provider) {
    return 'Dapatkan kunci API di $provider';
  }

  @override
  String get justNow => 'baru saja';

  @override
  String minutesAgo(int minutes) {
    return '${minutes}m yang lalu';
  }

  @override
  String hoursAgo(int hours) {
    return '${hours}j yang lalu';
  }

  @override
  String daysAgo(int days) {
    return '${days}h yang lalu';
  }

  @override
  String get microphonePermissionDenied => 'Izin mikrofon ditolak';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'Transkripsi langsung tidak tersedia: $error';
  }

  @override
  String failedToStartRecording(String error) {
    return 'Gagal memulai perekaman: $error';
  }

  @override
  String get usingOnDeviceTranscription =>
      'Menggunakan transkripsi pada perangkat';

  @override
  String get transcribingWithWhisper =>
      'Mentranskripsikan dengan Whisper API...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper API gagal: $error';
  }

  @override
  String get noTranscriptionCaptured => 'Tidak ada transkripsi yang ditangkap';

  @override
  String failedToStopRecording(String error) {
    return 'Gagal menghentikan perekaman: $error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return 'Gagal $action: $error';
  }

  @override
  String get pause => 'Jeda';

  @override
  String get resume => 'Lanjutkan';

  @override
  String get send => 'Kirim';

  @override
  String get liveActivityActive => 'Aktivitas Langsung aktif';

  @override
  String get restartGateway => 'Restart Gateway';

  @override
  String modelLabel(String model) {
    return 'Model: $model';
  }

  @override
  String uptimeLabel(String uptime) {
    return 'Waktu aktif: $uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS: Dukungan latar belakang aktif - gateway dapat terus memberikan respons';

  @override
  String get webChatBuiltIn => 'Antarmuka obrolan bawaan';

  @override
  String get configure => 'Konfigurasi';

  @override
  String get disconnect => 'Putuskan';

  @override
  String get agents => 'Agen';

  @override
  String get agentFiles => 'File Agen';

  @override
  String get createAgent => 'Buat Agen';

  @override
  String get editAgent => 'Edit Agen';

  @override
  String get noAgentsYet => 'Belum ada agen';

  @override
  String get createYourFirstAgent => 'Buat agen pertama Anda!';

  @override
  String get active => 'Aktif';

  @override
  String get agentName => 'Nama Agen';

  @override
  String get emoji => 'Emoji';

  @override
  String get selectEmoji => 'Pilih Emoji';

  @override
  String get vibe => 'Gaya';

  @override
  String get vibeHint => 'mis. ramah, formal, sarkastis';

  @override
  String get modelConfiguration => 'Konfigurasi Model';

  @override
  String get advancedSettings => 'Pengaturan Lanjutan';

  @override
  String get agentCreated => 'Agen dibuat';

  @override
  String get agentUpdated => 'Agen diperbarui';

  @override
  String get agentDeleted => 'Agen dihapus';

  @override
  String switchedToAgent(String name) {
    return 'Beralih ke $name';
  }

  @override
  String deleteAgentConfirm(String name) {
    return 'Hapus $name? Ini akan menghapus semua data ruang kerja.';
  }

  @override
  String get agentDetails => 'Detail Agen';

  @override
  String get createdAt => 'Dibuat';

  @override
  String get lastUsed => 'Terakhir Digunakan';

  @override
  String get basicInformation => 'Informasi Dasar';

  @override
  String get switchToAgent => 'Ganti Agen';

  @override
  String get providers => 'Penyedia';

  @override
  String get addProvider => 'Tambah penyedia';

  @override
  String get noProvidersConfigured => 'Tidak ada penyedia yang dikonfigurasi.';

  @override
  String get editCredentials => 'Edit kredensial';

  @override
  String get defaultModelHint =>
      'Model default digunakan oleh agen yang tidak menentukan model sendiri.';

  @override
  String get holdToSetAsDefault => 'Tahan untuk mengatur sebagai default';

  @override
  String get integrations => 'Integrasi';

  @override
  String get shortcutsIntegrations => 'Integrasi Shortcuts';

  @override
  String get shortcutsIntegrationsDesc =>
      'Instal iOS Shortcuts untuk menjalankan aksi aplikasi pihak ketiga';

  @override
  String get dangerZone => 'Zona berbahaya';

  @override
  String get resetOnboarding => 'Atur ulang dan jalankan ulang pengenalan';

  @override
  String get resetOnboardingDesc =>
      'Menghapus semua konfigurasi dan kembali ke wizard pengaturan.';

  @override
  String get resetAllConfiguration => 'Atur ulang semua konfigurasi?';

  @override
  String get resetAllConfigurationDesc =>
      'Ini akan menghapus kunci API, model, dan semua pengaturan Anda. Aplikasi akan kembali ke wizard pengaturan.\n\nRiwayat percakapan Anda tidak dihapus.';

  @override
  String get removeProvider => 'Hapus penyedia';

  @override
  String removeProviderConfirm(String provider) {
    return 'Hapus kredensial untuk $provider?';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$name diatur sebagai model default';
  }

  @override
  String get photoImage => 'Foto / Gambar';

  @override
  String get documentPdfTxt => 'Dokumen (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'Tidak dapat membuka dokumen: $error';
  }

  @override
  String get retry => 'Coba lagi';

  @override
  String get gatewayStopped => 'Gateway dihentikan';

  @override
  String get gatewayStarted => 'Gateway berhasil dimulai!';

  @override
  String gatewayFailed(String error) {
    return 'Gateway gagal: $error';
  }

  @override
  String exceptionError(String error) {
    return 'Pengecualian: $error';
  }

  @override
  String get pairingRequestApproved => 'Permintaan pemasangan disetujui';

  @override
  String get pairingRequestRejected => 'Permintaan pemasangan ditolak';

  @override
  String get addDevice => 'Tambah Perangkat';

  @override
  String get telegramConfigSaved => 'Konfigurasi Telegram disimpan';

  @override
  String get discordConfigSaved => 'Konfigurasi Discord disimpan';

  @override
  String get securityMethod => 'Metode Keamanan';

  @override
  String get pairingRecommended => 'Pemasangan (Direkomendasikan)';

  @override
  String get pairingDescription =>
      'Pengguna baru mendapat kode pemasangan. Anda menyetujui atau menolak mereka.';

  @override
  String get allowlistTitle => 'Daftar yang Diizinkan';

  @override
  String get allowlistDescription =>
      'Hanya ID pengguna tertentu yang dapat mengakses bot.';

  @override
  String get openAccess => 'Terbuka';

  @override
  String get openAccessDescription =>
      'Siapa saja dapat menggunakan bot segera (tidak direkomendasikan).';

  @override
  String get disabledAccess => 'Dinonaktifkan';

  @override
  String get disabledAccessDescription =>
      'Tidak ada DM yang diizinkan. Bot tidak akan merespons pesan apa pun.';

  @override
  String get approvedDevices => 'Perangkat yang Disetujui';

  @override
  String get noApprovedDevicesYet => 'Belum ada perangkat yang disetujui';

  @override
  String get devicesAppearAfterApproval =>
      'Perangkat akan muncul di sini setelah Anda menyetujui permintaan pemasangan mereka';

  @override
  String get noAllowedUsersConfigured =>
      'Tidak ada pengguna yang diizinkan dikonfigurasi';

  @override
  String get addUserIdsHint =>
      'Tambahkan ID pengguna untuk mengizinkan mereka menggunakan bot';

  @override
  String get removeDevice => 'Hapus perangkat?';

  @override
  String removeAccessFor(String name) {
    return 'Hapus akses untuk $name?';
  }

  @override
  String get saving => 'Menyimpan...';

  @override
  String get channelsLabel => 'Saluran';

  @override
  String get clawHubAccount => 'Akun ClawHub';

  @override
  String get loggedInToClawHub => 'Anda saat ini masuk ke ClawHub.';

  @override
  String get loggedOutFromClawHub => 'Keluar dari ClawHub';

  @override
  String get login => 'Masuk';

  @override
  String get logout => 'Keluar';

  @override
  String get connect => 'Hubungkan';

  @override
  String get pasteClawHubToken => 'Tempel token API ClawHub Anda';

  @override
  String get pleaseEnterApiToken => 'Silakan masukkan token API';

  @override
  String get successfullyConnected => 'Berhasil terhubung ke ClawHub';

  @override
  String get browseSkillsButton => 'Jelajahi Keterampilan';

  @override
  String get installSkill => 'Instal Keterampilan';

  @override
  String get incompatibleSkill => 'Keterampilan Tidak Kompatibel';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'Keterampilan ini tidak dapat berjalan di perangkat seluler (iOS/Android).\n\n$reason';
  }

  @override
  String get compatibilityWarning => 'Peringatan Kompatibilitas';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'Keterampilan ini dirancang untuk desktop dan mungkin tidak berfungsi di perangkat seluler.\n\n$reason\n\nApakah Anda ingin menginstal versi yang disesuaikan dan dioptimalkan untuk seluler?';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'Instal Asli';

  @override
  String get installAdapted => 'Instal yang Disesuaikan';

  @override
  String get resetSession => 'Atur Ulang Sesi';

  @override
  String resetSessionConfirm(String key) {
    return 'Atur ulang sesi \"$key\"? Ini akan menghapus semua pesan.';
  }

  @override
  String get sessionReset => 'Sesi diatur ulang';

  @override
  String get activeSessions => 'Sesi Aktif';

  @override
  String get scheduledTasks => 'Tugas Terjadwal';

  @override
  String get defaultBadge => 'Default';

  @override
  String errorGeneric(String error) {
    return 'Error: $error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileName disimpan';
  }

  @override
  String errorSavingFile(String error) {
    return 'Error menyimpan file: $error';
  }

  @override
  String get cannotDeleteLastAgent => 'Tidak dapat menghapus agen terakhir';

  @override
  String get close => 'Tutup';

  @override
  String get nameIsRequired => 'Nama wajib diisi';

  @override
  String get pleaseSelectModel => 'Silakan pilih model';

  @override
  String temperatureLabel(String value) {
    return 'Suhu: $value';
  }

  @override
  String get maxTokens => 'Token Maksimal';

  @override
  String get maxTokensRequired => 'Token maksimal wajib diisi';

  @override
  String get mustBePositiveNumber => 'Harus berupa angka positif';

  @override
  String get maxToolIterations => 'Iterasi Alat Maksimal';

  @override
  String get maxIterationsRequired => 'Iterasi maksimal wajib diisi';

  @override
  String get restrictToWorkspace => 'Batasi ke Ruang Kerja';

  @override
  String get restrictToWorkspaceDesc =>
      'Batasi operasi file ke ruang kerja agen';

  @override
  String get noModelsConfiguredLong =>
      'Silakan tambahkan setidaknya satu model di Pengaturan sebelum membuat agen.';

  @override
  String get selectProviderFirst => 'Pilih penyedia terlebih dahulu';

  @override
  String get skip => 'Lewati';

  @override
  String get continueButton => 'Lanjutkan';

  @override
  String get uiAutomation => 'Otomatisasi Antarmuka';

  @override
  String get uiAutomationDesc =>
      'FlutterClaw dapat mengontrol layar Anda — mengetuk tombol, mengisi formulir, menggulir, dan mengotomatisasi tugas berulang di aplikasi apa pun.';

  @override
  String get uiAutomationAccessibilityNote =>
      'Ini memerlukan pengaktifan Layanan Aksesibilitas di Pengaturan Android. Anda dapat melewati ini dan mengaktifkannya nanti.';

  @override
  String get openAccessibilitySettings => 'Buka Pengaturan Aksesibilitas';

  @override
  String get skipForNow => 'Lewati untuk sekarang';

  @override
  String get checkingPermission => 'Memeriksa izin…';

  @override
  String get accessibilityEnabled => 'Layanan Aksesibilitas diaktifkan';

  @override
  String get accessibilityNotEnabled =>
      'Layanan Aksesibilitas tidak diaktifkan';

  @override
  String get exploreIntegrations => 'Jelajahi Integrasi';

  @override
  String get requestTimedOut => 'Permintaan habis waktu';

  @override
  String get myShortcuts => 'Pintasan Saya';

  @override
  String get addShortcut => 'Tambah Pintasan';

  @override
  String get noShortcutsYet => 'Belum ada pintasan';

  @override
  String get shortcutsInstructions =>
      'Buat pintasan di aplikasi iOS Shortcuts, tambahkan aksi callback di akhir, lalu daftarkan di sini agar AI dapat menjalankannya.';

  @override
  String get shortcutName => 'Nama pintasan';

  @override
  String get shortcutNameHint => 'Nama persis dari aplikasi Shortcuts';

  @override
  String get descriptionOptional => 'Deskripsi (opsional)';

  @override
  String get whatDoesShortcutDo => 'Apa yang dilakukan pintasan ini?';

  @override
  String get callbackSetup => 'Pengaturan callback';

  @override
  String get callbackInstructions =>
      'Setiap pintasan harus diakhiri dengan:\n① Dapatkan Nilai untuk Kunci → \"callbackUrl\" (dari Input Pintasan yang diurai sebagai dict)\n② Buka URL ← output dari ①';

  @override
  String get channelApp => 'Aplikasi';

  @override
  String get channelHeartbeat => 'Detak Jantung';

  @override
  String get channelCron => 'Cron';

  @override
  String get channelSubagent => 'Subagen';

  @override
  String get channelSystem => 'Sistem';

  @override
  String secondsAgo(int seconds) {
    return '${seconds}d lalu';
  }

  @override
  String get messagesAbbrev => 'psn';
}
