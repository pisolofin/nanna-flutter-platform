import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  test('NaCardOptions copyWith works correctly', () {
    final NaCardOptionsGeneric genericOptions = NaCardOptionsGeneric(
      color : const Color(0xFF111111),
      margin: const EdgeInsets.all(8.0),
    );
    final NaCardOptionsGeneric updatedGeneric = genericOptions.copyWith(
      color: const Color(0xFF222222),
    );
    expect(updatedGeneric.color, const Color(0xFF222222));
    expect(updatedGeneric.margin, const EdgeInsets.all(8.0));

    final NaCardOptionsMaterial materialOptions = NaCardOptionsMaterial(
      elevation: 2.0,
      color    : const Color(0xFF111111),
    );
    final NaCardOptionsMaterial updatedMaterial = materialOptions.copyWith(
      elevation: 4.0,
    );
    expect(updatedMaterial.elevation, 4.0);
    expect(updatedMaterial.color, const Color(0xFF111111));

    final NaCardOptionsCupertino cupertinoOptions = NaCardOptionsCupertino(
      padding: const EdgeInsets.all(12.0),
      color  : const Color(0xFF111111),
    );
    final NaCardOptionsCupertino updatedCupertino = cupertinoOptions.copyWith(
      padding: const EdgeInsets.all(16.0),
    );
    expect(updatedCupertino.padding, const EdgeInsets.all(16.0));
    expect(updatedCupertino.color, const Color(0xFF111111));
  });

  test('NaTextFieldOptions copyWith works correctly', () {
    final NaTextFieldOptionsGeneric genericOptions = NaTextFieldOptionsGeneric(
      placeholder: 'Test Placeholder',
      obscureText: false,
    );
    final NaTextFieldOptionsGeneric updatedGeneric = genericOptions.copyWith(
      obscureText: true,
    );
    expect(updatedGeneric.placeholder, 'Test Placeholder');
    expect(updatedGeneric.obscureText, isTrue);

    final NaTextFieldOptionsMaterial materialOptions = NaTextFieldOptionsMaterial(
      placeholder: 'Test Placeholder',
      cursorWidth: 2.0,
    );
    final NaTextFieldOptionsMaterial updatedMaterial = materialOptions.copyWith(
      cursorWidth: 4.0,
    );
    expect(updatedMaterial.placeholder, 'Test Placeholder');
    expect(updatedMaterial.cursorWidth, 4.0);

    final NaTextFieldOptionsCupertino cupertinoOptions = NaTextFieldOptionsCupertino(
      placeholder: 'Test Placeholder',
      padding    : const EdgeInsets.all(6.0),
    );
    final NaTextFieldOptionsCupertino updatedCupertino = cupertinoOptions.copyWith(
      padding: const EdgeInsets.all(10.0),
    );
    expect(updatedCupertino.placeholder, 'Test Placeholder');
    expect(updatedCupertino.padding, const EdgeInsets.all(10.0));
  });

  test('NaSwitchOptions copyWith works correctly', () {
    final NaSwitchOptionsGeneric genericOptions = NaSwitchOptionsGeneric(
      activeTrackColor: const Color(0xFF00FF00),
    );
    final NaSwitchOptionsGeneric updatedGeneric = genericOptions.copyWith(
      inactiveTrackColor: const Color(0xFFFF0000),
    );
    expect(updatedGeneric.activeTrackColor, const Color(0xFF00FF00));
    expect(updatedGeneric.inactiveTrackColor, const Color(0xFFFF0000));

    final NaSwitchOptionsMaterial materialOptions = NaSwitchOptionsMaterial(
      activeThumbColor: const Color(0xFF0000FF),
    );
    final NaSwitchOptionsMaterial updatedMaterial = materialOptions.copyWith(
      inactiveThumbColor: const Color(0xFFFFFF00),
    );
    expect(updatedMaterial.activeThumbColor, const Color(0xFF0000FF));
    expect(updatedMaterial.inactiveThumbColor, const Color(0xFFFFFF00));

    final NaSwitchOptionsCupertino cupertinoOptions = NaSwitchOptionsCupertino(
      applyTheme: false,
    );
    final NaSwitchOptionsCupertino updatedCupertino = cupertinoOptions.copyWith(
      applyTheme: true,
    );
    expect(updatedCupertino.applyTheme, isTrue);
  });

  test('Parameterless Generic options copyWith creates a new instance', () {
    final NaAlertDialogOptionsGeneric alertDialogOptions = NaAlertDialogOptionsGeneric();
    expect(alertDialogOptions.copyWith(), isA<NaAlertDialogOptionsGeneric>());

    final NaAppBarOptionsGeneric appBarOptions = NaAppBarOptionsGeneric();
    expect(appBarOptions.copyWith(), isA<NaAppBarOptionsGeneric>());

    final NaAppOptionsGeneric appOptions = NaAppOptionsGeneric();
    expect(appOptions.copyWith(), isA<NaAppOptionsGeneric>());

    final NaDatePickerOptionsGeneric datePickerOptions = NaDatePickerOptionsGeneric();
    expect(datePickerOptions.copyWith(), isA<NaDatePickerOptionsGeneric>());

    final NaDialogActionOptionsGeneric dialogActionOptions = NaDialogActionOptionsGeneric();
    expect(dialogActionOptions.copyWith(), isA<NaDialogActionOptionsGeneric>());

    final NaListTileOptionsGeneric listTileOptions = NaListTileOptionsGeneric();
    expect(listTileOptions.copyWith(), isA<NaListTileOptionsGeneric>());

    final NaSearchBarOptionsGeneric searchBarOptions = NaSearchBarOptionsGeneric();
    expect(searchBarOptions.copyWith(), isA<NaSearchBarOptionsGeneric>());

    final NaTimePickerOptionsGeneric timePickerOptions = NaTimePickerOptionsGeneric();
    expect(timePickerOptions.copyWith(), isA<NaTimePickerOptionsGeneric>());
  });
}
