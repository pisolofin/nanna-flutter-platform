import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaButton renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaButton(onPressed: () {}, child: const SizedBox()));
    expect(find.byType(NaButton), findsOneWidget);
  });

  testWidgets('NaButton renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaButton(onPressed: () {}, child: const SizedBox()));
    expect(find.byType(NaButton), findsOneWidget);
  });
}

