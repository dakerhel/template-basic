int compareVersions(String a, String b) {
  String clean(String v) {
    var s = v.trim();
    if (s.startsWith('v') || s.startsWith('V')) s = s.substring(1);
    final plusIdx = s.indexOf('+');
    if (plusIdx != -1) s = s.substring(0, plusIdx);
    final dashIdx = s.indexOf('-');
    if (dashIdx != -1) s = s.substring(0, dashIdx);
    return s;
  }

  final aParts = clean(a).split('.').map((e) => int.tryParse(e) ?? 0).toList();
  final bParts = clean(b).split('.').map((e) => int.tryParse(e) ?? 0).toList();
  final length = aParts.length > bParts.length ? aParts.length : bParts.length;
  for (var i = 0; i < length; i++) {
    final x = i < aParts.length ? aParts[i] : 0;
    final y = i < bParts.length ? bParts[i] : 0;
    if (x != y) return x.compareTo(y);
  }
  return 0;
}
