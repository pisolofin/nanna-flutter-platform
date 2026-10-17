import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaDialogAction].
abstract class NaDialogActionOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaDialogActionOptions();

  /// Creates an empty [NaDialogActionOptions] with default values.
  factory NaDialogActionOptions.empty() => NaDialogActionOptionsGeneric.empty();
}

/// Generic options for [NaDialogAction], holding properties common to both platforms.
class NaDialogActionOptionsGeneric extends NaDialogActionOptions {
  /// Creates a [NaDialogActionOptionsGeneric].
  NaDialogActionOptionsGeneric();

  /// Creates an empty [NaDialogActionOptionsGeneric] with default values.
  NaDialogActionOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaDialogActionOptionsGeneric].
  NaDialogActionOptionsGeneric copyWith() {
    return NaDialogActionOptionsGeneric();
  }
}

/// Material-specific options for [NaDialogAction], resolving into a [TextButton].
class NaDialogActionOptionsMaterial extends NaDialogActionOptionsGeneric {
  /// The text style or button style.
  final ButtonStyle? style;
  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;
  /// True if this widget will be selected as the initial focus.
  final bool? autofocus;
  /// The content will be clipped (or not) according to this option.
  final Clip? clipBehavior;

  /// Creates a [NaDialogActionOptionsMaterial].
  NaDialogActionOptionsMaterial({
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
  });

  /// Creates an empty [NaDialogActionOptionsMaterial] with default values.
  NaDialogActionOptionsMaterial.empty() : this();

  /// Creates a [NaDialogActionOptionsMaterial] from generic options.
  NaDialogActionOptionsMaterial.fromGeneric(
    NaDialogActionOptionsGeneric? generic, {
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
  }) : super();

  /// Creates a copy of this [NaDialogActionOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaDialogActionOptionsMaterial copyWith({
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
  }) {
    return NaDialogActionOptionsMaterial(
      style       : style ?? this.style,
      focusNode   : focusNode ?? this.focusNode,
      autofocus   : autofocus ?? this.autofocus,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

/// Cupertino-specific options for [NaDialogAction], resolving into a [CupertinoDialogAction].
class NaDialogActionOptionsCupertino extends NaDialogActionOptionsGeneric {
  /// Whether this action is the default choice in the dialog.
  final bool? isDefaultAction;
  /// Whether this action destroys an object or performs a destructive action.
  final bool? isDestructiveAction;
  /// The text style to use.
  final TextStyle? textStyle;

  /// Creates a [NaDialogActionOptionsCupertino].
  NaDialogActionOptionsCupertino({
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  });

  /// Creates an empty [NaDialogActionOptionsCupertino] with default values.
  NaDialogActionOptionsCupertino.empty() : this();

  /// Creates a [NaDialogActionOptionsCupertino] from generic options.
  NaDialogActionOptionsCupertino.fromGeneric(
    NaDialogActionOptionsGeneric? generic, {
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  }) : super();

  /// Creates a copy of this [NaDialogActionOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaDialogActionOptionsCupertino copyWith({
    bool? isDefaultAction,
    bool? isDestructiveAction,
    TextStyle? textStyle,
  }) {
    return NaDialogActionOptionsCupertino(
      isDefaultAction    : isDefaultAction ?? this.isDefaultAction,
      isDestructiveAction: isDestructiveAction ?? this.isDestructiveAction,
      textStyle          : textStyle ?? this.textStyle,
    );
  }
}

/// A generic Dialog Action widget that automatically renders a [TextButton] on Material
/// and a [CupertinoDialogAction] on Cupertino.
class NaDialogAction extends NaWidget {
  /// The widget below this widget in the tree.
  final Widget child;
  /// The callback that is called when the widget is tapped or activated.
  final VoidCallback? onPressed;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaDialogActionOptions>? optionsBuilder;

  /// Creates a [NaDialogAction].
  const NaDialogAction({
    super.key,
    required this.child,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaDialogAction] with the given fields replaced by non-null values.
  NaDialogAction copyWith({
    Key? key,
    Widget? child,
    VoidCallback? onPressed,
    NaWidgetOptionsBuilder<NaDialogActionOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaDialogAction(
      key           : key ?? this.key,
      onPressed     : onPressed ?? this.onPressed,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
      child         : child ?? this.child,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaDialogActionOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaDialogActionOptionsCupertino? cupertinoOptions = options is NaDialogActionOptionsCupertino
        ? options
        : null
      ;
      return CupertinoDialogAction(
        onPressed          : this.onPressed,
        isDefaultAction    : cupertinoOptions?.isDefaultAction ?? false,
        isDestructiveAction: cupertinoOptions?.isDestructiveAction ?? false,
        textStyle          : cupertinoOptions?.textStyle,
        child              : this.child,
      );
    }

    if (uiType == NaUiType.material) {
      final NaDialogActionOptionsMaterial? materialOptions = options is NaDialogActionOptionsMaterial
        ? options
        : null
      ;
      return TextButton(
        onPressed   : this.onPressed,
        style       : materialOptions?.style,
        focusNode   : materialOptions?.focusNode,
        autofocus   : materialOptions?.autofocus ?? false,
        clipBehavior: materialOptions?.clipBehavior ?? Clip.none,
        child       : this.child,
      );
    }

    return null;
  }
}
