import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  testWidgets('NaPage returns MaterialPage when uiType is material', (WidgetTester tester) async {
    Page<dynamic>? page;

    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.material],
        child  : MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  page = NaPage.create(
                    context,
                    name : 'test-material',
                    child: const Text('Material Page'),
                  );
                },
                child: const Text('Create Page'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create Page'));
    await tester.pumpAndSettle();

    expect(page, isA<MaterialPage<dynamic>>());
    final MaterialPage<dynamic> materialPage = page as MaterialPage<dynamic>;
    expect(materialPage.name, 'test-material');
    expect(materialPage.fullscreenDialog, isFalse);
    expect(materialPage.maintainState, isTrue);
    expect(materialPage.allowSnapshotting, isTrue);
  });

  testWidgets('NaPage returns CupertinoPage when uiType is cupertino', (WidgetTester tester) async {
    Page<dynamic>? page;

    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.cupertino],
        child  : CupertinoApp(
          home: Builder(
            builder: (BuildContext context) {
              return CupertinoButton(
                onPressed: () {
                  page = NaPage.create(
                    context,
                    name : 'test-cupertino',
                    child: const Text('Cupertino Page'),
                  );
                },
                child: const Text('Create Page'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create Page'));
    await tester.pumpAndSettle();

    expect(page, isA<CupertinoPage<dynamic>>());
    final CupertinoPage<dynamic> cupertinoPage = page as CupertinoPage<dynamic>;
    expect(cupertinoPage.name, 'test-cupertino');
    expect(cupertinoPage.title, isNull);
    expect(cupertinoPage.fullscreenDialog, isFalse);
    expect(cupertinoPage.maintainState, isTrue);
    expect(cupertinoPage.allowSnapshotting, isTrue);
  });

  testWidgets('NaPage applies custom Cupertino options from optionsBuilder', (WidgetTester tester) async {
    Page<dynamic>? page;

    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.cupertino],
        child  : CupertinoApp(
          home: Builder(
            builder: (BuildContext context) {
              return CupertinoButton(
                onPressed: () {
                  page = NaPage.create(
                    context,
                    key           : const ValueKey('custom-key'),
                    name          : 'custom-cupertino',
                    optionsBuilder: (BuildContext ctx, NaUiType uiType) {
                      return NaPageOptionsCupertino(
                        title            : 'Cupertino Title',
                        fullscreenDialog : true,
                        maintainState    : false,
                        allowSnapshotting: false,
                      );
                    },
                    child: const Text('Custom Cupertino Page'),
                  );
                },
                child: const Text('Create Page'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create Page'));
    await tester.pumpAndSettle();

    expect(page, isA<CupertinoPage<dynamic>>());
    final CupertinoPage<dynamic> cupertinoPage = page as CupertinoPage<dynamic>;
    expect(cupertinoPage.key, const ValueKey('custom-key'));
    expect(cupertinoPage.name, 'custom-cupertino');
    expect(cupertinoPage.title, 'Cupertino Title');
    expect(cupertinoPage.fullscreenDialog, isTrue);
    expect(cupertinoPage.maintainState, isFalse);
    expect(cupertinoPage.allowSnapshotting, isFalse);
  });

  testWidgets('NaPage applies custom Material options from optionsBuilder', (WidgetTester tester) async {
    Page<dynamic>? page;

    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.material],
        child  : MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  page = NaPage.create(
                    context,
                    key           : const ValueKey('custom-material-key'),
                    name          : 'custom-material',
                    optionsBuilder: (BuildContext ctx, NaUiType uiType) {
                      return NaPageOptionsMaterial(
                        fullscreenDialog : true,
                        maintainState    : false,
                        allowSnapshotting: false,
                      );
                    },
                    child: const Text('Custom Material Page'),
                  );
                },
                child: const Text('Create Page'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create Page'));
    await tester.pumpAndSettle();

    expect(page, isA<MaterialPage<dynamic>>());
    final MaterialPage<dynamic> materialPage = page as MaterialPage<dynamic>;
    expect(materialPage.key, const ValueKey('custom-material-key'));
    expect(materialPage.name, 'custom-material');
    expect(materialPage.fullscreenDialog, isTrue);
    expect(materialPage.maintainState, isFalse);
    expect(materialPage.allowSnapshotting, isFalse);
  });

  testWidgets('NaPage converts generic options from optionsBuilder via fromGeneric', (WidgetTester tester) async {
    Page<dynamic>? cupertinoPage;

    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.cupertino],
        child  : CupertinoApp(
          home: Builder(
            builder: (BuildContext context) {
              return CupertinoButton(
                onPressed: () {
                  cupertinoPage = NaPage.create(
                    context,
                    optionsBuilder: (BuildContext ctx, NaUiType uiType) {
                      return NaPageOptionsGeneric(
                        fullscreenDialog: true,
                      );
                    },
                    child: const Text('Generic Page'),
                  );
                },
                child: const Text('Create Page'),
              );
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Create Page'));
    await tester.pumpAndSettle();

    expect(cupertinoPage, isA<CupertinoPage<dynamic>>());
    final CupertinoPage<dynamic> resolvedPage = cupertinoPage as CupertinoPage<dynamic>;
    expect(resolvedPage.fullscreenDialog, isTrue);
    expect(resolvedPage.maintainState, isTrue);
  });
}
