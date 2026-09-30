import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaIconButton].
abstract class NaIconButtonOptions extends NaWidgetOptions {}

/// Generic options for [NaIconButton], holding properties common to both platforms.
class NaIconButtonOptionsGeneric extends NaIconButtonOptions {
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? color;
  final Color? disabledColor;

  NaIconButtonOptionsGeneric({
    this.padding,
    this.alignment,
    this.color,
    this.disabledColor,
  });
}

/// Material-specific options for [NaIconButton], resolving into an [IconButton].
class NaIconButtonOptionsMaterial extends NaIconButtonOptionsGeneric {
  final double? iconSize;
  final VisualDensity? visualDensity;
  final double? splashRadius;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final MouseCursor? mouseCursor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final String? tooltip;
  final BoxConstraints? constraints;
  final ButtonStyle? style;

  NaIconButtonOptionsMaterial({
    this.iconSize,
    this.visualDensity,
    this.splashRadius,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.mouseCursor,
    this.focusNode,
    this.autofocus,
    this.tooltip,
    this.constraints,
    this.style,
    super.padding,
    super.alignment,
    super.color,
    super.disabledColor,
  });
}

/// Cupertino-specific options for [NaIconButton], resolving into a [CupertinoButton].
class NaIconButtonOptionsCupertino extends NaIconButtonOptionsGeneric {
  final Size? minimumSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;

  NaIconButtonOptionsCupertino({
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
    super.padding,
    super.alignment,
    super.color,
    super.disabledColor,
  });
}

/// A generic IconButton widget that automatically renders an [IconButton] on Material
/// and a [CupertinoButton] on Cupertino.
class NaIconButton extends NaWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  final NaWidgetOptionsBuilder<NaIconButtonOptions>? optionsBuilder;

  const NaIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaIconButtonOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaIconButtonOptionsGeneric? genericOptions = options is NaIconButtonOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaIconButtonOptionsCupertino? cupertinoOptions = options is NaIconButtonOptionsCupertino
        ? options
        : null
      ;
      return CupertinoButton(
        onPressed    : this.onPressed,
        padding      : genericOptions?.padding ?? EdgeInsets.zero,
        color        : genericOptions?.color,
        disabledColor: genericOptions?.disabledColor ??
            CupertinoColors.quaternarySystemFill,
        minimumSize: cupertinoOptions?.minimumSize ??
            const Size(
              kMinInteractiveDimensionCupertino,
              kMinInteractiveDimensionCupertino,
            ),
        pressedOpacity: cupertinoOptions?.pressedOpacity ?? 0.4,
        borderRadius  : cupertinoOptions?.borderRadius ??
            const BorderRadius.all(Radius.circular(8.0)),
        alignment: genericOptions?.alignment ?? Alignment.center,
        child    : this.icon,
      );
    }

    if (uiType == NaUiType.material) {
      final NaIconButtonOptionsMaterial? materialOptions = options is NaIconButtonOptionsMaterial
        ? options
        : null
      ;
      return IconButton(
        onPressed     : this.onPressed,
        icon          : this.icon,
        iconSize      : materialOptions?.iconSize,
        visualDensity : materialOptions?.visualDensity,
        padding       : genericOptions?.padding,
        alignment     : genericOptions?.alignment,
        splashRadius  : materialOptions?.splashRadius,
        color         : genericOptions?.color,
        focusColor    : materialOptions?.focusColor,
        hoverColor    : materialOptions?.hoverColor,
        highlightColor: materialOptions?.highlightColor,
        splashColor   : materialOptions?.splashColor,
        disabledColor : genericOptions?.disabledColor,
        mouseCursor   : materialOptions?.mouseCursor,
        focusNode     : materialOptions?.focusNode,
        autofocus     : materialOptions?.autofocus ?? false,
        tooltip       : materialOptions?.tooltip,
        constraints   : materialOptions?.constraints,
        style         : materialOptions?.style,
      );
    }

    return null;
  }
}
