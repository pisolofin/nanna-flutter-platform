import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import 'test-helpers.dart';

void main() {
  final List<NaSelectionItem<String>> sampleItemList = [
    const NaSelectionItem(value: 'opt1', title: Text('Option 1')),
    const NaSelectionItem(value: 'opt2', title: Text('Option 2')),
  ];

  testWidgets('naShowSelectionModalAsync renders Material Bottom Sheet on mobile', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    String? selectedResult;

    await pumpMaterialNaWidget(
      tester,
      Builder(
        builder: (BuildContext context) {
          return ElevatedButton(
            onPressed: () async {
              selectedResult = await naShowSelectionModalAsync<String>(
                context     : context,
                itemList    : sampleItemList,
                title       : const Text('Select Option'),
                cancelButton: const Text('Cancel'),
              );
            },
            child: const Text('Open'),
          );
        },
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byType(BottomSheet), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Option 1'));
    await tester.pumpAndSettle();

    expect(selectedResult, 'opt1');
  });

  testWidgets('naShowSelectionModalAsync renders Cupertino Action Sheet on mobile', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    String? selectedResult;

    await pumpCupertinoNaWidget(
      tester,
      Builder(
        builder: (BuildContext context) {
          return CupertinoButton(
            onPressed: () async {
              selectedResult = await naShowSelectionModalAsync<String>(
                context     : context,
                itemList    : sampleItemList,
                title       : const Text('Select Option'),
                cancelButton: const Text('Cancel'),
              );
            },
            child: const Text('Open'),
          );
        },
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byType(CupertinoActionSheet), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    expect(selectedResult, 'opt2');
  });

  testWidgets('naShowSelectionModalAsync renders SimpleDialog on tablet in Material', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    String? selectedResult;

    await pumpMaterialNaWidget(
      tester,
      Builder(
        builder: (BuildContext context) {
          return ElevatedButton(
            onPressed: () async {
              selectedResult = await naShowSelectionModalAsync<String>(
                context     : context,
                itemList    : sampleItemList,
                title       : const Text('Select Option'),
                cancelButton: const Text('Cancel'),
              );
            },
            child: const Text('Open'),
          );
        },
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byType(SimpleDialog), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Option 1'));
    await tester.pumpAndSettle();

    expect(selectedResult, 'opt1');
  });

  testWidgets('naShowSelectionModalAsync renders CupertinoAlertDialog on tablet in Cupertino', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    String? selectedResult;

    await pumpCupertinoNaWidget(
      tester,
      Builder(
        builder: (BuildContext context) {
          return CupertinoButton(
            onPressed: () async {
              selectedResult = await naShowSelectionModalAsync<String>(
                context     : context,
                itemList    : sampleItemList,
                title       : const Text('Select Option'),
                cancelButton: const Text('Cancel'),
              );
            },
            child: const Text('Open'),
          );
        },
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(find.byType(CupertinoAlertDialog), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);
    expect(find.text('Option 2'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);

    await tester.tap(find.text('Option 2'));
    await tester.pumpAndSettle();

    expect(selectedResult, 'opt2');
  });

  testWidgets('naShowSelectionModalAsync cancel button pops null', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    String? selectedResult = 'initial';

    await pumpMaterialNaWidget(
      tester,
      Builder(
        builder: (BuildContext context) {
          return ElevatedButton(
            onPressed: () async {
              selectedResult = await naShowSelectionModalAsync<String>(
                context     : context,
                itemList    : sampleItemList,
                cancelButton: const Text('Cancel'),
              );
            },
            child: const Text('Open'),
          );
        },
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(selectedResult, isNull);
  });
}
