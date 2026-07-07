import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaButton].
abstract class NaButtonOptions extends NaWidgetOptions {}

/// Material-specific options for [NaButton], resolving into an [ElevatedButton].
class NaButtonOptionsMaterial extends NaButtonOptions {
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;

  NaButtonOptionsMaterial({
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
    this.statesController,
  });
}

/// Cupertino-specific options for [NaButton], resolving into a [CupertinoButton].
class NaButtonOptionsCupertino extends NaButtonOptions {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Size? minimumSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;

  NaButtonOptionsCupertino({
    this.padding,
    this.color,
    this.disabledColor,
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
    this.alignment,
  });
}

/// A generic Button widget that automatically renders an [ElevatedButton] on Material
/// and a [CupertinoButton] on Cupertino.
class NaButton extends NaWidget {
  final Widget child;
  final VoidCallback? onPressed;

  /// Function to resolve platform-specific options at runtime.
  final NaWidgetOptionsBuilder<NaButtonOptions>? optionsBuilder;

  const NaButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    // 1. Resolve options via the builder provided by the user (if present)
    final NaButtonOptions? options = optionsBuilder?.call(context, uiType);

    // 2. Check type and render accordingly
    if (uiType == NaUiType.cupertino) {
      final NaButtonOptionsCupertino? cupertinoOptions = options is NaButtonOptionsCupertino
        ? options
        : null
      ;
      return CupertinoButton(
        onPressed    : this.onPressed,
        padding      : cupertinoOptions?.padding,
        color        : cupertinoOptions?.color,
        disabledColor:
            cupertinoOptions?.disabledColor ??
            CupertinoColors.quaternarySystemFill,
        minimumSize:
            cupertinoOptions?.minimumSize ??
            const Size(
              kMinInteractiveDimensionCupertino,
              kMinInteractiveDimensionCupertino,
            ),
        pressedOpacity: cupertinoOptions?.pressedOpacity ?? 0.4,
        borderRadius  :
            cupertinoOptions?.borderRadius ??
            const BorderRadius.all(Radius.circular(8.0)),
        alignment: cupertinoOptions?.alignment ?? Alignment.center,
        child    : this.child,
      );
    }

    if (uiType == NaUiType.material) {
      // Default fallback to Material
      final NaButtonOptionsMaterial? materialOptions = options is NaButtonOptionsMaterial
        ? options
        : null
      ;
      return ElevatedButton(
        onPressed       : this.onPressed,
        onLongPress     : materialOptions?.onLongPress,
        onHover         : materialOptions?.onHover,
        onFocusChange   : materialOptions?.onFocusChange,
        style           : materialOptions?.style,
        focusNode       : materialOptions?.focusNode,
        autofocus       : materialOptions?.autofocus ?? false,
        clipBehavior    : materialOptions?.clipBehavior ?? Clip.none,
        statesController: materialOptions?.statesController,
        child           : this.child,
      );
    }

    return null;
  }
}
