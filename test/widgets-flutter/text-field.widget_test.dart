import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaTextField renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaTextField());
    expect(find.byType(NaTextField), findsOneWidget);
  });

  testWidgets('NaTextField renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaTextField());
    expect(find.byType(NaTextField), findsOneWidget);
  });
}

