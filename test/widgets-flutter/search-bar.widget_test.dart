import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaSearchBar renders SearchBar in material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(
      tester,
      const NaSearchBar(
        hintText: 'Search...',
      ),
    );

    expect(find.byType(SearchBar), findsOneWidget);
    expect(find.text('Search...'), findsOneWidget);
  });

  testWidgets('NaSearchBar renders CupertinoSearchTextField in cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(
      tester,
      const NaSearchBar(
        hintText: 'Search...',
      ),
    );

    expect(find.byType(CupertinoSearchTextField), findsOneWidget);
    expect(find.text('Search...'), findsOneWidget);
  });
}
