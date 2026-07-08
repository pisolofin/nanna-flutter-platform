import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaListTile renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaListTile(title: SizedBox()));
    expect(find.byType(NaListTile), findsOneWidget);
  });

  testWidgets('NaListTile renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaListTile(title: SizedBox()));
    expect(find.byType(NaListTile), findsOneWidget);
  });
}

