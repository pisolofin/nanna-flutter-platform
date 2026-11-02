import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaIconButton].
abstract class NaIconButtonOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaIconButtonOptions();

  /// Creates an empty [NaIconButtonOptions] with default values.
  factory NaIconButtonOptions.empty() => NaIconButtonOptionsGeneric.empty();
}

/// Generic options for [NaIconButton], holding properties common to both platforms.
class NaIconButtonOptionsGeneric extends NaIconButtonOptions {
  /// The amount of space by which to inset the widget's contents.
  final EdgeInsetsGeometry? padding;
  /// How the child is aligned within the widget.
  final AlignmentGeometry? alignment;
  /// The color of this widget.
  final Color? color;
  /// The color for this widget when it is disabled.
  final Color? disabledColor;

  /// Creates a [NaIconButtonOptionsGeneric].
  NaIconButtonOptionsGeneric({
    this.padding,
    this.alignment,
    this.color,
    this.disabledColor,
  });

  /// Creates an empty [NaIconButtonOptionsGeneric] with default values.
  NaIconButtonOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaIconButtonOptionsGeneric] with the given fields replaced by non-null values.
  NaIconButtonOptionsGeneric copyWith({
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    Color? color,
    Color? disabledColor,
  }) {
    return NaIconButtonOptionsGeneric(
      padding      : padding ?? this.padding,
      alignment    : alignment ?? this.alignment,
      color        : color ?? this.color,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }
}

/// Material-specific options for [NaIconButton], resolving into an [IconButton].
class NaIconButtonOptionsMaterial extends NaIconButtonOptionsGeneric {
  /// The size of the icon.
  final double? iconSize;
  /// Defines how compact the widget's layout will be.
  final VisualDensity? visualDensity;
  /// The radius of the ink splash.
  final double? splashRadius;
  /// The color for the focus overlay.
  final Color? focusColor;
  /// The color of this widget when hovered over by a pointer.
  final Color? hoverColor;
  /// The highlight color for the widget's ink response.
  final Color? highlightColor;
  /// The splash color for the ink response.
  final Color? splashColor;
  /// The cursor for a mouse pointer when hovering over this widget.
  final MouseCursor? mouseCursor;
  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;
  /// True if this widget will be selected as the initial focus.
  final bool? autofocus;
  /// Text that describes the action that will occur when tapped.
  final String? tooltip;
  /// The box constraints for this widget.
  final BoxConstraints? constraints;
  /// The text style or button style.
  final ButtonStyle? style;

  /// Creates a [NaIconButtonOptionsMaterial].
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

  /// Creates an empty [NaIconButtonOptionsMaterial] with default values.
  NaIconButtonOptionsMaterial.empty() : this();

  /// Creates a [NaIconButtonOptionsMaterial] from generic options.
  NaIconButtonOptionsMaterial.fromGeneric(
    NaIconButtonOptionsGeneric? generic, {
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
  }) : super(
         padding      : generic?.padding,
         alignment    : generic?.alignment,
         color        : generic?.color,
         disabledColor: generic?.disabledColor,
       );

  /// Creates a copy of this [NaIconButtonOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaIconButtonOptionsMaterial copyWith({
    double? iconSize,
    VisualDensity? visualDensity,
    double? splashRadius,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    Color? splashColor,
    MouseCursor? mouseCursor,
    FocusNode? focusNode,
    bool? autofocus,
    String? tooltip,
    BoxConstraints? constraints,
    ButtonStyle? style,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    Color? color,
    Color? disabledColor,
  }) {
    return NaIconButtonOptionsMaterial(
      iconSize      : iconSize ?? this.iconSize,
      visualDensity : visualDensity ?? this.visualDensity,
      splashRadius  : splashRadius ?? this.splashRadius,
      focusColor    : focusColor ?? this.focusColor,
      hoverColor    : hoverColor ?? this.hoverColor,
      highlightColor: highlightColor ?? this.highlightColor,
      splashColor   : splashColor ?? this.splashColor,
      mouseCursor   : mouseCursor ?? this.mouseCursor,
      focusNode     : focusNode ?? this.focusNode,
      autofocus     : autofocus ?? this.autofocus,
      tooltip       : tooltip ?? this.tooltip,
      constraints   : constraints ?? this.constraints,
      style         : style ?? this.style,
      padding       : padding ?? this.padding,
      alignment     : alignment ?? this.alignment,
      color         : color ?? this.color,
      disabledColor : disabledColor ?? this.disabledColor,
    );
  }
}

/// Cupertino-specific options for [NaIconButton], resolving into a [CupertinoButton].
class NaIconButtonOptionsCupertino extends NaIconButtonOptionsGeneric {
  /// The minimum size of the widget.
  final Size? minimumSize;
  /// The opacity of the widget when it is being pressed.
  final double? pressedOpacity;
  /// If non-null, the corners of this widget are rounded by this [BorderRadius].
  final BorderRadius? borderRadius;

  /// Creates a [NaIconButtonOptionsCupertino].
  NaIconButtonOptionsCupertino({
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
    super.padding,
    super.alignment,
    super.color,
    super.disabledColor,
  });

  /// Creates an empty [NaIconButtonOptionsCupertino] with default values.
  NaIconButtonOptionsCupertino.empty() : this();

  /// Creates a [NaIconButtonOptionsCupertino] from generic options.
  NaIconButtonOptionsCupertino.fromGeneric(
    NaIconButtonOptionsGeneric? generic, {
    this.minimumSize,
    this.pressedOpacity,
    this.borderRadius,
  }) : super(
         padding      : generic?.padding,
         alignment    : generic?.alignment,
         color        : generic?.color,
         disabledColor: generic?.disabledColor,
       );

  /// Creates a copy of this [NaIconButtonOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaIconButtonOptionsCupertino copyWith({
    Size? minimumSize,
    double? pressedOpacity,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    AlignmentGeometry? alignment,
    Color? color,
    Color? disabledColor,
  }) {
    return NaIconButtonOptionsCupertino(
      minimumSize   : minimumSize ?? this.minimumSize,
      pressedOpacity: pressedOpacity ?? this.pressedOpacity,
      borderRadius  : borderRadius ?? this.borderRadius,
      padding       : padding ?? this.padding,
      alignment     : alignment ?? this.alignment,
      color         : color ?? this.color,
      disabledColor : disabledColor ?? this.disabledColor,
    );
  }
}

/// A generic IconButton widget that automatically renders an [IconButton] on Material
/// and a [CupertinoButton] on Cupertino.
class NaIconButton extends NaWidget {
  /// The icon to display.
  final Widget icon;
  /// The callback that is called when the widget is tapped or activated.
  final VoidCallback? onPressed;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaIconButtonOptions>? optionsBuilder;

  /// Creates a [NaIconButton].
  const NaIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaIconButton] with the given fields replaced by non-null values.
  NaIconButton copyWith({
    Key? key,
    Widget? icon,
    VoidCallback? onPressed,
    NaWidgetOptionsBuilder<NaIconButtonOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaIconButton(
      key           : key ?? this.key,
      icon          : icon ?? this.icon,
      onPressed     : onPressed ?? this.onPressed,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

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
