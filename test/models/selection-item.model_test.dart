import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  group('NaSelectionItem', () {
    test('creates item with default values', () {
      const NaSelectionItem<String> item = NaSelectionItem(
        value: 'val1',
        title: Text('Title 1'),
      );

      expect(item.value, equals('val1'));
      expect(item.subtitle, isNull);
      expect(item.leading, isNull);
      expect(item.trailing, isNull);
      expect(item.isDestructive, isFalse);
      expect(item.isDefault, isFalse);
      expect(item.isSelected, isFalse);
      expect(item.isEnabled, isTrue);
      expect(item.onTap, isNull);
    });

    test('creates item with text factory', () {
      bool tapped = false;
      final NaSelectionItem<int> item = NaSelectionItem.text(
        value        : 10,
        text         : 'Number 10',
        subtitleText : 'Subtitle',
        isDestructive: true,
        isDefault    : true,
        isSelected   : true,
        isEnabled    : false,
        onTap        : () {
          tapped = true;
        },
      );

      expect(item.value, equals(10));
      expect(item.isDestructive, isTrue);
      expect(item.isDefault, isTrue);
      expect(item.isSelected, isTrue);
      expect(item.isEnabled, isFalse);
      item.onTap?.call();
      expect(tapped, isTrue);
    });

    test('copyWith updates properties correctly', () {
      const NaSelectionItem<String> original = NaSelectionItem(
        value: 'orig',
        title: Text('Original'),
      );

      final NaSelectionItem<String> copy = original.copyWith(
        value     : 'newVal',
        isSelected: true,
      );

      expect(copy.value, equals('newVal'));
      expect(copy.isSelected, isTrue);
      expect(copy.isDestructive, isFalse);
    });
  });
}
