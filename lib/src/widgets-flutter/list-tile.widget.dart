import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaListTile].
abstract class NaListTileOptions extends NaWidgetOptions {}

/// Generic options for [NaListTile], holding properties common to both platforms.
class NaListTileOptionsGeneric extends NaListTileOptions {
  NaListTileOptionsGeneric();

  /// Creates a copy of this [NaListTileOptionsGeneric].
  NaListTileOptionsGeneric copyWith() {
    return NaListTileOptionsGeneric();
  }
}

/// Material-specific options for [NaListTile], resolving into a [ListTile].
class NaListTileOptionsMaterial extends NaListTileOptionsGeneric {
  final bool? isThreeLine;
  final bool? dense;
  final VisualDensity? visualDensity;
  final ShapeBorder? shape;
  final ListTileStyle? style;
  final Color? selectedColor;
  final Color? iconColor;
  final Color? textColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;
  final MouseCursor? mouseCursor;
  final bool? selected;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? splashColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Color? tileColor;
  final Color? selectedTileColor;
  final bool? enableFeedback;
  final double? horizontalTitleGap;
  final double? minVerticalPadding;
  final double? minLeadingWidth;

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
  final Widget? additionalInfo;
  final Color? backgroundColor;
  final Color? backgroundColorActivated;
  final EdgeInsetsGeometry? padding;
  final double? leadingSize;
  final double? leadingToTitle;

  NaListTileOptionsCupertino({
    this.additionalInfo,
    this.backgroundColor,
    this.backgroundColorActivated,
    this.padding,
    this.leadingSize,
    this.leadingToTitle,
  });

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
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool hasChevron;

  final NaWidgetOptionsBuilder<NaListTileOptions>? optionsBuilder;

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
      } else {
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
