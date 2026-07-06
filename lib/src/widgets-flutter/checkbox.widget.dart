import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaCheckbox].
abstract class NaCheckboxOptions extends NaWidgetOptions {}

/// Material-specific options for [NaCheckbox], resolving into a [Checkbox].
class NaCheckboxOptionsMaterial extends NaCheckboxOptions {
  final bool? tristate;
  final MouseCursor? mouseCursor;
  final Color? activeColor;
  final WidgetStateProperty<Color?>? fillColor;
  final Color? checkColor;
  final Color? focusColor;
  final Color? hoverColor;
  final WidgetStateProperty<Color?>? overlayColor;
  final double? splashRadius;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VisualDensity? visualDensity;
  final FocusNode? focusNode;
  final bool? autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final bool? isError;
  final String? semanticLabel;

  NaCheckboxOptionsMaterial({
    this.tristate,
    this.mouseCursor,
    this.activeColor,
    this.fillColor,
    this.checkColor,
    this.focusColor,
    this.hoverColor,
    this.overlayColor,
    this.splashRadius,
    this.materialTapTargetSize,
    this.visualDensity,
    this.focusNode,
    this.autofocus,
    this.shape,
    this.side,
    this.isError,
    this.semanticLabel,
  });
}

/// Cupertino-specific options for [NaCheckbox], resolving into a [CupertinoCheckbox].
class NaCheckboxOptionsCupertino extends NaCheckboxOptions {
  final bool? tristate;
  final Color? activeColor;
  final Color? checkColor;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool? autofocus;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final String? semanticLabel;

  NaCheckboxOptionsCupertino({
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

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaCheckboxOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaCheckboxOptionsCupertino? cupertinoOptions = options is NaCheckboxOptionsCupertino
        ? options
        : null
      ;
      return CupertinoCheckbox(
        value        : this.value,
        onChanged    : this.onChanged,
        tristate     : cupertinoOptions?.tristate ?? false,
        activeColor  : cupertinoOptions?.activeColor,
        checkColor   : cupertinoOptions?.checkColor,
        focusColor   : cupertinoOptions?.focusColor,
        focusNode    : cupertinoOptions?.focusNode,
        autofocus    : cupertinoOptions?.autofocus ?? false,
        shape        : cupertinoOptions?.shape,
        side         : cupertinoOptions?.side,
        semanticLabel: cupertinoOptions?.semanticLabel,
      );
    }

    final NaCheckboxOptionsMaterial? materialOptions = options is NaCheckboxOptionsMaterial
      ? options
      : null
    ;
    return Checkbox(
      value                : this.value,
      onChanged            : this.onChanged,
      tristate             : materialOptions?.tristate ?? false,
      mouseCursor          : materialOptions?.mouseCursor,
      activeColor          : materialOptions?.activeColor,
      fillColor            : materialOptions?.fillColor,
      checkColor           : materialOptions?.checkColor,
      focusColor           : materialOptions?.focusColor,
      hoverColor           : materialOptions?.hoverColor,
      overlayColor         : materialOptions?.overlayColor,
      splashRadius         : materialOptions?.splashRadius,
      materialTapTargetSize: materialOptions?.materialTapTargetSize,
      visualDensity        : materialOptions?.visualDensity,
      focusNode            : materialOptions?.focusNode,
      autofocus            : materialOptions?.autofocus ?? false,
      shape                : materialOptions?.shape,
      side                 : materialOptions?.side,
      isError              : materialOptions?.isError ?? false,
      semanticLabel        : materialOptions?.semanticLabel,
    );
  }
}
