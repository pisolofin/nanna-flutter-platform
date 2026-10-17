import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaListTile].
abstract class NaListTileOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaListTileOptions();

  /// Creates an empty [NaListTileOptions] with default values.
  factory NaListTileOptions.empty() => NaListTileOptionsGeneric.empty();
}

/// Generic options for [NaListTile], holding properties common to both platforms.
class NaListTileOptionsGeneric extends NaListTileOptions {
  /// Creates a [NaListTileOptionsGeneric].
  NaListTileOptionsGeneric();

  /// Creates an empty [NaListTileOptionsGeneric] with default values.
  NaListTileOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaListTileOptionsGeneric].
  NaListTileOptionsGeneric copyWith() {
    return NaListTileOptionsGeneric();
  }
}

/// Material-specific options for [NaListTile], resolving into a [ListTile].
class NaListTileOptionsMaterial extends NaListTileOptionsGeneric {
  /// Whether this list tile is intended to display three lines of text.
  final bool? isThreeLine;
  /// Whether this list tile is part of a vertically dense list.
  final bool? dense;
  /// Defines how compact the widget's layout will be.
  final VisualDensity? visualDensity;
  /// The shape of the widget.
  final ShapeBorder? shape;
  /// The text style or button style.
  final ListTileStyle? style;
  /// The color for the selected item.
  final Color? selectedColor;
  /// The color for the icon.
  final Color? iconColor;
  /// The color for the text.
  final Color? textColor;
  /// The padding around the content.
  final EdgeInsetsGeometry? contentPadding;
  /// Whether this widget is enabled for user interaction.
  final bool? enabled;
  /// Called when a long-press gesture occurs.
  final VoidCallback? onLongPress;
  /// Handler called when the focus changes.
  final ValueChanged<bool>? onFocusChange;
  /// The cursor for a mouse pointer when hovering over this widget.
  final MouseCursor? mouseCursor;
  /// Whether this widget is currently selected.
  final bool? selected;
  /// The color for the focus overlay.
  final Color? focusColor;
  /// The color of this widget when hovered over by a pointer.
  final Color? hoverColor;
  /// The splash color for the ink response.
  final Color? splashColor;
  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;
  /// True if this widget will be selected as the initial focus.
  final bool? autofocus;
  /// The tile's background color.
  final Color? tileColor;
  /// The background color of the tile when selected.
  final Color? selectedTileColor;
  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  final bool? enableFeedback;
  /// The horizontal gap between the titles and the leading/trailing widgets.
  final double? horizontalTitleGap;
  /// The minimum vertical padding around the list tile's contents.
  final double? minVerticalPadding;
  /// The minimum width allocated for the leading widget.
  final double? minLeadingWidth;

  /// Creates a [NaListTileOptionsMaterial].
  NaListTileOptionsMaterial({
    this.isThreeLine,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.contentPadding,
    this.enabled,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
  });

  /// Creates an empty [NaListTileOptionsMaterial] with default values.
  NaListTileOptionsMaterial.empty() : this();

  /// Creates a [NaListTileOptionsMaterial] from generic options.
  NaListTileOptionsMaterial.fromGeneric(
    NaListTileOptionsGeneric? generic, {
    this.isThreeLine,
    this.dense,
    this.visualDensity,
    this.shape,
    this.style,
    this.selectedColor,
    this.iconColor,
    this.textColor,
    this.contentPadding,
    this.enabled,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.selected,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.focusNode,
    this.autofocus,
    this.tileColor,
    this.selectedTileColor,
    this.enableFeedback,
    this.horizontalTitleGap,
    this.minVerticalPadding,
    this.minLeadingWidth,
  }) : super();

  /// Creates a copy of this [NaListTileOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaListTileOptionsMaterial copyWith({
    bool? isThreeLine,
    bool? dense,
    VisualDensity? visualDensity,
    ShapeBorder? shape,
    ListTileStyle? style,
    Color? selectedColor,
    Color? iconColor,
    Color? textColor,
    EdgeInsetsGeometry? contentPadding,
    bool? enabled,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onFocusChange,
    MouseCursor? mouseCursor,
    bool? selected,
    Color? focusColor,
    Color? hoverColor,
    Color? splashColor,
    FocusNode? focusNode,
    bool? autofocus,
    Color? tileColor,
    Color? selectedTileColor,
    bool? enableFeedback,
    double? horizontalTitleGap,
    double? minVerticalPadding,
    double? minLeadingWidth,
  }) {
    return NaListTileOptionsMaterial(
      isThreeLine       : isThreeLine ?? this.isThreeLine,
      dense             : dense ?? this.dense,
      visualDensity     : visualDensity ?? this.visualDensity,
      shape             : shape ?? this.shape,
      style             : style ?? this.style,
      selectedColor     : selectedColor ?? this.selectedColor,
      iconColor         : iconColor ?? this.iconColor,
      textColor         : textColor ?? this.textColor,
      contentPadding    : contentPadding ?? this.contentPadding,
      enabled           : enabled ?? this.enabled,
      onLongPress       : onLongPress ?? this.onLongPress,
      onFocusChange     : onFocusChange ?? this.onFocusChange,
      mouseCursor       : mouseCursor ?? this.mouseCursor,
      selected          : selected ?? this.selected,
      focusColor        : focusColor ?? this.focusColor,
      hoverColor        : hoverColor ?? this.hoverColor,
      splashColor       : splashColor ?? this.splashColor,
      focusNode         : focusNode ?? this.focusNode,
      autofocus         : autofocus ?? this.autofocus,
      tileColor         : tileColor ?? this.tileColor,
      selectedTileColor : selectedTileColor ?? this.selectedTileColor,
      enableFeedback    : enableFeedback ?? this.enableFeedback,
      horizontalTitleGap: horizontalTitleGap ?? this.horizontalTitleGap,
      minVerticalPadding: minVerticalPadding ?? this.minVerticalPadding,
      minLeadingWidth   : minLeadingWidth ?? this.minLeadingWidth,
    );
  }
}

/// Cupertino-specific options for [NaListTile], resolving into a [CupertinoListTile].
class NaListTileOptionsCupertino extends NaListTileOptionsGeneric {
  /// Additional information to display in the list tile.
  final Widget? additionalInfo;
  /// The background color of this widget.
  final Color? backgroundColor;
  /// The background color when the tile is activated.
  final Color? backgroundColorActivated;
  /// The amount of space by which to inset the widget's contents.
  final EdgeInsetsGeometry? padding;
  /// The size of the leading widget area.
  final double? leadingSize;
  /// The spacing between the leading widget and title.
  final double? leadingToTitle;

  /// Creates a [NaListTileOptionsCupertino].
  NaListTileOptionsCupertino({
    this.additionalInfo,
    this.backgroundColor,
    this.backgroundColorActivated,
    this.padding,
    this.leadingSize,
    this.leadingToTitle,
  });

  /// Creates an empty [NaListTileOptionsCupertino] with default values.
  NaListTileOptionsCupertino.empty() : this();

  /// Creates a [NaListTileOptionsCupertino] from generic options.
  NaListTileOptionsCupertino.fromGeneric(
    NaListTileOptionsGeneric? generic, {
    this.additionalInfo,
    this.backgroundColor,
    this.backgroundColorActivated,
    this.padding,
    this.leadingSize,
    this.leadingToTitle,
  }) : super();

  /// Creates a copy of this [NaListTileOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaListTileOptionsCupertino copyWith({
    Widget? additionalInfo,
    Color? backgroundColor,
    Color? backgroundColorActivated,
    EdgeInsetsGeometry? padding,
    double? leadingSize,
    double? leadingToTitle,
  }) {
    return NaListTileOptionsCupertino(
      additionalInfo          : additionalInfo ?? this.additionalInfo,
      backgroundColor         : backgroundColor ?? this.backgroundColor,
      backgroundColorActivated: backgroundColorActivated ?? this.backgroundColorActivated,
      padding                 : padding ?? this.padding,
      leadingSize             : leadingSize ?? this.leadingSize,
      leadingToTitle          : leadingToTitle ?? this.leadingToTitle,
    );
  }
}

/// A generic ListTile widget that automatically renders a [ListTile] on Material
/// and a [CupertinoListTile] on Cupertino.
class NaListTile extends NaWidget {
  /// A widget to display before the title.
  final Widget? leading;
  /// The primary content of the list tile or widget.
  final Widget title;
  /// Additional content displayed below the title.
  final Widget? subtitle;
  /// A widget to display after the title.
  final Widget? trailing;
  /// Called when the user taps this widget.
  final VoidCallback? onTap;
  /// Whether to display a trailing chevron disclosure indicator.
  final bool hasChevron;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaListTileOptions>? optionsBuilder;

  /// Creates a [NaListTile].
  const NaListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.hasChevron = false,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaListTile] with the given fields replaced by non-null values.
  NaListTile copyWith({
    Key? key,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    bool? hasChevron,
    NaWidgetOptionsBuilder<NaListTileOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaListTile(
      key           : key ?? this.key,
      leading       : leading ?? this.leading,
      title         : title ?? this.title,
      subtitle      : subtitle ?? this.subtitle,
      trailing      : trailing ?? this.trailing,
      onTap         : onTap ?? this.onTap,
      hasChevron    : hasChevron ?? this.hasChevron,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaListTileOptions? options = optionsBuilder?.call(context, uiType);

    Widget? finalTrailing = this.trailing;
    if (this.hasChevron) {
      final Widget chevron = uiType == NaUiType.cupertino
          ? const CupertinoListTileChevron()
          : const Icon(Icons.chevron_right);

      if (finalTrailing != null) {
        finalTrailing = Row(
          mainAxisSize: MainAxisSize.min,
          children    : [finalTrailing, const SizedBox(width: 8.0), chevron],
        );
      }else {
        finalTrailing = chevron;
      }
    }

    if (uiType == NaUiType.cupertino) {
      final NaListTileOptionsCupertino? cupertinoOptions = options is NaListTileOptionsCupertino
        ? options
        : null
      ;
      return CupertinoListTile(
        leading                 : this.leading,
        title                   : this.title,
        subtitle                : this.subtitle,
        trailing                : finalTrailing,
        additionalInfo          : cupertinoOptions?.additionalInfo,
        onTap                   : this.onTap,
        backgroundColor         : cupertinoOptions?.backgroundColor,
        backgroundColorActivated: cupertinoOptions?.backgroundColorActivated,
        padding                 : cupertinoOptions?.padding,
        leadingSize             : cupertinoOptions?.leadingSize ?? 28.0,
        leadingToTitle          : cupertinoOptions?.leadingToTitle ?? 16.0,
      );
    }

    if (uiType == NaUiType.material) {
      final NaListTileOptionsMaterial? materialOptions = options is NaListTileOptionsMaterial
        ? options
        : null
      ;
      return ListTile(
        leading           : this.leading,
        title             : this.title,
        subtitle          : this.subtitle,
        trailing          : finalTrailing,
        isThreeLine       : materialOptions?.isThreeLine ?? false,
        dense             : materialOptions?.dense,
        visualDensity     : materialOptions?.visualDensity,
        shape             : materialOptions?.shape,
        style             : materialOptions?.style,
        selectedColor     : materialOptions?.selectedColor,
        iconColor         : materialOptions?.iconColor,
        textColor         : materialOptions?.textColor,
        contentPadding    : materialOptions?.contentPadding,
        enabled           : materialOptions?.enabled ?? true,
        onTap             : this.onTap,
        onLongPress       : materialOptions?.onLongPress,
        onFocusChange     : materialOptions?.onFocusChange,
        mouseCursor       : materialOptions?.mouseCursor,
        selected          : materialOptions?.selected ?? false,
        focusColor        : materialOptions?.focusColor,
        hoverColor        : materialOptions?.hoverColor,
        splashColor       : materialOptions?.splashColor,
        focusNode         : materialOptions?.focusNode,
        autofocus         : materialOptions?.autofocus ?? false,
        tileColor         : materialOptions?.tileColor,
        selectedTileColor : materialOptions?.selectedTileColor,
        enableFeedback    : materialOptions?.enableFeedback,
        horizontalTitleGap: materialOptions?.horizontalTitleGap,
        minVerticalPadding: materialOptions?.minVerticalPadding,
        minLeadingWidth   : materialOptions?.minLeadingWidth,
      );
    }

    return null;
  }
}
