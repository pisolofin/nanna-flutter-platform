import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformDialogAction].
abstract class NaPlatformDialogActionOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformDialogAction], resolving into a [TextButton].
class NaPlatformDialogActionOptionsMaterial extends NaPlatformDialogActionOptions {
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;
  
  NaPlatformDialogActionOptionsMaterial({
    this.style,
    this.focusNode,
    this.autofocus,
    this.clipBehavior,
  });
}

/// Cupertino-specific options for [NaPlatformDialogAction], resolving into a [CupertinoDialogAction].
class NaPlatformDialogActionOptionsCupertino extends NaPlatformDialogActionOptions {
  final bool? isDefaultAction;
  final bool? isDestructiveAction;
  final TextStyle? textStyle;
  
  NaPlatformDialogActionOptionsCupertino({
    this.isDefaultAction,
    this.isDestructiveAction,
    this.textStyle,
  });
}

/// A generic Dialog Action widget that automatically renders a [TextButton] on Material 
/// and a [CupertinoDialogAction] on Cupertino.
class NaPlatformDialogAction extends NaPlatformWidget {
  final Widget child;
  final VoidCallback? onPressed;

  final NaWidgetOptionsBuilder<NaPlatformDialogActionOptions>? optionsBuilder;

  const NaPlatformDialogAction({
    super.key,
    required this.child,
    required this.onPressed,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformDialogActionOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformDialogActionOptionsCupertino? cupertinoOptions = options is NaPlatformDialogActionOptionsCupertino ? options : null;
      return CupertinoDialogAction(
        onPressed          : this.onPressed,
        isDefaultAction    : cupertinoOptions?.isDefaultAction ?? false,
        isDestructiveAction: cupertinoOptions?.isDestructiveAction ?? false,
        textStyle          : cupertinoOptions?.textStyle,
        child              : this.child,
      );
    }

    final NaPlatformDialogActionOptionsMaterial? materialOptions = options is NaPlatformDialogActionOptionsMaterial ? options : null;
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
