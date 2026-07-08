import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaDialogAction renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaDialogAction(child: const SizedBox(), onPressed: () {}));
    expect(find.byType(NaDialogAction), findsOneWidget);
  });

  testWidgets('NaDialogAction renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaDialogAction(child: const SizedBox(), onPressed: () {}));
    expect(find.byType(NaDialogAction), findsOneWidget);
  });
}


