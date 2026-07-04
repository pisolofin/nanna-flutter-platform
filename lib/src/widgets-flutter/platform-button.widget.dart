import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

abstract class NaPlatformButtonOptions extends NaWidgetOptions {}

class NaPlatformButtonOptionsMaterial extends NaPlatformButtonOptions {
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;

  NaPlatformButtonOptionsMaterial({
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

class NaPlatformButtonOptionsCupertino extends NaPlatformButtonOptions {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Size? minimumSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;

  NaPlatformButtonOptionsCupertino({
    this.padding,
    this.color,
    this.disabledColor,
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
    this.alignment,
  });
}

class NaPlatformButton extends NaPlatformWidget {
  final Widget child;
  final VoidCallback? onPressed;

  /// Function to resolve platform-specific options at runtime.
  final NaWidgetOptionsBuilder<NaPlatformButtonOptions>? optionsBuilder;

  const NaPlatformButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    // 1. Resolve options via the builder provided by the user (if present)
    final NaPlatformButtonOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    // 2. Check type and render accordingly
    if (uiType == NaUiType.cupertino) {
      final NaPlatformButtonOptionsCupertino? cupertinoOptions = options is NaPlatformButtonOptionsCupertino ? options : null;
      return CupertinoButton(
        onPressed     : this.onPressed,
        padding       : cupertinoOptions?.padding,
        color         : cupertinoOptions?.color,
        disabledColor : cupertinoOptions?.disabledColor ?? CupertinoColors.quaternarySystemFill,
        minimumSize   : cupertinoOptions?.minimumSize ?? const Size(kMinInteractiveDimensionCupertino, kMinInteractiveDimensionCupertino),
        pressedOpacity: cupertinoOptions?.pressedOpacity ?? 0.4,
        borderRadius  : cupertinoOptions?.borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
        alignment     : cupertinoOptions?.alignment ?? Alignment.center,
        child         : this.child,
      );
    }

    // Default fallback to Material
    final NaPlatformButtonOptionsMaterial? materialOptions = options is NaPlatformButtonOptionsMaterial ? options : null;
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
}
