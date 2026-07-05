import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/na-widget.widget.dart';

/// Base options for [NaCard].
abstract class NaCardOptions extends NaWidgetOptions {}

/// Material-specific options for [NaCard], resolving into a [Card].
class NaCardOptionsMaterial extends NaCardOptions {
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? borderOnForeground;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final bool? semanticContainer;

  NaCardOptionsMaterial({
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground,
    this.margin,
    this.clipBehavior,
    this.semanticContainer,
  });
}

/// Cupertino-specific options for [NaCard], resolving into a decorated [Container].
class NaCardOptionsCupertino extends NaCardOptions {
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  NaCardOptionsCupertino({
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
    this.border,
  });
}

/// A generic Card widget that automatically renders a [Card] on Material
/// and a decorated [Container] on Cupertino.
class NaCard extends NaWidget {
  final Widget child;

  final NaWidgetOptionsBuilder<NaCardOptions>? optionsBuilder;

  const NaCard({
    super.key,
    required this.child,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaCardOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaCardOptionsCupertino? cupertinoOptions = options is NaCardOptionsCupertino
        ? options
        : null
      ;
      return Container(
        margin      : cupertinoOptions?.margin ?? const EdgeInsets.all(4.0),
        padding     : cupertinoOptions?.padding,
        clipBehavior: Clip.hardEdge,
        decoration  : BoxDecoration(
          color:
              cupertinoOptions?.color ??
              CupertinoTheme.of(context).barBackgroundColor,
          borderRadius:
              cupertinoOptions?.borderRadius ?? BorderRadius.circular(10.0),
          border:
              cupertinoOptions?.border ??
              Border.all(
                color: CupertinoColors.systemGrey4.resolveFrom(context),
                width: 0.5,
              ),
        ),
        child: this.child,
      );
    }

    final NaCardOptionsMaterial? materialOptions = options is NaCardOptionsMaterial
      ? options
      : null
    ;
    return Card(
      color             : materialOptions?.color,
      shadowColor       : materialOptions?.shadowColor,
      surfaceTintColor  : materialOptions?.surfaceTintColor,
      elevation         : materialOptions?.elevation,
      shape             : materialOptions?.shape,
      borderOnForeground: materialOptions?.borderOnForeground ?? true,
      margin            : materialOptions?.margin,
      clipBehavior      : materialOptions?.clipBehavior,
      semanticContainer : materialOptions?.semanticContainer ?? true,
      child             : this.child,
    );
  }
}
