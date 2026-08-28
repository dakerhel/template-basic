import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/utils/version_compare.dart';

void main() {
  group('compareVersions', () {
    test('equal versions return 0', () {
      expect(compareVersions('1.0.0', '1.0.0'), 0);
      expect(compareVersions('2.3.4', '2.3.4'), 0);
    });

    test('major beats minor beats patch', () {
      expect(compareVersions('2.0.0', '1.9.9'), greaterThan(0));
      expect(compareVersions('1.1.0', '1.0.9'), greaterThan(0));
      expect(compareVersions('1.0.2', '1.0.1'), greaterThan(0));
      expect(compareVersions('1.0.1', '1.0.2'), lessThan(0));
    });

    test('shorter version padded with zeros', () {
      expect(compareVersions('1.0', '1.0.0'), 0);
      expect(compareVersions('1', '1.0.0'), 0);
      expect(compareVersions('1.0.0.1', '1.0.0'), greaterThan(0));
    });

    test('multi-digit segments', () {
      expect(compareVersions('1.0.10', '1.0.9'), greaterThan(0));
      expect(compareVersions('1.10.0', '1.9.0'), greaterThan(0));
      expect(compareVersions('10.0.0', '9.99.99'), greaterThan(0));
    });

    test('handles v prefix and build metadata', () {
      expect(compareVersions('v1.0.1', '1.0.0'), greaterThan(0));
      expect(compareVersions('1.0.39+40', '1.0.38'), greaterThan(0));
      expect(compareVersions('1.0.39+40', '1.0.39'), 0);
      expect(compareVersions('1.0.0-beta.1', '1.0.0'), 0);
    });

    test('garbage segments treated as zero', () {
      expect(compareVersions('1.0.x', '1.0.0'), 0);
      expect(compareVersions('abc', '0.0.0'), 0);
    });
  });
}
