import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformSlider].
abstract class NaPlatformSliderOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformSlider], resolving into a [Slider].
class NaPlatformSliderOptionsMaterial extends NaPlatformSliderOptions {
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final MouseCursor? mouseCursor;
  final SemanticFormatterCallback? semanticFormatterCallback;
  final FocusNode? focusNode;
  final bool? autofocus;
  final String? label;
  final int? divisions;

  NaPlatformSliderOptionsMaterial({
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.overlayColor,
    this.mouseCursor,
    this.semanticFormatterCallback,
    this.focusNode,
    this.autofocus,
    this.label,
    this.divisions,
  });
}

/// Cupertino-specific options for [NaPlatformSlider], resolving into a [CupertinoSlider].
class NaPlatformSliderOptionsCupertino extends NaPlatformSliderOptions {
  final Color? activeColor;
  final Color? thumbColor;
  final int? divisions;

  NaPlatformSliderOptionsCupertino({
    this.activeColor,
    this.thumbColor,
    this.divisions,
  });
}

/// A generic Slider widget that automatically renders a [Slider] on Material 
/// and a [CupertinoSlider] on Cupertino.
class NaPlatformSlider extends NaPlatformWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;

  final NaWidgetOptionsBuilder<NaPlatformSliderOptions>? optionsBuilder;

  const NaPlatformSlider({
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

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformSliderOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformSliderOptionsCupertino? cupertinoOptions = options is NaPlatformSliderOptionsCupertino ? options : null;
      return CupertinoSlider(
        value        : this.value,
        onChanged    : this.onChanged,
        onChangeStart: this.onChangeStart,
        onChangeEnd  : this.onChangeEnd,
        min          : this.min,
        max          : this.max,
        activeColor  : cupertinoOptions?.activeColor,
        thumbColor   : cupertinoOptions?.thumbColor ?? CupertinoColors.white,
        divisions    : cupertinoOptions?.divisions,
      );
    }

    final NaPlatformSliderOptionsMaterial? materialOptions = options is NaPlatformSliderOptionsMaterial ? options : null;
    return Slider(
      value                    : this.value,
      onChanged                : this.onChanged,
      onChangeStart            : this.onChangeStart,
      onChangeEnd              : this.onChangeEnd,
      min                      : this.min,
      max                      : this.max,
      activeColor              : materialOptions?.activeColor,
      inactiveColor            : materialOptions?.inactiveColor,
      thumbColor               : materialOptions?.thumbColor,
      overlayColor             : materialOptions?.overlayColor,
      mouseCursor              : materialOptions?.mouseCursor,
      semanticFormatterCallback: materialOptions?.semanticFormatterCallback,
      focusNode                : materialOptions?.focusNode,
      autofocus                : materialOptions?.autofocus ?? false,
      label                    : materialOptions?.label,
      divisions                : materialOptions?.divisions,
    );
  }
}
