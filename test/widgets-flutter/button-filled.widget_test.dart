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

  testWidgets('NaButtonFilled applies color in Material via generic and material options', (WidgetTester tester) async {
    const Color expectedColor = Color(0xFFFF0000);

    // Generic options
    await pumpMaterialNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsGeneric(
          color: expectedColor,
        ),
        child: const Text('Button'),
      ),
    );
    final FilledButton genericFilledButton = tester.widget(find.byType(FilledButton));
    expect(genericFilledButton.style?.backgroundColor?.resolve(<WidgetState>{}), expectedColor);

    // Material options
    await pumpMaterialNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsMaterial(
          color: expectedColor,
        ),
        child: const Text('Button'),
      ),
    );
    final FilledButton materialFilledButton = tester.widget(find.byType(FilledButton));
    expect(materialFilledButton.style?.backgroundColor?.resolve(<WidgetState>{}), expectedColor);
  });

  testWidgets('NaButtonFilled applies color in Cupertino via generic and cupertino options', (WidgetTester tester) async {
    const Color expectedColor = Color(0xFF00FF00);

    // Generic options
    await pumpCupertinoNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsGeneric(
          color: expectedColor,
        ),
        child: const Text('Button'),
      ),
    );
    final CupertinoButton genericCupertinoButton = tester.widget(find.byType(CupertinoButton));
    expect(genericCupertinoButton.color, expectedColor);

    // Cupertino options
    await pumpCupertinoNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsCupertino(
          color: expectedColor,
        ),
        child: const Text('Button'),
      ),
    );
    final CupertinoButton cupertinoButton = tester.widget(find.byType(CupertinoButton));
    expect(cupertinoButton.color, expectedColor);
  });

  testWidgets('NaButtonFilled applies padding in Material via generic and material options', (WidgetTester tester) async {
    const EdgeInsets expectedPadding = EdgeInsets.all(16.0);

    // Generic options
    await pumpMaterialNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsGeneric(
          padding: expectedPadding,
        ),
        child: const Text('Button'),
      ),
    );
    final FilledButton genericFilledButton = tester.widget(find.byType(FilledButton));
    expect(genericFilledButton.style?.padding?.resolve(<WidgetState>{}), expectedPadding);

    // Material options
    await pumpMaterialNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsMaterial(
          padding: expectedPadding,
        ),
        child: const Text('Button'),
      ),
    );
    final FilledButton materialFilledButton = tester.widget(find.byType(FilledButton));
    expect(materialFilledButton.style?.padding?.resolve(<WidgetState>{}), expectedPadding);
  });

  testWidgets('NaButtonFilled applies padding in Cupertino via generic and cupertino options', (WidgetTester tester) async {
    const EdgeInsets expectedPadding = EdgeInsets.all(12.0);

    // Generic options
    await pumpCupertinoNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsGeneric(
          padding: expectedPadding,
        ),
        child: const Text('Button'),
      ),
    );
    final CupertinoButton genericCupertinoButton = tester.widget(find.byType(CupertinoButton));
    expect(genericCupertinoButton.padding, expectedPadding);

    // Cupertino options
    await pumpCupertinoNaWidget(
      tester,
      NaButtonFilled(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonFilledOptionsCupertino(
          padding: expectedPadding,
        ),
        child: const Text('Button'),
      ),
    );
    final CupertinoButton cupertinoButton = tester.widget(find.byType(CupertinoButton));
    expect(cupertinoButton.padding, expectedPadding);
  });
}
