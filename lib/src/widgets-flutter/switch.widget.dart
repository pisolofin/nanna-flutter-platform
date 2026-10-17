import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaSwitch].
abstract class NaSwitchOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaSwitchOptions();

  /// Creates an empty [NaSwitchOptions] with default values.
  factory NaSwitchOptions.empty() => NaSwitchOptionsGeneric.empty();
}

/// Generic options for [NaSwitch], holding properties common to both platforms.
class NaSwitchOptionsGeneric extends NaSwitchOptions {
  /// The color to use on the track for this switch when active.
  final Color? activeTrackColor;
  /// The color to use on the track for this switch when inactive.
  final Color? inactiveTrackColor;
  /// The color for the focus overlay.
  final Color? focusColor;
  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;
  /// True if this widget will be selected as the initial focus.
  final bool? autofocus;

  /// Creates a [NaSwitchOptionsGeneric].
  NaSwitchOptionsGeneric({
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
  });

  /// Creates an empty [NaSwitchOptionsGeneric] with default values.
  NaSwitchOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaSwitchOptionsGeneric] with the given fields replaced by non-null values.
  NaSwitchOptionsGeneric copyWith({
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
  }) {
    return NaSwitchOptionsGeneric(
      activeTrackColor  : activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      focusColor        : focusColor ?? this.focusColor,
      focusNode         : focusNode ?? this.focusNode,
      autofocus         : autofocus ?? this.autofocus,
    );
  }
}

/// Material-specific options for [NaSwitch], resolving into a [Switch].
class NaSwitchOptionsMaterial extends NaSwitchOptionsGeneric {
  /// The color of this switch's thumb when active.
  final Color? activeThumbColor;
  /// The color of this switch's thumb when inactive.
  final Color? inactiveThumbColor;
  /// An image to use on the thumb of this switch when active.
  final ImageProvider? activeThumbImage;
  /// An image to use on the thumb of this switch when inactive.
  final ImageProvider? inactiveThumbImage;
  /// The color of the thumb.
  final WidgetStateProperty<Color?>? thumbColor;
  /// The color of the track.
  final WidgetStateProperty<Color?>? trackColor;
  /// The icon to use on the thumb of this switch.
  final WidgetStateProperty<Icon?>? thumbIcon;
  /// Determines the way that drag start behavior is handled.
  final DragStartBehavior? dragStartBehavior;
  /// The cursor for a mouse pointer when hovering over this widget.
  final MouseCursor? mouseCursor;
  /// The color of this widget when hovered over by a pointer.
  final Color? hoverColor;
  /// The color for the widget's ink response overlay.
  final WidgetStateProperty<Color?>? overlayColor;
  /// The radius of the ink splash.
  final double? splashRadius;

  /// Creates a [NaSwitchOptionsMaterial].
  NaSwitchOptionsMaterial({
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.thumbColor,
    this.trackColor,
    this.thumbIcon,
    this.dragStartBehavior,
    this.mouseCursor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    super.activeTrackColor,
    super.inactiveTrackColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
  });

  /// Creates an empty [NaSwitchOptionsMaterial] with default values.
  NaSwitchOptionsMaterial.empty() : this();

  /// Creates a [NaSwitchOptionsMaterial] from generic options.
  NaSwitchOptionsMaterial.fromGeneric(
    NaSwitchOptionsGeneric? generic, {
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.thumbColor,
    this.trackColor,
    this.thumbIcon,
    this.dragStartBehavior,
    this.mouseCursor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
  }) : super(
         activeTrackColor  : generic?.activeTrackColor,
         inactiveTrackColor: generic?.inactiveTrackColor,
         focusColor        : generic?.focusColor,
         focusNode         : generic?.focusNode,
         autofocus         : generic?.autofocus,
       );

  /// Creates a copy of this [NaSwitchOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaSwitchOptionsMaterial copyWith({
    Color? activeThumbColor,
    Color? inactiveThumbColor,
    ImageProvider? activeThumbImage,
    ImageProvider? inactiveThumbImage,
    WidgetStateProperty<Color?>? thumbColor,
    WidgetStateProperty<Color?>? trackColor,
    WidgetStateProperty<Icon?>? thumbIcon,
    DragStartBehavior? dragStartBehavior,
    MouseCursor? mouseCursor,
    Color? hoverColor,
    WidgetStateProperty<Color?>? overlayColor,
    double? splashRadius,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
  }) {
    return NaSwitchOptionsMaterial(
      activeThumbColor  : activeThumbColor ?? this.activeThumbColor,
      inactiveThumbColor: inactiveThumbColor ?? this.inactiveThumbColor,
      activeThumbImage  : activeThumbImage ?? this.activeThumbImage,
      inactiveThumbImage: inactiveThumbImage ?? this.inactiveThumbImage,
      thumbColor        : thumbColor ?? this.thumbColor,
      trackColor        : trackColor ?? this.trackColor,
      thumbIcon         : thumbIcon ?? this.thumbIcon,
      dragStartBehavior : dragStartBehavior ?? this.dragStartBehavior,
      mouseCursor       : mouseCursor ?? this.mouseCursor,
      hoverColor        : hoverColor ?? this.hoverColor,
      overlayColor      : overlayColor ?? this.overlayColor,
      splashRadius      : splashRadius ?? this.splashRadius,
      activeTrackColor  : activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      focusColor        : focusColor ?? this.focusColor,
      focusNode         : focusNode ?? this.focusNode,
      autofocus         : autofocus ?? this.autofocus,
    );
  }
}

/// Cupertino-specific options for [NaSwitch], resolving into a [CupertinoSwitch].
class NaSwitchOptionsCupertino extends NaSwitchOptionsGeneric {
  /// The color of the thumb.
  final Color? thumbColor;
  /// Whether to apply theme colors to this widget.
  final bool? applyTheme;

  /// Creates a [NaSwitchOptionsCupertino].
  NaSwitchOptionsCupertino({
    this.thumbColor,
    this.applyTheme,
    super.activeTrackColor,
    super.inactiveTrackColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
  });

  /// Creates an empty [NaSwitchOptionsCupertino] with default values.
  NaSwitchOptionsCupertino.empty() : this();

  /// Creates a [NaSwitchOptionsCupertino] from generic options.
  NaSwitchOptionsCupertino.fromGeneric(
    NaSwitchOptionsGeneric? generic, {
    this.thumbColor,
    this.applyTheme,
  }) : super(
         activeTrackColor  : generic?.activeTrackColor,
         inactiveTrackColor: generic?.inactiveTrackColor,
         focusColor        : generic?.focusColor,
         focusNode         : generic?.focusNode,
         autofocus         : generic?.autofocus,
       );

  /// Creates a copy of this [NaSwitchOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaSwitchOptionsCupertino copyWith({
    Color? thumbColor,
    bool? applyTheme,
    Color? activeTrackColor,
    Color? inactiveTrackColor,
    Color? focusColor,
    FocusNode? focusNode,
    bool? autofocus,
  }) {
    return NaSwitchOptionsCupertino(
      thumbColor        : thumbColor ?? this.thumbColor,
      applyTheme        : applyTheme ?? this.applyTheme,
      activeTrackColor  : activeTrackColor ?? this.activeTrackColor,
      inactiveTrackColor: inactiveTrackColor ?? this.inactiveTrackColor,
      focusColor        : focusColor ?? this.focusColor,
      focusNode         : focusNode ?? this.focusNode,
      autofocus         : autofocus ?? this.autofocus,
    );
  }
}

/// A generic Switch widget that automatically renders a [Switch] on Material
/// and a [CupertinoSwitch] on Cupertino.
class NaSwitch extends NaWidget {
  /// The current value of this widget.
  final bool value;
  /// Called when the value of the widget should change.
  final ValueChanged<bool>? onChanged;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaSwitchOptions>? optionsBuilder;

  /// Creates a [NaSwitch].
  const NaSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.optionsBuilder,
    super.uiType,
  });

  /// Creates a copy of this [NaSwitch] with the given fields replaced with the new values.
  NaSwitch copyWith({
    Key? key,
    bool? value,
    ValueChanged<bool>? onChanged,
    NaWidgetOptionsBuilder<NaSwitchOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaSwitch(
      key           : key ?? this.key,
      value         : value ?? this.value,
      onChanged     : onChanged ?? this.onChanged,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaSwitchOptions? options = this.optionsBuilder?.call(context, uiType);
    final NaSwitchOptionsGeneric? genericOptions = options is NaSwitchOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaSwitchOptionsCupertino? cupertinoOptions = options is NaSwitchOptionsCupertino
        ? options
        : null
      ;
      return CupertinoSwitch(
        value             : this.value,
        onChanged         : this.onChanged,
        activeTrackColor  : genericOptions?.activeTrackColor,
        inactiveTrackColor: genericOptions?.inactiveTrackColor,
        thumbColor        : cupertinoOptions?.thumbColor,
        applyTheme        : cupertinoOptions?.applyTheme,
        focusColor        : genericOptions?.focusColor,
        focusNode         : genericOptions?.focusNode,
        autofocus         : genericOptions?.autofocus ?? false,
      );
    }

    if (uiType == NaUiType.material) {
      final NaSwitchOptionsMaterial? materialOptions = options is NaSwitchOptionsMaterial
        ? options
        : null
      ;
      return Switch(
        value             : this.value,
        onChanged         : this.onChanged,
        activeThumbColor  : materialOptions?.activeThumbColor,
        activeTrackColor  : genericOptions?.activeTrackColor,
        inactiveThumbColor: materialOptions?.inactiveThumbColor,
        inactiveTrackColor: genericOptions?.inactiveTrackColor,
        activeThumbImage  : materialOptions?.activeThumbImage,
        inactiveThumbImage: materialOptions?.inactiveThumbImage,
        thumbColor        : materialOptions?.thumbColor,
        trackColor        : materialOptions?.trackColor,
        thumbIcon         : materialOptions?.thumbIcon,
        dragStartBehavior :
            materialOptions?.dragStartBehavior ?? DragStartBehavior.start,
        mouseCursor : materialOptions?.mouseCursor,
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
