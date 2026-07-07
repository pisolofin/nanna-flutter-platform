import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaListTile].
abstract class NaListTileOptions extends NaWidgetOptions {}

/// Material-specific options for [NaListTile], resolving into a [ListTile].
class NaListTileOptionsMaterial extends NaListTileOptions {
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
}

/// Cupertino-specific options for [NaListTile], resolving into a [CupertinoListTile].
class NaListTileOptionsCupertino extends NaListTileOptions {
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
