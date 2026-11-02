import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaTextFieldCaption renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const NaTextFieldCaption(
        caption  : 'Test Caption',
        textField: NaTextField(),
      ),
    );
    expect(find.byType(NaTextFieldCaption), findsOneWidget);
    expect(find.text('Test Caption'), findsOneWidget);
  });

  testWidgets('NaTextFieldCaption renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(
      tester,
      const NaTextFieldCaption(
        caption  : 'Test Caption',
        textField: NaTextField(),
      ),
    );
    expect(find.byType(NaTextFieldCaption), findsOneWidget);
    expect(find.text('Test Caption'), findsOneWidget);
  });

  testWidgets('NaTextFieldCaption supports below position', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const NaTextFieldCaption(
        caption  : 'Bottom Caption',
        position : NaTextFieldCaptionPosition.below,
        textField: NaTextField(),
      ),
    );
    expect(find.text('Bottom Caption'), findsOneWidget);
  });

  test('NaTextFieldCaption copyWith updates properties', () {
    const NaTextFieldCaption original = NaTextFieldCaption(
      caption  : 'Original',
      textField: NaTextField(),
    );

    final NaTextFieldCaption copy = original.copyWith(
      caption : 'Updated',
      position: NaTextFieldCaptionPosition.below,
    );

    expect(copy.caption, equals('Updated'));
    expect(copy.position, equals(NaTextFieldCaptionPosition.below));
  });
}
