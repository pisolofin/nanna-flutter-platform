import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaProgressIndicator].
abstract class NaProgressIndicatorOptions extends NaWidgetOptions {}

/// Generic options for [NaProgressIndicator], holding properties common to both platforms.
class NaProgressIndicatorOptionsGeneric extends NaProgressIndicatorOptions {
  final Color? color;

  NaProgressIndicatorOptionsGeneric({
    this.color,
  });
}

/// Material-specific options for [NaProgressIndicator], resolving into a [CircularProgressIndicator].
class NaProgressIndicatorOptionsMaterial extends NaProgressIndicatorOptionsGeneric {
  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final double? strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;

  NaProgressIndicatorOptionsMaterial({
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
    super.color,
  });
}

/// Cupertino-specific options for [NaProgressIndicator], resolving into a [CupertinoActivityIndicator].
class NaProgressIndicatorOptionsCupertino extends NaProgressIndicatorOptionsGeneric {
  final double? radius;
  final bool? animating;

  NaProgressIndicatorOptionsCupertino({
    this.radius,
    this.animating,
    super.color,
  });
}

/// A generic ProgressIndicator widget that automatically renders a [CircularProgressIndicator] on Material
/// and a [CupertinoActivityIndicator] on Cupertino.
class NaProgressIndicator extends NaWidget {
  final NaWidgetOptionsBuilder<NaProgressIndicatorOptions>? optionsBuilder;

  const NaProgressIndicator({ super.key, this.optionsBuilder, super.uiType });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaProgressIndicatorOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );
    final NaProgressIndicatorOptionsGeneric? genericOptions = options is NaProgressIndicatorOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaProgressIndicatorOptionsCupertino? cupertinoOptions = options is NaProgressIndicatorOptionsCupertino
        ? options
        : null
      ;
      return CupertinoActivityIndicator(
        radius   : cupertinoOptions?.radius ?? 10.0,
        animating: cupertinoOptions?.animating ?? true,
        color    : genericOptions?.color,
      );
    }

    if (uiType == NaUiType.material) {
      final NaProgressIndicatorOptionsMaterial? materialOptions = options is NaProgressIndicatorOptionsMaterial
        ? options
        : null
      ;
      return CircularProgressIndicator(
        value          : materialOptions?.value,
        backgroundColor: materialOptions?.backgroundColor,
        color          : genericOptions?.color,
        valueColor     : materialOptions?.valueColor,
        strokeWidth    : materialOptions?.strokeWidth ?? 4.0,
        semanticsLabel : materialOptions?.semanticsLabel,
        semanticsValue : materialOptions?.semanticsValue,
      );
    }

    return null;
  }
}
