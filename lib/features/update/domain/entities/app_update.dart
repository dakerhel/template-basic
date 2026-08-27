class AppUpdate {
  const AppUpdate({
    required this.version,
    required this.fileUrl,
    this.versionCode,
    this.notes,
    this.sha256,
    this.minSupported,
    this.required = false,
  });

  final String version;
  final int? versionCode;
  final String? notes;
  final String fileUrl;
  final String? sha256;
  final String? minSupported;
  final bool required;

  AppUpdate withRequired(bool value) => AppUpdate(
    version: version,
    fileUrl: fileUrl,
    versionCode: versionCode,
    notes: notes,
    sha256: sha256,
    minSupported: minSupported,
    required: value,
  );

  factory AppUpdate.fromJson(
    Map<String, dynamic> json,
    String platform,
    Uri manifestUrl,
  ) {
    final files = json['files'] as Map<String, dynamic>? ?? const {};
    final rawUrl = files[platform] as String?;
    if (rawUrl == null) {
      throw ArgumentError('В манифесте нет файла для платформы $platform');
    }
    final resolved = manifestUrl.resolve('.').resolve(rawUrl);
    final hashes = json['sha256'] as Map<String, dynamic>?;
    return AppUpdate(
      version: json['version'] as String,
      versionCode: json['versionCode'] as int?,
      notes: json['notes'] as String?,
      sha256: hashes?[platform] as String?,
      minSupported: json['minSupported'] as String?,
      fileUrl: resolved.toString(),
    );
  }
}
