import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  group('NaTimePicker', () {
    testWidgets('renders in Material with initial duration', (WidgetTester tester) async {
      Duration? selected;
      await pumpMaterialNaWidget(
        tester,
        NaTimePicker(
          initialTimerDuration  : const Duration(hours: 4, minutes: 15, seconds: 30),
          onTimerDurationChanged: (Duration v) {
            selected = v;
          },
        ),
      );

      expect(find.byType(NaTimePicker), findsOneWidget);
      expect(find.text('04'), findsOneWidget);
      expect(find.text('15'), findsOneWidget);
      expect(find.text('30'), findsOneWidget);
      expect(selected, isNull);
    });

    testWidgets('supports optionsBuilder and custom labels in Material', (WidgetTester tester) async {
      await pumpMaterialNaWidget(
        tester,
        NaTimePicker(
          initialTimerDuration  : const Duration(hours: 1, minutes: 2),
          onTimerDurationChanged: (Duration v) {},
          optionsBuilder        : (context, uiType) {
            return NaTimePickerOptionsMaterial(
              hourLabelText  : 'hours',
              minuteLabelText: 'mins',
              showSeconds    : false,
            );
          },
        ),
      );

      expect(find.text('hours'), findsOneWidget);
      expect(find.text('mins'), findsOneWidget);
      expect(find.text('s'), findsNothing);
    });

    testWidgets('renders in Cupertino', (WidgetTester tester) async {
      await tester.pumpWidget(
        NaUiTypeScope(
          uiTypes: const [NaUiType.cupertino],
          child  : CupertinoApp(
            home: CupertinoPageScaffold(
              child: NaTimePicker(
                initialTimerDuration  : const Duration(hours: 2, minutes: 10),
                onTimerDurationChanged: (Duration v) {},
              ),
            ),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(NaTimePicker), findsOneWidget);
      expect(find.byType(CupertinoTimerPicker), findsOneWidget);
    });

    test('copyWith updates properties properly', () {
      final NaTimePicker original = NaTimePicker(
        initialTimerDuration  : const Duration(hours: 1),
        onTimerDurationChanged: (Duration v) {},
      );

      final NaTimePicker copy = original.copyWith(
        initialTimerDuration: const Duration(hours: 3),
      );

      expect(copy.initialTimerDuration, equals(const Duration(hours: 3)));
    });
  });
}
