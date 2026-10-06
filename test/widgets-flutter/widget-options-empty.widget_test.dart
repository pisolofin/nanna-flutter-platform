import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  test('NaCardOptions .empty constructors create instances with default values', () {
    final NaCardOptions baseEmpty = NaCardOptions.empty();
    expect(baseEmpty, isA<NaCardOptionsGeneric>());

    final NaCardOptionsGeneric genericEmpty = NaCardOptionsGeneric.empty();
    expect(genericEmpty.color, isNull);
    expect(genericEmpty.margin, isNull);

    final NaCardOptionsMaterial materialEmpty = NaCardOptionsMaterial.empty();
    expect(materialEmpty.elevation, isNull);
    expect(materialEmpty.color, isNull);

    final NaCardOptionsCupertino cupertinoEmpty = NaCardOptionsCupertino.empty();
    expect(cupertinoEmpty.padding, isNull);
    expect(cupertinoEmpty.borderRadius, isNull);
  });

  test('NaSearchBarOptionsCupertino .empty constructor retains platform defaults', () {
    final NaSearchBarOptionsCupertino cupertinoEmpty = NaSearchBarOptionsCupertino.empty();
    expect(cupertinoEmpty.decoration, isNull);
    expect(cupertinoEmpty.padding, const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0));
    expect(cupertinoEmpty.itemSize, 20.0);
  });

  test('NaScrollbarOptionsCupertino .empty constructor retains platform defaults', () {
    final NaScrollbarOptionsCupertino cupertinoEmpty = NaScrollbarOptionsCupertino.empty();
    expect(cupertinoEmpty.thickness, CupertinoScrollbar.defaultThickness);
    expect(cupertinoEmpty.thicknessWhileDragging, CupertinoScrollbar.defaultThicknessWhileDragging);
    expect(cupertinoEmpty.radius, CupertinoScrollbar.defaultRadius);
    expect(cupertinoEmpty.radiusWhileDragging, CupertinoScrollbar.defaultRadiusWhileDragging);
  });

  test('All abstract Na*Options .empty factory constructors instantiate Generic options', () {
    expect(NaAlertDialogOptions.empty(), isA<NaAlertDialogOptionsGeneric>());
    expect(NaAppBarOptions.empty(), isA<NaAppBarOptionsGeneric>());
    expect(NaAppOptions.empty(), isA<NaAppOptionsGeneric>());
    expect(NaBottomNavigationBarOptions.empty(), isA<NaBottomNavigationBarOptionsGeneric>());
    expect(NaButtonFilledOptions.empty(), isA<NaButtonFilledOptionsGeneric>());
    expect(NaButtonOptions.empty(), isA<NaButtonOptionsGeneric>());
    expect(NaCardOptions.empty(), isA<NaCardOptionsGeneric>());
    expect(NaCheckboxOptions.empty(), isA<NaCheckboxOptionsGeneric>());
    expect(NaDatePickerOptions.empty(), isA<NaDatePickerOptionsGeneric>());
    expect(NaDialogActionOptions.empty(), isA<NaDialogActionOptionsGeneric>());
    expect(NaIconButtonOptions.empty(), isA<NaIconButtonOptionsGeneric>());
    expect(NaIconOptions.empty(), isA<NaIconOptionsGeneric>());
    expect(NaListTileOptions.empty(), isA<NaListTileOptionsGeneric>());
    expect(NaPageOptions.empty(), isA<NaPageOptionsGeneric>());
    expect(NaProgressIndicatorOptions.empty(), isA<NaProgressIndicatorOptionsGeneric>());
    expect(NaRadioOptions.empty(), isA<NaRadioOptionsGeneric>());
    expect(NaScaffoldOptions.empty(), isA<NaScaffoldOptionsGeneric>());
    expect(NaScrollbarOptions.empty(), isA<NaScrollbarOptionsGeneric>());
    expect(NaSearchBarOptions.empty(), isA<NaSearchBarOptionsGeneric>());
    expect(NaSliderOptions.empty(), isA<NaSliderOptionsGeneric>());
    expect(NaSwitchOptions.empty(), isA<NaSwitchOptionsGeneric>());
    expect(NaTextFieldOptions.empty(), isA<NaTextFieldOptionsGeneric>());
    expect(NaTimePickerOptions.empty(), isA<NaTimePickerOptionsGeneric>());
  });

  test('All Material and Cupertino .empty constructors instantiate properly', () {
    expect(NaAlertDialogOptionsMaterial.empty(), isA<NaAlertDialogOptionsMaterial>());
    expect(NaAlertDialogOptionsCupertino.empty(), isA<NaAlertDialogOptionsCupertino>());

    expect(NaAppBarOptionsMaterial.empty(), isA<NaAppBarOptionsMaterial>());
    expect(NaAppBarOptionsCupertino.empty(), isA<NaAppBarOptionsCupertino>());

    expect(NaAppOptionsMaterial.empty(), isA<NaAppOptionsMaterial>());
    expect(NaAppOptionsCupertino.empty(), isA<NaAppOptionsCupertino>());

    expect(NaBottomNavigationBarOptionsMaterial.empty(), isA<NaBottomNavigationBarOptionsMaterial>());
    expect(NaBottomNavigationBarOptionsCupertino.empty(), isA<NaBottomNavigationBarOptionsCupertino>());

    expect(NaButtonFilledOptionsMaterial.empty(), isA<NaButtonFilledOptionsMaterial>());
    expect(NaButtonFilledOptionsCupertino.empty(), isA<NaButtonFilledOptionsCupertino>());

    expect(NaButtonOptionsMaterial.empty(), isA<NaButtonOptionsMaterial>());
    expect(NaButtonOptionsCupertino.empty(), isA<NaButtonOptionsCupertino>());

    expect(NaCheckboxOptionsMaterial.empty(), isA<NaCheckboxOptionsMaterial>());
    expect(NaCheckboxOptionsCupertino.empty(), isA<NaCheckboxOptionsCupertino>());

    expect(NaDatePickerOptionsMaterial.empty(), isA<NaDatePickerOptionsMaterial>());
    expect(NaDatePickerOptionsCupertino.empty(), isA<NaDatePickerOptionsCupertino>());

    expect(NaDialogActionOptionsMaterial.empty(), isA<NaDialogActionOptionsMaterial>());
    expect(NaDialogActionOptionsCupertino.empty(), isA<NaDialogActionOptionsCupertino>());

    expect(NaIconButtonOptionsMaterial.empty(), isA<NaIconButtonOptionsMaterial>());
    expect(NaIconButtonOptionsCupertino.empty(), isA<NaIconButtonOptionsCupertino>());

    expect(NaIconOptionsMaterial.empty(), isA<NaIconOptionsMaterial>());
    expect(NaIconOptionsCupertino.empty(), isA<NaIconOptionsCupertino>());

    expect(NaListTileOptionsMaterial.empty(), isA<NaListTileOptionsMaterial>());
    expect(NaListTileOptionsCupertino.empty(), isA<NaListTileOptionsCupertino>());

    expect(NaPageOptionsMaterial.empty(), isA<NaPageOptionsMaterial>());
    expect(NaPageOptionsCupertino.empty(), isA<NaPageOptionsCupertino>());

    expect(NaProgressIndicatorOptionsMaterial.empty(), isA<NaProgressIndicatorOptionsMaterial>());
    expect(NaProgressIndicatorOptionsCupertino.empty(), isA<NaProgressIndicatorOptionsCupertino>());

    expect(NaRadioOptionsMaterial.empty(), isA<NaRadioOptionsMaterial>());
    expect(NaRadioOptionsCupertino.empty(), isA<NaRadioOptionsCupertino>());

    expect(NaScaffoldOptionsMaterial.empty(), isA<NaScaffoldOptionsMaterial>());
    expect(NaScaffoldOptionsCupertino.empty(), isA<NaScaffoldOptionsCupertino>());

    expect(NaScrollbarOptionsMaterial.empty(), isA<NaScrollbarOptionsMaterial>());
    expect(NaScrollbarOptionsCupertino.empty(), isA<NaScrollbarOptionsCupertino>());

    expect(NaSearchBarOptionsMaterial.empty(), isA<NaSearchBarOptionsMaterial>());
    expect(NaSearchBarOptionsCupertino.empty(), isA<NaSearchBarOptionsCupertino>());

    expect(NaSliderOptionsMaterial.empty(), isA<NaSliderOptionsMaterial>());
    expect(NaSliderOptionsCupertino.empty(), isA<NaSliderOptionsCupertino>());

    expect(NaSwitchOptionsMaterial.empty(), isA<NaSwitchOptionsMaterial>());
    expect(NaSwitchOptionsCupertino.empty(), isA<NaSwitchOptionsCupertino>());

    expect(NaTextFieldOptionsMaterial.empty(), isA<NaTextFieldOptionsMaterial>());
    expect(NaTextFieldOptionsCupertino.empty(), isA<NaTextFieldOptionsCupertino>());

    expect(NaTimePickerOptionsMaterial.empty(), isA<NaTimePickerOptionsMaterial>());
    expect(NaTimePickerOptionsCupertino.empty(), isA<NaTimePickerOptionsCupertino>());
  });
}
