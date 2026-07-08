import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaRadio].
abstract class NaRadioOptions extends NaWidgetOptions {}

/// Material-specific options for [NaRadio], resolving into a [Radio].
class NaRadioOptionsMaterial extends NaRadioOptions {
  final MouseCursor? mouseCursor;
  final bool? toggleable;
  final Color? activeColor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final FocusNode? focusNode;
  final bool? autofocus;

  NaRadioOptionsMaterial({
    this.mouseCursor,
    this.toggleable,
    this.activeColor,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.focusNode,
    this.autofocus,
  });
}

/// Cupertino-specific options for [NaRadio], resolving into a [CupertinoRadio].
class NaRadioOptionsCupertino extends NaRadioOptions {
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? fillColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? toggleable;

  NaRadioOptionsCupertino({
    this.activeColor,
    this.inactiveColor,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.autofocus,
    this.toggleable,
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
    final NaRadioOptions? options = optionsBuilder?.call(context, uiType);

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
        activeColor  : cupertinoOptions?.activeColor,
        inactiveColor: cupertinoOptions?.inactiveColor,
        fillColor    : cupertinoOptions?.fillColor,
        focusColor   : cupertinoOptions?.focusColor,
        focusNode    : cupertinoOptions?.focusNode,
        autofocus    : cupertinoOptions?.autofocus ?? false,
        toggleable   : cupertinoOptions?.toggleable ?? false,
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
        toggleable  : materialOptions?.toggleable ?? false,
        activeColor : materialOptions?.activeColor,
        fillColor   : materialOptions?.fillColor,
        focusColor  : materialOptions?.focusColor,
        hoverColor  : materialOptions?.hoverColor,
        overlayColor: materialOptions?.overlayColor,
        splashRadius: materialOptions?.splashRadius,
        focusNode   : materialOptions?.focusNode,
        autofocus   : materialOptions?.autofocus ?? false,
      );
    }

    return null;
  }
}
