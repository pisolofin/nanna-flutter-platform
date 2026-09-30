import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaRadio].
abstract class NaRadioOptions extends NaWidgetOptions {}

/// Generic options for [NaRadio], holding properties common to both platforms.
class NaRadioOptionsGeneric extends NaRadioOptions {
  final bool? toggleable;
  final Color? activeColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaRadioOptionsGeneric({
    this.toggleable,
    this.activeColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
  });
}

/// Material-specific options for [NaRadio], resolving into a [Radio].
class NaRadioOptionsMaterial extends NaRadioOptionsGeneric {
  final MouseCursor? mouseCursor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;

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
}

/// Cupertino-specific options for [NaRadio], resolving into a [CupertinoRadio].
class NaRadioOptionsCupertino extends NaRadioOptionsGeneric {
  final Color? inactiveColor;
  final Color? fillColor;

  NaRadioOptionsCupertino({
    this.inactiveColor,
    this.fillColor,
    super.activeColor,
    super.focusColor,
    super.focusNode,
    super.autofocus,
    super.toggleable,
  });
}

/// A generic Radio widget that automatically renders a [Radio] on Material
/// and a [CupertinoRadio] on Cupertino.
class NaRadio<T> extends NaWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  final NaWidgetOptionsBuilder<NaRadioOptions>? optionsBuilder;

  const NaRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.optionsBuilder,
    super.uiType,
  });

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
