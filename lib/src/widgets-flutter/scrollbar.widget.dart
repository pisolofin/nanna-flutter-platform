import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

abstract class NaScrollbarOptions extends NaWidgetOptions {}

class NaScrollbarOptionsMaterial extends NaScrollbarOptions {
  final bool? trackVisibility;
  final bool? interactive;
  final double? thickness;
  final Radius? radius;

  NaScrollbarOptionsMaterial({
    this.trackVisibility,
    this.interactive,
    this.thickness,
    this.radius,
  });
}

class NaScrollbarOptionsCupertino extends NaScrollbarOptions {
  final double thickness;
  final double thicknessWhileDragging;
  final Radius radius;
  final Radius radiusWhileDragging;

  NaScrollbarOptionsCupertino({
    this.thickness = CupertinoScrollbar.defaultThickness,
    this.thicknessWhileDragging = CupertinoScrollbar.defaultThicknessWhileDragging,
    this.radius = CupertinoScrollbar.defaultRadius,
    this.radiusWhileDragging = CupertinoScrollbar.defaultRadiusWhileDragging,
  });
}

/// A cross-platform scrollbar that translates to [Scrollbar] on Material
/// and [CupertinoScrollbar] on Cupertino.
class NaScrollbar extends NaWidget {
  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;

  final NaWidgetOptionsBuilder<NaScrollbarOptions>? optionsBuilder;

  const NaScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.thumbVisibility,
    this.optionsBuilder,
    super.uiType,
    super.options,
  });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaScrollbarOptions? options = this.options ?? optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaScrollbarOptionsCupertino? cupertinoOptions = options is NaScrollbarOptionsCupertino
        ? options
        : null;

      return CupertinoScrollbar(
        controller: this.controller,
        thumbVisibility: this.thumbVisibility ?? false,
        thickness: cupertinoOptions?.thickness ?? CupertinoScrollbar.defaultThickness,
        thicknessWhileDragging: cupertinoOptions?.thicknessWhileDragging ?? CupertinoScrollbar.defaultThicknessWhileDragging,
        radius: cupertinoOptions?.radius ?? CupertinoScrollbar.defaultRadius,
        radiusWhileDragging: cupertinoOptions?.radiusWhileDragging ?? CupertinoScrollbar.defaultRadiusWhileDragging,
        child: this.child,
      );
    }

    if (uiType == NaUiType.material) {
      final NaScrollbarOptionsMaterial? materialOptions = options is NaScrollbarOptionsMaterial
        ? options
        : null;

      return Scrollbar(
        controller: this.controller,
        thumbVisibility: this.thumbVisibility,
        trackVisibility: materialOptions?.trackVisibility,
        interactive: materialOptions?.interactive,
        thickness: materialOptions?.thickness,
        radius: materialOptions?.radius,
        child: this.child,
      );
    }

    return null;
  }
}
