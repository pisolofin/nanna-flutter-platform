import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

abstract class NaSearchBarOptions extends NaWidgetOptions {}

class NaSearchBarOptionsMaterial extends NaSearchBarOptions {
  final WidgetStateProperty<Color?>? backgroundColor;
  final WidgetStateProperty<double?>? elevation;
  final Iterable<Widget>? trailing;
  final BoxConstraints? constraints;

  NaSearchBarOptionsMaterial({
    this.backgroundColor,
    this.elevation,
    this.trailing,
    this.constraints,
  });
}

class NaSearchBarOptionsCupertino extends NaSearchBarOptions {
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry padding;
  final Color itemColor;
  final double itemSize;

  NaSearchBarOptionsCupertino({
    this.decoration,
    this.padding = const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
    this.itemColor = CupertinoColors.systemGrey2,
    this.itemSize = 20.0,
  });
}

/// A cross-platform search bar that translates to [SearchBar] on Material
/// and [CupertinoSearchTextField] on Cupertino.
class NaSearchBar extends NaWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? leading;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

  final NaWidgetOptionsBuilder<NaSearchBarOptions>? optionsBuilder;

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

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaSearchBarOptions? options = this.options ?? optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaSearchBarOptionsCupertino? cupertinoOptions = options is NaSearchBarOptionsCupertino
          ? options
          : null;

      // Extract the icon from 'leading' if it's an Icon widget, as CupertinoSearchTextField
      // expects an Icon for prefixIcon (defaulting to CupertinoIcons.search).
      Icon? cupertinoPrefixIcon;
      if (this.leading is Icon) {
        cupertinoPrefixIcon = this.leading as Icon;
      }

      return CupertinoSearchTextField(
        controller: this.controller,
        focusNode: this.focusNode,
        placeholder: this.hintText,
        prefixIcon: cupertinoPrefixIcon ?? const Icon(CupertinoIcons.search),
        onChanged: this.onChanged,
        onSubmitted: this.onSubmitted,
        onTap: this.onTap,
        decoration: cupertinoOptions?.decoration,
        padding: cupertinoOptions?.padding ?? const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
        itemColor: cupertinoOptions?.itemColor ?? CupertinoColors.systemGrey2,
        itemSize: cupertinoOptions?.itemSize ?? 20.0,
      );
    }

    if (uiType == NaUiType.material) {
      final NaSearchBarOptionsMaterial? materialOptions = options is NaSearchBarOptionsMaterial
          ? options
          : null;

      return SearchBar(
        controller: this.controller,
        focusNode: this.focusNode,
        hintText: this.hintText,
        leading: this.leading ?? const Icon(Icons.search),
        trailing: materialOptions?.trailing,
        onChanged: this.onChanged,
        onSubmitted: this.onSubmitted,
        onTap: this.onTap,
        backgroundColor: materialOptions?.backgroundColor,
        elevation: materialOptions?.elevation,
        constraints: materialOptions?.constraints,
      );
    }

    return null;
  }
}

