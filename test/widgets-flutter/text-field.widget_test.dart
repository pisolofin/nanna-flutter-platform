import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaTextField renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaTextField());
    expect(find.byType(NaTextField), findsOneWidget);
  });

  testWidgets('NaTextField renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaTextField());
    expect(find.byType(NaTextField), findsOneWidget);
  });

  testWidgets('NaTextField maintains identical vertical alignment for obscureText true and false in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const Column(
        children: [
          NaTextField(
            obscureText: false,
          ),
          NaTextField(
            obscureText: true,
          ),
        ],
      ),
    );

    final List<EditableText> editableTexts = tester.widgetList<EditableText>(find.byType(EditableText)).toList();
    expect(editableTexts.length, 2);

    final RenderBox firstEditableRenderBox = tester.renderObject(find.byWidget(editableTexts[0])) as RenderBox;
    final RenderBox secondEditableRenderBox = tester.renderObject(find.byWidget(editableTexts[1])) as RenderBox;

    final RenderBox firstParentRenderBox = tester.renderObject(find.byType(NaTextField).first) as RenderBox;
    final RenderBox secondParentRenderBox = tester.renderObject(find.byType(NaTextField).last) as RenderBox;

    final double firstDy = firstEditableRenderBox.localToGlobal(Offset.zero).dy - firstParentRenderBox.localToGlobal(Offset.zero).dy;
    final double secondDy = secondEditableRenderBox.localToGlobal(Offset.zero).dy - secondParentRenderBox.localToGlobal(Offset.zero).dy;

    expect(firstDy, equals(secondDy));
  });
}
