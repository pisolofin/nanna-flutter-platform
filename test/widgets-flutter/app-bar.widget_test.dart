import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaAppBar renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaAppBar());
    expect(find.byType(NaAppBar), findsOneWidget);
  });

  testWidgets('NaAppBar renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaAppBar());
    expect(find.byType(NaAppBar), findsOneWidget);
  });
}

