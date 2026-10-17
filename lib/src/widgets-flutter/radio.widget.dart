import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaRadio].
abstract class NaRadioOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaRadioOptions();

  /// Creates an empty [NaRadioOptions] with default values.
  factory NaRadioOptions.empty() => NaRadioOptionsGeneric.empty();
}

/// Generic options for [NaRadio], holding properties common to both platforms.
class NaRadioOptionsGeneric extends NaRadioOptions {
  /// Whether the radio value can be toggled unselected.
  final bool? toggleable;
  /// The color to use when this widget is active.
  final Color? activeColor;
  /// The color for the focus overlay.
  final Color? focusColor;
  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;
  /// True if this widget will be selected as the initial focus.
  final bool? autofocus;

  /// Creates a [NaRadioOptionsGeneric].
  NaRadioOptionsGeneric({
    this.toggleable,
    this.activeColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
  });

  /// Creates an empty [NaRadioOptionsGeneric] with default values.
  NaRadioOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaRadioOptionsGeneric] with the given fields replaced by non-null values.
  NaRadioOptionsGeneric copyWith({
    bool? toggleable,
    Color? activeColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
  }) {
    return NaRadioOptionsGeneric(
      toggleable : toggleable ?? this.toggleable,
      activeColor: activeColor ?? this.activeColor,
      focusColor : focusColor ?? this.focusColor,
      focusNode  : focusNode ?? this.focusNode,
      autofocus  : autofocus ?? this.autofocus,
    );
  }
}

/// Material-specific options for [NaRadio], resolving into a [Radio].
class NaRadioOptionsMaterial extends NaRadioOptionsGeneric {
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

  /// Creates a [NaRadioOptionsMaterial].
  NaRadioOptionsMaterial({
    this.mouseCursor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    super.toggleable,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
  });

  /// Creates an empty [NaRadioOptionsMaterial] with default values.
  NaRadioOptionsMaterial.empty() : this();

  /// Creates a [NaRadioOptionsMaterial] from generic options.
  NaRadioOptionsMaterial.fromGeneric(
    NaRadioOptionsGeneric? generic, {
    this.mouseCursor,
    this.fillColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
  }) : super(
         toggleable : generic?.toggleable,
         activeColor: generic?.activeColor,
         focusColor : generic?.focusColor,
         focusNode  : generic?.focusNode,
         autofocus  : generic?.autofocus,
       );

  /// Creates a copy of this [NaRadioOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaRadioOptionsMaterial copyWith({
    MouseCursor? mouseCursor,
    WidgetStateProperty<Color?>? fillColor,
    Color? hoverColor,
    WidgetStateProperty<Color?>? overlayColor,
    double? splashRadius,
    bool? toggleable,
    Color? activeColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
  }) {
    return NaRadioOptionsMaterial(
      mouseCursor : mouseCursor ?? this.mouseCursor,
      fillColor   : fillColor ?? this.fillColor,
      hoverColor  : hoverColor ?? this.hoverColor,
      overlayColor: overlayColor ?? this.overlayColor,
      splashRadius: splashRadius ?? this.splashRadius,
      toggleable  : toggleable ?? this.toggleable,
      activeColor : activeColor ?? this.activeColor,
      focusColor  : focusColor ?? this.focusColor,
      focusNode   : focusNode ?? this.focusNode,
      autofocus   : autofocus ?? this.autofocus,
    );
  }
}

/// Cupertino-specific options for [NaRadio], resolving into a [CupertinoRadio].
class NaRadioOptionsCupertino extends NaRadioOptionsGeneric {
  /// The color to use when this widget is inactive.
  final Color? inactiveColor;
  /// The color that fills the background of this widget.
  final Color? fillColor;

  /// Creates a [NaRadioOptionsCupertino].
  NaRadioOptionsCupertino({
    this.inactiveColor,
    this.fillColor,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.toggleable,
  });

  /// Creates an empty [NaRadioOptionsCupertino] with default values.
  NaRadioOptionsCupertino.empty() : this();

  /// Creates a [NaRadioOptionsCupertino] from generic options.
  NaRadioOptionsCupertino.fromGeneric(
    NaRadioOptionsGeneric? generic, {
    this.inactiveColor,
    this.fillColor,
  }) : super(
         toggleable : generic?.toggleable,
         activeColor: generic?.activeColor,
         focusColor : generic?.focusColor,
         focusNode  : generic?.focusNode,
         autofocus  : generic?.autofocus,
       );

  /// Creates a copy of this [NaRadioOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaRadioOptionsCupertino copyWith({
    Color? inactiveColor,
    Color? fillColor,
    Color? activeColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
    bool? toggleable,
  }) {
    return NaRadioOptionsCupertino(
      inactiveColor: inactiveColor ?? this.inactiveColor,
      fillColor    : fillColor ?? this.fillColor,
      activeColor  : activeColor ?? this.activeColor,
      focusColor   : focusColor ?? this.focusColor,
      focusNode    : focusNode ?? this.focusNode,
      autofocus    : autofocus ?? this.autofocus,
      toggleable   : toggleable ?? this.toggleable,
    );
  }
}

/// A generic Radio widget that automatically renders a [Radio] on Material
/// and a [CupertinoRadio] on Cupertino.
class NaRadio<T> extends NaWidget {
  /// The current value of this widget.
  final T value;
  /// The currently selected value for a group of radio buttons.
  final T? groupValue;
  /// Called when the value of the widget should change.
  final ValueChanged<T?>? onChanged;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaRadioOptions>? optionsBuilder;

  /// Creates a [NaRadio].
  const NaRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaRadio] with the given fields replaced by non-null values.
  NaRadio<T> copyWith({
    Key? key,
    T? value,
    T? groupValue,
    ValueChanged<T?>? onChanged,
    NaWidgetOptionsBuilder<NaRadioOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaRadio<T>(
      key           : key ?? this.key,
      value         : value ?? this.value,
      groupValue    : groupValue ?? this.groupValue,
      onChanged     : onChanged ?? this.onChanged,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaRadioOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaRadioOptionsGeneric? genericOptions = options is NaRadioOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaRadioOptionsCupertino? cupertinoOptions = options is NaRadioOptionsCupertino
        ? options
        : null
      ;
      return CupertinoRadio<T>(
        value: this.value,
        // ignore: deprecated_member_use
        groupValue: this.groupValue,
        // ignore: deprecated_member_use
        onChanged    : this.onChanged,
        activeColor  : genericOptions?.activeColor,
        inactiveColor: cupertinoOptions?.inactiveColor,
        fillColor    : cupertinoOptions?.fillColor,
        focusColor   : genericOptions?.focusColor,
        focusNode    : genericOptions?.focusNode,
        autofocus    : genericOptions?.autofocus ?? false,
        toggleable   : genericOptions?.toggleable ?? false,
      );
    }

    if (uiType == NaUiType.material) {
      final NaRadioOptionsMaterial? materialOptions = options is NaRadioOptionsMaterial
        ? options
        : null
      ;
      return Radio<T>(
        value: this.value,
        // ignore: deprecated_member_use
        groupValue: this.groupValue,
        // ignore: deprecated_member_use
        onChanged   : this.onChanged,
        mouseCursor : materialOptions?.mouseCursor,
        toggleable  : genericOptions?.toggleable ?? false,
        activeColor : genericOptions?.activeColor,
        fillColor   : materialOptions?.fillColor,
        focusColor  : genericOptions?.focusColor,
        hoverColor  : materialOptions?.hoverColor,
        overlayColor: materialOptions?.overlayColor,
        splashRadius: materialOptions?.splashRadius,
        focusNode   : genericOptions?.focusNode,
        autofocus   : genericOptions?.autofocus ?? false,
      );
    }

    return null;
  }
}
