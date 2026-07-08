import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaIcon renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaIcon(NaIcons.info));
    expect(find.byType(NaIcon), findsOneWidget);
  });

  testWidgets('NaIcon renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaIcon(NaIcons.info));
    expect(find.byType(NaIcon), findsOneWidget);
  });
}


