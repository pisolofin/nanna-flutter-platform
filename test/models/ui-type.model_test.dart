import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  group('NaUiType', () {
    test('standard instances have expected integer values', () {
      expect(NaUiType.none.value, equals(0));
      expect(NaUiType.material.value, equals(1));
      expect(NaUiType.cupertino.value, equals(2));
      expect(NaUiType.values, containsAll([
        NaUiType.none,
        NaUiType.material,
        NaUiType.cupertino,
      ]));
    });

    test('toString returns meaningful representation', () {
      expect(NaUiType.none.toString(), equals('NaUiType.none'));
      expect(NaUiType.material.toString(), equals('NaUiType.material'));
      expect(NaUiType.cupertino.toString(), equals('NaUiType.cupertino'));
      expect(const NaUiType(42).toString(), equals('NaUiType(42)'));
    });
  });
}
