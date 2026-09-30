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
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final ThemeMode? themeMode;
  final Duration? themeAnimationDuration;
  final Curve? themeAnimationCurve;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  NaAppOptionsMaterial({
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode,
    this.themeAnimationDuration,
    this.themeAnimationCurve,
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
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final NotificationListenerCallback<NavigationNotification>? onNavigationNotification;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final ScrollBehavior? scrollBehavior;
  final GlobalKey<NavigatorState>? navigatorKey;

  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final BackButtonDispatcher? backButtonDispatcher;
  final RouterConfig<Object>? routerConfig;

  final NaWidgetOptionsBuilder<NaAppOptions>? optionsBuilder;

  /// Creates a [NaApp] using the standard [Navigator].
  ///
  /// Automatically renders [MaterialApp] on Material and [CupertinoApp] on Cupertino.
  const NaApp({
    super.key,
    this.navigatorKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.onNavigationNotification,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.optionsBuilder,
    super.uiType,
  })  : routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        backButtonDispatcher = null;

  /// Creates a [NaApp] that uses the [Router] instead of a [Navigator].
  ///
  /// Automatically renders [MaterialApp.router] on Material and [CupertinoApp.router] on Cupertino.
  const NaApp.router({
    super.key,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.routerConfig,
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.onNavigationNotification,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.optionsBuilder,
    super.uiType,
  })  : assert(routerDelegate != null || routerConfig != null),
        assert(
          routerConfig == null ||
              (routeInformationProvider == null &&
                  routeInformationParser == null &&
                  routerDelegate == null &&
                  backButtonDispatcher == null),
          'If routerConfig is provided, all other router delegate and information provider/parser parameters must be null.',
        ),
        home = null,
        routes = null,
        initialRoute = null,
        onGenerateRoute = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        navigatorObservers = null,
        navigatorKey = null;

  /// Whether the app was configured using a router delegate or router config.
  bool get _isRouter => ((this.routerConfig != null) || (this.routerDelegate != null));

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaAppOptions? options = this.optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaAppOptionsCupertino? cupertinoOptions = options is NaAppOptionsCupertino
        ? options
        : null
      ;

      if (_isRouter) {
        return CupertinoApp.router(
          key                          : this.key,
          routeInformationProvider     : this.routeInformationProvider,
          routeInformationParser       : this.routeInformationParser,
          routerDelegate               : this.routerDelegate,
          routerConfig                 : this.routerConfig,
          backButtonDispatcher         : this.backButtonDispatcher,
          theme                        : cupertinoOptions?.theme,
          builder                      : this.builder,
          title                        : this.title,
          onGenerateTitle              : this.onGenerateTitle,
          onNavigationNotification     : this.onNavigationNotification,
          color                        : this.color,
          locale                       : this.locale,
          localizationsDelegates       : this.localizationsDelegates,
          localeListResolutionCallback : this.localeListResolutionCallback,
          localeResolutionCallback     : this.localeResolutionCallback,
          supportedLocales             : this.supportedLocales,
          showPerformanceOverlay       : this.showPerformanceOverlay,
          checkerboardRasterCacheImages: this.checkerboardRasterCacheImages,
          checkerboardOffscreenLayers  : this.checkerboardOffscreenLayers,
          showSemanticsDebugger        : this.showSemanticsDebugger,
          debugShowCheckedModeBanner   : this.debugShowCheckedModeBanner,
          shortcuts                    : this.shortcuts,
          actions                      : this.actions,
          restorationScopeId           : this.restorationScopeId,
          scrollBehavior               : this.scrollBehavior,
        );
      }

      return CupertinoApp(
        key                          : this.key,
        navigatorKey                 : this.navigatorKey,
        home                         : this.home,
        routes                       : this.routes ?? const <String, WidgetBuilder>{},
        initialRoute                 : this.initialRoute,
        onGenerateRoute              : this.onGenerateRoute,
        onGenerateInitialRoutes      : this.onGenerateInitialRoutes,
        onUnknownRoute               : this.onUnknownRoute,
        navigatorObservers           : this.navigatorObservers ?? const <NavigatorObserver>[],
        builder                      : this.builder,
        title                        : this.title,
        onGenerateTitle              : this.onGenerateTitle,
        onNavigationNotification     : this.onNavigationNotification,
        theme                        : cupertinoOptions?.theme,
        color                        : this.color,
        locale                       : this.locale,
        localizationsDelegates       : this.localizationsDelegates,
        localeListResolutionCallback : this.localeListResolutionCallback,
        localeResolutionCallback     : this.localeResolutionCallback,
        supportedLocales             : this.supportedLocales,
        showPerformanceOverlay       : this.showPerformanceOverlay,
        checkerboardRasterCacheImages: this.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers  : this.checkerboardOffscreenLayers,
        showSemanticsDebugger        : this.showSemanticsDebugger,
        debugShowCheckedModeBanner   : this.debugShowCheckedModeBanner,
        shortcuts                    : this.shortcuts,
        actions                      : this.actions,
        restorationScopeId           : this.restorationScopeId,
        scrollBehavior               : this.scrollBehavior,
      );
    }

    if (uiType == NaUiType.material) {
      final NaAppOptionsMaterial? materialOptions = options is NaAppOptionsMaterial
        ? options
        : null
      ;

      if (_isRouter) {
        return MaterialApp.router(
          key                          : this.key,
          scaffoldMessengerKey         : materialOptions?.scaffoldMessengerKey,
          routeInformationProvider     : this.routeInformationProvider,
          routeInformationParser       : this.routeInformationParser,
          routerDelegate               : this.routerDelegate,
          routerConfig                 : this.routerConfig,
          backButtonDispatcher         : this.backButtonDispatcher,
          builder                      : this.builder,
          title                        : this.title,
          onGenerateTitle              : this.onGenerateTitle,
          onNavigationNotification     : this.onNavigationNotification,
          color                        : this.color,
          theme                        : materialOptions?.theme,
          darkTheme                    : materialOptions?.darkTheme,
          highContrastTheme            : materialOptions?.highContrastTheme,
          highContrastDarkTheme        : materialOptions?.highContrastDarkTheme,
          themeMode                    : materialOptions?.themeMode ?? ThemeMode.system,
          themeAnimationDuration       : materialOptions?.themeAnimationDuration ?? kThemeAnimationDuration,
          themeAnimationCurve          : materialOptions?.themeAnimationCurve ?? Curves.linear,
          locale                       : this.locale,
          localizationsDelegates       : this.localizationsDelegates,
          localeListResolutionCallback : this.localeListResolutionCallback,
          localeResolutionCallback     : this.localeResolutionCallback,
          supportedLocales             : this.supportedLocales,
          showPerformanceOverlay       : this.showPerformanceOverlay,
          checkerboardRasterCacheImages: this.checkerboardRasterCacheImages,
          checkerboardOffscreenLayers  : this.checkerboardOffscreenLayers,
          showSemanticsDebugger        : this.showSemanticsDebugger,
          debugShowCheckedModeBanner   : this.debugShowCheckedModeBanner,
          shortcuts                    : this.shortcuts,
          actions                      : this.actions,
          restorationScopeId           : this.restorationScopeId,
          scrollBehavior               : this.scrollBehavior,
        );
      }

      return MaterialApp(
        key                          : this.key,
        navigatorKey                 : this.navigatorKey,
        scaffoldMessengerKey         : materialOptions?.scaffoldMessengerKey,
        home                         : this.home,
        routes                       : this.routes ?? const <String, WidgetBuilder>{},
        initialRoute                 : this.initialRoute,
        onGenerateRoute              : this.onGenerateRoute,
        onGenerateInitialRoutes      : this.onGenerateInitialRoutes,
        onUnknownRoute               : this.onUnknownRoute,
        navigatorObservers           : this.navigatorObservers ?? const <NavigatorObserver>[],
        builder                      : this.builder,
        title                        : this.title,
        onGenerateTitle              : this.onGenerateTitle,
        onNavigationNotification     : this.onNavigationNotification,
        color                        : this.color,
        theme                        : materialOptions?.theme,
        darkTheme                    : materialOptions?.darkTheme,
        highContrastTheme            : materialOptions?.highContrastTheme,
        highContrastDarkTheme        : materialOptions?.highContrastDarkTheme,
        themeMode                    : materialOptions?.themeMode ?? ThemeMode.system,
        themeAnimationDuration       : materialOptions?.themeAnimationDuration ?? kThemeAnimationDuration,
        themeAnimationCurve          : materialOptions?.themeAnimationCurve ?? Curves.linear,
        locale                       : this.locale,
        localizationsDelegates       : this.localizationsDelegates,
        localeListResolutionCallback : this.localeListResolutionCallback,
        localeResolutionCallback     : this.localeResolutionCallback,
        supportedLocales             : this.supportedLocales,
        showPerformanceOverlay       : this.showPerformanceOverlay,
        checkerboardRasterCacheImages: this.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers  : this.checkerboardOffscreenLayers,
        showSemanticsDebugger        : this.showSemanticsDebugger,
        debugShowCheckedModeBanner   : this.debugShowCheckedModeBanner,
        shortcuts                    : this.shortcuts,
        actions                      : this.actions,
        restorationScopeId           : this.restorationScopeId,
        scrollBehavior               : this.scrollBehavior,
      );
    }

    return null;
  }
}
