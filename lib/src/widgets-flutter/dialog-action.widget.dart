import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/na-widget.widget.dart';

/// Base options for [NaDialogAction].
abstract class NaDialogActionOptions extends NaWidgetOptions {}

/// Material-specific options for [NaDialogAction], resolving into a [TextButton].
class NaDialogActionOptionsMaterial extends NaDialogActionOptions {
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
}

/// Cupertino-specific options for [NaDialogAction], resolving into a [CupertinoDialogAction].
class NaDialogActionOptionsCupertino extends NaDialogActionOptions {
  final bool? isDefaultAction;
  final bool? isDestructiveAction;
  final TextStyle? textStyle;

  NaDialogActionOptionsCupertino({
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  });
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

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
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
}
