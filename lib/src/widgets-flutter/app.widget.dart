import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaApp].
abstract class NaAppOptions extends NaWidgetOptions {}

/// Material-specific options for [NaApp], resolving into a [MaterialApp].
class NaAppOptionsMaterial extends NaAppOptions {
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  NaAppOptionsMaterial({
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
  });
}

/// Cupertino-specific options for [NaApp], resolving into a [CupertinoApp].
class NaAppOptionsCupertino extends NaAppOptions {
  final CupertinoThemeData? theme;

  NaAppOptionsCupertino({ this.theme });
}

/// A generic App widget that automatically renders a [MaterialApp] on Material
/// and a [CupertinoApp] on Cupertino.
class NaApp extends NaWidget {
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final String title;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final bool debugShowCheckedModeBanner;
  final GlobalKey<NavigatorState>? navigatorKey;

  final NaWidgetOptionsBuilder<NaAppOptions>? optionsBuilder;

  const NaApp({
    super.key,
    this.home,
    this.routes,
    this.initialRoute,
    this.title = '',
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowCheckedModeBanner = true,
    this.navigatorKey,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaAppOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaAppOptionsCupertino? cupertinoOptions = options is NaAppOptionsCupertino
        ? options
        : null
      ;
      return CupertinoApp(
        key                       : this.key,
        navigatorKey              : this.navigatorKey,
        home                      : this.home,
        routes                    : this.routes ?? const <String, WidgetBuilder>{},
        initialRoute              : this.initialRoute,
        title                     : this.title,
        theme                     : cupertinoOptions?.theme,
        color                     : this.color,
        locale                    : this.locale,
        localizationsDelegates    : this.localizationsDelegates,
        supportedLocales          : this.supportedLocales,
        debugShowCheckedModeBanner: this.debugShowCheckedModeBanner,
      );
    }

    if (uiType == NaUiType.material) {
      final NaAppOptionsMaterial? materialOptions = options is NaAppOptionsMaterial
        ? options
        : null
      ;
      return MaterialApp(
        key                       : this.key,
        navigatorKey              : this.navigatorKey,
        scaffoldMessengerKey      : materialOptions?.scaffoldMessengerKey,
        home                      : this.home,
        routes                    : this.routes ?? const <String, WidgetBuilder>{},
        initialRoute              : this.initialRoute,
        title                     : this.title,
        theme                     : materialOptions?.theme,
        darkTheme                 : materialOptions?.darkTheme,
        themeMode                 : materialOptions?.themeMode,
        color                     : this.color,
        locale                    : this.locale,
        localizationsDelegates    : this.localizationsDelegates,
        supportedLocales          : this.supportedLocales,
        debugShowCheckedModeBanner: this.debugShowCheckedModeBanner,
      );
    }

    return null;
  }
}
