import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaProgressIndicator].
abstract class NaProgressIndicatorOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaProgressIndicatorOptions();

  /// Creates an empty [NaProgressIndicatorOptions] with default values.
  factory NaProgressIndicatorOptions.empty() => NaProgressIndicatorOptionsGeneric.empty();
}

/// Generic options for [NaProgressIndicator], holding properties common to both platforms.
class NaProgressIndicatorOptionsGeneric extends NaProgressIndicatorOptions {
  final Color? color;

  NaProgressIndicatorOptionsGeneric({
    this.color,
  });

  /// Creates an empty [NaProgressIndicatorOptionsGeneric] with default values.
  NaProgressIndicatorOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaProgressIndicatorOptionsGeneric] with the given fields replaced by non-null values.
  NaProgressIndicatorOptionsGeneric copyWith({
    Color? color,
  }) {
    return NaProgressIndicatorOptionsGeneric(
      color: color ?? this.color,
    );
  }
}

/// Material-specific options for [NaProgressIndicator], resolving into a [CircularProgressIndicator].
class NaProgressIndicatorOptionsMaterial extends NaProgressIndicatorOptionsGeneric {
  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final double? strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;

  NaProgressIndicatorOptionsMaterial({
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
    super.color,
  });

  /// Creates an empty [NaProgressIndicatorOptionsMaterial] with default values.
  NaProgressIndicatorOptionsMaterial.empty() : this();

  /// Creates a copy of this [NaProgressIndicatorOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaProgressIndicatorOptionsMaterial copyWith({
    double? value,
    Color? backgroundColor,
    Animation<Color?>? valueColor,
    double? strokeWidth,
    String? semanticsLabel,
    String? semanticsValue,
    Color? color,
  }) {
    return NaProgressIndicatorOptionsMaterial(
      value          : value ?? this.value,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      valueColor     : valueColor ?? this.valueColor,
      strokeWidth    : strokeWidth ?? this.strokeWidth,
      semanticsLabel : semanticsLabel ?? this.semanticsLabel,
      semanticsValue : semanticsValue ?? this.semanticsValue,
      color          : color ?? this.color,
    );
  }
}

/// Cupertino-specific options for [NaProgressIndicator], resolving into a [CupertinoActivityIndicator].
class NaProgressIndicatorOptionsCupertino extends NaProgressIndicatorOptionsGeneric {
  final double? radius;
  final bool? animating;

  NaProgressIndicatorOptionsCupertino({
    this.radius,
    this.animating,
    super.color,
  });

  /// Creates an empty [NaProgressIndicatorOptionsCupertino] with default values.
  NaProgressIndicatorOptionsCupertino.empty() : this();

  /// Creates a copy of this [NaProgressIndicatorOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaProgressIndicatorOptionsCupertino copyWith({
    double? radius,
    bool? animating,
    Color? color,
  }) {
    return NaProgressIndicatorOptionsCupertino(
      radius   : radius ?? this.radius,
      animating: animating ?? this.animating,
      color    : color ?? this.color,
    );
  }
}

/// A generic ProgressIndicator widget that automatically renders a [CircularProgressIndicator] on Material
/// and a [CupertinoActivityIndicator] on Cupertino.
class NaProgressIndicator extends NaWidget {
  final NaWidgetOptionsBuilder<NaProgressIndicatorOptions>? optionsBuilder;

  const NaProgressIndicator({ super.key, this.optionsBuilder, super.uiType });

  /// Creates a copy of this [NaProgressIndicator] with the given fields replaced by non-null values.
  NaProgressIndicator copyWith({
    Key? key,
    NaWidgetOptionsBuilder<NaProgressIndicatorOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaProgressIndicator(
      key           : key ?? this.key,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaProgressIndicatorOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );
    final NaProgressIndicatorOptionsGeneric? genericOptions = options is NaProgressIndicatorOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaProgressIndicatorOptionsCupertino? cupertinoOptions = options is NaProgressIndicatorOptionsCupertino
        ? options
        : null
      ;
      return CupertinoActivityIndicator(
        radius   : cupertinoOptions?.radius ?? 10.0,
        animating: cupertinoOptions?.animating ?? true,
        color    : genericOptions?.color,
      );
    }

    if (uiType == NaUiType.material) {
      final NaProgressIndicatorOptionsMaterial? materialOptions = options is NaProgressIndicatorOptionsMaterial
        ? options
        : null
      ;
      return CircularProgressIndicator(
        value          : materialOptions?.value,
        backgroundColor: materialOptions?.backgroundColor,
        color          : genericOptions?.color,
        valueColor     : materialOptions?.valueColor,
        strokeWidth    : materialOptions?.strokeWidth ?? 4.0,
        semanticsLabel : materialOptions?.semanticsLabel,
        semanticsValue : materialOptions?.semanticsValue,
      );
    }

    return null;
  }
}
