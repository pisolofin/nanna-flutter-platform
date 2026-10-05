import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaAlertDialog].
abstract class NaAlertDialogOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaAlertDialogOptions();

  /// Creates an empty [NaAlertDialogOptions] with default values.
  factory NaAlertDialogOptions.empty() => NaAlertDialogOptionsGeneric.empty();
}

/// Generic options for [NaAlertDialog], holding properties common to both platforms.
class NaAlertDialogOptionsGeneric extends NaAlertDialogOptions {
  NaAlertDialogOptionsGeneric();

  /// Creates an empty [NaAlertDialogOptionsGeneric] with default values.
  NaAlertDialogOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaAlertDialogOptionsGeneric].
  NaAlertDialogOptionsGeneric copyWith() {
    return NaAlertDialogOptionsGeneric();
  }
}

/// Material-specific options for [NaAlertDialog], resolving into a [AlertDialog].
class NaAlertDialogOptionsMaterial extends NaAlertDialogOptionsGeneric {
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

  /// Creates an empty [NaAlertDialogOptionsMaterial] with default values.
  NaAlertDialogOptionsMaterial.empty() : this();

  /// Creates a [NaAlertDialogOptionsMaterial] from generic options.
  NaAlertDialogOptionsMaterial.fromGeneric(
    NaAlertDialogOptionsGeneric? generic, {
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
  }) : super();

  /// Creates a copy of this [NaAlertDialogOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaAlertDialogOptionsMaterial copyWith({
    Widget? icon,
    EdgeInsetsGeometry? iconPadding,
    Color? iconColor,
    EdgeInsetsGeometry? titlePadding,
    TextStyle? titleTextStyle,
    EdgeInsetsGeometry? contentPadding,
    TextStyle? contentTextStyle,
    EdgeInsetsGeometry? actionsPadding,
    MainAxisAlignment? actionsAlignment,
    OverflowBarAlignment? actionsOverflowAlignment,
    VerticalDirection? actionsOverflowDirection,
    double? actionsOverflowButtonSpacing,
    EdgeInsetsGeometry? buttonPadding,
    Color? backgroundColor,
    double? elevation,
    Color? shadowColor,
    Color? surfaceTintColor,
    String? semanticLabel,
    ShapeBorder? shape,
    Clip? clipBehavior,
    bool? scrollable,
  }) {
    return NaAlertDialogOptionsMaterial(
      icon                        : icon ?? this.icon,
      iconPadding                 : iconPadding ?? this.iconPadding,
      iconColor                   : iconColor ?? this.iconColor,
      titlePadding                : titlePadding ?? this.titlePadding,
      titleTextStyle              : titleTextStyle ?? this.titleTextStyle,
      contentPadding              : contentPadding ?? this.contentPadding,
      contentTextStyle            : contentTextStyle ?? this.contentTextStyle,
      actionsPadding              : actionsPadding ?? this.actionsPadding,
      actionsAlignment            : actionsAlignment ?? this.actionsAlignment,
      actionsOverflowAlignment    : actionsOverflowAlignment ?? this.actionsOverflowAlignment,
      actionsOverflowDirection    : actionsOverflowDirection ?? this.actionsOverflowDirection,
      actionsOverflowButtonSpacing: actionsOverflowButtonSpacing ?? this.actionsOverflowButtonSpacing,
      buttonPadding               : buttonPadding ?? this.buttonPadding,
      backgroundColor             : backgroundColor ?? this.backgroundColor,
      elevation                   : elevation ?? this.elevation,
      shadowColor                 : shadowColor ?? this.shadowColor,
      surfaceTintColor            : surfaceTintColor ?? this.surfaceTintColor,
      semanticLabel               : semanticLabel ?? this.semanticLabel,
      shape                       : shape ?? this.shape,
      clipBehavior                : clipBehavior ?? this.clipBehavior,
      scrollable                  : scrollable ?? this.scrollable,
    );
  }
}

/// Cupertino-specific options for [NaAlertDialog], resolving into a [CupertinoAlertDialog].
class NaAlertDialogOptionsCupertino extends NaAlertDialogOptionsGeneric {
  /// Scroll controller for the actions section.
  final ScrollController? actionScrollController;

  /// Scroll controller for the main content section.
  final ScrollController? scrollController;

  /// Creates cupertino-specific options for the dialog.
  NaAlertDialogOptionsCupertino({
    this.actionScrollController,
    this.scrollController,
  });

  /// Creates an empty [NaAlertDialogOptionsCupertino] with default values.
  NaAlertDialogOptionsCupertino.empty() : this();

  /// Creates a [NaAlertDialogOptionsCupertino] from generic options.
  NaAlertDialogOptionsCupertino.fromGeneric(
    NaAlertDialogOptionsGeneric? generic, {
    this.actionScrollController,
    this.scrollController,
  }) : super();

  /// Creates a copy of this [NaAlertDialogOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaAlertDialogOptionsCupertino copyWith({
    ScrollController? actionScrollController,
    ScrollController? scrollController,
  }) {
    return NaAlertDialogOptionsCupertino(
      actionScrollController: actionScrollController ?? this.actionScrollController,
      scrollController      : scrollController ?? this.scrollController,
    );
  }
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

  /// Creates a copy of this [NaAlertDialog] with the given fields replaced by non-null values.
  NaAlertDialog copyWith({
    Key? key,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    NaWidgetOptionsBuilder<NaAlertDialogOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaAlertDialog(
      key           : key ?? this.key,
      title         : title ?? this.title,
      content       : content ?? this.content,
      actions       : actions ?? this.actions,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaAlertDialogOptions? options = this.optionsBuilder?.call(context, uiType);

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
