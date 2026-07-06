import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../models/icon-data.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaIcon].
abstract class NaIconOptions extends NaWidgetOptions {}

/// Material-specific options for [NaIcon], resolving into an [Icon].
class NaIconOptionsMaterial extends NaIconOptions {
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;

  NaIconOptionsMaterial({
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.semanticLabel,
    this.textDirection,
  });
}

/// Cupertino-specific options for [NaIcon], resolving into an [Icon].
/// (Cupertino does not use fill/weight/grade native properties by default on standard icons).
class NaIconOptionsCupertino extends NaIconOptions {
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;

  NaIconOptionsCupertino({
    this.shadows,
    this.semanticLabel,
    this.textDirection,
  });
}

/// A cross-platform Icon widget that automatically resolves to the correct native [IconData]
/// via a [NaIconData] object.
class NaIcon extends NaWidget {
  final NaIconData icon;
  final double? size;
  final Color? color;

  final NaWidgetOptionsBuilder<NaIconOptions>? optionsBuilder;

  const NaIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget renderForUIType(BuildContext context, NaUiType uiType) {
    final NaIconOptions? options = optionsBuilder?.call(context, uiType);

    final IconData resolvedIcon = this.icon.resolve(uiType);

    if (uiType == NaUiType.cupertino) {
      final NaIconOptionsCupertino? cupertinoOptions = options is NaIconOptionsCupertino
        ? options
        : null
      ;
      return Icon(
        resolvedIcon,
        size         : this.size,
        color        : this.color,
        shadows      : cupertinoOptions?.shadows,
        semanticLabel: cupertinoOptions?.semanticLabel,
        textDirection: cupertinoOptions?.textDirection,
      );
    }

    final NaIconOptionsMaterial? materialOptions = options is NaIconOptionsMaterial
      ? options
      : null
    ;
    return Icon(
      resolvedIcon,
      size         : this.size,
      color        : this.color,
      fill         : materialOptions?.fill,
      weight       : materialOptions?.weight,
      grade        : materialOptions?.grade,
      opticalSize  : materialOptions?.opticalSize,
      shadows      : materialOptions?.shadows,
      semanticLabel: materialOptions?.semanticLabel,
      textDirection: materialOptions?.textDirection,
    );
  }
}
