import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaSlider renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, NaSlider(value: 0.5, onChanged: (v) {}));
    expect(find.byType(NaSlider), findsOneWidget);
  });

  testWidgets('NaSlider renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, NaSlider(value: 0.5, onChanged: (v) {}));
    expect(find.byType(NaSlider), findsOneWidget);
  });
}


