import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaButtonFilled].
abstract class NaButtonFilledOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaButtonFilledOptions();

  /// Creates an empty [NaButtonFilledOptions] with default values.
  factory NaButtonFilledOptions.empty() => NaButtonFilledOptionsGeneric.empty();
}

/// Generic options for [NaButtonFilled], holding properties common to both platforms.
class NaButtonFilledOptionsGeneric extends NaButtonFilledOptions {
  final EdgeInsetsGeometry? padding;
  final Color? color;

  NaButtonFilledOptionsGeneric({
    this.padding,
    this.color,
  });

  /// Creates an empty [NaButtonFilledOptionsGeneric] with default values.
  NaButtonFilledOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaButtonFilledOptionsGeneric] with the given fields replaced by non-null values.
  NaButtonFilledOptionsGeneric copyWith({
    EdgeInsetsGeometry? padding,
    Color? color,
  }) {
    return NaButtonFilledOptionsGeneric(
      padding: padding ?? this.padding,
      color  : color ?? this.color,
    );
  }
}

/// Material-specific options for [NaButtonFilled], resolving into a [FilledButton].
class NaButtonFilledOptionsMaterial extends NaButtonFilledOptionsGeneric {
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;
  final WidgetStatesController? statesController;

  NaButtonFilledOptionsMaterial({
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
    this.statesController,
    super.padding,
    super.color,
  });

  /// Creates an empty [NaButtonFilledOptionsMaterial] with default values.
  NaButtonFilledOptionsMaterial.empty() : this();

  /// Creates a [NaButtonFilledOptionsMaterial] from generic options.
  NaButtonFilledOptionsMaterial.fromGeneric(
    NaButtonFilledOptionsGeneric? generic, {
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
    this.statesController,
  }) : super(
         padding: generic?.padding,
         color  : generic?.color,
       );

  /// Creates a copy of this [NaButtonFilledOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaButtonFilledOptionsMaterial copyWith({
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    WidgetStatesController? statesController,
    EdgeInsetsGeometry? padding,
    Color? color,
  }) {
    return NaButtonFilledOptionsMaterial(
      onLongPress     : onLongPress ?? this.onLongPress,
      onHover         : onHover ?? this.onHover,
      onFocusChange   : onFocusChange ?? this.onFocusChange,
      style           : style ?? this.style,
      focusNode       : focusNode ?? this.focusNode,
      autofocus       : autofocus ?? this.autofocus,
      clipBehavior    : clipBehavior ?? this.clipBehavior,
      statesController: statesController ?? this.statesController,
      padding         : padding ?? this.padding,
      color           : color ?? this.color,
    );
  }
}

/// Cupertino-specific options for [NaButtonFilled], resolving into a [CupertinoButton.filled].
class NaButtonFilledOptionsCupertino extends NaButtonFilledOptionsGeneric {
  final Color? disabledColor;
  final Size? minimumSize;
  final double? pressedOpacity;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? alignment;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaButtonFilledOptionsCupertino({
    this.disabledColor,
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
    this.alignment,
    this.focusNode,
    this.autofocus,
    super.padding,
    super.color,
  });

  /// Creates an empty [NaButtonFilledOptionsCupertino] with default values.
  NaButtonFilledOptionsCupertino.empty() : this();

  /// Creates a [NaButtonFilledOptionsCupertino] from generic options.
  NaButtonFilledOptionsCupertino.fromGeneric(
    NaButtonFilledOptionsGeneric? generic, {
    this.disabledColor,
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
    this.alignment,
    this.focusNode,
    this.autofocus,
  }) : super(
         padding: generic?.padding,
         color  : generic?.color,
       );

  /// Creates a copy of this [NaButtonFilledOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaButtonFilledOptionsCupertino copyWith({
    Color? disabledColor,
    Size? minimumSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    AlignmentGeometry? alignment,
    FocusNode? focusNode,
    bool? autofocus,
    EdgeInsetsGeometry? padding,
    Color? color,
  }) {
    return NaButtonFilledOptionsCupertino(
      disabledColor : disabledColor ?? this.disabledColor,
      minimumSize   : minimumSize ?? this.minimumSize,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      borderRadius  : borderRadius ?? this.borderRadius,
      alignment     : alignment ?? this.alignment,
      focusNode     : focusNode ?? this.focusNode,
      autofocus     : autofocus ?? this.autofocus,
      padding       : padding ?? this.padding,
      color         : color ?? this.color,
    );
  }
}

/// A generic Filled Button widget that automatically renders a [FilledButton] on Material
/// and a [CupertinoButton.filled] on Cupertino.
class NaButtonFilled extends NaWidget {
  final Widget child;
  final VoidCallback? onPressed;

  /// Function to resolve platform-specific options at runtime.
  final NaWidgetOptionsBuilder<NaButtonFilledOptions>? optionsBuilder;

  const NaButtonFilled({
    super.key,
    required this.child,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaButtonFilled] with the given fields replaced by non-null values.
  NaButtonFilled copyWith({
    Key? key,
    Widget? child,
    VoidCallback? onPressed,
    NaWidgetOptionsBuilder<NaButtonFilledOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaButtonFilled(
      key           : key ?? this.key,
      onPressed     : onPressed ?? this.onPressed,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
      child         : child ?? this.child,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaButtonFilledOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaButtonFilledOptionsGeneric? genericOptions = options is NaButtonFilledOptionsGeneric
      ? options
      : null
    ;

    // Cupertino
    if (uiType == NaUiType.cupertino) {
      final NaButtonFilledOptionsCupertino? cupertinoOptions = options is NaButtonFilledOptionsCupertino
        ? options
        : null
      ;
      return CupertinoButton.filled(
        onPressed    : this.onPressed,
        padding      : genericOptions?.padding,
        color        : genericOptions?.color,
        disabledColor: cupertinoOptions?.disabledColor ??
          CupertinoColors.quaternarySystemFill,
        minimumSize: cupertinoOptions?.minimumSize ??
          const Size(
            kMinInteractiveDimensionCupertino,
            kMinInteractiveDimensionCupertino,
          ),
        pressedOpacity: cupertinoOptions?.pressedOpacity ?? 0.4,
        borderRadius  : cupertinoOptions?.borderRadius ??
          const BorderRadius.all(Radius.circular(8.0)),
        alignment: cupertinoOptions?.alignment ?? Alignment.center,
        focusNode: cupertinoOptions?.focusNode,
        autofocus: cupertinoOptions?.autofocus ?? false,
        child    : this.child,
      );
    }

    // Material
    if (uiType == NaUiType.material) {
      final NaButtonFilledOptionsMaterial? materialOptions = options is NaButtonFilledOptionsMaterial
        ? options
        : null
      ;
      final ButtonStyle? customStyle = ((genericOptions?.color != null) || (genericOptions?.padding != null))
        ? FilledButton.styleFrom(
          backgroundColor: genericOptions?.color,
          padding        : genericOptions?.padding,
        )
        : null
      ;
      final ButtonStyle? effectiveStyle = materialOptions?.style != null
        ? (customStyle != null
          ? customStyle.merge(materialOptions!.style)
          : materialOptions!.style)
        : customStyle
      ;
      return FilledButton(
        onPressed       : this.onPressed,
        onLongPress     : materialOptions?.onLongPress,
        onHover         : materialOptions?.onHover,
        onFocusChange   : materialOptions?.onFocusChange,
        style           : effectiveStyle,
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
