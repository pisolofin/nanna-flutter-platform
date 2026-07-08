import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaScaffold renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaScaffold(body: SizedBox()));
    expect(find.byType(NaScaffold), findsOneWidget);
  });

  testWidgets('NaScaffold renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaScaffold(body: SizedBox()));
    expect(find.byType(NaScaffold), findsOneWidget);
  });
}

