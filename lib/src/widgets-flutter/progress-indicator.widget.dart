import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/na-widget.widget.dart';

/// Base options for [NaProgressIndicator].
abstract class NaProgressIndicatorOptions extends NaWidgetOptions {}

/// Material-specific options for [NaProgressIndicator], resolving into a [CircularProgressIndicator].
class NaProgressIndicatorOptionsMaterial extends NaProgressIndicatorOptions {
  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double? strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;

  NaProgressIndicatorOptionsMaterial({
    this.value,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.strokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
  });
}

/// Cupertino-specific options for [NaProgressIndicator], resolving into a [CupertinoActivityIndicator].
class NaProgressIndicatorOptionsCupertino extends NaProgressIndicatorOptions {
  final double? radius;
  final bool? animating;
  final Color? color;

  NaProgressIndicatorOptionsCupertino({
    this.radius,
    this.animating,
    this.color,
  });
}

/// A generic ProgressIndicator widget that automatically renders a [CircularProgressIndicator] on Material
/// and a [CupertinoActivityIndicator] on Cupertino.
class NaProgressIndicator extends NaWidget {
  final NaWidgetOptionsBuilder<NaProgressIndicatorOptions>? optionsBuilder;

  const NaProgressIndicator({super.key, this.optionsBuilder, super.uiType});

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaProgressIndicatorOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaProgressIndicatorOptionsCupertino? cupertinoOptions =
          options is NaProgressIndicatorOptionsCupertino ? options : null;
      return CupertinoActivityIndicator(
        radius: cupertinoOptions?.radius ?? 10.0,
        animating: cupertinoOptions?.animating ?? true,
        color: cupertinoOptions?.color,
      );
    }

    final NaProgressIndicatorOptionsMaterial? materialOptions =
        options is NaProgressIndicatorOptionsMaterial ? options : null;
    return CircularProgressIndicator(
      value: materialOptions?.value,
      backgroundColor: materialOptions?.backgroundColor,
      color: materialOptions?.color,
      valueColor: materialOptions?.valueColor,
      strokeWidth: materialOptions?.strokeWidth ?? 4.0,
      semanticsLabel: materialOptions?.semanticsLabel,
      semanticsValue: materialOptions?.semanticsValue,
    );
  }
}
