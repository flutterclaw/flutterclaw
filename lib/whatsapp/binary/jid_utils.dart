/// WhatsApp JID (Jabber ID) utilities.
/// Port of Baileys WABinary/jid-utils.ts.
library;

const sWhatsAppNet = '@s.whatsapp.net';
const officialBizJid = '16505361212@c.us';
const serverJid = 'server@c.us';
const psaWid = '0@c.us';
const storiesJid = 'status@broadcast';
const metaAiJid = '13135550002@c.us';

/// JID server domain types.
enum WAJIDDomains {
  whatsapp(0),
  lid(1),
  hosted(128),
  hostedLid(129);

  final int value;
  const WAJIDDomains(this.value);
}

/// Decoded JID components.
class FullJid {
  final String user;
  final String server;
  final int? device;
  final int? domainType;

  const FullJid({
    required this.user,
    required this.server,
    this.device,
    this.domainType,
  });
}

/// Get server name from domain type.
String getServerFromDomainType(String initialServer, int? domainType) {
  switch (domainType) {
    case 1: // WAJIDDomains.lid
      return 'lid';
    case 128: // WAJIDDomains.hosted
      return 'hosted';
    case 129: // WAJIDDomains.hostedLid
      return 'hosted.lid';
    case 0: // WAJIDDomains.whatsapp
    default:
      return initialServer;
  }
}

/// Encode JID components into a string.
String jidEncode(String? user, String server, [int? device, int? agent]) {
  final userPart = user ?? '';
  final agentPart = (agent != null && agent != 0) ? '_$agent' : '';
  final devicePart = (device != null && device != 0) ? ':$device' : '';
  return '$userPart$agentPart$devicePart@$server';
}

/// Decode a JID string into its components.
FullJid? jidDecode(String? jid) {
  if (jid == null) return null;
  final sepIdx = jid.indexOf('@');
  if (sepIdx < 0) return null;

  final server = jid.substring(sepIdx + 1);
  final userCombined = jid.substring(0, sepIdx);

  final deviceParts = userCombined.split(':');
  final userAgent = deviceParts[0];
  final device = deviceParts.length > 1 ? int.tryParse(deviceParts[1]) : null;

  final agentParts = userAgent.split('_');
  final user = agentParts[0];
  final agent = agentParts.length > 1 ? int.tryParse(agentParts[1]) : null;

  int domainType = WAJIDDomains.whatsapp.value;
  if (server == 'lid') {
    domainType = WAJIDDomains.lid.value;
  } else if (server == 'hosted') {
    domainType = WAJIDDomains.hosted.value;
  } else if (server == 'hosted.lid') {
    domainType = WAJIDDomains.hostedLid.value;
  } else if (agent != null) {
    domainType = agent;
  }

  return FullJid(
    server: server,
    user: user,
    domainType: domainType,
    device: device,
  );
}

/// Check if two JIDs belong to the same user.
bool areJidsSameUser(String? jid1, String? jid2) =>
    jidDecode(jid1)?.user == jidDecode(jid2)?.user;

bool isJidMetaAI(String? jid) => jid?.endsWith('@bot') ?? false;
bool isPnUser(String? jid) => jid?.endsWith('@s.whatsapp.net') ?? false;
bool isLidUser(String? jid) => jid?.endsWith('@lid') ?? false;
bool isJidBroadcast(String? jid) => jid?.endsWith('@broadcast') ?? false;
bool isJidGroup(String? jid) => jid?.endsWith('@g.us') ?? false;
bool isJidStatusBroadcast(String? jid) => jid == 'status@broadcast';
bool isJidNewsletter(String? jid) => jid?.endsWith('@newsletter') ?? false;
bool isHostedPnUser(String? jid) => jid?.endsWith('@hosted') ?? false;
bool isHostedLidUser(String? jid) => jid?.endsWith('@hosted.lid') ?? false;

final _botRegexp = RegExp(r'^1313555\d{4}$|^131655500\d{2}$');

bool isJidBot(String? jid) =>
    jid != null &&
    _botRegexp.hasMatch(jid.split('@')[0]) &&
    jid.endsWith('@c.us');

/// Normalize a JID to the standard WhatsApp format.
String jidNormalizedUser(String? jid) {
  final result = jidDecode(jid);
  if (result == null) return '';
  final server = result.server == 'c.us' ? 's.whatsapp.net' : result.server;
  return jidEncode(result.user, server);
}

/// Transfer device ID from one JID to another.
String transferDevice(String fromJid, String toJid) {
  final fromDecoded = jidDecode(fromJid);
  final deviceId = fromDecoded?.device ?? 0;
  final toDecoded = jidDecode(toJid)!;
  return jidEncode(toDecoded.user, toDecoded.server, deviceId);
}

bool jidHasDevice(String? jid) => (jidDecode(jid)?.device ?? 0) != 0;

String jidWithoutDevice(String? jid) {
  final decoded = jidDecode(jid);
  if (decoded == null) return jid ?? '';
  return jidEncode(decoded.user, decoded.server);
}
