import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaApp renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaApp(home: SizedBox()));
    expect(find.byType(NaApp), findsOneWidget);
  });

  testWidgets('NaApp renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaApp(home: SizedBox()));
    expect(find.byType(NaApp), findsOneWidget);
  });
}

