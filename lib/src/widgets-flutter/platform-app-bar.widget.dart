import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformAppBar].
abstract class NaPlatformAppBarOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformAppBar], resolving into an [AppBar].
class NaPlatformAppBarOptionsMaterial extends NaPlatformAppBarOptions {
  final double? elevation;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;

  NaPlatformAppBarOptionsMaterial({
    this.elevation,
    this.centerTitle,
    this.bottom,
  });
}

/// Cupertino-specific options for [NaPlatformAppBar], resolving into a [CupertinoNavigationBar].
class NaPlatformAppBarOptionsCupertino extends NaPlatformAppBarOptions {
  final Border? border;
  final bool? transitionBetweenRoutes;

  NaPlatformAppBarOptionsCupertino({
    this.border,
    this.transitionBetweenRoutes,
  });
}

/// A generic AppBar widget that automatically renders an [AppBar] on Material 
/// and a [CupertinoNavigationBar] on Cupertino.
class NaPlatformAppBar extends NaPlatformWidget implements ObstructingPreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;

  final NaWidgetOptionsBuilder<NaPlatformAppBarOptions>? optionsBuilder;

  const NaPlatformAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.backgroundColor,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformAppBarOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformAppBarOptionsCupertino? cupertinoOptions = options is NaPlatformAppBarOptionsCupertino ? options : null;
      
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
        transitionBetweenRoutes: cupertinoOptions?.transitionBetweenRoutes ?? true,
      );
    }

    final NaPlatformAppBarOptionsMaterial? materialOptions = options is NaPlatformAppBarOptionsMaterial ? options : null;
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

  @override
  Size get preferredSize => const Size.fromHeight(56.0); // kToolbarHeight

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor = CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ?? CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.a == 1.0;
  }
}
