import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
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
