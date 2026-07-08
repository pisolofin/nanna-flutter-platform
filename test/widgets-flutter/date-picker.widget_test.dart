import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaDatePicker renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now(), onDateChanged: (v) {}));
    expect(find.byType(NaDatePicker), findsOneWidget);
  });

  testWidgets('NaDatePicker renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now(), onDateChanged: (v) {}));
    expect(find.byType(NaDatePicker), findsOneWidget);
  });
}




