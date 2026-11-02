import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

class _CustomTestWidget extends NaWidget {
  const _CustomTestWidget();

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    return const SizedBox();
  }
}

void main() {
  group('Platform Builder Service', () {
    const NaUiType customType = NaUiType(50);

    tearDown(() {
      naPlatformServiceResetWidgetBuilders();
    });

    test('registers and retrieves custom widget builder', () {
      naPlatformServiceRegisterWidgetBuilder<_CustomTestWidget>(
        customType,
        (BuildContext context, _CustomTestWidget widget) {
          return const Text('custom_built');
        },
      );

      final NaWidgetBuilder? builder = naPlatformServiceGetWidgetBuilder(
        _CustomTestWidget,
        customType,
      );

      expect(builder, isNotNull);
    });

    test('returns null for unregistered types', () {
      final NaWidgetBuilder? builder = naPlatformServiceGetWidgetBuilder(
        _CustomTestWidget,
        const NaUiType(77),
      );

      expect(builder, isNull);
    });

    test('naPlatformServiceResetWidgetBuilders clears all builders', () {
      naPlatformServiceRegisterWidgetBuilder<_CustomTestWidget>(
        customType,
        (BuildContext context, _CustomTestWidget widget) => const SizedBox(),
      );

      naPlatformServiceResetWidgetBuilders();

      expect(
        naPlatformServiceGetWidgetBuilder(_CustomTestWidget, customType),
        isNull,
      );
    });
  });
}
