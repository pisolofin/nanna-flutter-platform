import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformApp].
abstract class NaPlatformAppOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformApp], resolving into a [MaterialApp].
class NaPlatformAppOptionsMaterial extends NaPlatformAppOptions {
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode? themeMode;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  NaPlatformAppOptionsMaterial({
    this.theme,
    this.darkTheme,
    this.themeMode,
    this.scaffoldMessengerKey,
  });
}

/// Cupertino-specific options for [NaPlatformApp], resolving into a [CupertinoApp].
class NaPlatformAppOptionsCupertino extends NaPlatformAppOptions {
  final CupertinoThemeData? theme;

  NaPlatformAppOptionsCupertino({
    this.theme,
  });
}

/// A generic App widget that automatically renders a [MaterialApp] on Material 
/// and a [CupertinoApp] on Cupertino.
class NaPlatformApp extends NaPlatformWidget {
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

  final NaWidgetOptionsBuilder<NaPlatformAppOptions>? optionsBuilder;

  const NaPlatformApp({
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
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformAppOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformAppOptionsCupertino? cupertinoOptions = options is NaPlatformAppOptionsCupertino ? options : null;
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

    final NaPlatformAppOptionsMaterial? materialOptions = options is NaPlatformAppOptionsMaterial ? options : null;
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
}
