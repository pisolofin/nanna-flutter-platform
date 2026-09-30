import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

import 'icon.widget.dart';
import 'icon-button.widget.dart';
import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';
import '../constants/icons.constant.dart';
import '../models/widget-options.model.dart';

/// Base options for [NaTextField].
abstract class NaTextFieldOptions extends NaWidgetOptions {}

/// Generic options for [NaTextField], holding properties common to both platforms.
class NaTextFieldOptionsGeneric extends NaTextFieldOptions {
  final String? placeholder;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? showObscureTextToggle;
  final TextSelectionControls? selectionControls;
  final Color? cursorColor;
  final double? cursorHeight;
  final double? cursorWidth;
  final Radius? cursorRadius;
  final bool? showCursor;
  final StrutStyle? strutStyle;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;

  NaTextFieldOptionsGeneric({
    this.placeholder,
    this.obscuringCharacter,
    this.obscureText,
    this.showObscureTextToggle,
    this.selectionControls,
    this.cursorColor,
    this.cursorHeight,
    this.cursorWidth,
    this.cursorRadius,
    this.showCursor,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
  });
}

/// Material-specific options for [NaTextField], resolving into a [TextField].
class NaTextFieldOptionsMaterial extends NaTextFieldOptionsGeneric {
  final InputDecoration? decoration;
  final TextSelectionThemeData? selectionTheme;
  final MouseCursor? mouseCursor;

  NaTextFieldOptionsMaterial({
    this.decoration,
    this.selectionTheme,
    this.mouseCursor,
    super.placeholder,
    super.obscuringCharacter,
    super.obscureText,
    super.showObscureTextToggle,
    super.selectionControls,
    super.cursorColor,
    super.cursorHeight,
    super.cursorWidth,
    super.cursorRadius,
    super.showCursor,
    super.strutStyle,
    super.textAlignVertical,
    super.textDirection,
  });
}

/// Cupertino-specific options for [NaTextField], resolving into a [CupertinoTextField].
class NaTextFieldOptionsCupertino extends NaTextFieldOptionsGeneric {
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final Widget? prefix;
  final OverlayVisibilityMode? prefixMode;
  final Widget? suffix;
  final OverlayVisibilityMode? suffixMode;
  final OverlayVisibilityMode? clearButtonMode;
  final TextStyle? placeholderStyle;

  NaTextFieldOptionsCupertino({
    this.decoration,
    this.padding,
    this.prefix,
    this.prefixMode,
    this.suffix,
    this.suffixMode,
    this.clearButtonMode,
    this.placeholderStyle,
    super.placeholder,
    super.obscuringCharacter,
    super.obscureText,
    super.showObscureTextToggle,
    super.cursorColor,
    super.cursorHeight,
    super.cursorWidth,
    super.cursorRadius,
    super.showCursor,
    super.selectionControls,
    super.strutStyle,
    super.textAlignVertical,
    super.textDirection,
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
  final bool showObscureTextToggle;
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
    this.showObscureTextToggle = true,
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

  /// Creates a copy of this [NaTextField] with the given fields replaced by non-null values.
  NaTextField copyWith({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextCapitalization? textCapitalization,
    TextStyle? style,
    TextAlign? textAlign,
    bool? autofocus,
    bool? readOnly,
    bool? showCursor,
    bool? obscureText,
    bool? showObscureTextToggle,
    bool? autocorrect,
    bool? enableSuggestions,
    int? maxLines,
    int? minLines,
    bool? expands,
    int? maxLength,
    ValueChanged<String>? onChanged,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onSubmitted,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    Brightness? keyboardAppearance,
    NaWidgetOptionsBuilder<NaTextFieldOptions>? optionsBuilder,
    NaUiType? uiType,
  }) {
    return NaTextField(
      key                  : key ?? this.key,
      controller           : controller ?? this.controller,
      focusNode            : focusNode ?? this.focusNode,
      keyboardType         : keyboardType ?? this.keyboardType,
      textInputAction      : textInputAction ?? this.textInputAction,
      textCapitalization   : textCapitalization ?? this.textCapitalization,
      style                : style ?? this.style,
      textAlign            : textAlign ?? this.textAlign,
      autofocus            : autofocus ?? this.autofocus,
      readOnly             : readOnly ?? this.readOnly,
      showCursor           : showCursor ?? this.showCursor,
      obscureText          : obscureText ?? this.obscureText,
      showObscureTextToggle: showObscureTextToggle ?? this.showObscureTextToggle,
      autocorrect          : autocorrect ?? this.autocorrect,
      enableSuggestions    : enableSuggestions ?? this.enableSuggestions,
      maxLines             : maxLines ?? this.maxLines,
      minLines             : minLines ?? this.minLines,
      expands              : expands ?? this.expands,
      maxLength            : maxLength ?? this.maxLength,
      onChanged            : onChanged ?? this.onChanged,
      onEditingComplete    : onEditingComplete ?? this.onEditingComplete,
      onSubmitted          : onSubmitted ?? this.onSubmitted,
      inputFormatters      : inputFormatters ?? this.inputFormatters,
      enabled              : enabled ?? this.enabled,
      keyboardAppearance   : keyboardAppearance ?? this.keyboardAppearance,
      optionsBuilder       : optionsBuilder ?? this.optionsBuilder,
      uiType               : uiType ?? this.uiType,
    );
  }

  @override
  Widget? renderForUIType(BuildContext context, NaUiType uiType) {
    if ((uiType != NaUiType.cupertino) && (uiType != NaUiType.material) ) {
      return null;
    }

    final NaTextFieldOptions? options = this.optionsBuilder?.call(context, uiType);

    return _NaTextFieldPlatformRender(
      naTextField: this,
      uiType     : uiType,
      options    : options,
    );
  }
}

/// Internal stateful wrapper for [NaTextField] that manages dynamic text obscuring toggle.
class _NaTextFieldPlatformRender extends StatefulWidget {
  final NaTextField naTextField;
  final NaUiType uiType;
  final NaTextFieldOptions? options;

  const _NaTextFieldPlatformRender({
    required this.naTextField,
    required this.uiType,
    this.options,
  });

  @override
  State<_NaTextFieldPlatformRender> createState() => _NaTextFieldPlatformRenderState();
}

class _NaTextFieldPlatformRenderState extends State<_NaTextFieldPlatformRender> {
  late bool _obscureText;
  late bool _isObscureConfigured;

  @override
  void initState() {
    super.initState();

    final NaTextFieldOptionsGeneric? genericOptions = widget.options is NaTextFieldOptionsGeneric
      ? (widget.options as NaTextFieldOptionsGeneric)
      : null
    ;
    _isObscureConfigured = genericOptions?.obscureText ?? widget.naTextField.obscureText;
    _obscureText         = _isObscureConfigured;
  }

  @override
  void didUpdateWidget(_NaTextFieldPlatformRender oldWidget) {
    super.didUpdateWidget(oldWidget);

    final NaTextFieldOptionsGeneric? genericOptions = widget.options is NaTextFieldOptionsGeneric
      ? (widget.options as NaTextFieldOptionsGeneric)
      : null
    ;
    final bool newConfigured = genericOptions?.obscureText ?? widget.naTextField.obscureText;
    if (newConfigured != _isObscureConfigured) {
      _isObscureConfigured = newConfigured;
      _obscureText         = newConfigured;
    }
  }

  /// Toggles between obscured and plain text display
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// Builds the standard visibility toggle icon button
  Widget _buildToggleVisibilityButton(BuildContext context) {
    return NaIconButton(
      icon: NaIcon(
        _obscureText ? NaIcons.visibility : NaIcons.visibilityOff,
        size: 20.0,
      ),
      onPressed     : _toggleObscureText,
      optionsBuilder: (BuildContext context, NaUiType uiType) {
        if (uiType == NaUiType.cupertino) {
          return NaIconButtonOptionsCupertino(
            minimumSize: Size.zero,
            padding    : const EdgeInsets.symmetric(horizontal: 6.0),
          );
        }
        if (uiType == NaUiType.material) {
          return NaIconButtonOptionsMaterial(
            splashRadius: 20.0,
            padding     : EdgeInsets.zero,
          );
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final NaTextFieldOptionsGeneric? genericOptions = widget.options is NaTextFieldOptionsGeneric
      ? (widget.options as NaTextFieldOptionsGeneric)
      : null
    ;
    final bool showToggle = genericOptions?.showObscureTextToggle ?? widget.naTextField.showObscureTextToggle;
    final bool enableToggle = _isObscureConfigured && showToggle;

    if (widget.uiType == NaUiType.cupertino) {
      final NaTextFieldOptionsCupertino? cupertinoOptions = widget.options is NaTextFieldOptionsCupertino
        ? (widget.options as NaTextFieldOptionsCupertino)
        : null
      ;

      final Widget? suffixWidget = enableToggle
        ? (cupertinoOptions?.suffix ?? _buildToggleVisibilityButton(context))
        : cupertinoOptions?.suffix
      ;
      final OverlayVisibilityMode suffixMode = enableToggle
        ? (cupertinoOptions?.suffixMode ?? OverlayVisibilityMode.always)
        : (cupertinoOptions?.suffixMode ?? OverlayVisibilityMode.always)
      ;

      return CupertinoTextField(
        controller        : widget.naTextField.controller,
        focusNode         : widget.naTextField.focusNode,
        keyboardType      : widget.naTextField.keyboardType,
        textInputAction   : widget.naTextField.textInputAction,
        textCapitalization: widget.naTextField.textCapitalization,
        style             : widget.naTextField.style,
        textAlign         : widget.naTextField.textAlign,
        autofocus         : widget.naTextField.autofocus,
        readOnly          : widget.naTextField.readOnly,
        showCursor        : genericOptions?.showCursor ?? widget.naTextField.showCursor,
        obscureText       : enableToggle ? _obscureText : (genericOptions?.obscureText ?? widget.naTextField.obscureText),
        autocorrect       : widget.naTextField.autocorrect,
        enableSuggestions : widget.naTextField.enableSuggestions,
        maxLines          : widget.naTextField.maxLines,
        minLines          : widget.naTextField.minLines,
        expands           : widget.naTextField.expands,
        maxLength         : widget.naTextField.maxLength,
        onChanged         : widget.naTextField.onChanged,
        onEditingComplete : widget.naTextField.onEditingComplete,
        onSubmitted       : widget.naTextField.onSubmitted,
        inputFormatters   : widget.naTextField.inputFormatters,
        enabled           : widget.naTextField.enabled ?? true,
        keyboardAppearance: widget.naTextField.keyboardAppearance,

        // Cupertino specific
        decoration: cupertinoOptions?.decoration,
        padding   : cupertinoOptions?.padding ?? const EdgeInsets.all(6.0),
        prefix    : cupertinoOptions?.prefix,
        prefixMode:
            cupertinoOptions?.prefixMode ?? OverlayVisibilityMode.always,
        suffix         : suffixWidget,
        suffixMode     : suffixMode,
        clearButtonMode:
            cupertinoOptions?.clearButtonMode ?? OverlayVisibilityMode.never,
        placeholder     : genericOptions?.placeholder,
        placeholderStyle: cupertinoOptions?.placeholderStyle ??
            const TextStyle(
              fontWeight: FontWeight.w400,
              color     : CupertinoColors.placeholderText,
            ),
        obscuringCharacter: genericOptions?.obscuringCharacter ?? '•',
        cursorColor       : genericOptions?.cursorColor,
        cursorHeight      : genericOptions?.cursorHeight,
        cursorWidth       : genericOptions?.cursorWidth ?? 2.0,
        cursorRadius      :
            genericOptions?.cursorRadius ?? const Radius.circular(2.0),
        selectionControls: genericOptions?.selectionControls,
        strutStyle       : genericOptions?.strutStyle,
        textAlignVertical: genericOptions?.textAlignVertical,
        textDirection    : genericOptions?.textDirection,
      );
    }

    if (widget.uiType == NaUiType.material) {
      final NaTextFieldOptionsMaterial? materialOptions = widget.options is NaTextFieldOptionsMaterial
        ? (widget.options as NaTextFieldOptionsMaterial)
        : null
      ;
      final InputDecoration effectiveDecoration = materialOptions?.decoration ?? const InputDecoration();
      final InputDecoration decorationWithPlaceholder = ((genericOptions?.placeholder != null) && (effectiveDecoration.hintText == null))
        ? effectiveDecoration.copyWith(hintText: genericOptions?.placeholder)
        : effectiveDecoration
      ;

      final Widget? suffixIconWidget = enableToggle
        ? (decorationWithPlaceholder.suffixIcon ?? _buildToggleVisibilityButton(context))
        : decorationWithPlaceholder.suffixIcon
      ;

      final InputDecoration finalDecoration = decorationWithPlaceholder.copyWith(
        suffixIcon: suffixIconWidget,
      );

      return TextField(
        controller        : widget.naTextField.controller,
        focusNode         : widget.naTextField.focusNode,
        keyboardType      : widget.naTextField.keyboardType,
        textInputAction   : widget.naTextField.textInputAction,
        textCapitalization: widget.naTextField.textCapitalization,
        style             : widget.naTextField.style,
        textAlign         : widget.naTextField.textAlign,
        autofocus         : widget.naTextField.autofocus,
        readOnly          : widget.naTextField.readOnly,
        showCursor        : genericOptions?.showCursor ?? widget.naTextField.showCursor,
        obscureText       : enableToggle ? _obscureText : (genericOptions?.obscureText ?? widget.naTextField.obscureText),
        autocorrect       : widget.naTextField.autocorrect,
        enableSuggestions : widget.naTextField.enableSuggestions,
        maxLines          : widget.naTextField.maxLines,
        minLines          : widget.naTextField.minLines,
        expands           : widget.naTextField.expands,
        maxLength         : widget.naTextField.maxLength,
        onChanged         : widget.naTextField.onChanged,
        onEditingComplete : widget.naTextField.onEditingComplete,
        onSubmitted       : widget.naTextField.onSubmitted,
        inputFormatters   : widget.naTextField.inputFormatters,
        enabled           : widget.naTextField.enabled,
        keyboardAppearance: widget.naTextField.keyboardAppearance,

        // Material specific
        decoration        : finalDecoration,
        obscuringCharacter: genericOptions?.obscuringCharacter ?? '•',
        selectionControls : genericOptions?.selectionControls,
        cursorColor       : genericOptions?.cursorColor,
        cursorHeight      : genericOptions?.cursorHeight,
        cursorWidth       : genericOptions?.cursorWidth ?? 2.0,
        cursorRadius      : genericOptions?.cursorRadius,
        mouseCursor       : materialOptions?.mouseCursor,
        strutStyle        : genericOptions?.strutStyle,
        textAlignVertical : genericOptions?.textAlignVertical,
        textDirection     : genericOptions?.textDirection,
      );
    }

    return const SizedBox.shrink();
  }
}
