import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaScrollbar].
abstract class NaScrollbarOptions extends NaWidgetOptions {}

/// Generic options for [NaScrollbar], holding properties common to both platforms.
class NaScrollbarOptionsGeneric extends NaScrollbarOptions {
  final double? thickness;
  final Radius? radius;

  NaScrollbarOptionsGeneric({
    this.thickness,
    this.radius,
  });
}

/// Material-specific options for [NaScrollbar], resolving into a [Scrollbar].
class NaScrollbarOptionsMaterial extends NaScrollbarOptionsGeneric {
  final bool? trackVisibility;
  final bool? interactive;

  NaScrollbarOptionsMaterial({
    this.trackVisibility,
    this.interactive,
    super.thickness,
    super.radius,
  });
}

/// Cupertino-specific options for [NaScrollbar], resolving into a [CupertinoScrollbar].
class NaScrollbarOptionsCupertino extends NaScrollbarOptionsGeneric {
  final double thicknessWhileDragging;
  final Radius radiusWhileDragging;

  NaScrollbarOptionsCupertino({
    super.thickness = CupertinoScrollbar.defaultThickness,
    this.thicknessWhileDragging =
        CupertinoScrollbar.defaultThicknessWhileDragging,
    super.radius = CupertinoScrollbar.defaultRadius,
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
    final NaScrollbarOptions? options =
        this.options ?? this.optionsBuilder?.call(context, uiType);
    final NaScrollbarOptionsGeneric? genericOptions = options is NaScrollbarOptionsGeneric
      ? options
      : null
    ;

    if (uiType == NaUiType.cupertino) {
      final NaScrollbarOptionsCupertino? cupertinoOptions = options is NaScrollbarOptionsCupertino
        ? options
        : null
      ;

      return CupertinoScrollbar(
        controller     : this.controller,
        thumbVisibility: this.thumbVisibility ?? false,
        thickness      :
            genericOptions?.thickness ?? CupertinoScrollbar.defaultThickness,
        thicknessWhileDragging: cupertinoOptions?.thicknessWhileDragging ??
            CupertinoScrollbar.defaultThicknessWhileDragging,
        radius             : genericOptions?.radius ?? CupertinoScrollbar.defaultRadius,
        radiusWhileDragging: cupertinoOptions?.radiusWhileDragging ??
            CupertinoScrollbar.defaultRadiusWhileDragging,
        child: this.child,
      );
    }

    if (uiType == NaUiType.material) {
      final NaScrollbarOptionsMaterial? materialOptions = options is NaScrollbarOptionsMaterial
        ? options
        : null
      ;

      return Scrollbar(
        controller     : this.controller,
        thumbVisibility: this.thumbVisibility,
        trackVisibility: materialOptions?.trackVisibility,
        interactive    : materialOptions?.interactive,
        thickness      : genericOptions?.thickness,
        radius         : genericOptions?.radius,
        child          : this.child,
      );
    }

    return null;
  }
}
