import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaCheckbox renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaCheckbox(value: true, onChanged: (v) {}));
    expect(find.byType(NaCheckbox), findsOneWidget);
  });

  testWidgets('NaCheckbox renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaCheckbox(value: true, onChanged: (v) {}));
    expect(find.byType(NaCheckbox), findsOneWidget);
  });
}


