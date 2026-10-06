import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nanna_platform/nanna_platform.dart';

import '../helpers/test-helpers.dart';

class _TestRouterDelegate extends RouterDelegate<RouteInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteInformation> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  @override
  Future setNewRoutePath(RouteInformation configuration) async {}
}

class _TestRouteInformationParser extends RouteInformationParser<RouteInformation> {
  const _TestRouteInformationParser();

  @override
  Future<RouteInformation> parseRouteInformation(RouteInformation routeInformation) async {
    return routeInformation;
  }
}

void main() {
  testWidgets('NaApp renders in Material', (WidgetTester tester) async {
    await pumpMaterialNaWidget(tester, const NaApp(home: SizedBox()));
    expect(find.byType(NaApp), findsOneWidget);
  });

  testWidgets('NaApp renders in Cupertino', (WidgetTester tester) async {
    await pumpCupertinoNaWidget(tester, const NaApp(home: SizedBox()));
    expect(find.byType(NaApp), findsOneWidget);
  });

  testWidgets('NaApp.router renders in Material with routerConfig', (WidgetTester tester) async {
    final RouterConfig<Object> routerConfig = RouterConfig<Object>(
      routerDelegate: _TestRouterDelegate(),
    );

    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.material],
        child  : NaApp.router(routerConfig: routerConfig),
      ),
    );

    expect(find.byType(NaApp), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('NaApp.router renders in Cupertino with routerConfig', (WidgetTester tester) async {
    final RouterConfig<Object> routerConfig = RouterConfig<Object>(
      routerDelegate: _TestRouterDelegate(),
    );

    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.cupertino],
        child  : NaApp.router(routerConfig: routerConfig),
      ),
    );

    expect(find.byType(NaApp), findsOneWidget);
    expect(find.byType(CupertinoApp), findsOneWidget);
  });

  testWidgets('NaApp.router renders in Material with routerDelegate and routeInformationParser', (WidgetTester tester) async {
    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.material],
        child  : NaApp.router(
          routerDelegate        : _TestRouterDelegate(),
          routeInformationParser: const _TestRouteInformationParser(),
        ),
      ),
    );

    expect(find.byType(NaApp), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('NaApp.router renders in Cupertino with routerDelegate and routeInformationParser', (WidgetTester tester) async {
    await tester.pumpWidget(
      NaUiTypeScope(
        uiTypes: const [NaUiType.cupertino],
        child  : NaApp.router(
          routerDelegate        : _TestRouterDelegate(),
          routeInformationParser: const _TestRouteInformationParser(),
        ),
      ),
    );

    expect(find.byType(NaApp), findsOneWidget);
    expect(find.byType(CupertinoApp), findsOneWidget);
  });
}
