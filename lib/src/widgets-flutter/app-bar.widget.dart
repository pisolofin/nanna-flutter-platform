import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaAppBar].
abstract class NaAppBarOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaAppBarOptions();

  /// Creates an empty [NaAppBarOptions] with default values.
  factory NaAppBarOptions.empty() => NaAppBarOptionsGeneric.empty();
}

/// Generic options for [NaAppBar], holding properties common to both platforms.
class NaAppBarOptionsGeneric extends NaAppBarOptions {
  /// Creates a [NaAppBarOptionsGeneric].
  NaAppBarOptionsGeneric();

  /// Creates an empty [NaAppBarOptionsGeneric] with default values.
  NaAppBarOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaAppBarOptionsGeneric].
  NaAppBarOptionsGeneric copyWith() {
    return NaAppBarOptionsGeneric();
  }
}

/// Material-specific options for [NaAppBar], resolving into an [AppBar].
class NaAppBarOptionsMaterial extends NaAppBarOptionsGeneric {
  /// The z-coordinate at which to place this app bar relative to its parent.
  final double? elevation;

  /// Whether the title should be centered.
  final bool? centerTitle;

  /// This widget appears across the bottom of the app bar.
  final PreferredSizeWidget? bottom;

  /// Creates a [NaAppBarOptionsMaterial].
  NaAppBarOptionsMaterial({
    this.elevation,
    this.centerTitle,
    this.bottom,
  });

  /// Creates an empty [NaAppBarOptionsMaterial] with default values.
  NaAppBarOptionsMaterial.empty() : this();

  /// Creates a [NaAppBarOptionsMaterial] from generic options.
  NaAppBarOptionsMaterial.fromGeneric(
    NaAppBarOptionsGeneric? generic, {
    this.elevation,
    this.centerTitle,
    this.bottom,
  }) : super();

  /// Creates a copy of this [NaAppBarOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaAppBarOptionsMaterial copyWith({
    double? elevation,
    bool? centerTitle,
    PreferredSizeWidget? bottom,
  }) {
    return NaAppBarOptionsMaterial(
      elevation  : elevation ?? this.elevation,
      centerTitle: centerTitle ?? this.centerTitle,
      bottom     : bottom ?? this.bottom,
    );
  }
}

/// Cupertino-specific options for [NaAppBar], resolving into a [CupertinoNavigationBar].
class NaAppBarOptionsCupertino extends NaAppBarOptionsGeneric {
  /// The border of the navigation bar.
  final Border? border;

  /// Whether to transition between routes.
  final bool? transitionBetweenRoutes;

  /// Creates a [NaAppBarOptionsCupertino].
  NaAppBarOptionsCupertino({
    this.border,
    this.transitionBetweenRoutes,
  });

  /// Creates an empty [NaAppBarOptionsCupertino] with default values.
  NaAppBarOptionsCupertino.empty() : this();

  /// Creates a [NaAppBarOptionsCupertino] from generic options.
  NaAppBarOptionsCupertino.fromGeneric(
    NaAppBarOptionsGeneric? generic, {
    this.border,
    this.transitionBetweenRoutes,
  }) : super();

  /// Creates a copy of this [NaAppBarOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaAppBarOptionsCupertino copyWith({
    Border? border,
    bool? transitionBetweenRoutes,
  }) {
    return NaAppBarOptionsCupertino(
      border                 : border ?? this.border,
      transitionBetweenRoutes: transitionBetweenRoutes ?? this.transitionBetweenRoutes,
    );
  }
}

/// A generic AppBar widget that automatically renders an [AppBar] on Material
/// and a [CupertinoNavigationBar] on Cupertino.
class NaAppBar extends NaWidget implements ObstructingPreferredSizeWidget {
  /// The primary widget displayed in the app bar.
  final Widget? title;

  /// A widget to display before the toolbar's title.
  final Widget? leading;

  /// A list of Widgets to display in a row after the [title] widget.
  final List<Widget>? actions;

  /// The fill color to use for the app bar.
  final Color? backgroundColor;

  /// Optional options builder for customizing platform-specific app bar configuration.
  final NaWidgetOptionsBuilder<NaAppBarOptions>? optionsBuilder;

  /// Creates a [NaAppBar].
  const NaAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaAppBar] with the given fields replaced by non-null values.
  NaAppBar copyWith({
    Key? key,
    Widget? title,
    Widget? leading,
    List<Widget>? actions,
    Color? backgroundColor,
    NaWidgetOptionsBuilder<NaAppBarOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaAppBar(
      key            : key ?? this.key,
      title          : title ?? this.title,
      leading        : leading ?? this.leading,
      actions        : actions ?? this.actions,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      optionsBuilder : optionsBuilder ?? this.optionsBuilder,
      uiType         : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaAppBarOptions? options = this.optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaAppBarOptionsCupertino? cupertinoOptions = options is NaAppBarOptionsCupertino
        ? options
        : null
      ;

      Widget? trailingWidget;
      if (this.actions != null && this.actions!.isNotEmpty) {
        trailingWidget = Row(
          mainAxisSize: MainAxisSize.min,
          children    : this.actions!,
        );
      }

      return CupertinoNavigationBar(
        leading                : this.leading,
        middle                 : this.title,
        trailing               : trailingWidget,
        backgroundColor        : this.backgroundColor,
        border                 : cupertinoOptions?.border,
        transitionBetweenRoutes:
            cupertinoOptions?.transitionBetweenRoutes ?? true,
      );
    }

    if (uiType == NaUiType.material) {
      final NaAppBarOptionsMaterial? materialOptions = options is NaAppBarOptionsMaterial
        ? options
        : null
      ;
      return AppBar(
        leading        : this.leading,
        title          : this.title,
        actions        : this.actions,
        backgroundColor: this.backgroundColor,
        elevation      : materialOptions?.elevation,
        centerTitle    : materialOptions?.centerTitle,
        bottom         : materialOptions?.bottom,
      );
    }

    return null;
  }

  @override
  Size get preferredSize {
    if (uiType == NaUiType.cupertino) {
      return const Size.fromHeight(44.0); // kMinInteractiveDimensionCupertino
    }
    if (uiType == NaUiType.material) {
      return const Size.fromHeight(56.0); // kToolbarHeight
    }
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return const Size.fromHeight(44.0); // kMinInteractiveDimensionCupertino
    }
    return const Size.fromHeight(56.0); // kToolbarHeight
  }

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.a == 1.0;
  }
}
