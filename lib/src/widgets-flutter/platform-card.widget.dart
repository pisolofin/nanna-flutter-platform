import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformCard].
abstract class NaPlatformCardOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformCard], resolving into a [Card].
class NaPlatformCardOptionsMaterial extends NaPlatformCardOptions {
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? borderOnForeground;
  final EdgeInsetsGeometry? margin;
  final Clip? clipBehavior;
  final bool? semanticContainer;

  NaPlatformCardOptionsMaterial({
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

/// Cupertino-specific options for [NaPlatformCard], resolving into a decorated [Container].
class NaPlatformCardOptionsCupertino extends NaPlatformCardOptions {
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  NaPlatformCardOptionsCupertino({
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
    this.border,
  });
}

/// A generic Card widget that automatically renders a [Card] on Material 
/// and a decorated [Container] on Cupertino.
class NaPlatformCard extends NaPlatformWidget {
  final Widget child;

  final NaWidgetOptionsBuilder<NaPlatformCardOptions>? optionsBuilder;

  const NaPlatformCard({
    super.key,
    required this.child,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformCardOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformCardOptionsCupertino? cupertinoOptions = options is NaPlatformCardOptionsCupertino ? options : null;
      return Container(
        margin : cupertinoOptions?.margin ?? const EdgeInsets.all(4.0),
        padding: cupertinoOptions?.padding,
        decoration: BoxDecoration(
          color       : cupertinoOptions?.color ?? CupertinoTheme.of(context).barBackgroundColor,
          borderRadius: cupertinoOptions?.borderRadius ?? BorderRadius.circular(10.0),
          border      : cupertinoOptions?.border ?? Border.all(
            color: CupertinoColors.systemGrey4.resolveFrom(context),
            width: 0.5,
          ),
        ),
        child  : this.child,
      );
    }

    final NaPlatformCardOptionsMaterial? materialOptions = options is NaPlatformCardOptionsMaterial ? options : null;
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
