// ignore_for_file: avoid_print — это CLI-скрипт, print здесь уместен
import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:yaml/yaml.dart';

void main(List<String> args) {
  // Читаем версию из pubspec.yaml
  final pubspec = loadYaml(File('pubspec.yaml').readAsStringSync()) as Map;
  final versionFull = pubspec['version'].toString(); // e.g. "1.0.17+18"
  final version = versionFull.split('+').first;
  final versionCode = int.parse(versionFull.split('+').last);

  // APK файл — либо из аргумента, либо из build папки
  final apkPath = args.isNotEmpty
      ? args.first
      : 'build/app/outputs/flutter-apk/app-release.apk';
  final apkFile = File(apkPath);

  if (!apkFile.existsSync()) {
    print('❌ APK не найден: $apkPath');
    print('   Сначала выполни: flutter build apk --release');
    exit(1);
  }

  // Вычисляем SHA-256
  final bytes = apkFile.readAsBytesSync();
  final hash = sha256.convert(bytes).toString();
  print('✅ SHA-256: $hash');

  const owner = 'dakerhel';
  const repo = 'template-basic';
  final apkName = 'my_app-$version.apk';
  final downloadUrl =
      'https://github.com/$owner/$repo/releases/download/v$version/$apkName';

  // Обновляем manifest.json
  final manifestFile = File('updates/manifest.json');
  final manifest =
      jsonDecode(manifestFile.readAsStringSync()) as Map<String, dynamic>;

  manifest['version'] = version;
  manifest['versionCode'] = versionCode;
  manifest['notes'] = 'Release v$version';
  (manifest['sha256'] as Map<String, dynamic>)['android'] = hash;
  (manifest['files'] as Map<String, dynamic>)['android'] = downloadUrl;

  const encoder = JsonEncoder.withIndent('  ');
  manifestFile.writeAsStringSync('${encoder.convert(manifest)}\n');

  print('✅ manifest.json обновлён: версия $version ($versionCode)');
  print('   URL: $downloadUrl');
}
