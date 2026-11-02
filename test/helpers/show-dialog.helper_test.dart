import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  group('naShowDialogAsync', () {
    testWidgets('renders Material dialog when active UI type is Material', (WidgetTester tester) async {
      await tester.pumpWidget(
        NaUiTypeScope(
          uiTypes: const [NaUiType.material],
          child  : MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      naShowDialogAsync(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return const AlertDialog(
                            title: Text('Material Dialog Title'),
                          );
                        },
                      );
                    },
                    child: const Text('Open Dialog'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Material Dialog Title'), findsOneWidget);
    });

    testWidgets('renders Cupertino dialog when active UI type is Cupertino', (WidgetTester tester) async {
      await tester.pumpWidget(
        NaUiTypeScope(
          uiTypes: const [NaUiType.cupertino],
          child  : CupertinoApp(
            home: CupertinoPageScaffold(
              child: Builder(
                builder: (BuildContext context) {
                  return CupertinoButton(
                    onPressed: () {
                      naShowDialogAsync(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return const CupertinoAlertDialog(
                            title: Text('Cupertino Dialog Title'),
                          );
                        },
                      );
                    },
                    child: const Text('Open Dialog'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      expect(find.byType(CupertinoAlertDialog), findsOneWidget);
      expect(find.text('Cupertino Dialog Title'), findsOneWidget);
    });

    testWidgets('deprecated naShowDialog function works properly', (WidgetTester tester) async {
      await tester.pumpWidget(
        NaUiTypeScope(
          uiTypes: const [NaUiType.material],
          child  : MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      // ignore: deprecated_member_use_from_same_package
                      naShowDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return const AlertDialog(
                            title: Text('Legacy Dialog'),
                          );
                        },
                      );
                    },
                    child: const Text('Open Legacy Dialog'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open Legacy Dialog'));
      await tester.pumpAndSettle();

      expect(find.text('Legacy Dialog'), findsOneWidget);
    });
  });
}
