import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/na-widget.widget.dart';

/// Base options for [NaSwitch].
abstract class NaSwitchOptions extends NaWidgetOptions {}

/// Material-specific options for [NaSwitch], resolving into a [Switch].
class NaSwitchOptionsMaterial extends NaSwitchOptions {
  final Color? activeThumbColor;
  final Color? activeTrackColor;
  final Color? inactiveThumbColor;
  final Color? inactiveTrackColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final WidgetStateProperty<Color?>? thumbColor;
  final WidgetStateProperty<Color?>? trackColor;
  final WidgetStateProperty<Icon?>? thumbIcon;
  final DragStartBehavior? dragStartBehavior;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaSwitchOptionsMaterial({
    this.activeThumbColor,
    this.activeTrackColor,
    this.inactiveThumbColor,
    this.inactiveTrackColor,
    this.activeThumbImage,
    this.inactiveThumbImage,
    this.thumbColor,
    this.trackColor,
    this.thumbIcon,
    this.dragStartBehavior,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.autofocus,
  });
}

/// Cupertino-specific options for [NaSwitch], resolving into a [CupertinoSwitch].
class NaSwitchOptionsCupertino extends NaSwitchOptions {
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? thumbColor;
  final bool? applyTheme;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaSwitchOptionsCupertino({
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.thumbColor,
    this.applyTheme,
    this.focusColor,
    this.focusNode,
    this.autofocus,
  });
}

/// A generic Switch widget that automatically renders a [Switch] on Material
/// and a [CupertinoSwitch] on Cupertino.
class NaSwitch extends NaWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;

  final NaWidgetOptionsBuilder<NaSwitchOptions>? optionsBuilder;

  const NaSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaSwitchOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaSwitchOptionsCupertino? cupertinoOptions = options is NaSwitchOptionsCupertino
        ? options
        : null
      ;
      return CupertinoSwitch(
        value             : this.value,
        onChanged         : this.onChanged,
        activeTrackColor  : cupertinoOptions?.activeTrackColor,
        inactiveTrackColor: cupertinoOptions?.inactiveTrackColor,
        thumbColor        : cupertinoOptions?.thumbColor,
        applyTheme        : cupertinoOptions?.applyTheme,
        focusColor        : cupertinoOptions?.focusColor,
        focusNode         : cupertinoOptions?.focusNode,
        autofocus         : cupertinoOptions?.autofocus ?? false,
      );
    }

    final NaSwitchOptionsMaterial? materialOptions = options is NaSwitchOptionsMaterial
      ? options
      : null
    ;
    return Switch(
      value             : this.value,
      onChanged         : this.onChanged,
      activeThumbColor  : materialOptions?.activeThumbColor,
      activeTrackColor  : materialOptions?.activeTrackColor,
      inactiveThumbColor: materialOptions?.inactiveThumbColor,
      inactiveTrackColor: materialOptions?.inactiveTrackColor,
      activeThumbImage  : materialOptions?.activeThumbImage,
      inactiveThumbImage: materialOptions?.inactiveThumbImage,
      thumbColor        : materialOptions?.thumbColor,
      trackColor        : materialOptions?.trackColor,
      thumbIcon         : materialOptions?.thumbIcon,
      dragStartBehavior :
          materialOptions?.dragStartBehavior ?? DragStartBehavior.start,
      mouseCursor : materialOptions?.mouseCursor,
      focusColor  : materialOptions?.focusColor,
      hoverColor  : materialOptions?.hoverColor,
      overlayColor: materialOptions?.overlayColor,
      splashRadius: materialOptions?.splashRadius,
      focusNode   : materialOptions?.focusNode,
      autofocus   : materialOptions?.autofocus ?? false,
    );
  }
}
