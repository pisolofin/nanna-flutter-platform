import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaCard renders crisp hairline defaults in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaCard(child: SizedBox(width: 80.0, height: 40.0)));

    expect(find.byType(NaCard), findsOneWidget);
    final Card materialCard = tester.widget(find.byType(Card));
    expect(materialCard.margin, EdgeInsets.zero);
    expect(materialCard.elevation, NaCard.defaultElevation);
    expect(materialCard.clipBehavior, Clip.antiAlias);
    expect(materialCard.surfaceTintColor, const Color(0x00000000));
    expect(materialCard.shape, isA<RoundedRectangleBorder>());

    final RoundedRectangleBorder cardShape = materialCard.shape! as RoundedRectangleBorder;
    expect(cardShape.borderRadius, BorderRadius.circular(NaCard.defaultBorderRadius));
    expect(cardShape.side.width, NaCard.defaultBorderWidth);
    expect(cardShape.side.style, BorderStyle.solid);
  });

  testWidgets('NaCard renders crisp hairline defaults in Cupertino light and dark themes', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaCard(child: SizedBox(width: 80.0, height: 40.0)));

    expect(find.byType(NaCard), findsOneWidget);
    final Container lightContainer = tester.widget(
      find.descendant(of: find.byType(NaCard), matching: find.byType(Container)),
    );
    expect(lightContainer.margin, EdgeInsets.zero);
    expect(lightContainer.clipBehavior, Clip.antiAlias);

    final BoxDecoration lightDecoration = lightContainer.decoration! as BoxDecoration;
    expect(lightDecoration.color!.toARGB32(), const Color(0xFFFFFFFF).toARGB32());
    expect(lightDecoration.borderRadius, BorderRadius.circular(NaCard.defaultBorderRadius));
    expect(lightDecoration.border, isA<Border>());
    final Border lightBorder = lightDecoration.border! as Border;
    expect(lightBorder.top.width, NaCard.defaultBorderWidth);
    expect(lightBorder.top.color.toARGB32(), const Color(0xB3E5E7EB).toARGB32());

    // Verify Cupertino dark theme resolves dark surface and hairline border
    await tester.pumpWidget(
      const NaUiTypeScope(
        uiTypes: [NaUiType.cupertino],
        child  : CupertinoApp(
          theme: CupertinoThemeData(brightness: Brightness.dark),
          home : CupertinoPageScaffold(
            child: NaCard(child: SizedBox(width: 80.0, height: 40.0)),
          ),
        ),
      ),
    );

    final Container darkContainer = tester.widget(
      find.descendant(of: find.byType(NaCard), matching: find.byType(Container)),
    );
    final BoxDecoration darkDecoration = darkContainer.decoration! as BoxDecoration;
    expect(darkDecoration.color!.toARGB32(), const Color(0xFF1C1C1E).toARGB32());
    expect((darkDecoration.border! as Border).top.color.toARGB32(), const Color(0x993A3A3C).toARGB32());
  });

  testWidgets('NaCard applies direct padding parameter on both Material and Cupertino', (WidgetTester tester) async {
    const EdgeInsets cardPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);
    const Key childKey = ValueKey<String>('card-inner-child');

    await pumpMaterialNaWidget(
      tester,
      const NaCard(
        padding: cardPadding,
        child  : SizedBox(key: childKey, width: 50.0, height: 20.0),
      ),
    );
    final Padding materialPadding = tester.widget(
      find.ancestor(of: find.byKey(childKey), matching: find.byType(Padding)).first,
    );
    expect(materialPadding.padding, cardPadding);

    await pumpCupertinoNaWidget(
      tester,
      const NaCard(
        padding: cardPadding,
        child  : SizedBox(key: childKey, width: 50.0, height: 20.0),
      ),
    );
    final Container cupertinoContainer = tester.widget(
      find.descendant(of: find.byType(NaCard), matching: find.byType(Container)),
    );
    expect(cupertinoContainer.padding, cardPadding);
  });

  testWidgets('NaCard removes border cleanly when borderWidth is zero', (WidgetTester tester) async {
    final NaCard borderlessCard = NaCard(
      options: NaCardOptionsGeneric(borderWidth: 0.0),
      child  : const SizedBox(width: 40.0, height: 20.0),
    );

    await pumpMaterialNaWidget(tester, borderlessCard);
    final Card materialCard = tester.widget(find.byType(Card));
    final RoundedRectangleBorder materialShape = materialCard.shape! as RoundedRectangleBorder;
    expect(materialShape.side, BorderSide.none);

    await pumpCupertinoNaWidget(tester, borderlessCard);
    final Container cupertinoContainer = tester.widget(
      find.descendant(of: find.byType(NaCard), matching: find.byType(Container)),
    );
    final BoxDecoration cupertinoDecoration = cupertinoContainer.decoration! as BoxDecoration;
    expect(cupertinoDecoration.border, isNull);
  });

  test('NaCard copyWith preserves and updates properties', () {
    const NaCard originalCard = NaCard(
      padding: EdgeInsets.all(8.0),
      uiType : NaUiType.material,
      child  : SizedBox(),
    );
    final NaCard updatedCard = originalCard.copyWith(
      padding: const EdgeInsets.all(16.0),
      uiType : NaUiType.cupertino,
    );

    expect(updatedCard.padding, const EdgeInsets.all(16.0));
    expect(updatedCard.uiType, NaUiType.cupertino);
    expect(updatedCard.child, originalCard.child);
  });
}
