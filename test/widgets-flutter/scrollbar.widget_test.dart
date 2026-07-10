import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaScrollbar renders Scrollbar in material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      NaScrollbar(
        child: ListView(children: const [Text('Item 1')]),
      ),
    );

    expect(find.byType(Scrollbar), findsOneWidget);
  });

  testWidgets('NaScrollbar renders CupertinoScrollbar in cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(
      tester,
      NaScrollbar(
        child: ListView(children: const [Text('Item 1')]),
      ),
    );

    expect(find.byType(CupertinoScrollbar), findsOneWidget);
  });
}
