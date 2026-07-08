import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaSwitch renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaSwitch(value: true, onChanged: (v) {}));
    expect(find.byType(NaSwitch), findsOneWidget);
  });

  testWidgets('NaSwitch renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaSwitch(value: true, onChanged: (v) {}));
    expect(find.byType(NaSwitch), findsOneWidget);
  });
}


