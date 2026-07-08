import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaTextField].
abstract class NaTextFieldOptions extends NaWidgetOptions {}

/// Material-specific options for [NaTextField], resolving into a [TextField].
class NaTextFieldOptionsMaterial extends NaTextFieldOptions {
  final InputDecoration? decoration;
  final TextSelectionThemeData? selectionTheme;
  final String? obscuringCharacter;
  final bool? obscureText;
  final TextSelectionControls? selectionControls;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final Radius? cursorRadius;
  final bool? showCursor;
  final MouseCursor? mouseCursor;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;

  NaTextFieldOptionsMaterial({
    this.decoration,
    this.selectionTheme,
    this.obscuringCharacter,
    this.obscureText,
    this.selectionControls,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.cursorRadius,
    this.showCursor,
    this.mouseCursor,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
  });
}

/// Cupertino-specific options for [NaTextField], resolving into a [CupertinoTextField].
class NaTextFieldOptionsCupertino extends NaTextFieldOptions {
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final Widget? prefix;
  final OverlayVisibilityMode? prefixMode;
  final Widget? suffix;
  final OverlayVisibilityMode? suffixMode;
  final OverlayVisibilityMode? clearButtonMode;
  final String? placeholder;
  final TextStyle? placeholderStyle;
  final String? obscuringCharacter;
  final bool? obscureText;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final Radius? cursorRadius;
  final bool? showCursor;
  final TextSelectionControls? selectionControls;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;

  NaTextFieldOptionsCupertino({
    this.decoration,
    this.padding,
    this.prefix,
    this.prefixMode,
    this.suffix,
    this.suffixMode,
    this.clearButtonMode,
    this.placeholder,
    this.placeholderStyle,
    this.obscuringCharacter,
    this.obscureText,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.cursorRadius,
    this.showCursor,
    this.selectionControls,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
  });
}

/// A generic TextField widget that automatically renders a [TextField] on Material
/// and a [CupertinoTextField] on Cupertino.
class NaTextField extends NaWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final Brightness? keyboardAppearance;

  final NaWidgetOptionsBuilder<NaTextFieldOptions>? optionsBuilder;

  const NaTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.style,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.keyboardAppearance,
    this.optionsBuilder,
    super.uiType,
  });

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    final NaTextFieldOptions? options = optionsBuilder?.call(context, uiType);

    if (uiType == NaUiType.cupertino) {
      final NaTextFieldOptionsCupertino? cupertinoOptions = options is NaTextFieldOptionsCupertino
        ? options
        : null
      ;
      return CupertinoTextField(
        controller        : this.controller,
        focusNode         : this.focusNode,
        keyboardType      : this.keyboardType,
        textInputAction   : this.textInputAction,
        textCapitalization: this.textCapitalization,
        style             : this.style,
        textAlign         : this.textAlign,
        autofocus         : this.autofocus,
        readOnly          : this.readOnly,
        showCursor        : cupertinoOptions?.showCursor ?? this.showCursor,
        obscureText       : cupertinoOptions?.obscureText ?? this.obscureText,
        autocorrect       : this.autocorrect,
        enableSuggestions : this.enableSuggestions,
        maxLines          : this.maxLines,
        minLines          : this.minLines,
        expands           : this.expands,
        maxLength         : this.maxLength,
        onChanged         : this.onChanged,
        onEditingComplete : this.onEditingComplete,
        onSubmitted       : this.onSubmitted,
        inputFormatters   : this.inputFormatters,
        enabled           : this.enabled ?? true,
        keyboardAppearance: this.keyboardAppearance,

        // Cupertino specific
        decoration: cupertinoOptions?.decoration,
        padding   : cupertinoOptions?.padding ?? const EdgeInsets.all(6.0),
        prefix    : cupertinoOptions?.prefix,
        prefixMode:
            cupertinoOptions?.prefixMode ?? OverlayVisibilityMode.always,
        suffix    : cupertinoOptions?.suffix,
        suffixMode:
            cupertinoOptions?.suffixMode ?? OverlayVisibilityMode.always,
        clearButtonMode:
            cupertinoOptions?.clearButtonMode ?? OverlayVisibilityMode.never,
        placeholder     : cupertinoOptions?.placeholder,
        placeholderStyle:
            cupertinoOptions?.placeholderStyle ??
            const TextStyle(
              fontWeight: FontWeight.w400,
              color     : CupertinoColors.placeholderText,
            ),
        obscuringCharacter: cupertinoOptions?.obscuringCharacter ?? '•',
        cursorColor       : cupertinoOptions?.cursorColor,
        cursorHeight      : cupertinoOptions?.cursorHeight,
        cursorWidth       : cupertinoOptions?.cursorWidth ?? 2.0,
        cursorRadius      :
            cupertinoOptions?.cursorRadius ?? const Radius.circular(2.0),
        selectionControls: cupertinoOptions?.selectionControls,
        strutStyle       : cupertinoOptions?.strutStyle,
        textAlignVertical: cupertinoOptions?.textAlignVertical,
        textDirection    : cupertinoOptions?.textDirection,
      );
    }

    if (uiType == NaUiType.material) {
      final NaTextFieldOptionsMaterial? materialOptions = options is NaTextFieldOptionsMaterial
        ? options
        : null
      ;
      return TextField(
        controller        : this.controller,
        focusNode         : this.focusNode,
        keyboardType      : this.keyboardType,
        textInputAction   : this.textInputAction,
        textCapitalization: this.textCapitalization,
        style             : this.style,
        textAlign         : this.textAlign,
        autofocus         : this.autofocus,
        readOnly          : this.readOnly,
        showCursor        : materialOptions?.showCursor ?? this.showCursor,
        obscureText       : materialOptions?.obscureText ?? this.obscureText,
        autocorrect       : this.autocorrect,
        enableSuggestions : this.enableSuggestions,
        maxLines          : this.maxLines,
        minLines          : this.minLines,
        expands           : this.expands,
        maxLength         : this.maxLength,
        onChanged         : this.onChanged,
        onEditingComplete : this.onEditingComplete,
        onSubmitted       : this.onSubmitted,
        inputFormatters   : this.inputFormatters,
        enabled           : this.enabled,
        keyboardAppearance: this.keyboardAppearance,

        // Material specific
        decoration        : materialOptions?.decoration ?? const InputDecoration(),
        obscuringCharacter: materialOptions?.obscuringCharacter ?? '•',
        selectionControls : materialOptions?.selectionControls,
        cursorColor       : materialOptions?.cursorColor,
        cursorHeight      : materialOptions?.cursorHeight,
        cursorWidth       : materialOptions?.cursorWidth ?? 2.0,
        cursorRadius      : materialOptions?.cursorRadius,
        mouseCursor       : materialOptions?.mouseCursor,
        strutStyle        : materialOptions?.strutStyle,
        textAlignVertical : materialOptions?.textAlignVertical,
        textDirection     : materialOptions?.textDirection,
      );
    }

    return null;
  }
}
