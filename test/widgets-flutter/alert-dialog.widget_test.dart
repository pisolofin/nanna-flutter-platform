import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaAlertDialog renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaAlertDialog());
    expect(find.byType(NaAlertDialog), findsOneWidget);
  });

  testWidgets('NaAlertDialog renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaAlertDialog());
    expect(find.byType(NaAlertDialog), findsOneWidget);
  });
}

