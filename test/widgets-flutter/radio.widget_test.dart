import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaRadio<int> renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaRadio<int>(value: 1, groupValue: 1, onChanged: (v) {}));
    expect(find.byType(NaRadio<int>), findsOneWidget);
  });

  testWidgets('NaRadio<int> renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaRadio<int>(value: 1, groupValue: 1, onChanged: (v) {}));
    expect(find.byType(NaRadio<int>), findsOneWidget);
  });
}


