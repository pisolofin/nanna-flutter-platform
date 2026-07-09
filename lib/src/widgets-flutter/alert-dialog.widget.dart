import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaAlertDialog].
abstract class NaAlertDialogOptions extends NaWidgetOptions {}

/// Material-specific options for [NaAlertDialog], resolving into a [AlertDialog].
class NaAlertDialogOptionsMaterial extends NaAlertDialogOptions {
  /// The optional icon at the top of the dialog.
  final Widget? icon;
  /// Padding around the icon.
  final EdgeInsetsGeometry? iconPadding;
  /// Color of the icon.
  final Color? iconColor;
  /// Padding around the title.
  final EdgeInsetsGeometry? titlePadding;
  /// Text style for the title.
  final TextStyle? titleTextStyle;
  /// Padding around the content.
  final EdgeInsetsGeometry? contentPadding;
  /// Text style for the content.
  final TextStyle? contentTextStyle;
  /// Padding around the actions.
  final EdgeInsetsGeometry? actionsPadding;
  /// Alignment of the actions.
  final MainAxisAlignment? actionsAlignment;
  /// Alignment when actions overflow.
  final OverflowBarAlignment? actionsOverflowAlignment;
  /// Direction when actions overflow.
  final VerticalDirection? actionsOverflowDirection;
  /// Spacing between actions when they overflow.
  final double? actionsOverflowButtonSpacing;
  /// Padding around each action button.
  final EdgeInsetsGeometry? buttonPadding;
  /// Background color of the dialog.
  final Color? backgroundColor;
  /// Elevation of the dialog.
  final double? elevation;
  /// Shadow color of the dialog.
  final Color? shadowColor;
  /// Surface tint color of the dialog.
  final Color? surfaceTintColor;
  /// Semantic label for accessibility.
  final String? semanticLabel;
  /// Shape of the dialog.
  final ShapeBorder? shape;
  /// Clip behavior of the dialog.
  final Clip? clipBehavior;
  /// Whether the dialog should be scrollable.
  final bool? scrollable;

  /// Creates material-specific options for the dialog.
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
  /// Scroll controller for the actions section.
  final ScrollController? actionScrollController;
  /// Scroll controller for the main content section.
  final ScrollController? scrollController;

  /// Creates cupertino-specific options for the dialog.
  NaAlertDialogOptionsCupertino({
    this.actionScrollController,
    this.scrollController,
  });
}

/// A generic Alert Dialog widget that automatically renders a [AlertDialog] on Material
/// and a [CupertinoAlertDialog] on Cupertino.
class NaAlertDialog extends NaWidget {
  /// The (optional) title of the dialog.
  final Widget? title;
  /// The (optional) content of the dialog.
  final Widget? content;
  /// The (optional) set of actions that are displayed at the bottom of the dialog.
  final List<Widget>? actions;

  /// Builder for providing platform-specific options.
  final NaWidgetOptionsBuilder<NaAlertDialogOptions>? optionsBuilder;

  /// Creates a cross-platform alert dialog.
  const NaAlertDialog({
    super.key,
    this.title,
    this.content,
    this.actions,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaAlertDialogOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaAlertDialogOptionsCupertino? cupertinoOptions = options is NaAlertDialogOptionsCupertino
        ? options
        : null
      ;
      return CupertinoAlertDialog(
        title                 : this.title,
        content               : this.content,
        actions               : this.actions ?? const <Widget>[],
        actionScrollController: cupertinoOptions?.actionScrollController,
        scrollController      : cupertinoOptions?.scrollController,
      );
    }

    if (uiType == NaUiType.material) {
      final NaAlertDialogOptionsMaterial? materialOptions = options is NaAlertDialogOptionsMaterial
        ? options
        : null
      ;
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
        actionsOverflowButtonSpacing:
            materialOptions?.actionsOverflowButtonSpacing,
        buttonPadding   : materialOptions?.buttonPadding,
        backgroundColor : materialOptions?.backgroundColor,
        elevation       : materialOptions?.elevation,
        shadowColor     : materialOptions?.shadowColor,
        surfaceTintColor: materialOptions?.surfaceTintColor,
        semanticLabel   : materialOptions?.semanticLabel,
        shape           : materialOptions?.shape,
        clipBehavior    : materialOptions?.clipBehavior ?? Clip.none,
        scrollable      : materialOptions?.scrollable ?? false,
      );
    }

    return null;
  }
}
