import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformAlertDialog].
abstract class NaPlatformAlertDialogOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformAlertDialog], resolving into a [AlertDialog].
class NaPlatformAlertDialogOptionsMaterial extends NaPlatformAlertDialogOptions {
  final Widget? icon;
  final EdgeInsetsGeometry? iconPadding;
  final Color? iconColor;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;
  final EdgeInsetsGeometry? actionsPadding;
  final MainAxisAlignment? actionsAlignment;
  final OverflowBarAlignment? actionsOverflowAlignment;
  final VerticalDirection? actionsOverflowDirection;
  final double? actionsOverflowButtonSpacing;
  final EdgeInsetsGeometry? buttonPadding;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final String? semanticLabel;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final bool? scrollable;

  NaPlatformAlertDialogOptionsMaterial({
    this.icon,
    this.iconPadding,
    this.iconColor,
    this.titlePadding,
    this.titleTextStyle,
    this.contentPadding,
    this.contentTextStyle,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.semanticLabel,
    this.shape,
    this.clipBehavior,
    this.scrollable,
  });
}

/// Cupertino-specific options for [NaPlatformAlertDialog], resolving into a [CupertinoAlertDialog].
class NaPlatformAlertDialogOptionsCupertino extends NaPlatformAlertDialogOptions {
  final ScrollController? actionScrollController;
  final ScrollController? scrollController;
  
  NaPlatformAlertDialogOptionsCupertino({
    this.actionScrollController,
    this.scrollController,
  });
}

/// A generic Alert Dialog widget that automatically renders a [AlertDialog] on Material 
/// and a [CupertinoAlertDialog] on Cupertino.
class NaPlatformAlertDialog extends NaPlatformWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  final NaWidgetOptionsBuilder<NaPlatformAlertDialogOptions>? optionsBuilder;

  const NaPlatformAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformAlertDialogOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformAlertDialogOptionsCupertino? cupertinoOptions = options is NaPlatformAlertDialogOptionsCupertino ? options : null;
      return CupertinoAlertDialog(
        title                  : this.title,
        content                : this.content,
        actions               : this.actions ?? const <Widget>[],
        actionScrollController: cupertinoOptions?.actionScrollController,
        scrollController      : cupertinoOptions?.scrollController,
      );
    }

    final NaPlatformAlertDialogOptionsMaterial? materialOptions = options is NaPlatformAlertDialogOptionsMaterial ? options : null;
    return AlertDialog(
      title                       : this.title,
      content                     : this.content,
      actions                     : this.actions,
      icon                        : materialOptions?.icon,
      iconPadding                 : materialOptions?.iconPadding,
      iconColor                   : materialOptions?.iconColor,
      titlePadding                : materialOptions?.titlePadding,
      titleTextStyle              : materialOptions?.titleTextStyle,
      contentPadding              : materialOptions?.contentPadding,
      contentTextStyle            : materialOptions?.contentTextStyle,
      actionsPadding              : materialOptions?.actionsPadding,
      actionsAlignment            : materialOptions?.actionsAlignment,
      actionsOverflowAlignment    : materialOptions?.actionsOverflowAlignment,
      actionsOverflowDirection    : materialOptions?.actionsOverflowDirection,
      actionsOverflowButtonSpacing: materialOptions?.actionsOverflowButtonSpacing,
      buttonPadding               : materialOptions?.buttonPadding,
      backgroundColor             : materialOptions?.backgroundColor,
      elevation                   : materialOptions?.elevation,
      shadowColor                 : materialOptions?.shadowColor,
      surfaceTintColor            : materialOptions?.surfaceTintColor,
      semanticLabel               : materialOptions?.semanticLabel,
      shape                       : materialOptions?.shape,
      clipBehavior                : materialOptions?.clipBehavior ?? Clip.none,
      scrollable                  : materialOptions?.scrollable ?? false,
    );
  }
}
