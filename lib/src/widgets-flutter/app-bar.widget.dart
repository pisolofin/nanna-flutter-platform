import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaAppBar].
abstract class NaAppBarOptions extends NaWidgetOptions {}

/// Material-specific options for [NaAppBar], resolving into an [AppBar].
class NaAppBarOptionsMaterial extends NaAppBarOptions {
  final double? elevation;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;

  NaAppBarOptionsMaterial({ this.elevation, this.centerTitle, this.bottom });
}

/// Cupertino-specific options for [NaAppBar], resolving into a [CupertinoNavigationBar].
class NaAppBarOptionsCupertino extends NaAppBarOptions {
  final Border? border;
  final bool? transitionBetweenRoutes;

  NaAppBarOptionsCupertino({ this.border, this.transitionBetweenRoutes });
}

/// A generic AppBar widget that automatically renders an [AppBar] on Material
/// and a [CupertinoNavigationBar] on Cupertino.
class NaAppBar extends NaWidget implements ObstructingPreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  final NaWidgetOptionsBuilder<NaAppBarOptions>? optionsBuilder;

  const NaAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaAppBarOptions? options = optionsBuilder?.call(context, uiType);

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
  Size get preferredSize => const Size.fromHeight(56.0); // kToolbarHeight

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
        CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.a == 1.0;
  }
}
