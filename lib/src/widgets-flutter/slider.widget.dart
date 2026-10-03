import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaSlider].
abstract class NaSliderOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaSliderOptions();

  /// Creates an empty [NaSliderOptions] with default values.
  factory NaSliderOptions.empty() => NaSliderOptionsGeneric.empty();
}

/// Generic options for [NaSlider], holding properties common to both platforms.
class NaSliderOptionsGeneric extends NaSliderOptions {
  final Color? activeColor;
  final Color? thumbColor;
  final int? divisions;

  NaSliderOptionsGeneric({
    this.activeColor,
    this.thumbColor,
    this.divisions,
  });

  /// Creates an empty [NaSliderOptionsGeneric] with default values.
  NaSliderOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaSliderOptionsGeneric] with the given fields replaced by non-null values.
  NaSliderOptionsGeneric copyWith({
    Color? activeColor,
    Color? thumbColor,
    int? divisions,
  }) {
    return NaSliderOptionsGeneric(
      activeColor: activeColor ?? this.activeColor,
      thumbColor : thumbColor ?? this.thumbColor,
      divisions  : divisions ?? this.divisions,
    );
  }
}

/// Material-specific options for [NaSlider], resolving into a [Slider].
class NaSliderOptionsMaterial extends NaSliderOptionsGeneric {
  final Color? inactiveColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final MouseCursor? mouseCursor;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final FocusNode? focusNode;
  final bool? autofocus;
  final String? label;

  NaSliderOptionsMaterial({
    this.inactiveColor,
    this.overlayColor,
    this.mouseCursor,
    this.semanticFormatterCallback,
    this.focusNode,
    this.autofocus,
    this.label,
    super.activeColor,
    super.thumbColor,
    super.divisions,
  });

  /// Creates an empty [NaSliderOptionsMaterial] with default values.
  NaSliderOptionsMaterial.empty() : this();

  /// Creates a copy of this [NaSliderOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaSliderOptionsMaterial copyWith({
    Color? inactiveColor,
    WidgetStateProperty<Color?>? overlayColor,
    MouseCursor? mouseCursor,
    SemanticFormatterCallback? semanticFormatterCallback,
    FocusNode? focusNode,
    bool? autofocus,
    String? label,
    Color? activeColor,
    Color? thumbColor,
    int? divisions,
  }) {
    return NaSliderOptionsMaterial(
      inactiveColor            : inactiveColor ?? this.inactiveColor,
      overlayColor             : overlayColor ?? this.overlayColor,
      mouseCursor              : mouseCursor ?? this.mouseCursor,
      semanticFormatterCallback: semanticFormatterCallback ?? this.semanticFormatterCallback,
      focusNode                : focusNode ?? this.focusNode,
      autofocus                : autofocus ?? this.autofocus,
      label                    : label ?? this.label,
      activeColor              : activeColor ?? this.activeColor,
      thumbColor               : thumbColor ?? this.thumbColor,
      divisions                : divisions ?? this.divisions,
    );
  }
}

/// Cupertino-specific options for [NaSlider], resolving into a [CupertinoSlider].
class NaSliderOptionsCupertino extends NaSliderOptionsGeneric {
  NaSliderOptionsCupertino({
    super.activeColor,
    super.thumbColor,
    super.divisions,
  });

  /// Creates an empty [NaSliderOptionsCupertino] with default values.
  NaSliderOptionsCupertino.empty() : this();

  /// Creates a copy of this [NaSliderOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaSliderOptionsCupertino copyWith({
    Color? activeColor,
    Color? thumbColor,
    int? divisions,
  }) {
    return NaSliderOptionsCupertino(
      activeColor: activeColor ?? this.activeColor,
      thumbColor : thumbColor ?? this.thumbColor,
      divisions  : divisions ?? this.divisions,
    );
  }
}

/// A generic Slider widget that automatically renders a [Slider] on Material
/// and a [CupertinoSlider] on Cupertino.
class NaSlider extends NaWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;

  final NaWidgetOptionsBuilder<NaSliderOptions>? optionsBuilder;

  const NaSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0.0,
    this.max = 1.0,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaSlider] with the given fields replaced with the new values.
  NaSlider copyWith({
    Key? key,
    double? value,
    ValueChanged<double>? onChanged,
    ValueChanged<double>? onChangeStart,
    ValueChanged<double>? onChangeEnd,
    double? min,
    double? max,
    NaWidgetOptionsBuilder<NaSliderOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaSlider(
      key           : key ?? this.key,
      value         : value ?? this.value,
      onChanged     : onChanged ?? this.onChanged,
      onChangeStart : onChangeStart ?? this.onChangeStart,
      onChangeEnd   : onChangeEnd ?? this.onChangeEnd,
      min           : min ?? this.min,
      max           : max ?? this.max,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaSliderOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaSliderOptionsGeneric? genericOptions = options is NaSliderOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      return CupertinoSlider(
        value        : this.value,
        onChanged    : this.onChanged,
        onChangeStart: this.onChangeStart,
        onChangeEnd  : this.onChangeEnd,
        min          : this.min,
        max          : this.max,
        activeColor  : genericOptions?.activeColor,
        thumbColor   : genericOptions?.thumbColor ?? CupertinoColors.white,
        divisions    : genericOptions?.divisions,
      );
    }

    if (uiType == NaUiType.material) {
      final NaSliderOptionsMaterial? materialOptions = options is NaSliderOptionsMaterial
        ? options
        : null
      ;
      return Slider(
        value                    : this.value,
        onChanged                : this.onChanged,
        onChangeStart            : this.onChangeStart,
        onChangeEnd              : this.onChangeEnd,
        min                      : this.min,
        max                      : this.max,
        activeColor              : genericOptions?.activeColor,
        inactiveColor            : materialOptions?.inactiveColor,
        thumbColor               : genericOptions?.thumbColor,
        overlayColor             : materialOptions?.overlayColor,
        mouseCursor              : materialOptions?.mouseCursor,
        semanticFormatterCallback: materialOptions?.semanticFormatterCallback,
        focusNode                : materialOptions?.focusNode,
        autofocus                : materialOptions?.autofocus ?? false,
        label                    : materialOptions?.label,
        divisions                : genericOptions?.divisions,
      );
    }

    return null;
  }
}
