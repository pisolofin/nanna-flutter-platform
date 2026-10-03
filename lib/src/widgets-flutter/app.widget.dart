import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaApp].
abstract class NaAppOptions extends NaWidgetOptions {}

/// Generic options for [NaApp], holding properties common to both platforms.
class NaAppOptionsGeneric extends NaAppOptions {
  NaAppOptionsGeneric();

  /// Creates a copy of this [NaAppOptionsGeneric].
  NaAppOptionsGeneric copyWith() {
    return NaAppOptionsGeneric();
  }
}

/// Material-specific options for [NaApp], resolving into a [MaterialApp].
class NaAppOptionsMaterial extends NaAppOptionsGeneric {
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

  /// Creates a copy of this [NaAppOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaAppOptionsMaterial copyWith({
    ThemeData? theme,
    ThemeData? darkTheme,
    ThemeData? highContrastTheme,
    ThemeData? highContrastDarkTheme,
    ThemeMode? themeMode,
    Duration? themeAnimationDuration,
    Curve? themeAnimationCurve,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  }) {
    return NaAppOptionsMaterial(
      theme                 : theme ?? this.theme,
      darkTheme             : darkTheme ?? this.darkTheme,
      highContrastTheme     : highContrastTheme ?? this.highContrastTheme,
      highContrastDarkTheme : highContrastDarkTheme ?? this.highContrastDarkTheme,
      themeMode             : themeMode ?? this.themeMode,
      themeAnimationDuration: themeAnimationDuration ?? this.themeAnimationDuration,
      themeAnimationCurve   : themeAnimationCurve ?? this.themeAnimationCurve,
      scaffoldMessengerKey  : scaffoldMessengerKey ?? this.scaffoldMessengerKey,
    );
  }
}

/// Cupertino-specific options for [NaApp], resolving into a [CupertinoApp].
class NaAppOptionsCupertino extends NaAppOptionsGeneric {
  final CupertinoThemeData? theme;

  NaAppOptionsCupertino({ this.theme });

  /// Creates a copy of this [NaAppOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaAppOptionsCupertino copyWith({
    CupertinoThemeData? theme,
  }) {
    return NaAppOptionsCupertino(
      theme: theme ?? this.theme,
    );
  }
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

  /// Creates a copy of this [NaApp] with the given fields replaced by non-null values.
  NaApp copyWith({
    Key? key,
    GlobalKey<NavigatorState>? navigatorKey,
    Widget? home,
    Map<String, WidgetBuilder>? routes,
    String? initialRoute,
    RouteFactory? onGenerateRoute,
    InitialRouteListFactory? onGenerateInitialRoutes,
    RouteFactory? onUnknownRoute,
    List<NavigatorObserver>? navigatorObservers,
    TransitionBuilder? builder,
    String? title,
    GenerateAppTitle? onGenerateTitle,
    NotificationListenerCallback<NavigationNotification>? onNavigationNotification,
    Color? color,
    Locale? locale,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    LocaleListResolutionCallback? localeListResolutionCallback,
    LocaleResolutionCallback? localeResolutionCallback,
    Iterable<Locale>? supportedLocales,
    bool? showPerformanceOverlay,
    bool? checkerboardRasterCacheImages,
    bool? checkerboardOffscreenLayers,
    bool? showSemanticsDebugger,
    bool? debugShowCheckedModeBanner,
    Map<ShortcutActivator, Intent>? shortcuts,
    Map<Type, Action<Intent>>? actions,
    String? restorationScopeId,
    ScrollBehavior? scrollBehavior,
    RouteInformationProvider? routeInformationProvider,
    RouteInformationParser<Object>? routeInformationParser,
    RouterDelegate<Object>? routerDelegate,
    BackButtonDispatcher? backButtonDispatcher,
    RouterConfig<Object>? routerConfig,
    NaWidgetOptionsBuilder<NaAppOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    if (this._isRouter) {
      return NaApp.router(
        key                          : key ?? this.key,
        routeInformationProvider     : routeInformationProvider ?? this.routeInformationProvider,
        routeInformationParser       : routeInformationParser ?? this.routeInformationParser,
        routerDelegate               : routerDelegate ?? this.routerDelegate,
        routerConfig                 : routerConfig ?? this.routerConfig,
        backButtonDispatcher         : backButtonDispatcher ?? this.backButtonDispatcher,
        builder                      : builder ?? this.builder,
        title                        : title ?? this.title,
        onGenerateTitle              : onGenerateTitle ?? this.onGenerateTitle,
        onNavigationNotification     : onNavigationNotification ?? this.onNavigationNotification,
        color                        : color ?? this.color,
        locale                       : locale ?? this.locale,
        localizationsDelegates       : localizationsDelegates ?? this.localizationsDelegates,
        localeListResolutionCallback : localeListResolutionCallback ?? this.localeListResolutionCallback,
        localeResolutionCallback     : localeResolutionCallback ?? this.localeResolutionCallback,
        supportedLocales             : supportedLocales ?? this.supportedLocales,
        showPerformanceOverlay       : showPerformanceOverlay ?? this.showPerformanceOverlay,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages ?? this.checkerboardRasterCacheImages,
        checkerboardOffscreenLayers  : checkerboardOffscreenLayers ?? this.checkerboardOffscreenLayers,
        showSemanticsDebugger        : showSemanticsDebugger ?? this.showSemanticsDebugger,
        debugShowCheckedModeBanner   : debugShowCheckedModeBanner ?? this.debugShowCheckedModeBanner,
        shortcuts                    : shortcuts ?? this.shortcuts,
        actions                      : actions ?? this.actions,
        restorationScopeId           : restorationScopeId ?? this.restorationScopeId,
        scrollBehavior               : scrollBehavior ?? this.scrollBehavior,
        optionsBuilder               : optionsBuilder ?? this.optionsBuilder,
        uiType                       : uiType ?? this.uiType,
      );
    }

    return NaApp(
      key                          : key ?? this.key,
      navigatorKey                 : navigatorKey ?? this.navigatorKey,
      home                         : home ?? this.home,
      routes                       : routes ?? this.routes,
      initialRoute                 : initialRoute ?? this.initialRoute,
      onGenerateRoute              : onGenerateRoute ?? this.onGenerateRoute,
      onGenerateInitialRoutes      : onGenerateInitialRoutes ?? this.onGenerateInitialRoutes,
      onUnknownRoute               : onUnknownRoute ?? this.onUnknownRoute,
      navigatorObservers           : navigatorObservers ?? this.navigatorObservers,
      builder                      : builder ?? this.builder,
      title                        : title ?? this.title,
      onGenerateTitle              : onGenerateTitle ?? this.onGenerateTitle,
      onNavigationNotification     : onNavigationNotification ?? this.onNavigationNotification,
      color                        : color ?? this.color,
      locale                       : locale ?? this.locale,
      localizationsDelegates       : localizationsDelegates ?? this.localizationsDelegates,
      localeListResolutionCallback : localeListResolutionCallback ?? this.localeListResolutionCallback,
      localeResolutionCallback     : localeResolutionCallback ?? this.localeResolutionCallback,
      supportedLocales             : supportedLocales ?? this.supportedLocales,
      showPerformanceOverlay       : showPerformanceOverlay ?? this.showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages ?? this.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers  : checkerboardOffscreenLayers ?? this.checkerboardOffscreenLayers,
      showSemanticsDebugger        : showSemanticsDebugger ?? this.showSemanticsDebugger,
      debugShowCheckedModeBanner   : debugShowCheckedModeBanner ?? this.debugShowCheckedModeBanner,
      shortcuts                    : shortcuts ?? this.shortcuts,
      actions                      : actions ?? this.actions,
      restorationScopeId           : restorationScopeId ?? this.restorationScopeId,
      scrollBehavior               : scrollBehavior ?? this.scrollBehavior,
      optionsBuilder               : optionsBuilder ?? this.optionsBuilder,
      uiType                       : uiType ?? this.uiType,
    );
  }

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
