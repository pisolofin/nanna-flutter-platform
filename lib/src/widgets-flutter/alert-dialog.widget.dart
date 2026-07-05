import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/na-widget.widget.dart';

/// Base options for [NaAlertDialog].
abstract class NaAlertDialogOptions extends NaWidgetOptions {}

/// Material-specific options for [NaAlertDialog], resolving into a [AlertDialog].
class NaAlertDialogOptionsMaterial extends NaAlertDialogOptions {
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

  NaAlertDialogOptionsMaterial({
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

/// Cupertino-specific options for [NaAlertDialog], resolving into a [CupertinoAlertDialog].
class NaAlertDialogOptionsCupertino extends NaAlertDialogOptions {
  final ScrollController? actionScrollController;
  final ScrollController? scrollController;
  
  NaAlertDialogOptionsCupertino({
    this.actionScrollController,
    this.scrollController,
  });
}

/// A generic Alert Dialog widget that automatically renders a [AlertDialog] on Material 
/// and a [CupertinoAlertDialog] on Cupertino.
class NaAlertDialog extends NaWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  final NaWidgetOptionsBuilder<NaAlertDialogOptions>? optionsBuilder;

  const NaAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaAlertDialogOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaAlertDialogOptionsCupertino? cupertinoOptions = options is NaAlertDialogOptionsCupertino ? options : null;
      return CupertinoAlertDialog(
        title                  : this.title,
        content                : this.content,
        actions               : this.actions ?? const <Widget>[],
        actionScrollController: cupertinoOptions?.actionScrollController,
        scrollController      : cupertinoOptions?.scrollController,
      );
    }

    final NaAlertDialogOptionsMaterial? materialOptions = options is NaAlertDialogOptionsMaterial ? options : null;
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
