import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  testWidgets('NaPageRoute returns MaterialPageRoute when uiType is material', (WidgetTester tester) async {
    PageRoute<dynamic>? route;
    
    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.material],
        child: MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  route = NaPageRoute.create(
                    context,
                    builder: (_) => const Text('Material Page'),
                  );
                },
                child: const Text('Push'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();

    expect(route, isA<MaterialPageRoute>());
  });

  testWidgets('NaPageRoute returns CupertinoPageRoute when uiType is cupertino', (WidgetTester tester) async {
    PageRoute<dynamic>? route;
    
    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.cupertino],
        child: CupertinoApp(
          home: Builder(
            builder: (BuildContext context) {
              return CupertinoButton(
                onPressed: () {
                  route = NaPageRoute.create(
                    context,
                    builder: (_) => const Text('Cupertino Page'),
                  );
                },
                child: const Text('Push'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Push'));
    await tester.pumpAndSettle();

    expect(route, isA<CupertinoPageRoute>());
  });
}
