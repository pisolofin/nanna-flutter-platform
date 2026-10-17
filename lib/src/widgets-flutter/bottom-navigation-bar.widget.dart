import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaBottomNavigationBar].
abstract class NaBottomNavigationBarOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaBottomNavigationBarOptions();

  /// Creates an empty [NaBottomNavigationBarOptions] with default values.
  factory NaBottomNavigationBarOptions.empty() => NaBottomNavigationBarOptionsGeneric.empty();
}

/// Generic options for [NaBottomNavigationBar], holding properties common to both platforms.
class NaBottomNavigationBarOptionsGeneric extends NaBottomNavigationBarOptions {
  /// The background color of the bottom navigation bar.
  final Color? backgroundColor;

  /// The size of all of the [BottomNavigationBarItem] icons.
  final double? iconSize;

  /// Creates a [NaBottomNavigationBarOptionsGeneric].
  NaBottomNavigationBarOptionsGeneric({
    this.backgroundColor,
    this.iconSize,
  });

  /// Creates an empty [NaBottomNavigationBarOptionsGeneric] with default values.
  NaBottomNavigationBarOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaBottomNavigationBarOptionsGeneric] with the given fields replaced by non-null values.
  NaBottomNavigationBarOptionsGeneric copyWith({
    Color? backgroundColor,
    double? iconSize,
  }) {
    return NaBottomNavigationBarOptionsGeneric(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconSize       : iconSize ?? this.iconSize,
    );
  }
}

/// Material-specific options for [NaBottomNavigationBar], resolving into a [BottomNavigationBar].
class NaBottomNavigationBarOptionsMaterial extends NaBottomNavigationBarOptionsGeneric {
  /// The z-coordinate at which to place this bottom navigation bar relative to its parent.
  final double? elevation;

  /// Defines the layout and behavior of a [BottomNavigationBar].
  final BottomNavigationBarType? type;

  /// The value of [selectedItemColor].
  final Color? fixedColor;

  /// The color of the selected item when that item is an icon or text.
  final Color? selectedItemColor;

  /// The color of the unselected items when they are icons or text.
  final Color? unselectedItemColor;

  /// The size and color of the selected icon.
  final IconThemeData? selectedIconTheme;

  /// The size and color of unselected icons.
  final IconThemeData? unselectedIconTheme;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they are selected.
  final TextStyle? selectedLabelStyle;

  /// The [TextStyle] of the [BottomNavigationBarItem] labels when they are unselected.
  final TextStyle? unselectedLabelStyle;

  /// Whether the labels are shown for selected items.
  final bool? showSelectedLabels;

  /// Whether the labels are shown for unselected items.
  final bool? showUnselectedLabels;

  /// The cursor for a mouse pointer when it enters or is hovering over the widget.
  final MouseCursor? mouseCursor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  final bool? enableFeedback;

  /// The arrangement of the bar's items when in landscape mode.
  final BottomNavigationBarLandscapeLayout? landscapeLayout;

  /// Creates a [NaBottomNavigationBarOptionsMaterial].
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

  /// Creates an empty [NaBottomNavigationBarOptionsMaterial] with default values.
  NaBottomNavigationBarOptionsMaterial.empty() : this();

  /// Creates a [NaBottomNavigationBarOptionsMaterial] from generic options.
  NaBottomNavigationBarOptionsMaterial.fromGeneric(
    NaBottomNavigationBarOptionsGeneric? generic, {
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
  }) : super(
         backgroundColor: generic?.backgroundColor,
         iconSize       : generic?.iconSize,
       );

  /// Creates a copy of this [NaBottomNavigationBarOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaBottomNavigationBarOptionsMaterial copyWith({
    double? elevation,
    BottomNavigationBarType? type,
    Color? fixedColor,
    Color? selectedItemColor,
    Color? unselectedItemColor,
    IconThemeData? selectedIconTheme,
    IconThemeData? unselectedIconTheme,
    TextStyle? selectedLabelStyle,
    TextStyle? unselectedLabelStyle,
    bool? showSelectedLabels,
    bool? showUnselectedLabels,
    MouseCursor? mouseCursor,
    bool? enableFeedback,
    BottomNavigationBarLandscapeLayout? landscapeLayout,
    Color? backgroundColor,
    double? iconSize,
  }) {
    return NaBottomNavigationBarOptionsMaterial(
      elevation           : elevation ?? this.elevation,
      type                : type ?? this.type,
      fixedColor          : fixedColor ?? this.fixedColor,
      selectedItemColor   : selectedItemColor ?? this.selectedItemColor,
      unselectedItemColor : unselectedItemColor ?? this.unselectedItemColor,
      selectedIconTheme   : selectedIconTheme ?? this.selectedIconTheme,
      unselectedIconTheme : unselectedIconTheme ?? this.unselectedIconTheme,
      selectedLabelStyle  : selectedLabelStyle ?? this.selectedLabelStyle,
      unselectedLabelStyle: unselectedLabelStyle ?? this.unselectedLabelStyle,
      showSelectedLabels  : showSelectedLabels ?? this.showSelectedLabels,
      showUnselectedLabels: showUnselectedLabels ?? this.showUnselectedLabels,
      mouseCursor         : mouseCursor ?? this.mouseCursor,
      enableFeedback      : enableFeedback ?? this.enableFeedback,
      landscapeLayout     : landscapeLayout ?? this.landscapeLayout,
      backgroundColor     : backgroundColor ?? this.backgroundColor,
      iconSize            : iconSize ?? this.iconSize,
    );
  }
}

/// Cupertino-specific options for [NaBottomNavigationBar], resolving into a [CupertinoTabBar].
class NaBottomNavigationBarOptionsCupertino extends NaBottomNavigationBarOptionsGeneric {
  /// The foreground color of the selected tab icon and text.
  final Color? activeColor;

  /// The foreground color of the unselected tab icon and text.
  final Color? inactiveColor;

  /// The height of the tab bar.
  final double? height;

  /// The border at the top of the tab bar.
  final Border? border;

  /// Creates a [NaBottomNavigationBarOptionsCupertino].
  NaBottomNavigationBarOptionsCupertino({
    this.activeColor,
    this.inactiveColor,
    this.height,
    this.border,
    super.backgroundColor,
    super.iconSize,
  });

  /// Creates an empty [NaBottomNavigationBarOptionsCupertino] with default values.
  NaBottomNavigationBarOptionsCupertino.empty() : this();

  /// Creates a [NaBottomNavigationBarOptionsCupertino] from generic options.
  NaBottomNavigationBarOptionsCupertino.fromGeneric(
    NaBottomNavigationBarOptionsGeneric? generic, {
    this.activeColor,
    this.inactiveColor,
    this.height,
    this.border,
  }) : super(
         backgroundColor: generic?.backgroundColor,
         iconSize       : generic?.iconSize,
       );

  /// Creates a copy of this [NaBottomNavigationBarOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaBottomNavigationBarOptionsCupertino copyWith({
    Color? activeColor,
    Color? inactiveColor,
    double? height,
    Border? border,
    Color? backgroundColor,
    double? iconSize,
  }) {
    return NaBottomNavigationBarOptionsCupertino(
      activeColor    : activeColor ?? this.activeColor,
      inactiveColor  : inactiveColor ?? this.inactiveColor,
      height         : height ?? this.height,
      border         : border ?? this.border,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconSize       : iconSize ?? this.iconSize,
    );
  }
}

/// A generic Bottom Navigation Bar widget that automatically renders a [BottomNavigationBar] on Material
/// and a [CupertinoTabBar] on Cupertino.
class NaBottomNavigationBar extends NaWidget {
  /// The interactive items laid out within the bottom navigation bar.
  final List<BottomNavigationBarItem> items;

  /// The callback that is called when one of the items is tapped.
  final ValueChanged<int>? onTap;

  /// The index into [items] for the current active item.
  final int currentIndex;

  /// Optional options builder for customizing platform-specific navigation bar configuration.
  final NaWidgetOptionsBuilder<NaBottomNavigationBarOptions>? optionsBuilder;

  /// Creates a [NaBottomNavigationBar].
  const NaBottomNavigationBar({
    super.key,
    required this.items,
    this.onTap,
    this.currentIndex = 0,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaBottomNavigationBar] with the given fields replaced by non-null values.
  NaBottomNavigationBar copyWith({
    Key? key,
    List<BottomNavigationBarItem>? items,
    ValueChanged<int>? onTap,
    int? currentIndex,
    NaWidgetOptionsBuilder<NaBottomNavigationBarOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaBottomNavigationBar(
      key           : key ?? this.key,
      items         : items ?? this.items,
      onTap         : onTap ?? this.onTap,
      currentIndex  : currentIndex ?? this.currentIndex,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

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
