import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaTextFieldTitle renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const NaTextFieldTitle(
        title    : 'Test Title',
        textField: NaTextField(),
      ),
    );
    expect(find.byType(NaTextFieldTitle), findsOneWidget);
    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('NaTextFieldTitle renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(
      tester,
      const NaTextFieldTitle(
        title    : 'Test Title',
        textField: NaTextField(),
      ),
    );
    expect(find.byType(NaTextFieldTitle), findsOneWidget);
    expect(find.text('Test Title'), findsOneWidget);
  });

  testWidgets('NaTextFieldTitle renders on border in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const NaTextFieldTitle(
        title        : 'On Border Title',
        titlePosition: NaTextFieldTitlePosition.onBorder,
        textField    : NaTextField(),
      ),
    );
    expect(find.byType(NaTextFieldTitle), findsOneWidget);
    expect(find.text('On Border Title'), findsOneWidget);
    expect(find.byType(Stack), findsWidgets);
  });

  testWidgets('NaTextFieldTitle renders on border in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(
      tester,
      const NaTextFieldTitle(
        title        : 'On Border Title Cupertino',
        titlePosition: NaTextFieldTitlePosition.onBorder,
        textField    : NaTextField(),
      ),
    );
    expect(find.byType(NaTextFieldTitle), findsOneWidget);
    expect(find.text('On Border Title Cupertino'), findsOneWidget);
    expect(find.byType(Stack), findsWidgets);
  });

  testWidgets('NaTextFieldTitle shows title when text is entered', (WidgetTester tester) async {
    final TextEditingController textEditingController = TextEditingController();

    await pumpMaterialNaWidget(
      tester,
      NaTextFieldTitle(
        title     : 'Dynamic Title',
        controller: textEditingController,
        textField : NaTextField(
          controller: textEditingController,
        ),
      ),
    );

    // Initial state: empty and not focused
    final Visibility initialVisibility = tester.widget<Visibility>(find.byType(Visibility));
    expect(initialVisibility.visible, isFalse);

    // Enter text
    textEditingController.text = 'Hello';
    await tester.pump();

    final Visibility updatedVisibility = tester.widget<Visibility>(find.byType(Visibility));
    expect(updatedVisibility.visible, isTrue);
  });

  testWidgets('NaTextFieldTitle shows title on border when text is entered', (WidgetTester tester) async {
    final TextEditingController textEditingController = TextEditingController();

    await pumpMaterialNaWidget(
      tester,
      NaTextFieldTitle(
        title        : 'Dynamic Border Title',
        titlePosition: NaTextFieldTitlePosition.onBorder,
        controller   : textEditingController,
        textField    : NaTextField(
          controller: textEditingController,
        ),
      ),
    );

    // Initial state: empty and not focused
    final Visibility initialVisibility = tester.widget<Visibility>(find.byType(Visibility));
    expect(initialVisibility.visible, isFalse);

    // Enter text
    textEditingController.text = 'Hello';
    await tester.pump();

    final Visibility updatedVisibility = tester.widget<Visibility>(find.byType(Visibility));
    expect(updatedVisibility.visible, isTrue);
  });

  testWidgets('NaTextFieldTitle removes any border from textField in Material style', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const NaTextFieldTitle(
        title    : 'Material Title',
        textField: NaTextField(),
      ),
    );

    final TextField textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.decoration?.border, equals(InputBorder.none));
    expect(textField.decoration?.enabledBorder, equals(InputBorder.none));
    expect(textField.decoration?.focusedBorder, equals(InputBorder.none));
    expect(textField.decoration?.disabledBorder, equals(InputBorder.none));
    expect(textField.decoration?.errorBorder, equals(InputBorder.none));
    expect(textField.decoration?.focusedErrorBorder, equals(InputBorder.none));
  });

  testWidgets('NaTextFieldTitle removes any border from custom decorated NaTextField in Material style', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      NaTextFieldTitle(
        title    : 'Custom Material Title',
        textField: NaTextField(
          optionsBuilder: (BuildContext context, NaUiType uiType) {
            return NaTextFieldOptionsMaterial(
              decoration: const InputDecoration(
                border       : OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
            );
          },
        ),
      ),
    );

    final TextField textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.decoration?.border, equals(InputBorder.none));
    expect(textField.decoration?.enabledBorder, equals(InputBorder.none));
    expect(textField.decoration?.focusedBorder, equals(InputBorder.none));
    expect(textField.decoration?.disabledBorder, equals(InputBorder.none));
    expect(textField.decoration?.errorBorder, equals(InputBorder.none));
    expect(textField.decoration?.focusedErrorBorder, equals(InputBorder.none));
  });

  testWidgets('NaTextFieldTitle removes border from raw TextField in Material style via Theme', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const NaTextFieldTitle(
        title    : 'Raw Material Title',
        textField: TextField(),
      ),
    );

    final Theme themeWidget = tester.widget<Theme>(
      find.ancestor(
        of      : find.byType(TextField),
        matching: find.byType(Theme),
      ).first,
    );
    expect(themeWidget.data.inputDecorationTheme.border, equals(InputBorder.none));
    expect(themeWidget.data.inputDecorationTheme.enabledBorder, equals(InputBorder.none));
    expect(themeWidget.data.inputDecorationTheme.focusedBorder, equals(InputBorder.none));
  });

  test('NaTextFieldTitle copyWith updates titlePosition and titleBackgroundColor', () {
    const NaTextFieldTitle originalWidget = NaTextFieldTitle(
      title    : 'Original',
      textField: NaTextField(),
    );

    expect(originalWidget.titlePosition, equals(NaTextFieldTitlePosition.above));
    expect(originalWidget.titleBackgroundColor, isNull);

    final NaTextFieldTitle updatedWidget = originalWidget.copyWith(
      titlePosition       : NaTextFieldTitlePosition.onBorder,
      titleBackgroundColor: const Color(0xFFFFFFFF),
    );

    expect(updatedWidget.titlePosition, equals(NaTextFieldTitlePosition.onBorder));
    expect(updatedWidget.titleBackgroundColor, equals(const Color(0xFFFFFFFF)));
  });
}
