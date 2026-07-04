import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformIconButton].
abstract class NaPlatformIconButtonOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformIconButton], resolving into an [IconButton].
class NaPlatformIconButtonOptionsMaterial extends NaPlatformIconButtonOptions {
  final double? iconSize;
  final VisualDensity? visualDensity;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? splashRadius;
  final Color? color;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? disabledColor;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final String? tooltip;
  final BoxConstraints? constraints;
  final ButtonStyle? style;

  NaPlatformIconButtonOptionsMaterial({
    this.iconSize,
    this.visualDensity,
    this.padding,
    this.alignment,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.mouseCursor,
    this.focusNode,
    this.autofocus,
    this.tooltip,
    this.constraints,
    this.style,
  });
}

/// Cupertino-specific options for [NaPlatformIconButton], resolving into a [CupertinoButton].
class NaPlatformIconButtonOptionsCupertino extends NaPlatformIconButtonOptions {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Size? minimumSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;

  NaPlatformIconButtonOptionsCupertino({
    this.padding,
    this.color,
    this.disabledColor,
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
    this.alignment,
  });
}

/// A generic IconButton widget that automatically renders an [IconButton] on Material 
/// and a [CupertinoButton] on Cupertino.
class NaPlatformIconButton extends NaPlatformWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  final NaWidgetOptionsBuilder<NaPlatformIconButtonOptions>? optionsBuilder;

  const NaPlatformIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformIconButtonOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformIconButtonOptionsCupertino? cupertinoOptions = options is NaPlatformIconButtonOptionsCupertino ? options : null;
      return CupertinoButton(
        onPressed     : this.onPressed,
        padding       : cupertinoOptions?.padding ?? EdgeInsets.zero,
        color         : cupertinoOptions?.color,
        disabledColor : cupertinoOptions?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        minimumSize   : cupertinoOptions?.minimumSize ?? const Size(kMinInteractiveDimensionCupertino, kMinInteractiveDimensionCupertino),
        pressedOpacity: cupertinoOptions?.pressedOpacity ?? 0.4,
        borderRadius  : cupertinoOptions?.borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
        alignment     : cupertinoOptions?.alignment ?? Alignment.center,
        child         : this.icon,
      );
    }

    final NaPlatformIconButtonOptionsMaterial? materialOptions = options is NaPlatformIconButtonOptionsMaterial ? options : null;
    return IconButton(
      onPressed     : this.onPressed,
      icon          : this.icon,
      iconSize      : materialOptions?.iconSize,
      visualDensity : materialOptions?.visualDensity,
      padding       : materialOptions?.padding,
      alignment     : materialOptions?.alignment,
      splashRadius  : materialOptions?.splashRadius,
      color         : materialOptions?.color,
      focusColor    : materialOptions?.focusColor,
      hoverColor    : materialOptions?.hoverColor,
      highlightColor: materialOptions?.highlightColor,
      splashColor   : materialOptions?.splashColor,
      disabledColor : materialOptions?.disabledColor,
      mouseCursor   : materialOptions?.mouseCursor,
      focusNode     : materialOptions?.focusNode,
      autofocus     : materialOptions?.autofocus ?? false,
      tooltip       : materialOptions?.tooltip,
      constraints   : materialOptions?.constraints,
      style         : materialOptions?.style,
    );
  }
}
