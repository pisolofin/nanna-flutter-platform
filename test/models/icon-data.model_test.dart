import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  group('NaIconData', () {
    const NaUiType customType = NaUiType(99);

    tearDown(() {
      NaIconData.unregisterPlatformIcons(customType);
    });

    test('resolves default icon when uiType not in map', () {
      const NaIconData iconData = NaIconData(
        Icons.star,
        platformIcons: {
          NaUiType.cupertino: CupertinoIcons.star,
        },
      );

      expect(iconData.resolve(NaUiType.material), equals(Icons.star));
      expect(iconData.resolve(NaUiType.cupertino), equals(CupertinoIcons.star));
      expect(iconData.resolve(const NaUiType(88)), equals(Icons.star));
    });

    test('resolves external registered platform icons', () {
      const NaIconData iconData = NaIconData(Icons.favorite);

      NaIconData.registerPlatformIcons(customType, {
        iconData: CupertinoIcons.heart,
      });

      expect(iconData.resolve(customType), equals(CupertinoIcons.heart));

      NaIconData.unregisterPlatformIcons(customType);
      expect(iconData.resolve(customType), equals(Icons.favorite));
    });
  });
}
