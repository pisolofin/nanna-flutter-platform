import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

void main() {
  testWidgets('NaPlatformButton si renderizza correttamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NaPlatformButton(
            onPressed: () {},
            child: const Text('Test Button'),
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
  });

  testWidgets('NaPlatformCard si renderizza correttamente', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: NaPlatformCard(
            child: Text('Test Card'),
          ),
        ),
      ),
    );

    expect(find.text('Test Card'), findsOneWidget);
  });
}
