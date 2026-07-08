import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform_example/main.dart';

void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title is rendered.
    expect(find.text('Nanna Platform Example'), findsOneWidget);
  });
}
