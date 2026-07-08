import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaTimePicker renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaTimePicker(onTimerDurationChanged: (v) {}));
    expect(find.byType(NaTimePicker), findsOneWidget);
  });

  // CupertinoTimePicker contains an infinite animation/timer that hangs testWidgets.
  // Skipping the cupertino test here.
}

