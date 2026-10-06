import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  test('NaCardOptions fromGeneric constructors inherit generic properties and set specific properties', () {
    final NaCardOptionsGeneric generic = NaCardOptionsGeneric(
      color : const Color(0xFF112233),
      margin: const EdgeInsets.all(8.0),
    );

    final NaCardOptionsMaterial material = NaCardOptionsMaterial.fromGeneric(
      generic,
      elevation: 4.0,
    );
    expect(material.color, const Color(0xFF112233));
    expect(material.margin, const EdgeInsets.all(8.0));
    expect(material.elevation, 4.0);

    final NaCardOptionsCupertino cupertino = NaCardOptionsCupertino.fromGeneric(
      generic,
      padding: const EdgeInsets.all(12.0),
    );
    expect(cupertino.color, const Color(0xFF112233));
    expect(cupertino.margin, const EdgeInsets.all(8.0));
    expect(cupertino.padding, const EdgeInsets.all(12.0));
  });

  test('NaTextFieldOptions fromGeneric constructors inherit generic properties and set specific properties', () {
    final NaTextFieldOptionsGeneric generic = NaTextFieldOptionsGeneric(
      placeholder: 'Test Placeholder',
      obscureText: true,
      cursorColor: const Color(0xFFFF0000),
    );

    final NaTextFieldOptionsMaterial material = NaTextFieldOptionsMaterial.fromGeneric(
      generic,
      mouseCursor: SystemMouseCursors.click,
    );
    expect(material.placeholder, 'Test Placeholder');
    expect(material.obscureText, isTrue);
    expect(material.cursorColor, const Color(0xFFFF0000));
    expect(material.mouseCursor, SystemMouseCursors.click);

    final NaTextFieldOptionsCupertino cupertino = NaTextFieldOptionsCupertino.fromGeneric(
      generic,
      padding: const EdgeInsets.all(6.0),
    );
    expect(cupertino.placeholder, 'Test Placeholder');
    expect(cupertino.obscureText, isTrue);
    expect(cupertino.cursorColor, const Color(0xFFFF0000));
    expect(cupertino.padding, const EdgeInsets.all(6.0));
  });

  test('NaPageOptions fromGeneric constructors inherit generic properties and set specific properties', () {
    final NaPageOptionsGeneric generic = NaPageOptionsGeneric(
      maintainState    : false,
      fullscreenDialog : true,
      allowSnapshotting: false,
    );

    final NaPageOptionsMaterial material = NaPageOptionsMaterial.fromGeneric(generic);
    expect(material.maintainState, isFalse);
    expect(material.fullscreenDialog, isTrue);
    expect(material.allowSnapshotting, isFalse);

    final NaPageOptionsCupertino cupertino = NaPageOptionsCupertino.fromGeneric(
      generic,
      title: 'Test Title',
    );
    expect(cupertino.maintainState, isFalse);
    expect(cupertino.fullscreenDialog, isTrue);
    expect(cupertino.allowSnapshotting, isFalse);
    expect(cupertino.title, 'Test Title');
  });

  test('NaScrollbarOptionsCupertino fromGeneric handles overrides and defaults', () {
    final NaScrollbarOptionsGeneric genericWithValues = NaScrollbarOptionsGeneric(
      thickness: 10.0,
      radius   : const Radius.circular(5.0),
    );
    final NaScrollbarOptionsCupertino cupertinoWithValues = NaScrollbarOptionsCupertino.fromGeneric(genericWithValues);
    expect(cupertinoWithValues.thickness, 10.0);
    expect(cupertinoWithValues.radius, const Radius.circular(5.0));
    expect(cupertinoWithValues.thicknessWhileDragging, CupertinoScrollbar.defaultThicknessWhileDragging);

    final NaScrollbarOptionsCupertino cupertinoNullGeneric = NaScrollbarOptionsCupertino.fromGeneric(null);
    expect(cupertinoNullGeneric.thickness, CupertinoScrollbar.defaultThickness);
    expect(cupertinoNullGeneric.radius, CupertinoScrollbar.defaultRadius);
  });

  test('NaSearchBarOptionsCupertino fromGeneric retains platform defaults', () {
    final NaSearchBarOptionsCupertino cupertino = NaSearchBarOptionsCupertino.fromGeneric(null);
    expect(cupertino.padding, const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0));
    expect(cupertino.itemColor, CupertinoColors.systemGrey2);
    expect(cupertino.itemSize, 20.0);
  });

  test('All Material and Cupertino .fromGeneric constructors instantiate properly', () {
    expect(NaAlertDialogOptionsMaterial.fromGeneric(null), isA<NaAlertDialogOptionsMaterial>());
    expect(NaAlertDialogOptionsCupertino.fromGeneric(null), isA<NaAlertDialogOptionsCupertino>());

    expect(NaAppBarOptionsMaterial.fromGeneric(null), isA<NaAppBarOptionsMaterial>());
    expect(NaAppBarOptionsCupertino.fromGeneric(null), isA<NaAppBarOptionsCupertino>());

    expect(NaAppOptionsMaterial.fromGeneric(null), isA<NaAppOptionsMaterial>());
    expect(NaAppOptionsCupertino.fromGeneric(null), isA<NaAppOptionsCupertino>());

    expect(NaBottomNavigationBarOptionsMaterial.fromGeneric(null), isA<NaBottomNavigationBarOptionsMaterial>());
    expect(NaBottomNavigationBarOptionsCupertino.fromGeneric(null), isA<NaBottomNavigationBarOptionsCupertino>());

    expect(NaButtonFilledOptionsMaterial.fromGeneric(null), isA<NaButtonFilledOptionsMaterial>());
    expect(NaButtonFilledOptionsCupertino.fromGeneric(null), isA<NaButtonFilledOptionsCupertino>());

    expect(NaButtonOptionsMaterial.fromGeneric(null), isA<NaButtonOptionsMaterial>());
    expect(NaButtonOptionsCupertino.fromGeneric(null), isA<NaButtonOptionsCupertino>());

    expect(NaCardOptionsMaterial.fromGeneric(null), isA<NaCardOptionsMaterial>());
    expect(NaCardOptionsCupertino.fromGeneric(null), isA<NaCardOptionsCupertino>());

    expect(NaCheckboxOptionsMaterial.fromGeneric(null), isA<NaCheckboxOptionsMaterial>());
    expect(NaCheckboxOptionsCupertino.fromGeneric(null), isA<NaCheckboxOptionsCupertino>());

    expect(NaDatePickerOptionsMaterial.fromGeneric(null), isA<NaDatePickerOptionsMaterial>());
    expect(NaDatePickerOptionsCupertino.fromGeneric(null), isA<NaDatePickerOptionsCupertino>());

    expect(NaDialogActionOptionsMaterial.fromGeneric(null), isA<NaDialogActionOptionsMaterial>());
    expect(NaDialogActionOptionsCupertino.fromGeneric(null), isA<NaDialogActionOptionsCupertino>());

    expect(NaIconButtonOptionsMaterial.fromGeneric(null), isA<NaIconButtonOptionsMaterial>());
    expect(NaIconButtonOptionsCupertino.fromGeneric(null), isA<NaIconButtonOptionsCupertino>());

    expect(NaIconOptionsMaterial.fromGeneric(null), isA<NaIconOptionsMaterial>());
    expect(NaIconOptionsCupertino.fromGeneric(null), isA<NaIconOptionsCupertino>());

    expect(NaListTileOptionsMaterial.fromGeneric(null), isA<NaListTileOptionsMaterial>());
    expect(NaListTileOptionsCupertino.fromGeneric(null), isA<NaListTileOptionsCupertino>());

    expect(NaPageOptionsMaterial.fromGeneric(null), isA<NaPageOptionsMaterial>());
    expect(NaPageOptionsCupertino.fromGeneric(null), isA<NaPageOptionsCupertino>());

    expect(NaProgressIndicatorOptionsMaterial.fromGeneric(null), isA<NaProgressIndicatorOptionsMaterial>());
    expect(NaProgressIndicatorOptionsCupertino.fromGeneric(null), isA<NaProgressIndicatorOptionsCupertino>());

    expect(NaRadioOptionsMaterial.fromGeneric(null), isA<NaRadioOptionsMaterial>());
    expect(NaRadioOptionsCupertino.fromGeneric(null), isA<NaRadioOptionsCupertino>());

    expect(NaScaffoldOptionsMaterial.fromGeneric(null), isA<NaScaffoldOptionsMaterial>());
    expect(NaScaffoldOptionsCupertino.fromGeneric(null), isA<NaScaffoldOptionsCupertino>());

    expect(NaScrollbarOptionsMaterial.fromGeneric(null), isA<NaScrollbarOptionsMaterial>());
    expect(NaScrollbarOptionsCupertino.fromGeneric(null), isA<NaScrollbarOptionsCupertino>());

    expect(NaSearchBarOptionsMaterial.fromGeneric(null), isA<NaSearchBarOptionsMaterial>());
    expect(NaSearchBarOptionsCupertino.fromGeneric(null), isA<NaSearchBarOptionsCupertino>());

    expect(NaSliderOptionsMaterial.fromGeneric(null), isA<NaSliderOptionsMaterial>());
    expect(NaSliderOptionsCupertino.fromGeneric(null), isA<NaSliderOptionsCupertino>());

    expect(NaSwitchOptionsMaterial.fromGeneric(null), isA<NaSwitchOptionsMaterial>());
    expect(NaSwitchOptionsCupertino.fromGeneric(null), isA<NaSwitchOptionsCupertino>());

    expect(NaTextFieldOptionsMaterial.fromGeneric(null), isA<NaTextFieldOptionsMaterial>());
    expect(NaTextFieldOptionsCupertino.fromGeneric(null), isA<NaTextFieldOptionsCupertino>());

    expect(NaTimePickerOptionsMaterial.fromGeneric(null), isA<NaTimePickerOptionsMaterial>());
    expect(NaTimePickerOptionsCupertino.fromGeneric(null), isA<NaTimePickerOptionsCupertino>());
  });
}
