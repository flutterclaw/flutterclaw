// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'FlutterClaw';

  @override
  String get chat => 'チャット';

  @override
  String get channels => 'チャンネル';

  @override
  String get agent => 'エージェント';

  @override
  String get settings => '設定';

  @override
  String get getStarted => '始める';

  @override
  String get yourPersonalAssistant => 'あなた個人のAIアシスタント';

  @override
  String get multiChannelChat => 'マルチチャンネルチャット';

  @override
  String get multiChannelChatDesc => 'Telegram、Discord、WebChatなど';

  @override
  String get powerfulAIModels => '強力なAIモデル';

  @override
  String get powerfulAIModelsDesc => 'OpenAI、Anthropic、Grok、無料モデル';

  @override
  String get localGateway => 'ローカルゲートウェイ';

  @override
  String get localGatewayDesc => 'デバイス上で実行、データはあなたのもの';

  @override
  String get chooseProvider => 'プロバイダーを選択';

  @override
  String get selectProviderDesc => 'AIモデルへの接続方法を選択してください。';

  @override
  String get startForFree => '無料で始める';

  @override
  String get freeProvidersDesc => 'これらのプロバイダーは無料モデルを提供しています。';

  @override
  String get free => '無料';

  @override
  String get otherProviders => 'その他のプロバイダー';

  @override
  String connectToProvider(String provider) {
    return '$providerに接続';
  }

  @override
  String get enterApiKeyDesc => 'APIキーを入力し、モデルを選択してください。';

  @override
  String get dontHaveApiKey => 'APIキーをお持ちではありませんか?';

  @override
  String get createAccountCopyKey => 'アカウントを作成してキーをコピーしてください。';

  @override
  String get signUp => 'サインアップ';

  @override
  String get apiKey => 'APIキー';

  @override
  String get pasteFromClipboard => 'クリップボードから貼り付け';

  @override
  String get apiBaseUrl => 'APIベースURL';

  @override
  String get selectModel => 'モデルを選択';

  @override
  String get modelId => 'モデルID';

  @override
  String get validateKey => 'キーを検証';

  @override
  String get validating => '検証中...';

  @override
  String get invalidApiKey => '無効なAPIキー';

  @override
  String get gatewayConfiguration => 'ゲートウェイ設定';

  @override
  String get gatewayConfigDesc => 'ゲートウェイはアシスタントのローカル制御プレーンです。';

  @override
  String get defaultSettingsNote => 'デフォルト設定はほとんどのユーザーに適しています。必要な場合のみ変更してください。';

  @override
  String get host => 'ホスト';

  @override
  String get port => 'ポート';

  @override
  String get autoStartGateway => 'ゲートウェイを自動起動';

  @override
  String get autoStartGatewayDesc => 'アプリ起動時にゲートウェイを自動起動します。';

  @override
  String get channelsPageTitle => 'チャンネル';

  @override
  String get channelsPageDesc => 'オプションでメッセージングチャンネルを接続できます。後で設定で構成できます。';

  @override
  String get telegram => 'Telegram';

  @override
  String get connectTelegramBot => 'Telegramボットを接続します。';

  @override
  String get openBotFather => 'BotFatherを開く';

  @override
  String get discord => 'Discord';

  @override
  String get connectDiscordBot => 'Discordボットを接続します。';

  @override
  String get developerPortal => '開発者ポータル';

  @override
  String get botToken => 'ボットトークン';

  @override
  String telegramBotToken(String platform) {
    return '$platformボットトークン';
  }

  @override
  String get readyToGo => '準備完了';

  @override
  String get reviewConfiguration => '設定を確認してFlutterClawを起動します。';

  @override
  String get model => 'モデル';

  @override
  String viaProvider(String provider) {
    return '$provider経由';
  }

  @override
  String get gateway => 'ゲートウェイ';

  @override
  String get webChatOnly => 'WebChatのみ(後で追加可能)';

  @override
  String get webChat => 'WebChat';

  @override
  String get starting => '起動中...';

  @override
  String get startFlutterClaw => 'FlutterClawを起動';

  @override
  String get newSession => '新しいセッション';

  @override
  String get photoLibrary => 'フォトライブラリ';

  @override
  String get camera => 'カメラ';

  @override
  String get whatDoYouSeeInImage => 'この画像に何が見えますか?';

  @override
  String get imagePickerNotAvailable => 'シミュレータでは画像ピッカーは使用できません。実機を使用してください。';

  @override
  String get couldNotOpenImagePicker => '画像ピッカーを開けませんでした。';

  @override
  String get copiedToClipboard => 'クリップボードにコピーしました';

  @override
  String get attachImage => '画像を添付';

  @override
  String get messageFlutterClaw => 'FlutterClawにメッセージ...';

  @override
  String get channelsAndGateway => 'チャンネルとゲートウェイ';

  @override
  String get stop => '停止';

  @override
  String get start => '開始';

  @override
  String status(String status) {
    return '状態: $status';
  }

  @override
  String get builtInChatInterface => '内蔵チャットインターフェース';

  @override
  String get notConfigured => '未設定';

  @override
  String get connected => '接続済み';

  @override
  String get configuredStarting => '設定済み(起動中...)';

  @override
  String get telegramConfiguration => 'Telegram設定';

  @override
  String get fromBotFather => '@BotFatherから';

  @override
  String get allowedUserIds => '許可されたユーザーID(カンマ区切り)';

  @override
  String get leaveEmptyToAllowAll => 'すべて許可する場合は空欄';

  @override
  String get cancel => 'キャンセル';

  @override
  String get saveAndConnect => '保存して接続';

  @override
  String get discordConfiguration => 'Discord設定';

  @override
  String get pendingPairingRequests => '保留中のペアリングリクエスト';

  @override
  String get approve => '承認';

  @override
  String get reject => '拒否';

  @override
  String get expired => '期限切れ';

  @override
  String minutesLeft(int minutes) {
    return '残り$minutes分';
  }

  @override
  String get workspaceFiles => 'ワークスペースファイル';

  @override
  String get personalAIAssistant => '個人AIアシスタント';

  @override
  String sessionsCount(int count) {
    return 'セッション($count)';
  }

  @override
  String get noActiveSessions => 'アクティブなセッションはありません';

  @override
  String get startConversationToCreate => '会話を開始してセッションを作成';

  @override
  String get startConversationToSee => '会話を開始してセッションを表示';

  @override
  String get reset => 'リセット';

  @override
  String get cronJobs => 'スケジュールタスク';

  @override
  String get noCronJobs => 'スケジュールタスクはありません';

  @override
  String get addScheduledTasks => 'エージェントのスケジュールタスクを追加';

  @override
  String get runNow => '今すぐ実行';

  @override
  String get enable => '有効化';

  @override
  String get disable => '無効化';

  @override
  String get delete => '削除';

  @override
  String get skills => 'スキル';

  @override
  String get browseClawHub => 'ClawHubを閲覧';

  @override
  String get noSkillsInstalled => 'インストールされたスキルはありません';

  @override
  String get browseClawHubToAdd => 'ClawHubを閲覧してスキルを追加';

  @override
  String removeSkillConfirm(String name) {
    return '\"$name\"をスキルから削除しますか?';
  }

  @override
  String get clawHubSkills => 'ClawHubスキル';

  @override
  String get searchSkills => 'スキルを検索...';

  @override
  String get noSkillsFound => 'スキルが見つかりません。別の検索をお試しください。';

  @override
  String installedSkill(String name) {
    return '$nameをインストールしました';
  }

  @override
  String failedToInstallSkill(String name) {
    return '$nameのインストールに失敗しました';
  }

  @override
  String get addCronJob => 'スケジュールタスクを追加';

  @override
  String get jobName => 'タスク名';

  @override
  String get dailySummaryExample => '例: 日次サマリー';

  @override
  String get taskPrompt => 'タスクプロンプト';

  @override
  String get whatShouldAgentDo => 'エージェントは何をすべきですか?';

  @override
  String get interval => '間隔';

  @override
  String get every5Minutes => '5分ごと';

  @override
  String get every15Minutes => '15分ごと';

  @override
  String get every30Minutes => '30分ごと';

  @override
  String get everyHour => '1時間ごと';

  @override
  String get every6Hours => '6時間ごと';

  @override
  String get every12Hours => '12時間ごと';

  @override
  String get every24Hours => '24時間ごと';

  @override
  String get add => '追加';

  @override
  String get save => '保存';

  @override
  String get sessions => 'セッション';

  @override
  String messagesCount(int count) {
    return '$count件のメッセージ';
  }

  @override
  String tokensCount(int count) {
    return '$countトークン';
  }

  @override
  String get compact => '圧縮';

  @override
  String get models => 'モデル';

  @override
  String get noModelsConfigured => '設定されたモデルはありません';

  @override
  String get addModelToStartChatting => 'チャットを開始するにはモデルを追加';

  @override
  String get addModel => 'モデルを追加';

  @override
  String get default_ => 'デフォルト';

  @override
  String get autoStart => '自動起動';

  @override
  String get startGatewayWhenLaunches => 'アプリ起動時にゲートウェイを起動';

  @override
  String get heartbeat => 'ハートビート';

  @override
  String get enabled => '有効';

  @override
  String get periodicAgentTasks => 'HEARTBEAT.mdからの定期的なエージェントタスク';

  @override
  String intervalMinutes(int minutes) {
    return '$minutes分';
  }

  @override
  String get about => 'について';

  @override
  String get personalAIAssistantForIOS => 'iOS & Android用個人AIアシスタント';

  @override
  String get version => 'バージョン';

  @override
  String get basedOnOpenClaw => 'OpenClawベース';

  @override
  String get removeModel => 'モデルを削除しますか?';

  @override
  String removeModelConfirm(String name) {
    return '\"$name\"をモデルから削除しますか?';
  }

  @override
  String get remove => '削除';

  @override
  String get setAsDefault => 'デフォルトに設定';

  @override
  String get paste => '貼り付け';

  @override
  String get chooseProviderStep => '1. プロバイダーを選択';

  @override
  String get selectModelStep => '2. モデルを選択';

  @override
  String get apiKeyStep => '3. APIキー';

  @override
  String getApiKeyAt(String provider) {
    return '$providerでAPIキーを取得';
  }

  @override
  String get justNow => 'たった今';

  @override
  String minutesAgo(int minutes) {
    return '$minutes分前';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours時間前';
  }

  @override
  String daysAgo(int days) {
    return '$days日前';
  }

  @override
  String get microphonePermissionDenied => 'マイクの許可が拒否されました';

  @override
  String liveTranscriptionUnavailable(String error) {
    return 'ライブ文字起こしが利用できません：$error';
  }

  @override
  String failedToStartRecording(String error) {
    return '録音を開始できませんでした：$error';
  }

  @override
  String get usingOnDeviceTranscription => 'デバイス上の文字起こしを使用中';

  @override
  String get transcribingWithWhisper => 'Whisper APIで文字起こし中...';

  @override
  String whisperApiFailed(String error) {
    return 'Whisper APIが失敗しました：$error';
  }

  @override
  String get noTranscriptionCaptured => '文字起こしがキャプチャされませんでした';

  @override
  String failedToStopRecording(String error) {
    return '録音を停止できませんでした：$error';
  }

  @override
  String failedToPauseResume(String action, String error) {
    return '$actionに失敗しました：$error';
  }

  @override
  String get pause => '一時停止';

  @override
  String get resume => '再開';

  @override
  String get send => '送信';

  @override
  String get liveActivityActive => 'ライブアクティビティ有効';

  @override
  String get restartGateway => 'ゲートウェイを再起動';

  @override
  String modelLabel(String model) {
    return 'モデル：$model';
  }

  @override
  String uptimeLabel(String uptime) {
    return '稼働時間：$uptime';
  }

  @override
  String get iosBackgroundSupportActive =>
      'iOS：バックグラウンドサポートが有効 - ゲートウェイは応答を継続できます';

  @override
  String get webChatBuiltIn => '内蔵チャットインターフェース';

  @override
  String get configure => '設定';

  @override
  String get disconnect => '切断';

  @override
  String get agents => 'エージェント';

  @override
  String get agentFiles => 'エージェントファイル';

  @override
  String get createAgent => 'エージェントを作成';

  @override
  String get editAgent => 'エージェントを編集';

  @override
  String get noAgentsYet => 'エージェントはまだありません';

  @override
  String get createYourFirstAgent => '最初のエージェントを作成しましょう！';

  @override
  String get active => 'アクティブ';

  @override
  String get agentName => 'エージェント名';

  @override
  String get emoji => '絵文字';

  @override
  String get selectEmoji => '絵文字を選択';

  @override
  String get vibe => '雰囲気';

  @override
  String get vibeHint => '例：フレンドリー、フォーマル、皮肉';

  @override
  String get modelConfiguration => 'モデル設定';

  @override
  String get advancedSettings => '詳細設定';

  @override
  String get agentCreated => 'エージェントを作成しました';

  @override
  String get agentUpdated => 'エージェントを更新しました';

  @override
  String get agentDeleted => 'エージェントを削除しました';

  @override
  String switchedToAgent(String name) {
    return '$nameに切り替えました';
  }

  @override
  String deleteAgentConfirm(String name) {
    return '$nameを削除しますか？すべてのワークスペースデータが削除されます。';
  }

  @override
  String get agentDetails => 'エージェント詳細';

  @override
  String get createdAt => '作成日';

  @override
  String get lastUsed => '最終使用';

  @override
  String get basicInformation => '基本情報';

  @override
  String get switchToAgent => 'エージェントを切り替え';

  @override
  String get providers => 'プロバイダー';

  @override
  String get addProvider => 'プロバイダーを追加';

  @override
  String get noProvidersConfigured => 'プロバイダーが設定されていません。';

  @override
  String get editCredentials => '資格情報を編集';

  @override
  String get defaultModelHint => 'デフォルトモデルは独自のモデルを指定しないエージェントで使用されます。';

  @override
  String get holdToSetAsDefault => '長押しでデフォルトに設定';

  @override
  String get integrations => '統合';

  @override
  String get shortcutsIntegrations => 'ショートカット統合';

  @override
  String get shortcutsIntegrationsDesc => 'iOSショートカットをインストールしてサードパーティアプリの操作を実行';

  @override
  String get dangerZone => '危険ゾーン';

  @override
  String get resetOnboarding => 'リセットしてオンボーディングを再実行';

  @override
  String get resetOnboardingDesc => 'すべての設定を削除し、セットアップウィザードに戻ります。';

  @override
  String get resetAllConfiguration => 'すべての設定をリセットしますか？';

  @override
  String get resetAllConfigurationDesc =>
      'APIキー、モデル、すべての設定が削除されます。アプリはセットアップウィザードに戻ります。\n\n会話履歴は削除されません。';

  @override
  String get removeProvider => 'プロバイダーを削除';

  @override
  String removeProviderConfirm(String provider) {
    return '$providerの資格情報を削除しますか？';
  }

  @override
  String modelSetAsDefault(String name) {
    return '$nameをデフォルトモデルに設定しました';
  }

  @override
  String get photoImage => '写真 / 画像';

  @override
  String get documentPdfTxt => 'ドキュメント (PDF / TXT)';

  @override
  String couldNotOpenDocument(String error) {
    return 'ドキュメントを開けませんでした：$error';
  }

  @override
  String get retry => 'リトライ';

  @override
  String get gatewayStopped => 'ゲートウェイが停止しました';

  @override
  String get gatewayStarted => 'ゲートウェイが正常に起動しました！';

  @override
  String gatewayFailed(String error) {
    return 'ゲートウェイ失敗：$error';
  }

  @override
  String exceptionError(String error) {
    return '例外：$error';
  }

  @override
  String get pairingRequestApproved => 'ペアリングリクエストを承認しました';

  @override
  String get pairingRequestRejected => 'ペアリングリクエストを拒否しました';

  @override
  String get addDevice => 'デバイスを追加';

  @override
  String get telegramConfigSaved => 'Telegram設定を保存しました';

  @override
  String get discordConfigSaved => 'Discord設定を保存しました';

  @override
  String get securityMethod => 'セキュリティ方式';

  @override
  String get pairingRecommended => 'ペアリング（推奨）';

  @override
  String get pairingDescription => '新しいユーザーにペアリングコードが発行されます。承認または拒否できます。';

  @override
  String get allowlistTitle => '許可リスト';

  @override
  String get allowlistDescription => '特定のユーザーIDのみがボットにアクセスできます。';

  @override
  String get openAccess => 'オープン';

  @override
  String get openAccessDescription => '誰でもすぐにボットを使用できます（非推奨）。';

  @override
  String get disabledAccess => '無効';

  @override
  String get disabledAccessDescription => 'DMは許可されません。ボットはすべてのメッセージに応答しません。';

  @override
  String get approvedDevices => '承認済みデバイス';

  @override
  String get noApprovedDevicesYet => '承認済みデバイスはまだありません';

  @override
  String get devicesAppearAfterApproval => 'ペアリングリクエストを承認すると、デバイスがここに表示されます';

  @override
  String get noAllowedUsersConfigured => '許可されたユーザーが設定されていません';

  @override
  String get addUserIdsHint => 'ボットの使用を許可するユーザーIDを追加してください';

  @override
  String get removeDevice => 'デバイスを削除しますか？';

  @override
  String removeAccessFor(String name) {
    return '$nameのアクセスを削除しますか？';
  }

  @override
  String get saving => '保存中...';

  @override
  String get channelsLabel => 'チャンネル';

  @override
  String get clawHubAccount => 'ClawHubアカウント';

  @override
  String get loggedInToClawHub => '現在ClawHubにログインしています。';

  @override
  String get loggedOutFromClawHub => 'ClawHubからログアウトしました';

  @override
  String get login => 'ログイン';

  @override
  String get logout => 'ログアウト';

  @override
  String get connect => '接続';

  @override
  String get pasteClawHubToken => 'ClawHub APIトークンを貼り付け';

  @override
  String get pleaseEnterApiToken => 'APIトークンを入力してください';

  @override
  String get successfullyConnected => 'ClawHubに正常に接続しました';

  @override
  String get browseSkillsButton => 'スキルを閲覧';

  @override
  String get installSkill => 'スキルをインストール';

  @override
  String get incompatibleSkill => '互換性のないスキル';

  @override
  String incompatibleSkillDesc(String reason) {
    return 'このスキルはモバイル（iOS/Android）では実行できません。\n\n$reason';
  }

  @override
  String get compatibilityWarning => '互換性の警告';

  @override
  String compatibilityWarningDesc(String reason) {
    return 'このスキルはデスクトップ向けに設計されており、モバイルではそのまま動作しない可能性があります。\n\n$reason\n\nモバイル向けに最適化された適応版をインストールしますか？';
  }

  @override
  String get ok => 'OK';

  @override
  String get installOriginal => 'オリジナルをインストール';

  @override
  String get installAdapted => '適応版をインストール';

  @override
  String get resetSession => 'セッションをリセット';

  @override
  String resetSessionConfirm(String key) {
    return 'セッション\"$key\"をリセットしますか？すべてのメッセージが削除されます。';
  }

  @override
  String get sessionReset => 'セッションをリセットしました';

  @override
  String get activeSessions => 'アクティブなセッション';

  @override
  String get scheduledTasks => 'スケジュールタスク';

  @override
  String get defaultBadge => 'デフォルト';

  @override
  String errorGeneric(String error) {
    return 'エラー：$error';
  }

  @override
  String fileSaved(String fileName) {
    return '$fileNameを保存しました';
  }

  @override
  String errorSavingFile(String error) {
    return 'ファイルの保存エラー：$error';
  }

  @override
  String get cannotDeleteLastAgent => '最後のエージェントは削除できません';

  @override
  String get close => '閉じる';

  @override
  String get nameIsRequired => '名前は必須です';

  @override
  String get pleaseSelectModel => 'モデルを選択してください';

  @override
  String temperatureLabel(String value) {
    return '温度：$value';
  }

  @override
  String get maxTokens => '最大トークン数';

  @override
  String get maxTokensRequired => '最大トークン数は必須です';

  @override
  String get mustBePositiveNumber => '正の数を入力してください';

  @override
  String get maxToolIterations => '最大ツール反復回数';

  @override
  String get maxIterationsRequired => '最大反復回数は必須です';

  @override
  String get restrictToWorkspace => 'ワークスペースに制限';

  @override
  String get restrictToWorkspaceDesc => 'ファイル操作をエージェントのワークスペースに限定';

  @override
  String get noModelsConfiguredLong => 'エージェントを作成する前に、設定で少なくとも1つのモデルを追加してください。';

  @override
  String get selectProviderFirst => 'まずプロバイダーを選択してください';

  @override
  String get skip => 'スキップ';

  @override
  String get continueButton => '続行';

  @override
  String get uiAutomation => 'UI自動化';

  @override
  String get uiAutomationDesc =>
      'FlutterClawはあなたの代わりに画面を操作できます。ボタンのタップ、フォームの入力、スクロール、任意のアプリでの繰り返しタスクの自動化が可能です。';

  @override
  String get uiAutomationAccessibilityNote =>
      'これにはAndroid設定でアクセシビリティサービスを有効にする必要があります。スキップして後で有効にすることもできます。';

  @override
  String get openAccessibilitySettings => 'アクセシビリティ設定を開く';

  @override
  String get skipForNow => '今はスキップ';

  @override
  String get checkingPermission => '権限を確認中…';

  @override
  String get accessibilityEnabled => 'アクセシビリティサービスが有効です';

  @override
  String get accessibilityNotEnabled => 'アクセシビリティサービスが有効ではありません';

  @override
  String get exploreIntegrations => '統合を探索';

  @override
  String get requestTimedOut => 'リクエストがタイムアウトしました';

  @override
  String get myShortcuts => 'マイショートカット';

  @override
  String get addShortcut => 'ショートカットを追加';

  @override
  String get noShortcutsYet => 'ショートカットはまだありません';

  @override
  String get shortcutsInstructions =>
      'iOSショートカットアプリでショートカットを作成し、最後にコールバックアクションを追加して、AIが実行できるようにここで登録してください。';

  @override
  String get shortcutName => 'ショートカット名';

  @override
  String get shortcutNameHint => 'ショートカットアプリの正確な名前';

  @override
  String get descriptionOptional => '説明（任意）';

  @override
  String get whatDoesShortcutDo => 'このショートカットは何をしますか？';

  @override
  String get callbackSetup => 'コールバック設定';

  @override
  String get callbackInstructions =>
      '各ショートカットは以下で終了する必要があります：\n① キーの値を取得 → \"callbackUrl\"（ショートカット入力を辞書として解析）\n② URLを開く ← ①の出力';

  @override
  String get channelApp => 'アプリ';

  @override
  String get channelHeartbeat => 'ハートビート';

  @override
  String get channelCron => '定期実行';

  @override
  String get channelSubagent => 'サブエージェント';

  @override
  String get channelSystem => 'システム';

  @override
  String secondsAgo(int seconds) {
    return '$seconds秒前';
  }

  @override
  String get messagesAbbrev => '件';

  @override
  String get modelAlreadyAdded => 'このモデルは既にリストに存在します';

  @override
  String get bothTokensRequired => '両方のトークンが必要です';

  @override
  String get slackSavedRestart => 'Slackを保存しました — 接続するにはゲートウェイを再起動してください';

  @override
  String get slackConfiguration => 'Slack設定';

  @override
  String get setupTitle => 'セットアップ';

  @override
  String get slackSetupInstructions =>
      '1. api.slack.com/appsでSlackアプリを作成\n2. Socket Modeを有効化 → App-Level Token (xapp-…)を生成\n   スコープ: connections:write\n3. Bot Token Scopesを追加: chat:write, channels:history,\n   groups:history, im:history, mpim:history\n4. ワークスペースにアプリをインストール → Bot Token (xoxb-…)をコピー';

  @override
  String get botTokenXoxb => 'ボットトークン (xoxb-…)';

  @override
  String get appLevelToken => 'App-Levelトークン (xapp-…)';

  @override
  String get apiUrlPhoneRequired => 'API URLと電話番号が必要です';

  @override
  String get signalSavedRestart => 'Signalを保存しました — 接続するにはゲートウェイを再起動してください';

  @override
  String get signalConfiguration => 'Signal設定';

  @override
  String get requirementsTitle => '必要条件';

  @override
  String get signalRequirements =>
      'サーバー上でsignal-cli-rest-apiを実行する必要があります：\n\n  docker run -p 8080:8080 \\\n    -v /data:/home/.local/share/signal-cli \\\n    bbernhard/signal-cli-rest-api\n\nREST API経由でSignal番号を登録/リンクし、下記にURLと電話番号を入力してください。';

  @override
  String get signalApiUrl => 'signal-cli-rest-api URL';

  @override
  String get signalPhoneNumber => 'あなたのSignal電話番号';

  @override
  String get userIdLabel => 'ユーザーID';

  @override
  String get enterDiscordUserId => 'DiscordユーザーIDを入力';

  @override
  String get enterTelegramUserId => 'TelegramユーザーIDを入力';

  @override
  String get fromDiscordDevPortal => 'Discord開発者ポータルから';

  @override
  String get allowedUserIdsTitle => '許可されたユーザーID';

  @override
  String get approvedDevice => '承認済みデバイス';

  @override
  String get allowedUser => '許可されたユーザー';

  @override
  String get howToGetBotToken => 'ボットトークンの取得方法';

  @override
  String get discordTokenInstructions =>
      '1. Discord開発者ポータルにアクセス\n2. 新しいアプリケーションとボットを作成\n3. トークンをコピーして上記に貼り付け\n4. Message Content Intentを有効化';

  @override
  String get telegramTokenInstructions =>
      '1. Telegramを開き@BotFatherを検索\n2. /newbotを送信し指示に従う\n3. トークンをコピーして上記に貼り付け';

  @override
  String get fromBotFatherHint => '@BotFatherから取得';

  @override
  String get accessTokenLabel => 'アクセストークン';

  @override
  String get notSetOpenAccess => '未設定 — オープンアクセス（ループバックのみ）';

  @override
  String get gatewayAccessToken => 'ゲートウェイアクセストークン';

  @override
  String get tokenFieldLabel => 'トークン';

  @override
  String get leaveEmptyDisableAuth => '認証を無効にする場合は空欄にしてください';

  @override
  String get toolPolicies => 'ツールポリシー';

  @override
  String get toolPoliciesDesc =>
      'エージェントがアクセスできるものを制御します。無効化されたツールはAIから隠され、実行時にブロックされます。';

  @override
  String get privacySensors => 'プライバシーとセンサー';

  @override
  String get networkCategory => 'ネットワーク';

  @override
  String get systemCategory => 'システム';

  @override
  String get toolTakePhotos => '写真を撮る';

  @override
  String get toolTakePhotosDesc => 'エージェントにカメラで写真を撮ることを許可';

  @override
  String get toolRecordVideo => '動画を録画';

  @override
  String get toolRecordVideoDesc => 'エージェントに動画を録画することを許可';

  @override
  String get toolLocation => '位置情報';

  @override
  String get toolLocationDesc => 'エージェントに現在のGPS位置を読み取ることを許可';

  @override
  String get toolHealthData => 'ヘルスデータ';

  @override
  String get toolHealthDataDesc => 'エージェントに健康/フィットネスデータを読み取ることを許可';

  @override
  String get toolContacts => '連絡先';

  @override
  String get toolContactsDesc => 'エージェントに連絡先を検索することを許可';

  @override
  String get toolScreenshots => 'スクリーンショット';

  @override
  String get toolScreenshotsDesc => 'エージェントに画面のスクリーンショットを撮ることを許可';

  @override
  String get toolWebFetch => 'Web取得';

  @override
  String get toolWebFetchDesc => 'エージェントにURLからコンテンツを取得することを許可';

  @override
  String get toolWebSearch => 'Web検索';

  @override
  String get toolWebSearchDesc => 'エージェントにWebを検索することを許可';

  @override
  String get toolHttpRequests => 'HTTPリクエスト';

  @override
  String get toolHttpRequestsDesc => 'エージェントに任意のHTTPリクエストを実行することを許可';

  @override
  String get toolSandboxShell => 'サンドボックスシェル';

  @override
  String get toolSandboxShellDesc => 'エージェントにサンドボックス内でシェルコマンドを実行することを許可';

  @override
  String get toolImageGeneration => '画像生成';

  @override
  String get toolImageGenerationDesc => 'エージェントにAIで画像を生成することを許可';

  @override
  String get toolLaunchApps => 'アプリ起動';

  @override
  String get toolLaunchAppsDesc => 'エージェントにインストール済みアプリを開くことを許可';

  @override
  String get toolLaunchIntents => 'Intent起動';

  @override
  String get toolLaunchIntentsDesc =>
      'エージェントにAndroid Intent（ディープリンク、システム画面）を起動することを許可';

  @override
  String get renameSession => 'セッション名を変更';

  @override
  String get myConversationName => '会話名';

  @override
  String get renameAction => '名前を変更';

  @override
  String get couldNotTranscribeAudio => '音声を文字起こしできませんでした';

  @override
  String get stopRecording => '録音を停止';

  @override
  String get voiceInput => '音声入力';

  @override
  String get copyTooltip => 'コピー';

  @override
  String get commandsTooltip => 'コマンド';

  @override
  String get providersAndModels => 'プロバイダーとモデル';

  @override
  String modelsConfiguredCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のモデルが設定済み',
    );
    return '$_temp0';
  }

  @override
  String get autoStartEnabledLabel => '自動起動が有効';

  @override
  String get autoStartOffLabel => '自動起動がオフ';

  @override
  String get allToolsEnabled => 'すべてのツールが有効';

  @override
  String toolsDisabledCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count個のツールが無効',
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
  String get officialWebsite => '公式サイト';

  @override
  String get noPendingPairingRequests => '保留中のペアリングリクエストはありません';

  @override
  String get pairingRequestsTitle => 'ペアリングリクエスト';

  @override
  String get gatewayStartingStatus => 'ゲートウェイを起動中...';

  @override
  String get gatewayRetryingStatus => 'ゲートウェイの起動を再試行中...';

  @override
  String get errorStartingGateway => 'ゲートウェイの起動エラー';

  @override
  String get runningStatus => '実行中';

  @override
  String get stoppedStatus => '停止済み';

  @override
  String get notSetUpStatus => '未設定';

  @override
  String get configuredStatus => '設定済み';

  @override
  String get whatsAppConfigSaved => 'WhatsApp設定を保存しました';

  @override
  String get whatsAppDisconnected => 'WhatsAppの接続を解除しました';

  @override
  String get whatsAppTitle => 'WhatsApp';

  @override
  String get applyingSettings => '適用中...';

  @override
  String get reconnectWhatsApp => 'WhatsAppを再接続';

  @override
  String get saveSettingsLabel => '設定を保存';

  @override
  String get applySettingsRestart => '設定を適用して再起動';

  @override
  String get whatsAppMode => 'WhatsAppモード';

  @override
  String get myPersonalNumber => '個人番号';

  @override
  String get myPersonalNumberDesc => '自分のWhatsAppチャットに送信したメッセージでエージェントを起動します。';

  @override
  String get dedicatedBotAccount => '専用ボットアカウント';

  @override
  String get dedicatedBotAccountDesc =>
      'リンクされたアカウント自体から送信されたメッセージは送信メッセージとして無視されます。';

  @override
  String get allowedNumbers => '許可された番号';

  @override
  String get addNumberTitle => '番号を追加';

  @override
  String get phoneNumberJid => '電話番号 / JID';

  @override
  String get noAllowedNumbersConfigured => '許可された番号が設定されていません';

  @override
  String get devicesAppearAfterPairing => 'ペアリングリクエストを承認すると、デバイスがここに表示されます';

  @override
  String get addPhoneNumbersHint => 'ボットの使用を許可する電話番号を追加してください';

  @override
  String get allowedNumber => '許可された番号';

  @override
  String get howToConnect => '接続方法';

  @override
  String get whatsAppConnectInstructions =>
      '1. 上の「WhatsAppを接続」をタップ\n2. QRコードが表示されます — WhatsAppでスキャン\n   （設定 → リンク済みデバイス → デバイスをリンク）\n3. 接続すると、受信メッセージが自動的に\n   アクティブなAIエージェントにルーティングされます';

  @override
  String get whatsAppPairingDesc => '新しい送信者にペアリングコードが発行されます。承認できます。';

  @override
  String get whatsAppAllowlistDesc => '特定の電話番号のみがボットにメッセージを送信できます。';

  @override
  String get whatsAppOpenDesc => 'メッセージを送った人は誰でもボットを使用できます。';

  @override
  String get whatsAppDisabledDesc => 'ボットは受信メッセージに応答しません。';

  @override
  String get sessionExpiredRelink =>
      'セッションが期限切れです。下の「再接続」をタップして新しいQRコードをスキャンしてください。';

  @override
  String get connectWhatsAppBelow => '下の「WhatsAppを接続」をタップしてアカウントをリンクしてください。';

  @override
  String get whatsAppAcceptedQr => 'WhatsAppがQRを受け入れました。リンクを完了しています...';

  @override
  String get waitingForWhatsApp => 'WhatsAppがリンクを完了するのを待っています...';

  @override
  String get focusedLabel => '集中';

  @override
  String get balancedLabel => 'バランス';

  @override
  String get creativeLabel => '創造的';

  @override
  String get preciseLabel => '正確';

  @override
  String get expressiveLabel => '表現豊か';

  @override
  String get browseLabel => '閲覧';

  @override
  String get apiTokenLabel => 'APIトークン';

  @override
  String get connectToClawHub => 'ClawHubに接続';

  @override
  String get clawHubLoginHint => 'ClawHubにログインしてプレミアムスキルにアクセスし、パッケージをインストール';

  @override
  String get howToGetApiToken => 'APIトークンの取得方法：';

  @override
  String get clawHubApiTokenInstructions =>
      '1. clawhub.aiにアクセスしてGitHubでログイン\n2. ターミナルで\"clawhub login\"を実行\n3. トークンをコピーしてここに貼り付け';

  @override
  String connectionFailed(String error) {
    return '接続に失敗しました：$error';
  }

  @override
  String cronJobRuns(int count) {
    return '$count回実行';
  }

  @override
  String nextRunLabel(String time) {
    return '次回実行：$time';
  }

  @override
  String lastErrorLabel(String error) {
    return '最後のエラー：$error';
  }

  @override
  String get cronJobHintText => 'このジョブが起動したときのエージェントへの指示...';

  @override
  String get androidPermissions => 'Android権限';

  @override
  String get androidPermissionsDesc =>
      'FlutterClawはあなたの代わりに画面を操作できます。ボタンのタップ、フォームの入力、スクロール、任意のアプリでの繰り返しタスクの自動化が可能です。';

  @override
  String get twoPermissionsNeeded => '完全な体験には2つの権限が必要です。スキップして後で設定で有効にできます。';

  @override
  String get accessibilityService => 'アクセシビリティサービス';

  @override
  String get accessibilityServiceDesc => 'タップ、スワイプ、入力、画面コンテンツの読み取りを許可';

  @override
  String get displayOverOtherApps => '他のアプリの上に表示';

  @override
  String get displayOverOtherAppsDesc =>
      'エージェントが何をしているかを確認できるフローティングステータスチップを表示';

  @override
  String get changeDefaultModel => 'デフォルトモデルを変更';

  @override
  String setModelAsDefault(String name) {
    return '$nameをデフォルトモデルに設定します。';
  }

  @override
  String alsoUpdateAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return '$count個のエージェント$_temp0も更新';
  }

  @override
  String get startNewSessions => '新しいセッションを開始';

  @override
  String get currentConversationsArchived => '現在の会話はアーカイブされます';

  @override
  String get applyAction => '適用';

  @override
  String applyModelQuestion(String name) {
    return '$nameを適用しますか？';
  }

  @override
  String get setAsDefaultModel => 'デフォルトモデルに設定';

  @override
  String get usedByAgentsWithout => '特定のモデルを持たないエージェントで使用されます';

  @override
  String applyToAgents(int count) {
    String _temp0 = intl.Intl.pluralLogic(count, locale: localeName, other: '');
    return '$count個のエージェント$_temp0に適用';
  }

  @override
  String get providerAlreadyAuth => 'プロバイダーは既に認証済みです — APIキーは不要です。';

  @override
  String get selectFromList => 'リストから選択';

  @override
  String get enterCustomModelId => 'カスタムモデルIDを入力';

  @override
  String get removeSkillTitle => 'スキルを削除しますか？';

  @override
  String get browseClawHubToDiscover => 'ClawHubを閲覧してスキルを発見し、インストール';

  @override
  String get addDeviceTooltip => 'デバイスを追加';

  @override
  String get addNumberTooltip => '番号を追加';

  @override
  String get searchSkillsHint => 'スキルを検索...';

  @override
  String get loginToClawHub => 'ClawHubにログイン';

  @override
  String get accountTooltip => 'アカウント';

  @override
  String get editAction => '編集';

  @override
  String get setAsDefaultAction => 'デフォルトに設定';

  @override
  String get chooseProviderTitle => 'プロバイダーを選択';

  @override
  String get apiKeyTitle => 'APIキー';

  @override
  String get slackConfigSaved => 'Slackを保存しました — 接続するにはゲートウェイを再起動してください';

  @override
  String get signalConfigSaved => 'Signalを保存しました — 接続するにはゲートウェイを再起動してください';

  @override
  String idPrefix(String id) {
    return 'ID：$id';
  }

  @override
  String get addDeviceHint => 'デバイスを追加';

  @override
  String get skipAction => 'スキップ';
}
