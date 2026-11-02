import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

void main() {
  group('NaUiTypeScope', () {
    testWidgets('defaults to [NaUiType.material] when no scope in tree', (WidgetTester tester) async {
      late List<NaUiType> resolvedTypes;
      late NaUiType activeType;

      await tester.pumpWidget(
        Builder(
          builder: (BuildContext context) {
            resolvedTypes = NaUiTypeScope.of(context);
            activeType = NaUiTypeScope.resolveUiType(context);
            return const SizedBox();
          },
        ),
      );

      expect(resolvedTypes, equals([NaUiType.material]));
      expect(activeType, equals(NaUiType.material));
    });

    testWidgets('resolves scope UI types correctly', (WidgetTester tester) async {
      late List<NaUiType> resolvedTypes;
      late NaUiType activeType;

      await tester.pumpWidget(
        NaUiTypeScope(
          uiTypes: const [NaUiType.cupertino, NaUiType.material],
          child  : Builder(
            builder: (BuildContext context) {
              resolvedTypes = NaUiTypeScope.of(context);
              activeType = NaUiTypeScope.resolveUiType(context);
              return const SizedBox();
            },
          ),
        ),
      );

      expect(resolvedTypes, equals([NaUiType.cupertino, NaUiType.material]));
      expect(activeType, equals(NaUiType.cupertino));
    });

    testWidgets('isMaterial detects Material Scaffold', (WidgetTester tester) async {
      late bool isMat;
      late bool isCup;

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: _DetectionWidget(),
          ),
        ),
      );

      final _DetectionWidgetState state =
          tester.state<_DetectionWidgetState>(find.byType(_DetectionWidget));
      isMat = state.isMaterial;
      isCup = state.isCupertino;

      expect(isMat, isTrue);
      expect(isCup, isFalse);
    });

    testWidgets('isCupertino detects CupertinoPageScaffold', (WidgetTester tester) async {
      late bool isMat;
      late bool isCup;

      await tester.pumpWidget(
        const CupertinoApp(
          home: CupertinoPageScaffold(
            child: _DetectionWidget(),
          ),
        ),
      );

      final _DetectionWidgetState state =
          tester.state<_DetectionWidgetState>(find.byType(_DetectionWidget));
      isMat = state.isMaterial;
      isCup = state.isCupertino;

      expect(isMat, isFalse);
      expect(isCup, isTrue);
    });
  });
}

class _DetectionWidget extends StatefulWidget {
  const _DetectionWidget();

  @override
  State<_DetectionWidget> createState() => _DetectionWidgetState();
}

class _DetectionWidgetState extends State<_DetectionWidget> {
  bool isMaterial = false;
  bool isCupertino = false;

  @override
  Widget build(BuildContext context) {
    this.isMaterial = NaUiTypeScope.isMaterial(context);
    this.isCupertino = NaUiTypeScope.isCupertino(context);
    return const SizedBox();
  }
}
