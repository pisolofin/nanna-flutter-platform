import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaCard renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaCard(child: SizedBox()));
    expect(find.byType(NaCard), findsOneWidget);
  });

  testWidgets('NaCard renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaCard(child: SizedBox()));
    expect(find.byType(NaCard), findsOneWidget);
  });
}

