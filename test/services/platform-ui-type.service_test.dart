import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  group('Platform UI Type Service', () {
    setUp(() {
      naPlatformServiceResetUiTypes();
    });

    tearDown(() {
      naPlatformServiceResetUiTypes();
    });

    test('registers unique UI type and returns valid system UI type', () {
      final NaUiType registeredType = naPlatformServiceRegisterUiType(
        styleId: 'test_style',
        uiType : 'fluent',
      );

      expect(registeredType.value, greaterThanOrEqualTo(100));
    });

    test('throws NaUiTypeAlreadyRegisteredException on duplicate key', () {
      naPlatformServiceRegisterUiType(
        styleId: 'duplicate_test',
        uiType : 'macos',
      );

      expect(
        () => naPlatformServiceRegisterUiType(
          styleId: 'duplicate_test',
          uiType : 'macos',
        ),
        throwsA(isA<NaUiTypeAlreadyRegisteredException>()),
      );
    });

    test('naPlatformServiceResetUiTypes clears all registered types', () {
      naPlatformServiceRegisterUiType(
        styleId: 'reset_test',
        uiType : 'style1',
      );

      naPlatformServiceResetUiTypes();

      // Registering the exact same key now succeeds without throwing
      final NaUiType registered = naPlatformServiceRegisterUiType(
        styleId: 'reset_test',
        uiType : 'style1',
      );
      expect(registered.value, equals(101));
    });
  });
}
