import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformListTile].
abstract class NaPlatformListTileOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformListTile], resolving into a [ListTile].
class NaPlatformListTileOptionsMaterial extends NaPlatformListTileOptions {
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

  NaPlatformListTileOptionsMaterial({
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

/// Cupertino-specific options for [NaPlatformListTile], resolving into a [CupertinoListTile].
class NaPlatformListTileOptionsCupertino extends NaPlatformListTileOptions {
  final Widget? additionalInfo;
  final Color? backgroundColor;
  final Color? backgroundColorActivated;
  final EdgeInsetsGeometry? padding;
  final double? leadingSize;
  final double? leadingToTitle;

  NaPlatformListTileOptionsCupertino({
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
class NaPlatformListTile extends NaPlatformWidget {
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  final NaWidgetOptionsBuilder<NaPlatformListTileOptions>? optionsBuilder;

  const NaPlatformListTile({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformListTileOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformListTileOptionsCupertino? cupertinoOptions = options is NaPlatformListTileOptionsCupertino ? options : null;
      return CupertinoListTile(
        leading                 : this.leading,
        title                   : this.title,
        subtitle                : this.subtitle,
        trailing                : this.trailing,
        additionalInfo          : cupertinoOptions?.additionalInfo,
        onTap                   : this.onTap,
        backgroundColor         : cupertinoOptions?.backgroundColor,
        backgroundColorActivated: cupertinoOptions?.backgroundColorActivated,
        padding                 : cupertinoOptions?.padding,
        leadingSize             : cupertinoOptions?.leadingSize ?? 28.0,
        leadingToTitle          : cupertinoOptions?.leadingToTitle ?? 16.0,
      );
    }

    final NaPlatformListTileOptionsMaterial? materialOptions = options is NaPlatformListTileOptionsMaterial ? options : null;
    return ListTile(
      leading           : this.leading,
      title             : this.title,
      subtitle          : this.subtitle,
      trailing          : this.trailing,
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
}
