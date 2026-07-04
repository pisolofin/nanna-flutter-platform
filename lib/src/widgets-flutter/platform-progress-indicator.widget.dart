import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/ui-type.model.dart';
import '../models/widget-options.model.dart';
import '../widgets/platform-widget.widget.dart';

/// Base options for [NaPlatformProgressIndicator].
abstract class NaPlatformProgressIndicatorOptions extends NaWidgetOptions {}

/// Material-specific options for [NaPlatformProgressIndicator], resolving into a [CircularProgressIndicator].
class NaPlatformProgressIndicatorOptionsMaterial extends NaPlatformProgressIndicatorOptions {
  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double? strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;

  NaPlatformProgressIndicatorOptionsMaterial({
    this.value,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.strokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
  });
}

/// Cupertino-specific options for [NaPlatformProgressIndicator], resolving into a [CupertinoActivityIndicator].
class NaPlatformProgressIndicatorOptionsCupertino extends NaPlatformProgressIndicatorOptions {
  final double? radius;
  final bool? animating;
  final Color? color;

  NaPlatformProgressIndicatorOptionsCupertino({
    this.radius,
    this.animating,
    this.color,
  });
}

/// A generic ProgressIndicator widget that automatically renders a [CircularProgressIndicator] on Material 
/// and a [CupertinoActivityIndicator] on Cupertino.
class NaPlatformProgressIndicator extends NaPlatformWidget {
  final NaWidgetOptionsBuilder<NaPlatformProgressIndicatorOptions>? optionsBuilder;

  const NaPlatformProgressIndicator({
    super.key,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaPlatformProgressIndicatorOptions? options = optionsBuilder?.call(
      context,
      uiType,
    );

    if (uiType == NaUiType.cupertino) {
      final NaPlatformProgressIndicatorOptionsCupertino? cupertinoOptions = options is NaPlatformProgressIndicatorOptionsCupertino ? options : null;
      return CupertinoActivityIndicator(
        radius   : cupertinoOptions?.radius ?? 10.0,
        animating: cupertinoOptions?.animating ?? true,
        color    : cupertinoOptions?.color,
      );
    }

    final NaPlatformProgressIndicatorOptionsMaterial? materialOptions = options is NaPlatformProgressIndicatorOptionsMaterial ? options : null;
    return CircularProgressIndicator(
      value          : materialOptions?.value,
      backgroundColor: materialOptions?.backgroundColor,
      color          : materialOptions?.color,
      valueColor     : materialOptions?.valueColor,
      strokeWidth    : materialOptions?.strokeWidth ?? 4.0,
      semanticsLabel : materialOptions?.semanticsLabel,
      semanticsValue : materialOptions?.semanticsValue,
    );
  }
}
