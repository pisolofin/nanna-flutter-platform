import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaSearchBar].
abstract class NaSearchBarOptions extends NaWidgetOptions {
  /// Default constructor for subclasses.
  NaSearchBarOptions();

  /// Creates an empty [NaSearchBarOptions] with default values.
  factory NaSearchBarOptions.empty() => NaSearchBarOptionsGeneric.empty();
}

/// Generic options for [NaSearchBar], holding properties common to both platforms.
class NaSearchBarOptionsGeneric extends NaSearchBarOptions {
  /// Creates a [NaSearchBarOptionsGeneric].
  NaSearchBarOptionsGeneric();

  /// Creates an empty [NaSearchBarOptionsGeneric] with default values.
  NaSearchBarOptionsGeneric.empty() : this();

  /// Creates a copy of this [NaSearchBarOptionsGeneric].
  NaSearchBarOptionsGeneric copyWith() {
    return NaSearchBarOptionsGeneric();
  }
}

/// Material-specific options for [NaSearchBar], resolving into a [SearchBar].
class NaSearchBarOptionsMaterial extends NaSearchBarOptionsGeneric {
  /// The background color of this widget.
  final WidgetStateProperty<Color?>? backgroundColor;
  /// The z-coordinate at which to place this widget relative to its parent.
  final WidgetStateProperty<double?>? elevation;
  /// A widget to display after the title.
  final Iterable<Widget>? trailing;
  /// The box constraints for this widget.
  final BoxConstraints? constraints;

  /// Creates a [NaSearchBarOptionsMaterial].
  NaSearchBarOptionsMaterial({
    this.backgroundColor,
    this.elevation,
    this.trailing,
    this.constraints,
  });

  /// Creates an empty [NaSearchBarOptionsMaterial] with default values.
  NaSearchBarOptionsMaterial.empty() : this();

  /// Creates a [NaSearchBarOptionsMaterial] from generic options.
  NaSearchBarOptionsMaterial.fromGeneric(
    NaSearchBarOptionsGeneric? generic, {
    this.backgroundColor,
    this.elevation,
    this.trailing,
    this.constraints,
  }) : super();

  /// Creates a copy of this [NaSearchBarOptionsMaterial] with the given fields replaced by non-null values.
  @override
  NaSearchBarOptionsMaterial copyWith({
    WidgetStateProperty<Color?>? backgroundColor,
    WidgetStateProperty<double?>? elevation,
    Iterable<Widget>? trailing,
    BoxConstraints? constraints,
  }) {
    return NaSearchBarOptionsMaterial(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation      : elevation ?? this.elevation,
      trailing       : trailing ?? this.trailing,
      constraints    : constraints ?? this.constraints,
    );
  }
}

/// Cupertino-specific options for [NaSearchBar], resolving into a [CupertinoSearchTextField].
class NaSearchBarOptionsCupertino extends NaSearchBarOptionsGeneric {
  /// The decoration to show around the widget.
  final BoxDecoration? decoration;
  /// The amount of space by which to inset the widget's contents.
  final EdgeInsetsGeometry padding;
  /// The color of items in the search bar.
  final Color itemColor;
  /// The size of items in the search bar.
  final double itemSize;

  /// Creates a [NaSearchBarOptionsCupertino].
  NaSearchBarOptionsCupertino({
    this.decoration,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
    this.itemColor = CupertinoColors.systemGrey2,
    this.itemSize = 20.0,
  });

  /// Creates an empty [NaSearchBarOptionsCupertino] with default values.
  NaSearchBarOptionsCupertino.empty() : this();

  /// Creates a [NaSearchBarOptionsCupertino] from generic options.
  NaSearchBarOptionsCupertino.fromGeneric(
    NaSearchBarOptionsGeneric? generic, {
    this.decoration,
    this.padding   = const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
    this.itemColor = CupertinoColors.systemGrey2,
    this.itemSize  = 20.0,
  }) : super();

  /// Creates a copy of this [NaSearchBarOptionsCupertino] with the given fields replaced by non-null values.
  @override
  NaSearchBarOptionsCupertino copyWith({
    BoxDecoration? decoration,
    EdgeInsetsGeometry? padding,
    Color? itemColor,
    double? itemSize,
  }) {
    return NaSearchBarOptionsCupertino(
      decoration: decoration ?? this.decoration,
      padding   : padding ?? this.padding,
      itemColor : itemColor ?? this.itemColor,
      itemSize  : itemSize ?? this.itemSize,
    );
  }
}

/// A cross-platform search bar that translates to [SearchBar] on Material
/// and [CupertinoSearchTextField] on Cupertino.
class NaSearchBar extends NaWidget {
  /// Controls the text being edited.
  final TextEditingController? controller;
  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;
  /// Text that suggests what sort of input the field accepts.
  final String? hintText;
  /// A widget to display before the title.
  final Widget? leading;
  /// Called when the value of the widget should change.
  final ValueChanged<String>? onChanged;
  /// Called when the user indicates that they are done editing the text.
  final ValueChanged<String>? onSubmitted;
  /// Called when the user taps this widget.
  final VoidCallback? onTap;

  /// Optional options builder for customizing platform-specific widget configuration.
  final NaWidgetOptionsBuilder<NaSearchBarOptions>? optionsBuilder;

  /// Creates a [NaSearchBar].
  const NaSearchBar({
    super.key,
    this.controller,
    this.focusNode,
    this.hintText,
    this.leading,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.optionsBuilder,
    super.uiType,
    super.options,
  });

  /// Creates a copy of this [NaSearchBar] with the given fields replaced with the new values.
  NaSearchBar copyWith({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? hintText,
    Widget? leading,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    VoidCallback? onTap,
    NaWidgetOptionsBuilder<NaSearchBarOptions>? optionsBuilder,
    NaUiType? uiType,
    dynamic options,
  }) {
    return NaSearchBar(
      key           : key ?? this.key,
      controller    : controller ?? this.controller,
      focusNode     : focusNode ?? this.focusNode,
      hintText      : hintText ?? this.hintText,
      leading       : leading ?? this.leading,
      onChanged     : onChanged ?? this.onChanged,
      onSubmitted   : onSubmitted ?? this.onSubmitted,
      onTap         : onTap ?? this.onTap,
      optionsBuilder: optionsBuilder ?? this.optionsBuilder,
      uiType        : uiType ?? this.uiType,
      options       : options ?? this.options,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaSearchBarOptions? options =
        this.options ?? optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaSearchBarOptionsCupertino? cupertinoOptions = options is NaSearchBarOptionsCupertino
        ? options
        : null
      ;

      // Extract the icon from 'leading' if it's an Icon widget, as CupertinoSearchTextField
      // expects an Icon for prefixIcon (defaulting to CupertinoIcons.search).
      Icon? cupertinoPrefixIcon;
      if (this.leading is Icon) {
        cupertinoPrefixIcon = this.leading as Icon;
      }

      return CupertinoSearchTextField(
        controller : this.controller,
        focusNode  : this.focusNode,
        placeholder: this.hintText,
        prefixIcon : cupertinoPrefixIcon ?? const Icon(CupertinoIcons.search),
        onChanged  : this.onChanged,
        onSubmitted: this.onSubmitted,
        onTap      : this.onTap,
        decoration : cupertinoOptions?.decoration,
        padding    : cupertinoOptions?.padding ??
            const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        itemColor: cupertinoOptions?.itemColor ?? CupertinoColors.systemGrey2,
        itemSize : cupertinoOptions?.itemSize ?? 20.0,
      );
    }

    if (uiType == NaUiType.material) {
      final NaSearchBarOptionsMaterial? materialOptions = options is NaSearchBarOptionsMaterial
        ? options
        : null
      ;

      return SearchBar(
        controller     : this.controller,
        focusNode      : this.focusNode,
        hintText       : this.hintText,
        leading        : this.leading ?? const Icon(Icons.search),
        trailing       : materialOptions?.trailing,
        onChanged      : this.onChanged,
        onSubmitted    : this.onSubmitted,
        onTap          : this.onTap,
        backgroundColor: materialOptions?.backgroundColor,
        elevation      : materialOptions?.elevation,
        constraints    : materialOptions?.constraints,
      );
    }

    return null;
  }
}
