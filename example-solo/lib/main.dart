import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanna_platform/nanna_platform.dart';

import 'pages/home-page.dart';

void main() {
  runApp(const MyApp());
}

/// Example app using [NaApp] with automatic platform style detection (no [NaUiTypeScope]).
class MyApp extends StatelessWidget {
  /// Creates a [MyApp].
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return NaApp(
      title                     : 'Nanna Platform Example',
      debugShowCheckedModeBanner: false,
      optionsBuilder            : (BuildContext context, NaUiType uiType) {
        if (uiType == NaUiType.cupertino) {
          return NaAppOptionsCupertino(
            theme: const CupertinoThemeData(brightness: Brightness.light),
          );
        }

        return NaAppOptionsMaterial(
          theme: ThemeData(
            colorScheme : ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
        );
      },
      home: const ExampleHomePage(),
    );
  }
}
