import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaIconButton renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaIconButton(icon: const SizedBox(), onPressed: () {}));
    expect(find.byType(NaIconButton), findsOneWidget);
  });

  testWidgets('NaIconButton renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaIconButton(icon: const SizedBox(), onPressed: () {}));
    expect(find.byType(NaIconButton), findsOneWidget);
  });
}

