import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../models/icon-data.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaIcon].
abstract class NaIconOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaIconOptions();

  /// Creates an empty [NaIconOptions] with default values.
  factory NaIconOptions.empty() => NaIconOptionsGeneric.empty();
}

/// Generic options for [NaIcon], holding properties common to both platforms.
class NaIconOptionsGeneric extends NaIconOptions {
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;

  NaIconOptionsGeneric({
    this.shadows,
    this.semanticLabel,
    this.textDirection,
  });

  /// Creates an empty [NaIconOptionsGeneric] with default values.
  NaIconOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaIconOptionsGeneric] with the given fields replaced by non-null values.
  NaIconOptionsGeneric copyWith({
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
  }) {
    return NaIconOptionsGeneric(
      shadows      : shadows ?? this.shadows,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      textDirection: textDirection ?? this.textDirection,
    );
  }
}

/// Material-specific options for [NaIcon], resolving into an [Icon].
class NaIconOptionsMaterial extends NaIconOptionsGeneric {
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;

  NaIconOptionsMaterial({
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    super.shadows,
    super.semanticLabel,
    super.textDirection,
  });

  /// Creates an empty [NaIconOptionsMaterial] with default values.
  NaIconOptionsMaterial.empty() : this();

  /// Creates a copy of this [NaIconOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaIconOptionsMaterial copyWith({
    double? fill,
    double? weight,
    double? grade,
    double? opticalSize,
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
  }) {
    return NaIconOptionsMaterial(
      fill         : fill ?? this.fill,
      weight       : weight ?? this.weight,
      grade        : grade ?? this.grade,
      opticalSize  : opticalSize ?? this.opticalSize,
      shadows      : shadows ?? this.shadows,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      textDirection: textDirection ?? this.textDirection,
    );
  }
}

/// Cupertino-specific options for [NaIcon], resolving into an [Icon].
/// (Cupertino does not use fill/weight/grade native properties by default on standard icons).
class NaIconOptionsCupertino extends NaIconOptionsGeneric {
  NaIconOptionsCupertino({
    super.shadows,
    super.semanticLabel,
    super.textDirection,
  });

  /// Creates an empty [NaIconOptionsCupertino] with default values.
  NaIconOptionsCupertino.empty() : this();

  /// Creates a copy of this [NaIconOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaIconOptionsCupertino copyWith({
    List<Shadow>? shadows,
    String? semanticLabel,
    TextDirection? textDirection,
  }) {
    return NaIconOptionsCupertino(
      shadows      : shadows ?? this.shadows,
      semanticLabel: semanticLabel ?? this.semanticLabel,
      textDirection: textDirection ?? this.textDirection,
    );
  }
}

/// A cross-platform Icon widget that automatically resolves to the correct native [IconData]
/// via a [NaIconData] object.
class NaIcon extends NaWidget {
  final NaIconData icon;
  final double? size;
  final Color? color;

  final NaWidgetOptionsBuilder<NaIconOptions>? optionsBuilder;

  const NaIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaIcon] with the given fields replaced by non-null values.
  NaIcon copyWith({
    NaIconData? icon,
    Key? key,
    double? size,
    Color? color,
    NaWidgetOptionsBuilder<NaIconOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaIcon(
      icon ?? this.icon,
      key           : key ?? this.key,
      size          : size ?? this.size,
      color         : color ?? this.color,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaIconOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaIconOptionsGeneric? genericOptions = options is NaIconOptionsGeneric
      ? options
      : null
    ;

    final IconData resolvedIcon = this.icon.resolve(uiType);

    if (uiType == NaUiType.cupertino) {
      return Icon(
        resolvedIcon,
        size         : this.size,
        color        : this.color,
        shadows      : genericOptions?.shadows,
        semanticLabel: genericOptions?.semanticLabel,
        textDirection: genericOptions?.textDirection,
      );
    }

    if (uiType == NaUiType.material) {
      final NaIconOptionsMaterial? materialOptions = options is NaIconOptionsMaterial
        ? options
        : null
      ;
      return Icon(
        resolvedIcon,
        size         : this.size,
        color        : this.color,
        fill         : materialOptions?.fill,
        weight       : materialOptions?.weight,
        grade        : materialOptions?.grade,
        opticalSize  : materialOptions?.opticalSize,
        shadows      : genericOptions?.shadows,
        semanticLabel: genericOptions?.semanticLabel,
        textDirection: genericOptions?.textDirection,
      );
    }

    return null;
  }
}
