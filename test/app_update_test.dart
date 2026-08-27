import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/update/domain/entities/app_update.dart';

Uri manifestUri() => Uri.parse('http://localhost:8080/manifest.json');

Map<String, dynamic> manifest({
  String version = '1.0.13',
  Object? files,
  Object? sha256,
  Object? minSupported,
}) =>
    {
      'version': version,
      'versionCode': 14,
      'notes': 'test notes',
      'files': files ??
          {
            'android': 'my_app-1.0.13.apk',
            'windows': 'my_app-1.0.13.exe',
          },
      'sha256': ?sha256,
      'minSupported': ?minSupported,
    };

void main() {
  group('AppUpdate.fromJson', () {
    test('parses platform file and resolves relative url', () {
      final update = AppUpdate.fromJson(
        manifest(),
        'android',
        manifestUri(),
      );
      expect(update.version, '1.0.13');
      expect(update.versionCode, 14);
      expect(update.notes, 'test notes');
      expect(
        update.fileUrl,
        'http://localhost:8080/my_app-1.0.13.apk',
      );
      expect(update.required, isFalse);
    });

    test('resolves nested relative paths', () {
      final update = AppUpdate.fromJson(
        manifest(files: {'android': 'builds/android/app.apk'}),
        'android',
        manifestUri(),
      );
      expect(
        update.fileUrl,
        'http://localhost:8080/builds/android/app.apk',
      );
    });

    test('parses sha256 for platform', () {
      final update = AppUpdate.fromJson(
        manifest(sha256: {'android': 'abc123'}),
        'android',
        manifestUri(),
      );
      expect(update.sha256, 'abc123');
    });

    test('throws when platform file missing', () {
      expect(
        () => AppUpdate.fromJson(
          manifest(files: {'windows': 'app.exe'}),
          'android',
          manifestUri(),
        ),
        throwsArgumentError,
      );
    });
  });

  group('withRequired', () {
    test('keeps all fields and toggles required', () {
      final update = AppUpdate.fromJson(
        manifest(sha256: {'android': 'abc'}, minSupported: '1.0.0'),
        'android',
        manifestUri(),
      );
      final forced = update.withRequired(true);
      expect(forced.required, isTrue);
      expect(forced.version, update.version);
      expect(forced.fileUrl, update.fileUrl);
      expect(forced.sha256, 'abc');
      expect(forced.minSupported, '1.0.0');
      expect(forced.notes, update.notes);
      expect(update.required, isFalse);
    });
  });
}
