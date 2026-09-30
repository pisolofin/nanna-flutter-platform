import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaIcon renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaIcon(NaIcons.info));
    expect(find.byType(NaIcon), findsOneWidget);
  });

  testWidgets('NaIcon renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaIcon(NaIcons.info));
    expect(find.byType(NaIcon), findsOneWidget);
  });

  test('NaIconData resolves registered external platform icons', () {
    const NaUiType customUiType = NaUiType(99);
    const IconData customIconData = IconData(0x1234, fontFamily: 'CustomFont');

    NaIconData.registerPlatformIcons(customUiType, {
      NaIcons.home: customIconData,
    });

    expect(NaIcons.home.resolve(customUiType), equals(customIconData));
    expect(NaIcons.settings.resolve(customUiType),
        equals(NaIcons.settings.defaultIcon));

    NaIconData.unregisterPlatformIcons(customUiType);
    expect(
        NaIcons.home.resolve(customUiType), equals(NaIcons.home.defaultIcon));
  });
}
