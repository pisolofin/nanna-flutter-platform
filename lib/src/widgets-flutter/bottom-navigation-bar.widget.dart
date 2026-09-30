import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaBottomNavigationBar].
abstract class NaBottomNavigationBarOptions extends NaWidgetOptions {}

/// Generic options for [NaBottomNavigationBar], holding properties common to both platforms.
class NaBottomNavigationBarOptionsGeneric extends NaBottomNavigationBarOptions {
  final Color? backgroundColor;
  final double? iconSize;

  NaBottomNavigationBarOptionsGeneric({
    this.backgroundColor,
    this.iconSize,
  });
}

/// Material-specific options for [NaBottomNavigationBar], resolving into a [BottomNavigationBar].
class NaBottomNavigationBarOptionsMaterial
    extends NaBottomNavigationBarOptionsGeneric {
  final double? elevation;
  final BottomNavigationBarType? type;
  final Color? fixedColor;
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
    super.backgroundColor,
    super.iconSize,
  });
}

/// Cupertino-specific options for [NaBottomNavigationBar], resolving into a [CupertinoTabBar].
class NaBottomNavigationBarOptionsCupertino
    extends NaBottomNavigationBarOptionsGeneric {
  final Color? activeColor;
  final Color? inactiveColor;
  final double? height;
  final Border? border;

  NaBottomNavigationBarOptionsCupertino({
    this.activeColor,
    this.inactiveColor,
    this.height,
    this.border,
    super.backgroundColor,
    super.iconSize,
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
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaBottomNavigationBarOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );
    final NaBottomNavigationBarOptionsGeneric? genericOptions = options is NaBottomNavigationBarOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaBottomNavigationBarOptionsCupertino? cupertinoOptions = options is NaBottomNavigationBarOptionsCupertino
        ? options
        : null
      ;
      return CupertinoTabBar(
        items          : this.items,
        onTap          : this.onTap,
        currentIndex   : this.currentIndex,
        backgroundColor: genericOptions?.backgroundColor,
        activeColor    : cupertinoOptions?.activeColor,
        inactiveColor  :
            cupertinoOptions?.inactiveColor ?? CupertinoColors.inactiveGray,
        iconSize: genericOptions?.iconSize ?? 30.0,
        height  : cupertinoOptions?.height ?? 50.0,
        border  : cupertinoOptions?.border,
      );
    }

    if (uiType == NaUiType.material) {
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
        backgroundColor     : genericOptions?.backgroundColor,
        iconSize            : genericOptions?.iconSize ?? 24.0,
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

    return null;
  }
}
