import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaSwitch].
abstract class NaSwitchOptions extends NaWidgetOptions {}

/// Generic options for [NaSwitch], holding properties common to both platforms.
class NaSwitchOptionsGeneric extends NaSwitchOptions {
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaSwitchOptionsGeneric({
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
  });
}

/// Material-specific options for [NaSwitch], resolving into a [Switch].
class NaSwitchOptionsMaterial extends NaSwitchOptionsGeneric {
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final ImageProvider? activeThumbImage;
  final ImageProvider? inactiveThumbImage;
  final WidgetStateProperty<Color?>? thumbColor;
  final WidgetStateProperty<Color?>? trackColor;
  final WidgetStateProperty<Icon?>? thumbIcon;
  final DragStartBehavior? dragStartBehavior;
  final MouseCursor? mouseCursor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;

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
}

/// Cupertino-specific options for [NaSwitch], resolving into a [CupertinoSwitch].
class NaSwitchOptionsCupertino extends NaSwitchOptionsGeneric {
  final Color? thumbColor;
  final bool? applyTheme;

  NaSwitchOptionsCupertino({
    this.thumbColor,
    this.applyTheme,
    super.activeTrackColor,
    super.inactiveTrackColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
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
