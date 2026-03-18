/// Maps a media content type to the WhatsApp CDN upload path segment.
const mediaTypeUploadPath = {
  'image': 'image',
  'video': 'video',
  'audio': 'audio',
  'document': 'document',
  'sticker': 'image',
  'history': 'md-app-state',
  'md-app-state': 'md-app-state',
};

/// Mime type → WhatsApp media type string.
const mimeToMediaType = {
  'image/jpeg': 'image',
  'image/png': 'image',
  'image/webp': 'sticker',
  'image/gif': 'video',
  'video/mp4': 'video',
  'video/quicktime': 'video',
  'audio/ogg; codecs=opus': 'audio',
  'audio/ogg': 'audio',
  'audio/mpeg': 'audio',
  'audio/mp4': 'audio',
};

/// Infer the WhatsApp media type from a MIME type string.
String mediaTypeFromMime(String mime) {
  final norm = mime.toLowerCase().split(';').first.trim();
  return mimeToMediaType[norm] ?? 'document';
}

/// AES-256-CBC media key expansion info strings.
const mediaKeyInfo = {
  'image': 'WhatsApp Image Keys',
  'video': 'WhatsApp Video Keys',
  'audio': 'WhatsApp Audio Keys',
  'document': 'WhatsApp Document Keys',
  'sticker': 'WhatsApp Image Keys',
  'history': 'WhatsApp History Keys',
  'md-app-state': 'WhatsApp App State Keys',
};
