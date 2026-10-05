import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaScrollbar].
abstract class NaScrollbarOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaScrollbarOptions();

  /// Creates an empty [NaScrollbarOptions] with default values.
  factory NaScrollbarOptions.empty() => NaScrollbarOptionsGeneric.empty();
}

/// Generic options for [NaScrollbar], holding properties common to both platforms.
class NaScrollbarOptionsGeneric extends NaScrollbarOptions {
  final double? thickness;
  final Radius? radius;

  NaScrollbarOptionsGeneric({
    this.thickness,
    this.radius,
  });

  /// Creates an empty [NaScrollbarOptionsGeneric] with default values.
  NaScrollbarOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaScrollbarOptionsGeneric] with the given fields replaced by non-null values.
  NaScrollbarOptionsGeneric copyWith({
    double? thickness,
    Radius? radius,
  }) {
    return NaScrollbarOptionsGeneric(
      thickness: thickness ?? this.thickness,
      radius   : radius ?? this.radius,
    );
  }
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

  /// Creates an empty [NaScrollbarOptionsMaterial] with default values.
  NaScrollbarOptionsMaterial.empty() : this();

  /// Creates a [NaScrollbarOptionsMaterial] from generic options.
  NaScrollbarOptionsMaterial.fromGeneric(
    NaScrollbarOptionsGeneric? generic, {
    this.trackVisibility,
    this.interactive,
  }) : super(
         thickness: generic?.thickness,
         radius   : generic?.radius,
       );

  /// Creates a copy of this [NaScrollbarOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaScrollbarOptionsMaterial copyWith({
    bool? trackVisibility,
    bool? interactive,
    double? thickness,
    Radius? radius,
  }) {
    return NaScrollbarOptionsMaterial(
      trackVisibility: trackVisibility ?? this.trackVisibility,
      interactive    : interactive ?? this.interactive,
      thickness      : thickness ?? this.thickness,
      radius         : radius ?? this.radius,
    );
  }
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

  /// Creates an empty [NaScrollbarOptionsCupertino] with default values.
  NaScrollbarOptionsCupertino.empty() : this();

  /// Creates a [NaScrollbarOptionsCupertino] from generic options.
  NaScrollbarOptionsCupertino.fromGeneric(
    NaScrollbarOptionsGeneric? generic, {
    this.thicknessWhileDragging = CupertinoScrollbar.defaultThicknessWhileDragging,
    this.radiusWhileDragging    = CupertinoScrollbar.defaultRadiusWhileDragging,
  }) : super(
         thickness: generic?.thickness ?? CupertinoScrollbar.defaultThickness,
         radius   : generic?.radius ?? CupertinoScrollbar.defaultRadius,
       );

  /// Creates a copy of this [NaScrollbarOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaScrollbarOptionsCupertino copyWith({
    double? thicknessWhileDragging,
    Radius? radiusWhileDragging,
    double? thickness,
    Radius? radius,
  }) {
    return NaScrollbarOptionsCupertino(
      thicknessWhileDragging: thicknessWhileDragging ?? this.thicknessWhileDragging,
      radiusWhileDragging   : radiusWhileDragging ?? this.radiusWhileDragging,
      thickness             : thickness ?? this.thickness,
      radius                : radius ?? this.radius,
    );
  }
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

  /// Creates a copy of this [NaScrollbar] with the given fields replaced with the new values.
  NaScrollbar copyWith({
    Key? key,
    Widget? child,
    ScrollController? controller,
    bool? thumbVisibility,
    NaWidgetOptionsBuilder<NaScrollbarOptions>? optionsBuilder,
    NaUiType? uiType,
    dynamic options,
  }) {
    return NaScrollbar(
      key            : key ?? this.key,
      controller     : controller ?? this.controller,
      thumbVisibility: thumbVisibility ?? this.thumbVisibility,
      optionsBuilder : optionsBuilder ?? this.optionsBuilder,
      uiType         : uiType ?? this.uiType,
      options        : options ?? this.options,
      child          : child ?? this.child,
    );
  }

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
