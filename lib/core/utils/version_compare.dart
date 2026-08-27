int compareVersions(String a, String b) {
  final aParts = a.split('.').map((e) => int.tryParse(e) ?? 0).toList();
  final bParts = b.split('.').map((e) => int.tryParse(e) ?? 0).toList();
  final length = aParts.length > bParts.length ? aParts.length : bParts.length;
  for (var i = 0; i < length; i++) {
    final x = i < aParts.length ? aParts[i] : 0;
    final y = i < bParts.length ? bParts[i] : 0;
    if (x != y) return x.compareTo(y);
  }
  return 0;
}
