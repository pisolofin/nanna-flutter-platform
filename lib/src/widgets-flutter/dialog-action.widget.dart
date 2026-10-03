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
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;

  NaDialogActionOptionsMaterial({
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
  });

  /// Creates an empty [NaDialogActionOptionsMaterial] with default values.
  NaDialogActionOptionsMaterial.empty() : this();

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
  final bool? isDefaultAction;
  final bool? isDestructiveAction;
  final TextStyle? textStyle;

  NaDialogActionOptionsCupertino({
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  });

  /// Creates an empty [NaDialogActionOptionsCupertino] with default values.
  NaDialogActionOptionsCupertino.empty() : this();

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
  final Widget child;
  final VoidCallback? onPressed;

  final NaWidgetOptionsBuilder<NaDialogActionOptions>? optionsBuilder;

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
