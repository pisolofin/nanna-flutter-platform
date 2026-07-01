import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('Test cupertino switch', (WidgetTester tester) async {
    await tester.pumpWidget(const ExampleApp());
    
    // Trova e clicca il pulsante Cupertino
    await tester.tap(find.text('Cupertino'));
    await tester.pump();
    
    expect(find.text('Cupertino'), findsWidgets);
  });
}
