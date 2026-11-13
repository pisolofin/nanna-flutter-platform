import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaCard optionsBuilder with NaCardOptionsGeneric in Material and Cupertino', (WidgetTester tester) async {
    const Color customSurfaceColor = Color(0xFF1E293B);
    const Color customBorderColor  = Color(0xFF38BDF8);
    const EdgeInsets customMargin  = EdgeInsets.all(6.0);
    const EdgeInsets customPadding = EdgeInsets.all(14.0);
    final BorderRadius customRadius = BorderRadius.circular(18.0);
    const Key innerKey = ValueKey<String>('generic-card-child');

    Widget buildTestCard() {
      return NaCard(
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaCardOptionsGeneric(
          color       : customSurfaceColor,
          margin      : customMargin,
          padding     : customPadding,
          borderRadius: customRadius,
          borderColor : customBorderColor,
          borderWidth : 1.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        ),
        child: const SizedBox(key: innerKey, width: 60.0, height: 30.0),
      );
    }

    await pumpMaterialNaWidget(tester, buildTestCard());
    final Card materialCard = tester.widget(find.byType(Card));
    expect(materialCard.color, customSurfaceColor);
    expect(materialCard.margin, customMargin);
    expect(materialCard.clipBehavior, Clip.antiAliasWithSaveLayer);
    final RoundedRectangleBorder materialShape = materialCard.shape! as RoundedRectangleBorder;
    expect(materialShape.borderRadius, customRadius);
    expect(materialShape.side.color, customBorderColor);
    expect(materialShape.side.width, 1.0);
    final Padding materialPadding = tester.widget(
      find.ancestor(of: find.byKey(innerKey), matching: find.byType(Padding)).first,
    );
    expect(materialPadding.padding, customPadding);

    await pumpCupertinoNaWidget(tester, buildTestCard());
    final Container cupertinoContainer = tester.widget(
      find.descendant(of: find.byType(NaCard), matching: find.byType(Container)),
    );
    expect(cupertinoContainer.margin, customMargin);
    expect(cupertinoContainer.padding, customPadding);
    expect(cupertinoContainer.clipBehavior, Clip.antiAliasWithSaveLayer);
    final BoxDecoration cupertinoDecoration = cupertinoContainer.decoration! as BoxDecoration;
    expect(cupertinoDecoration.color, customSurfaceColor);
    expect(cupertinoDecoration.borderRadius, customRadius);
    final Border cupertinoBorder = cupertinoDecoration.border! as Border;
    expect(cupertinoBorder.top.color, customBorderColor);
    expect(cupertinoBorder.top.width, 1.0);
  });

  testWidgets('NaTextField optionsBuilder with NaTextFieldOptionsGeneric in Material and Cupertino', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      NaTextField(
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaTextFieldOptionsGeneric(
          placeholder       : 'Enter text',
          obscureText       : true,
          obscuringCharacter: '*',
        ),
      ),
    );
    final TextField materialTextField = tester.widget(find.byType(TextField));
    expect(materialTextField.obscureText, isTrue);
    expect(materialTextField.obscuringCharacter, '*');
    expect(materialTextField.decoration?.hintText, 'Enter text');

    await pumpCupertinoNaWidget(
      tester,
      NaTextField(
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaTextFieldOptionsGeneric(
          placeholder       : 'Enter text',
          obscureText       : true,
          obscuringCharacter: '*',
        ),
      ),
    );
    final CupertinoTextField cupertinoTextField = tester.widget(find.byType(CupertinoTextField));
    expect(cupertinoTextField.obscureText, isTrue);
    expect(cupertinoTextField.obscuringCharacter, '*');
    expect(cupertinoTextField.placeholder, 'Enter text');
  });

  testWidgets('NaCheckbox optionsBuilder with NaCheckboxOptionsGeneric in Material and Cupertino', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      NaCheckbox(
        value         : true,
        onChanged     : (bool? value) {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaCheckboxOptionsGeneric(
          autofocus: true,
        ),
      ),
    );
    final Checkbox materialCheckbox = tester.widget(find.byType(Checkbox));
    expect(materialCheckbox.autofocus, isTrue);

    await pumpCupertinoNaWidget(
      tester,
      NaCheckbox(
        value         : true,
        onChanged     : (bool? value) {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaCheckboxOptionsGeneric(
          autofocus: true,
        ),
      ),
    );
    final CupertinoCheckbox cupertinoCheckbox = tester.widget(find.byType(CupertinoCheckbox));
    expect(cupertinoCheckbox.autofocus, isTrue);
  });

  testWidgets('NaSlider optionsBuilder with NaSliderOptionsGeneric in Material and Cupertino', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      NaSlider(
        value         : 0.5,
        onChanged     : (double value) {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaSliderOptionsGeneric(
          divisions: 5,
        ),
      ),
    );
    final Slider materialSlider = tester.widget(find.byType(Slider));
    expect(materialSlider.divisions, 5);

    await pumpCupertinoNaWidget(
      tester,
      NaSlider(
        value         : 0.5,
        onChanged     : (double value) {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaSliderOptionsGeneric(
          divisions: 5,
        ),
      ),
    );
    final CupertinoSlider cupertinoSlider = tester.widget(find.byType(CupertinoSlider));
    expect(cupertinoSlider.divisions, 5);
  });

  testWidgets('NaButton optionsBuilder with NaButtonOptionsGeneric in Material and Cupertino', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      NaButton(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonOptionsGeneric(),
        child         : const Text('Test'),
      ),
    );
    expect(find.byType(ElevatedButton), findsOneWidget);

    await pumpCupertinoNaWidget(
      tester,
      NaButton(
        onPressed     : () {},
        optionsBuilder: (BuildContext context, NaUiType uiType) => NaButtonOptionsGeneric(),
        child         : const Text('Test'),
      ),
    );
    expect(find.byType(CupertinoButton), findsOneWidget);
  });
}
