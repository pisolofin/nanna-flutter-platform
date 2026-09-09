import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaTextFieldCaption renders in Material',
      (WidgetTester tester) async {
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

  testWidgets('NaTextFieldCaption renders in Cupertino',
      (WidgetTester tester) async {
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
}

