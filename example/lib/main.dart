import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanna_platform/nanna_platform.dart';

import 'pages/home-page.dart';

void main() {
  runApp(const MyApp());
}

class AppStateScope extends InheritedWidget {
  final VoidCallback toggleUiType;

  const AppStateScope({
    super.key,
    required this.toggleUiType,
    required super.child,
  });

  static AppStateScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateScope>()!;
  }

  @override
  bool updateShouldNotify(AppStateScope oldWidget) => false;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NaUiType _currentUiType = NaUiType.material;

  void _toggleUiType() {
    setState(() {
      _currentUiType = _currentUiType == NaUiType.material
          ? NaUiType.cupertino
          : NaUiType.material;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Wrap the app with NaUiTypeScope to propagate the selected UI type to all NaPlatform* widgets.
    return NaUiTypeScope(
      uiTypes: [_currentUiType],
      child: AppStateScope(
        toggleUiType: _toggleUiType,
        child: NaApp(
          title: 'Nanna Platform Example',
          debugShowCheckedModeBanner: false,
          optionsBuilder: (BuildContext context, NaUiType uiType) {
            if (uiType == NaUiType.cupertino) {
              return NaAppOptionsCupertino(
                theme: const CupertinoThemeData(brightness: Brightness.light),
              );
            }

            return NaAppOptionsMaterial(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
            );
          },
          home: const ExampleHomePage(),
        ),
      ),
    );
  }
}
