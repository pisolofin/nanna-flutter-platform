import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaCheckbox].
abstract class NaCheckboxOptions extends NaWidgetOptions {}

/// Generic options for [NaCheckbox], holding properties common to both platforms.
class NaCheckboxOptionsGeneric extends NaCheckboxOptions {
  final bool? tristate;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final String? semanticLabel;

  NaCheckboxOptionsGeneric({
    this.tristate,
    this.activeColor,
    this.checkColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
    this.shape,
    this.side,
    this.semanticLabel,
  });

  /// Creates a copy of this [NaCheckboxOptionsGeneric] with the given fields replaced by non-null values.
  NaCheckboxOptionsGeneric copyWith({
    bool? tristate,
    Color? activeColor,
    Color? checkColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
    OutlinedBorder? shape,
    BorderSide? side,
    String? semanticLabel,
  }) {
    return NaCheckboxOptionsGeneric(
      tristate     : tristate ?? this.tristate,
      activeColor  : activeColor ?? this.activeColor,
      checkColor   : checkColor ?? this.checkColor,
      focusColor   : focusColor ?? this.focusColor,
      focusNode    : focusNode ?? this.focusNode,
      autofocus    : autofocus ?? this.autofocus,
      shape        : shape ?? this.shape,
      side         : side ?? this.side,
      semanticLabel: semanticLabel ?? this.semanticLabel,
    );
  }
}

/// Material-specific options for [NaCheckbox], resolving into a [Checkbox].
class NaCheckboxOptionsMaterial extends NaCheckboxOptionsGeneric {
  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final bool? isError;

  NaCheckboxOptionsMaterial({
    this.mouseCursor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.isError,
    super.tristate,
    super.activeColor,
    super.checkColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.shape,
    super.side,
    super.semanticLabel,
  });

  /// Creates a copy of this [NaCheckboxOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaCheckboxOptionsMaterial copyWith({
    MouseCursor? mouseCursor,
    WidgetStateProperty<Color?>? fillColor,
    Color? hoverColor,
    WidgetStateProperty<Color?>? overlayColor,
    double? splashRadius,
    MaterialTapTargetSize? materialTapTargetSize,
    VisualDensity? visualDensity,
    bool? isError,
    bool? tristate,
    Color? activeColor,
    Color? checkColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
    OutlinedBorder? shape,
    BorderSide? side,
    String? semanticLabel,
  }) {
    return NaCheckboxOptionsMaterial(
      mouseCursor          : mouseCursor ?? this.mouseCursor,
      fillColor            : fillColor ?? this.fillColor,
      hoverColor           : hoverColor ?? this.hoverColor,
      overlayColor         : overlayColor ?? this.overlayColor,
      splashRadius         : splashRadius ?? this.splashRadius,
      materialTapTargetSize: materialTapTargetSize ?? this.materialTapTargetSize,
      visualDensity        : visualDensity ?? this.visualDensity,
      isError              : isError ?? this.isError,
      tristate             : tristate ?? this.tristate,
      activeColor          : activeColor ?? this.activeColor,
      checkColor           : checkColor ?? this.checkColor,
      focusColor           : focusColor ?? this.focusColor,
      focusNode            : focusNode ?? this.focusNode,
      autofocus            : autofocus ?? this.autofocus,
      shape                : shape ?? this.shape,
      side                 : side ?? this.side,
      semanticLabel        : semanticLabel ?? this.semanticLabel,
    );
  }
}

/// Cupertino-specific options for [NaCheckbox], resolving into a [CupertinoCheckbox].
class NaCheckboxOptionsCupertino extends NaCheckboxOptionsGeneric {
  NaCheckboxOptionsCupertino({
    super.tristate,
    super.activeColor,
    super.checkColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.shape,
    super.side,
    super.semanticLabel,
  });

  /// Creates a copy of this [NaCheckboxOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaCheckboxOptionsCupertino copyWith({
    bool? tristate,
    Color? activeColor,
    Color? checkColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
    OutlinedBorder? shape,
    BorderSide? side,
    String? semanticLabel,
  }) {
    return NaCheckboxOptionsCupertino(
      tristate     : tristate ?? this.tristate,
      activeColor  : activeColor ?? this.activeColor,
      checkColor   : checkColor ?? this.checkColor,
      focusColor   : focusColor ?? this.focusColor,
      focusNode    : focusNode ?? this.focusNode,
      autofocus    : autofocus ?? this.autofocus,
      shape        : shape ?? this.shape,
      side         : side ?? this.side,
      semanticLabel: semanticLabel ?? this.semanticLabel,
    );
  }
}

/// A generic Checkbox widget that automatically renders a [Checkbox] on Material
/// and a [CupertinoCheckbox] on Cupertino.
class NaCheckbox extends NaWidget {
  final bool? value;
  final ValueChanged<bool?>? onChanged;

  final NaWidgetOptionsBuilder<NaCheckboxOptions>? optionsBuilder;

  const NaCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaCheckbox] with the given fields replaced by non-null values.
  NaCheckbox copyWith({
    Key? key,
    bool? value,
    ValueChanged<bool?>? onChanged,
    NaWidgetOptionsBuilder<NaCheckboxOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaCheckbox(
      key           : key ?? this.key,
      value         : value ?? this.value,
      onChanged     : onChanged ?? this.onChanged,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaCheckboxOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaCheckboxOptionsGeneric? genericOptions = options is NaCheckboxOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      return CupertinoCheckbox(
        value        : this.value,
        onChanged    : this.onChanged,
        tristate     : genericOptions?.tristate ?? false,
        activeColor  : genericOptions?.activeColor,
        checkColor   : genericOptions?.checkColor,
        focusColor   : genericOptions?.focusColor,
        focusNode    : genericOptions?.focusNode,
        autofocus    : genericOptions?.autofocus ?? false,
        shape        : genericOptions?.shape,
        side         : genericOptions?.side,
        semanticLabel: genericOptions?.semanticLabel,
      );
    }

    if (uiType == NaUiType.material) {
      final NaCheckboxOptionsMaterial? materialOptions = options is NaCheckboxOptionsMaterial
        ? options
        : null
      ;
      return Checkbox(
        value                : this.value,
        onChanged            : this.onChanged,
        tristate             : genericOptions?.tristate ?? false,
        mouseCursor          : materialOptions?.mouseCursor,
        activeColor          : genericOptions?.activeColor,
        fillColor            : materialOptions?.fillColor,
        checkColor           : genericOptions?.checkColor,
        focusColor           : genericOptions?.focusColor,
        hoverColor           : materialOptions?.hoverColor,
        overlayColor         : materialOptions?.overlayColor,
        splashRadius         : materialOptions?.splashRadius,
        materialTapTargetSize: materialOptions?.materialTapTargetSize,
        visualDensity        : materialOptions?.visualDensity,
        focusNode            : genericOptions?.focusNode,
        autofocus            : genericOptions?.autofocus ?? false,
        shape                : genericOptions?.shape,
        side                 : genericOptions?.side,
        isError              : materialOptions?.isError ?? false,
        semanticLabel        : genericOptions?.semanticLabel,
      );
    }

    return null;
  }
}
