import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

/// Wraps a widget in a [MaterialApp] and injects a [NaUiTypeScope] with [NaUiType.material].
Future<void> pumpMaterialNaWidget(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    NaUiTypeScope(
      uiTypes: const [NaUiType.material],
      child: MaterialApp(
        home: Scaffold(
          body: child,
        ),
      ),
    ),
  );
}

/// Wraps a widget in a [CupertinoApp] and injects a [NaUiTypeScope] with [NaUiType.cupertino].
Future<void> pumpCupertinoNaWidget(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    NaUiTypeScope(
      uiTypes: const [NaUiType.cupertino],
      child: CupertinoApp(
        home: CupertinoPageScaffold(
          child: child,
        ),
      ),
    ),
  );
}
