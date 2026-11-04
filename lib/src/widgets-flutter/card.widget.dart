import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Default visual constants for [NaCard].
const double _defaultCardBorderRadius = 12.0;
const double _defaultCardBorderWidth  = 0.5;
const double _defaultCardElevation    = 0.0;
const double _zeroBorderWidth         = 0.0;
const Color _transparentColor         = Color(0x00000000);
const Color _lightHairlineBorderColor = Color(0xB3E5E7EB);
const Color _darkHairlineBorderColor  = Color(0x993A3A3C);

const CupertinoDynamicColor _defaultCupertinoSurfaceColor = CupertinoDynamicColor.withBrightness(
  color    : Color(0xFFFFFFFF),
  darkColor: Color(0xFF1C1C1E),
);

const CupertinoDynamicColor _defaultCupertinoBorderColor = CupertinoDynamicColor.withBrightness(
  color    : _lightHairlineBorderColor,
  darkColor: _darkHairlineBorderColor,
);

/// Base options for [NaCard].
abstract class NaCardOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaCardOptions();

  /// Creates an empty [NaCardOptions] with default values.
  factory NaCardOptions.empty() => NaCardOptionsGeneric.empty();
}

/// Generic options for [NaCard], holding properties common to both platforms.
class NaCardOptionsGeneric extends NaCardOptions {
  /// The background color of the card.
  final Color? color;

  /// The empty space that surrounds the card.
  final EdgeInsetsGeometry? margin;

  /// The amount of inner space surrounding the child widget.
  final EdgeInsetsGeometry? padding;

  /// If non-null, the corners of this card are rounded by this [BorderRadiusGeometry].
  final BorderRadiusGeometry? borderRadius;

  /// The color of the hairline or custom border drawn around the card.
  final Color? borderColor;

  /// The stroke width of the border drawn around the card. Set to `0.0` to remove the border.
  final double? borderWidth;

  /// How the card content should be clipped to its rounded shape.
  final Clip? clipBehavior;

  /// Creates a [NaCardOptionsGeneric].
  NaCardOptionsGeneric({
    this.color,
    this.margin,
    this.padding,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.clipBehavior,
  });

  /// Creates an empty [NaCardOptionsGeneric] with default values.
  NaCardOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaCardOptionsGeneric] with the given fields replaced by non-null values.
  NaCardOptionsGeneric copyWith({
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Clip? clipBehavior,
  }) {
    return NaCardOptionsGeneric(
      color       : color ?? this.color,
      margin      : margin ?? this.margin,
      padding     : padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor : borderColor ?? this.borderColor,
      borderWidth : borderWidth ?? this.borderWidth,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

/// Material-specific options for [NaCard], resolving into a [Card].
class NaCardOptionsMaterial extends NaCardOptionsGeneric {
  /// The color to paint the shadow below the card.
  final Color? shadowColor;

  /// The color used as an overlay on [color] to indicate elevation.
  final Color? surfaceTintColor;

  /// The z-coordinate at which to place this card.
  final double? elevation;

  /// Explicit [ShapeBorder] override for the card's [Material].
  final ShapeBorder? shape;

  /// Whether to paint the [shape] border in front of the child.
  final bool? borderOnForeground;

  /// Whether this widget represents a single semantic container.
  final bool? semanticContainer;

  /// Creates a [NaCardOptionsMaterial].
  NaCardOptionsMaterial({
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground,
    this.semanticContainer,
    super.color,
    super.margin,
    super.padding,
    super.borderRadius,
    super.borderColor,
    super.borderWidth,
    super.clipBehavior,
  });

  /// Creates an empty [NaCardOptionsMaterial] with default values.
  NaCardOptionsMaterial.empty() : this();

  /// Creates a [NaCardOptionsMaterial] from generic options.
  NaCardOptionsMaterial.fromGeneric(
    NaCardOptionsGeneric? generic, {
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground,
    this.semanticContainer,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Clip? clipBehavior,
  }) : super(
         color       : color ?? generic?.color,
         margin      : margin ?? generic?.margin,
         padding     : padding ?? generic?.padding,
         borderRadius: borderRadius ?? generic?.borderRadius,
         borderColor : borderColor ?? generic?.borderColor,
         borderWidth : borderWidth ?? generic?.borderWidth,
         clipBehavior: clipBehavior ?? generic?.clipBehavior,
       );

  /// Creates a copy of this [NaCardOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaCardOptionsMaterial copyWith({
    Color? shadowColor,
    Color? surfaceTintColor,
    double? elevation,
    ShapeBorder? shape,
    bool? borderOnForeground,
    bool? semanticContainer,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Clip? clipBehavior,
  }) {
    return NaCardOptionsMaterial(
      shadowColor       : shadowColor ?? this.shadowColor,
      surfaceTintColor  : surfaceTintColor ?? this.surfaceTintColor,
      elevation         : elevation ?? this.elevation,
      shape             : shape ?? this.shape,
      borderOnForeground: borderOnForeground ?? this.borderOnForeground,
      semanticContainer : semanticContainer ?? this.semanticContainer,
      color             : color ?? this.color,
      margin            : margin ?? this.margin,
      padding           : padding ?? this.padding,
      borderRadius      : borderRadius ?? this.borderRadius,
      borderColor       : borderColor ?? this.borderColor,
      borderWidth       : borderWidth ?? this.borderWidth,
      clipBehavior      : clipBehavior ?? this.clipBehavior,
    );
  }
}

/// Cupertino-specific options for [NaCard], resolving into a decorated [Container].
class NaCardOptionsCupertino extends NaCardOptionsGeneric {
  /// Explicit [BoxBorder] override drawn around the card.
  final BoxBorder? border;

  /// Creates a [NaCardOptionsCupertino].
  NaCardOptionsCupertino({
    this.border,
    super.color,
    super.margin,
    super.padding,
    super.borderRadius,
    super.borderColor,
    super.borderWidth,
    super.clipBehavior,
  });

  /// Creates an empty [NaCardOptionsCupertino] with default values.
  NaCardOptionsCupertino.empty() : this();

  /// Creates a [NaCardOptionsCupertino] from generic options.
  NaCardOptionsCupertino.fromGeneric(
    NaCardOptionsGeneric? generic, {
    this.border,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Clip? clipBehavior,
  }) : super(
         color       : color ?? generic?.color,
         margin      : margin ?? generic?.margin,
         padding     : padding ?? generic?.padding,
         borderRadius: borderRadius ?? generic?.borderRadius,
         borderColor : borderColor ?? generic?.borderColor,
         borderWidth : borderWidth ?? generic?.borderWidth,
         clipBehavior: clipBehavior ?? generic?.clipBehavior,
       );

  /// Creates a copy of this [NaCardOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaCardOptionsCupertino copyWith({
    BoxBorder? border,
    Color? color,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    double? borderWidth,
    Clip? clipBehavior,
  }) {
    return NaCardOptionsCupertino(
      border      : border ?? this.border,
      color       : color ?? this.color,
      margin      : margin ?? this.margin,
      padding     : padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      borderColor : borderColor ?? this.borderColor,
      borderWidth : borderWidth ?? this.borderWidth,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

/// A cross-platform Card widget with crisp hairline borders, zero outer margin,
/// and anti-aliased rounded corners on both Material ([Card]) and Cupertino ([Container]).
class NaCard extends NaWidget {
  /// Default corner radius applied when no custom radius or shape is specified.
  static const double defaultBorderRadius = _defaultCardBorderRadius;

  /// Default hairline border width applied when no custom width or border is specified.
  static const double defaultBorderWidth = _defaultCardBorderWidth;

  /// Default elevation applied on Material when no custom elevation is specified.
  static const double defaultElevation = _defaultCardElevation;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Optional inner padding surrounding [child] on both platforms.
  final EdgeInsetsGeometry? padding;

  /// Optional options builder for customizing platform-specific card configuration.
  final NaWidgetOptionsBuilder<NaCardOptions>? optionsBuilder;

  /// Creates a [NaCard].
  const NaCard({
    super.key,
    required this.child,
    this.padding,
    this.optionsBuilder,
    super.uiType,
    super.options,
  });

  /// Creates a copy of this [NaCard] with the given fields replaced by non-null values.
  NaCard copyWith({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry? padding,
    NaWidgetOptionsBuilder<NaCardOptions>? optionsBuilder,
    NaUiType? uiType,
    dynamic options,
  }) {
    return NaCard(
      key           : key ?? this.key,
      padding       : padding ?? this.padding,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
      options       : options ?? this.options,
      child         : child ?? this.child,
    );
  }

  /// Resolves the Cupertino [BoxBorder] from explicit or generic options.
  BoxBorder? _resolveCupertinoBorder(
    BuildContext context,
    NaCardOptionsGeneric? genericOptions,
    NaCardOptionsCupertino? cupertinoOptions,
  ) {
    if (cupertinoOptions?.border != null) {
      return cupertinoOptions!.border;
    }

    final double effectiveWidth = genericOptions?.borderWidth ?? defaultBorderWidth;
    if (effectiveWidth <= _zeroBorderWidth) {
      return null;
    }

    final Color effectiveColor = genericOptions?.borderColor ??
        _defaultCupertinoBorderColor.resolveFrom(context);

    return Border.all(
      color: effectiveColor,
      width: effectiveWidth,
    );
  }

  /// Extracts a [BorderRadiusGeometry] from a [RoundedRectangleBorder] when available.
  BorderRadiusGeometry? _extractBorderRadius(ShapeBorder? shape) {
    if (shape is RoundedRectangleBorder) {
      return shape.borderRadius;
    }
    return null;
  }

  /// Resolves the Material [ShapeBorder] from explicit, generic, or theme options.
  ShapeBorder _resolveMaterialShape(
    ThemeData materialTheme,
    CardThemeData cardTheme,
    NaCardOptionsGeneric? genericOptions,
    NaCardOptionsMaterial? materialOptions,
  ) {
    if (materialOptions?.shape != null) {
      return materialOptions!.shape!;
    }

    final bool hasGenericBorderOverride =
      (genericOptions?.borderRadius != null) ||
      (genericOptions?.borderColor != null) ||
      (genericOptions?.borderWidth != null)
    ;

    if ((!hasGenericBorderOverride) && (cardTheme.shape != null)) {
      return cardTheme.shape!;
    }

    final BorderRadiusGeometry effectiveRadius = genericOptions?.borderRadius ??
        _extractBorderRadius(cardTheme.shape) ??
        BorderRadius.circular(defaultBorderRadius);

    final double effectiveWidth = genericOptions?.borderWidth ?? defaultBorderWidth;
    final Color defaultBorderColor = (materialTheme.brightness == Brightness.dark)
      ? _darkHairlineBorderColor
      : _lightHairlineBorderColor
    ;

    final BorderSide effectiveSide = (effectiveWidth <= _zeroBorderWidth)
      ? BorderSide.none
      : BorderSide(
          color: genericOptions?.borderColor ?? defaultBorderColor,
          width: effectiveWidth,
        )
    ;

    return RoundedRectangleBorder(
      borderRadius: effectiveRadius,
      side        : effectiveSide,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final Object? rawOptions = this.options;
    final NaCardOptions? resolvedOptions = (rawOptions is NaCardOptions)
      ? rawOptions
      : this.optionsBuilder?.call(context, uiType)
    ;
    final NaCardOptionsGeneric? genericOptions = (resolvedOptions is NaCardOptionsGeneric)
      ? resolvedOptions
      : null
    ;
    final EdgeInsetsGeometry? effectivePadding = genericOptions?.padding ?? this.padding;

    // Render Cupertino decorated Container with anti-aliased rounded corners and hairline border
    if (uiType == NaUiType.cupertino) {
      final NaCardOptionsCupertino? cupertinoOptions = (resolvedOptions is NaCardOptionsCupertino)
        ? resolvedOptions
        : null
      ;

      return Container(
        margin      : genericOptions?.margin ?? EdgeInsets.zero,
        padding     : effectivePadding,
        clipBehavior: genericOptions?.clipBehavior ?? Clip.antiAlias,
        decoration  : BoxDecoration(
          color       : genericOptions?.color ?? _defaultCupertinoSurfaceColor.resolveFrom(context),
          borderRadius: genericOptions?.borderRadius ?? BorderRadius.circular(defaultBorderRadius),
          border      : _resolveCupertinoBorder(context, genericOptions, cupertinoOptions),
        ),
        child: this.child,
      );
    }

    // Render Material Card with flat surface, anti-aliased clipping, and hairline border
    if (uiType == NaUiType.material) {
      final NaCardOptionsMaterial? materialOptions = (resolvedOptions is NaCardOptionsMaterial)
        ? resolvedOptions
        : null
      ;
      final ThemeData materialTheme = Theme.of(context);
      final CardThemeData cardTheme = CardTheme.of(context);
      final Widget effectiveChild = (effectivePadding != null)
        ? Padding(
            padding: effectivePadding,
            child  : this.child,
          )
        : this.child
      ;

      return Card(
        color             : genericOptions?.color ?? cardTheme.color ?? materialTheme.colorScheme.surface,
        shadowColor       : materialOptions?.shadowColor ?? cardTheme.shadowColor,
        surfaceTintColor  : materialOptions?.surfaceTintColor ?? cardTheme.surfaceTintColor ?? _transparentColor,
        elevation         : materialOptions?.elevation ?? cardTheme.elevation ?? defaultElevation,
        shape             : _resolveMaterialShape(materialTheme, cardTheme, genericOptions, materialOptions),
        borderOnForeground: materialOptions?.borderOnForeground ?? true,
        margin            : genericOptions?.margin ?? cardTheme.margin ?? EdgeInsets.zero,
        clipBehavior      : genericOptions?.clipBehavior ?? cardTheme.clipBehavior ?? Clip.antiAlias,
        semanticContainer : materialOptions?.semanticContainer ?? true,
        child             : effectiveChild,
      );
    }

    return null;
  }
}
