import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaCheckbox].
abstract class NaCheckboxOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaCheckboxOptions();

  /// Creates an empty [NaCheckboxOptions] with default values.
  factory NaCheckboxOptions.empty() => NaCheckboxOptionsGeneric.empty();
}

/// Generic options for [NaCheckbox], holding properties common to both platforms.
class NaCheckboxOptionsGeneric extends NaCheckboxOptions {
  /// If true, the checkbox's value can be true, false, or null.
  final bool? tristate;
  /// The color to use when this widget is active.
  final Color? activeColor;
  /// The color to use for the check icon when the checkbox is checked.
  final Color? checkColor;
  /// The color for the focus overlay.
  final Color? focusColor;
  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;
  /// True if this widget will be selected as the initial focus.
  final bool? autofocus;
  /// The shape of the widget.
  final OutlinedBorder? shape;
  /// The color and width of the widget's border.
  final BorderSide? side;
  /// The semantic label for the widget.
  final String? semanticLabel;

  /// Creates a [NaCheckboxOptionsGeneric].
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

  /// Creates an empty [NaCheckboxOptionsGeneric] with default values.
  NaCheckboxOptionsGeneric.empty() : this();

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
  /// The cursor for a mouse pointer when hovering over this widget.
  final MouseCursor? mouseCursor;
  /// The color that fills the background of this widget.
  final WidgetStateProperty<Color?>? fillColor;
  /// The color of this widget when hovered over by a pointer.
  final Color? hoverColor;
  /// The color for the widget's ink response overlay.
  final WidgetStateProperty<Color?>? overlayColor;
  /// The radius of the ink splash.
  final double? splashRadius;
  /// Configures the minimum size of the tap target.
  final MaterialTapTargetSize? materialTapTargetSize;
  /// Defines how compact the widget's layout will be.
  final VisualDensity? visualDensity;
  /// True if this checkbox wants to show an error state.
  final bool? isError;

  /// Creates a [NaCheckboxOptionsMaterial].
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

  /// Creates an empty [NaCheckboxOptionsMaterial] with default values.
  NaCheckboxOptionsMaterial.empty() : this();

  /// Creates a [NaCheckboxOptionsMaterial] from generic options.
  NaCheckboxOptionsMaterial.fromGeneric(
    NaCheckboxOptionsGeneric? generic, {
    this.mouseCursor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.isError,
  }) : super(
         tristate     : generic?.tristate,
         activeColor  : generic?.activeColor,
         checkColor   : generic?.checkColor,
         focusColor   : generic?.focusColor,
         focusNode    : generic?.focusNode,
         autofocus    : generic?.autofocus,
         shape        : generic?.shape,
         side         : generic?.side,
         semanticLabel: generic?.semanticLabel,
       );

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
  /// Creates a [NaCheckboxOptionsCupertino].
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

  /// Creates an empty [NaCheckboxOptionsCupertino] with default values.
  NaCheckboxOptionsCupertino.empty() : this();

  /// Creates a [NaCheckboxOptionsCupertino] from generic options.
  NaCheckboxOptionsCupertino.fromGeneric(
    NaCheckboxOptionsGeneric? generic,
  ) : super(
         tristate     : generic?.tristate,
         activeColor  : generic?.activeColor,
         checkColor   : generic?.checkColor,
         focusColor   : generic?.focusColor,
         focusNode    : generic?.focusNode,
         autofocus    : generic?.autofocus,
         shape        : generic?.shape,
         side         : generic?.side,
         semanticLabel: generic?.semanticLabel,
       );

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
  /// The current value of this widget.
  final bool? value;
  /// Called when the value of the widget should change.
  final ValueChanged<bool?>? onChanged;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaCheckboxOptions>? optionsBuilder;

  /// Creates a [NaCheckbox].
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
