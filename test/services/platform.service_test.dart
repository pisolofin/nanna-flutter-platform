import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  group('Platform Service', () {
    setUp(() {
      naPlatformServiceResetUiTypes();
    });

    tearDown(() {
      naPlatformServiceResetUiTypes();
    });

    test('naPlatformServiceInit registers built-in types without errors', () {
      expect(() => naPlatformServiceInit(), returnsNormally);
    });

    test('naPlatformServiceInit is idempotent and can be called multiple times', () {
      naPlatformServiceInit();
      expect(() => naPlatformServiceInit(), returnsNormally);
    });
  });
}
