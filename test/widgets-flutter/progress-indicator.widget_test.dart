import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaProgressIndicator renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaProgressIndicator());
    expect(find.byType(NaProgressIndicator), findsOneWidget);
  });

  testWidgets('NaProgressIndicator renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaProgressIndicator());
    expect(find.byType(NaProgressIndicator), findsOneWidget);
  });
}

