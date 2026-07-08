import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';
import '../helpers/test-helpers.dart';

void main() {
  testWidgets('NaBottomNavigationBar renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaBottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Star')]));
    expect(find.byType(NaBottomNavigationBar), findsOneWidget);
  });

  testWidgets('NaBottomNavigationBar renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaBottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Star')]));
    expect(find.byType(NaBottomNavigationBar), findsOneWidget);
  });
}




