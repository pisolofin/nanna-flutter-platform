import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaButtonFilled renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      NaButtonFilled(
        onPressed: () {},
        child    : const Text('Button'),
      ),
    );
    expect(find.byType(NaButtonFilled), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
    expect(find.text('Button'), findsOneWidget);
  });

  testWidgets('NaButtonFilled renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(
      tester,
      NaButtonFilled(
        onPressed: () {},
        child    : const Text('Button'),
      ),
    );
    expect(find.byType(NaButtonFilled), findsOneWidget);
    expect(find.byType(CupertinoButton), findsOneWidget);
    expect(find.text('Button'), findsOneWidget);
  });
}
