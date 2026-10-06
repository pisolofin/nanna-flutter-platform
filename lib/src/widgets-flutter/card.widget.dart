import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaCard].
abstract class NaCardOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaCardOptions();

  /// Creates an empty [NaCardOptions] with default values.
  factory NaCardOptions.empty() => NaCardOptionsGeneric.empty();
}

/// Generic options for [NaCard], holding properties common to both platforms.
class NaCardOptionsGeneric extends NaCardOptions {
  final Color? color;
  final EdgeInsetsGeometry? margin;

  NaCardOptionsGeneric({
    this.color,
    this.margin,
  });

  /// Creates an empty [NaCardOptionsGeneric] with default values.
  NaCardOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaCardOptionsGeneric] with the given fields replaced by non-null values.
  NaCardOptionsGeneric copyWith({
    Color? color,
    EdgeInsetsGeometry? margin,
  }) {
    return NaCardOptionsGeneric(
      color : color ?? this.color,
      margin: margin ?? this.margin,
    );
  }
}

/// Material-specific options for [NaCard], resolving into a [Card].
class NaCardOptionsMaterial extends NaCardOptionsGeneric {
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool? borderOnForeground;
  final Clip? clipBehavior;
  final bool? semanticContainer;

  NaCardOptionsMaterial({
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground,
    this.clipBehavior,
    this.semanticContainer,
    super.color,
    super.margin,
  });

  /// Creates an empty [NaCardOptionsMaterial] with default values.
  NaCardOptionsMaterial.empty() : this();

  /// Creates a [NaCardOptionsMaterial] from generic options.
  NaCardOptionsMaterial.fromGeneric(
    NaCardOptionsGeneric? generic, {
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground,
    this.clipBehavior,
    this.semanticContainer,
  }) : super(
         color : generic?.color,
         margin: generic?.margin,
       );

  /// Creates a copy of this [NaCardOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaCardOptionsMaterial copyWith({
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool? borderOnForeground,
    Clip? clipBehavior,
    bool? semanticContainer,
    Color? color,
    EdgeInsetsGeometry? margin,
  }) {
    return NaCardOptionsMaterial(
      shadowColor       : shadowColor ?? this.shadowColor,
      surfaceTintColor  : surfaceTintColor ?? this.surfaceTintColor,
      elevation         : elevation ?? this.elevation,
      shape             : shape ?? this.shape,
      borderOnForeground: borderOnForeground ?? this.borderOnForeground,
      clipBehavior      : clipBehavior ?? this.clipBehavior,
      semanticContainer : semanticContainer ?? this.semanticContainer,
      color             : color ?? this.color,
      margin            : margin ?? this.margin,
    );
  }
}

/// Cupertino-specific options for [NaCard], resolving into a decorated [Container].
class NaCardOptionsCupertino extends NaCardOptionsGeneric {
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  NaCardOptionsCupertino({
    this.padding,
    this.borderRadius,
    this.border,
    super.color,
    super.margin,
  });

  /// Creates an empty [NaCardOptionsCupertino] with default values.
  NaCardOptionsCupertino.empty() : this();

  /// Creates a [NaCardOptionsCupertino] from generic options.
  NaCardOptionsCupertino.fromGeneric(
    NaCardOptionsGeneric? generic, {
    this.padding,
    this.borderRadius,
    this.border,
  }) : super(
         color : generic?.color,
         margin: generic?.margin,
       );

  /// Creates a copy of this [NaCardOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaCardOptionsCupertino copyWith({
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
    Color? color,
    EdgeInsetsGeometry? margin,
  }) {
    return NaCardOptionsCupertino(
      padding     : padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      border      : border ?? this.border,
      color       : color ?? this.color,
      margin      : margin ?? this.margin,
    );
  }
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

  /// Creates a copy of this [NaCard] with the given fields replaced by non-null values.
  NaCard copyWith({
    Key? key,
    Widget? child,
    NaWidgetOptionsBuilder<NaCardOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaCard(
      key           : key ?? this.key,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
      child         : child ?? this.child,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaCardOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaCardOptionsGeneric? genericOptions = options is NaCardOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaCardOptionsCupertino? cupertinoOptions = options is NaCardOptionsCupertino
        ? options
        : null
      ;
      return Container(
        margin      : genericOptions?.margin ?? const EdgeInsets.all(4.0),
        padding     : cupertinoOptions?.padding,
        clipBehavior: Clip.hardEdge,
        decoration  : BoxDecoration(
          color: genericOptions?.color ??
              CupertinoTheme.of(context).barBackgroundColor,
          borderRadius:
              cupertinoOptions?.borderRadius ?? BorderRadius.circular(10.0),
          border: cupertinoOptions?.border ??
              Border.all(
                color: CupertinoColors.systemGrey4.resolveFrom(context),
                width: 0.5,
              ),
        ),
        child: this.child,
      );
    }

    if (uiType == NaUiType.material) {
      final NaCardOptionsMaterial? materialOptions = options is NaCardOptionsMaterial
        ? options
        : null
      ;
      return Card(
        color             : genericOptions?.color,
        shadowColor       : materialOptions?.shadowColor,
        surfaceTintColor  : materialOptions?.surfaceTintColor,
        elevation         : materialOptions?.elevation,
        shape             : materialOptions?.shape,
        borderOnForeground: materialOptions?.borderOnForeground ?? true,
        margin            : genericOptions?.margin,
        clipBehavior      : materialOptions?.clipBehavior,
        semanticContainer : materialOptions?.semanticContainer ?? true,
        child             : this.child,
      );
    }

    return null;
  }
}
