import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaBottomNavigationBar].
abstract class NaBottomNavigationBarOptions extends NaWidgetOptions {}

/// Material-specific options for [NaBottomNavigationBar], resolving into a [BottomNavigationBar].
class NaBottomNavigationBarOptionsMaterial
    extends NaBottomNavigationBarOptions {
  final double? elevation;
  final BottomNavigationBarType? type;
  final Color? fixedColor;
  final Color? backgroundColor;
  final double? iconSize;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final MouseCursor? mouseCursor;
  final bool? enableFeedback;
  final BottomNavigationBarLandscapeLayout? landscapeLayout;

  NaBottomNavigationBarOptionsMaterial({
    this.elevation,
    this.type,
    this.fixedColor,
    this.backgroundColor,
    this.iconSize,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedIconTheme,
    this.unselectedIconTheme,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.showSelectedLabels,
    this.showUnselectedLabels,
    this.mouseCursor,
    this.enableFeedback,
    this.landscapeLayout,
  });
}

/// Cupertino-specific options for [NaBottomNavigationBar], resolving into a [CupertinoTabBar].
class NaBottomNavigationBarOptionsCupertino
    extends NaBottomNavigationBarOptions {
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? iconSize;
  final double? height;
  final Border? border;

  NaBottomNavigationBarOptionsCupertino({
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.iconSize,
    this.height,
    this.border,
  });
}

/// A generic Bottom Navigation Bar widget that automatically renders a [BottomNavigationBar] on Material
/// and a [CupertinoTabBar] on Cupertino.
class NaBottomNavigationBar extends NaWidget {
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int>? onTap;
  final int currentIndex;

  final NaWidgetOptionsBuilder<NaBottomNavigationBarOptions>? optionsBuilder;

  const NaBottomNavigationBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaBottomNavigationBarOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaBottomNavigationBarOptionsCupertino? cupertinoOptions = options is NaBottomNavigationBarOptionsCupertino
        ? options
        : null
      ;
      return CupertinoTabBar(
        items          : this.items,
        onTap          : this.onTap,
        currentIndex   : this.currentIndex,
        backgroundColor: cupertinoOptions?.backgroundColor,
        activeColor    : cupertinoOptions?.activeColor,
        inactiveColor  :
            cupertinoOptions?.inactiveColor ?? CupertinoColors.inactiveGray,
        iconSize: cupertinoOptions?.iconSize ?? 30.0,
        height  : cupertinoOptions?.height ?? 50.0,
        border  : cupertinoOptions?.border,
      );
    }

    final NaBottomNavigationBarOptionsMaterial? materialOptions = options is NaBottomNavigationBarOptionsMaterial
      ? options
      : null
    ;
    return BottomNavigationBar(
      items               : this.items,
      onTap               : this.onTap,
      currentIndex        : this.currentIndex,
      elevation           : materialOptions?.elevation,
      type                : materialOptions?.type,
      fixedColor          : materialOptions?.fixedColor,
      backgroundColor     : materialOptions?.backgroundColor,
      iconSize            : materialOptions?.iconSize ?? 24.0,
      selectedItemColor   : materialOptions?.selectedItemColor,
      unselectedItemColor : materialOptions?.unselectedItemColor,
      selectedIconTheme   : materialOptions?.selectedIconTheme,
      unselectedIconTheme : materialOptions?.unselectedIconTheme,
      selectedLabelStyle  : materialOptions?.selectedLabelStyle,
      unselectedLabelStyle: materialOptions?.unselectedLabelStyle,
      showSelectedLabels  : materialOptions?.showSelectedLabels,
      showUnselectedLabels: materialOptions?.showUnselectedLabels,
      mouseCursor         : materialOptions?.mouseCursor,
      enableFeedback      : materialOptions?.enableFeedback,
      landscapeLayout     : materialOptions?.landscapeLayout,
    );
  }
}
