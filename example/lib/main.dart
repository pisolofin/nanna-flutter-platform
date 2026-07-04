import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanna_flutter_platform/nanna_flutter_platform.dart';

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
    Widget app;

    if (_currentUiType == NaUiType.cupertino) {
      app = const CupertinoApp(
        title: 'Nanna Platform Example',
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: ExampleHomePage(),
      );
    } else {
      app = MaterialApp(
        title: 'Nanna Platform Example',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ExampleHomePage(),
      );
    }

    // Wrap the app with NaUiTypeScope to propagate the selected UI type to all NaPlatform* widgets.
    return NaUiTypeScope(
      uiType: _currentUiType,
      child: AppStateScope(toggleUiType: _toggleUiType, child: app),
    );
  }
}

class ExampleHomePage extends StatelessWidget {
  const ExampleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NaUiType uiType = NaUiTypeScope.of(context);
    final bool isMaterial = uiType == NaUiType.material;

    return NaPlatformScaffold(
      appBar: NaPlatformAppBar(title: const Text('Nanna Platform Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current UI Type: ${isMaterial ? 'Material' : 'Cupertino'}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            NaPlatformButton(
              onPressed: AppStateScope.of(context).toggleUiType,
              child: Text(
                'Switch to ${isMaterial ? 'Cupertino' : 'Material'}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
