import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart' show CupertinoTheme;
import 'package:flutter/material.dart' show InputDecoration, InputBorder, ThemeData, Theme;

import 'text-field.widget.dart';
import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';
import '../widgets/na-widget.widget.dart';

/// Position of the title relative to the text field container
enum NaTextFieldTitlePosition {
  /// Display the title above the field container with vertical spacing
  above,

  /// Display the title overlapping the top border of the field container
  onBorder,
}

/// Title wrapper for text fields (such as [NaTextField])
/// that conditionally displays the title while maintaining identical layout space
/// whether the title is visible or not.
class NaTextFieldTitle extends StatefulWidget {
  /// Default text style for title display
  static const TextStyle defaultTitleStyle = TextStyle(
    fontSize  : 13.0,
    fontWeight: FontWeight.w500,
    color     : Color(0xFF757575),
  );

  /// Backward-compatible alias for [defaultTitleStyle]
  static const TextStyle defaultCaptionStyle = defaultTitleStyle;

  /// Default border for the field container
  static final BoxBorder defaultBorder = Border.all(
    color: const Color(0xFFD1D1D6),
    width: 1.0,
  );

  /// Default border radius for the field container
  static const BorderRadius defaultBorderRadius = BorderRadius.all(
    Radius.circular(5.0),
  );

  /// Title text displayed above or overlapping the field
  final String title;

  /// Input widget wrapped by this title
  final Widget textField;

  /// Text style for the title, defaulting to [defaultTitleStyle]
  final TextStyle? titleStyle;

  /// Vertical space between the title and the text field when [titlePosition] is [NaTextFieldTitlePosition.above]
  final double gap;

  /// Border decoration applied to the field container, defaulting to [defaultBorder]
  final BoxBorder? border;

  /// Border radius applied to the field container, defaulting to [defaultBorderRadius]
  final BorderRadiusGeometry? borderRadius;

  /// Optional border color override
  final Color? borderColor;

  /// Optional focused border color override
  final Color? focusedBorderColor;

  /// Optional background color for the field container
  final Color? backgroundColor;

  /// Optional background color for the title when [titlePosition] is [NaTextFieldTitlePosition.onBorder]
  final Color? titleBackgroundColor;

  /// Position of the title relative to the field container
  final NaTextFieldTitlePosition titlePosition;

  /// Optional explicit text controller
  final TextEditingController? controller;

  /// Optional explicit focus node
  final FocusNode? focusNode;

  /// Whether the title should be visible only when focused or text is present
  final bool showWhenFocusedOrHasText;

  /// Optional explicit UI type override
  final NaUiType? uiType;

  /// Backward-compatible alias for [title]
  String get caption => this.title;

  /// Backward-compatible alias for [titleStyle]
  TextStyle? get captionStyle => this.titleStyle;

  /// Creates a [NaTextFieldTitle] wrapper
  const NaTextFieldTitle({
    super.key,
    required this.title,
    required this.textField,
    this.titleStyle = defaultTitleStyle,
    this.gap = 4.0,
    this.border,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.backgroundColor,
    this.titleBackgroundColor,
    this.titlePosition = NaTextFieldTitlePosition.above,
    this.controller,
    this.focusNode,
    this.showWhenFocusedOrHasText = true,
    this.uiType,
  });

  /// Creates a copy of this [NaTextFieldTitle] with the given fields replaced with the new values.
  NaTextFieldTitle copyWith({
    Key? key,
    String? title,
    Widget? textField,
    TextStyle? titleStyle,
    double? gap,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? backgroundColor,
    Color? titleBackgroundColor,
    NaTextFieldTitlePosition? titlePosition,
    TextEditingController? controller,
    FocusNode? focusNode,
    bool? showWhenFocusedOrHasText,
    NaUiType? uiType,
  }) {
    return NaTextFieldTitle(
      key                     : key ?? this.key,
      title                   : title ?? this.title,
      textField               : textField ?? this.textField,
      titleStyle              : titleStyle ?? this.titleStyle,
      gap                     : gap ?? this.gap,
      border                  : border ?? this.border,
      borderRadius            : borderRadius ?? this.borderRadius,
      borderColor             : borderColor ?? this.borderColor,
      focusedBorderColor      : focusedBorderColor ?? this.focusedBorderColor,
      backgroundColor         : backgroundColor ?? this.backgroundColor,
      titleBackgroundColor    : titleBackgroundColor ?? this.titleBackgroundColor,
      titlePosition           : titlePosition ?? this.titlePosition,
      controller              : controller ?? this.controller,
      focusNode               : focusNode ?? this.focusNode,
      showWhenFocusedOrHasText: showWhenFocusedOrHasText ?? this.showWhenFocusedOrHasText,
      uiType                  : uiType ?? this.uiType,
    );
  }

  @override
  State<NaTextFieldTitle> createState() => _NaTextFieldTitleState();
}

class _NaTextFieldTitleState extends State<NaTextFieldTitle> {
  TextEditingController? _controller;
  FocusNode? _focusNode;
  bool _hasFocus = false;

  /// Initializes state and attaches listeners to resolved controller and focus node
  @override
  void initState() {
    super.initState();

    _resolveControllers();
    _controller?.addListener(_onStateChange);
    _focusNode?.addListener(_onStateChange);
  }

  /// Updates listeners when widget dependencies change
  @override
  void didUpdateWidget(NaTextFieldTitle oldWidget) {
    super.didUpdateWidget(oldWidget);

    if ((widget.controller != oldWidget.controller) ||
        (widget.textField != oldWidget.textField) ||
        (widget.focusNode != oldWidget.focusNode)
    ) {
      _controller?.removeListener(_onStateChange);
      _focusNode?.removeListener(_onStateChange);
      _resolveControllers();
      _controller?.addListener(_onStateChange);
      _focusNode?.addListener(_onStateChange);
    }
  }

  /// Removes listeners when widget is disposed
  @override
  void dispose() {
    _controller?.removeListener(_onStateChange);
    _focusNode?.removeListener(_onStateChange);

    super.dispose();
  }

  /// Resolves the controller and focus node from parameters or by inspecting the wrapped widget
  void _resolveControllers() {
    if (widget.controller != null) {
      _controller = widget.controller;
    }else if (widget.textField is NaTextField) {
      _controller = (widget.textField as NaTextField).controller;
    }else {
      _controller = null;
    }

    if (widget.focusNode != null) {
      _focusNode = widget.focusNode;
    }else if (widget.textField is NaTextField) {
      _focusNode = (widget.textField as NaTextField).focusNode;
    }else {
      _focusNode = null;
    }
  }

  /// Handles state change notifications and triggers widget rebuild
  void _onStateChange() {
    if (mounted) {
      setState(() {});
    }
  }

  /// Resolves active UI type list considering local overrides and ambient scope
  List<NaUiType> _resolveUiTypes(BuildContext context) {
    if (widget.uiType != null) {
      return [widget.uiType!];
    }
    if ((widget.textField is NaWidget) && ((widget.textField as NaWidget).uiType != null)) {
      return [(widget.textField as NaWidget).uiType!];
    }
    return NaUiTypeScope.of(context);
  }

  /// Determines whether the active style is Material
  bool _isMaterialStyle(BuildContext context) {
    final List<NaUiType> uiTypeList = _resolveUiTypes(context);

    for (final NaUiType candidateType in uiTypeList) {
      if (candidateType == NaUiType.cupertino) {
        return false;
      }
      if (candidateType == NaUiType.material) {
        return true;
      }
    }

    return true;
  }

  /// Calculates platform-adaptive left padding for title text alignment
  double _titleLeftPadding(BuildContext context) {
    if (widget.titlePosition == NaTextFieldTitlePosition.onBorder) {
      double minLeftOffset = 8.0;
      if (widget.borderRadius is BorderRadius) {
        final BorderRadius radius = widget.borderRadius as BorderRadius;
        minLeftOffset = radius.topLeft.x + 4.0;
      }
      return minLeftOffset;
    }

    final List<NaUiType> uiTypeList = _resolveUiTypes(context);

    for (final NaUiType candidateType in uiTypeList) {
      if (candidateType == NaUiType.cupertino) {
        return 6.0;
      }
      if (candidateType == NaUiType.material) {
        return 8.0;
      }
    }

    return 0.0;
  }

  /// Calculates platform-adaptive left padding for text field alignment
  double _textFieldLeftPadding(BuildContext context) {
    final List<NaUiType> uiTypeList = _resolveUiTypes(context);

    for (final NaUiType candidateType in uiTypeList) {
      if (candidateType == NaUiType.cupertino) {
        return 0;
      }
      if (candidateType == NaUiType.material) {
        return 8.0;
      }
    }

    return 0.0;
  }

  /// Calculates the vertical offset to center the title on the top border
  double _calculateTitleOffset() {
    final double fontSize = widget.titleStyle?.fontSize ?? NaTextFieldTitle.defaultTitleStyle.fontSize ?? 13.0;
    final double lineHeightMultiplier = widget.titleStyle?.height ?? 1.2;
    return (fontSize * lineHeightMultiplier) / 2.0;
  }

  /// Resolves the background color for masking the border under the title
  Color _resolveTitleBackgroundColor(BuildContext context) {
    if (widget.titleBackgroundColor != null) {
      return widget.titleBackgroundColor!;
    }
    if (widget.backgroundColor != null) {
      return widget.backgroundColor!;
    }
    if (_isMaterialStyle(context)) {
      try {
        return Theme.of(context).scaffoldBackgroundColor;
      }catch (exception) {
        return const Color(0xFFFFFFFF);
      }
    }else {
      try {
        return CupertinoTheme.of(context).scaffoldBackgroundColor;
      }catch (exception) {
        return const Color(0xFFFFFFFF);
      }
    }
  }

  /// Resolves effective border to use, falling back to default border styling
  BoxBorder _resolveBorder(BuildContext context, bool hasFocus) {
    if (widget.border != null) {
      return widget.border!;
    }
    if (hasFocus && (widget.focusedBorderColor != null)) {
      return Border.all(
        color: widget.focusedBorderColor!,
        width: 1.0,
      );
    }
    if (widget.borderColor != null) {
      return Border.all(
        color: widget.borderColor!,
        width: 1.0,
      );
    }
    return NaTextFieldTitle.defaultBorder;
  }

  /// Handles focus change notifications from the focus widget
  void _onFocusChange(bool focused) {
    if (_hasFocus != focused) {
      setState(() {
        _hasFocus = focused;
      });
    }
  }

  /// Builds the field container with resolved borders and focus handling
  Widget _buildFieldContainer(BuildContext context, bool hasFocus) {
    return Container(
      decoration: BoxDecoration(
        border      : _resolveBorder(context, hasFocus),
        borderRadius: widget.borderRadius ?? NaTextFieldTitle.defaultBorderRadius,
        color       : widget.backgroundColor,
      ),
      child: Focus(
        onFocusChange: _onFocusChange,
        child        : Padding(
          padding: EdgeInsets.only(
            left: _textFieldLeftPadding(context),
          ),
          child: _buildTextField(context),
        ),
      ),
    );
  }

  /// Builds the text field widget, removing borders when in Material style
  Widget _buildTextField(BuildContext context) {
    if (!_isMaterialStyle(context)) {
      return widget.textField;
    }

    Widget resolvedField = widget.textField;

    if (widget.textField is NaTextField) {
      final NaTextField naTextField = widget.textField as NaTextField;
      resolvedField = naTextField.copyWith(
        optionsBuilder: (BuildContext fieldContext, NaUiType fieldUiType) {
          final NaTextFieldOptions? baseOptions = naTextField.optionsBuilder?.call(fieldContext, fieldUiType);
          if (fieldUiType == NaUiType.material) {
            final NaTextFieldOptionsMaterial? materialOptions = baseOptions is NaTextFieldOptionsMaterial
              ? baseOptions
              : null
            ;
            final InputDecoration baseDecoration = materialOptions?.decoration ?? const InputDecoration();
            final NaTextFieldOptionsGeneric? genericOptions = baseOptions is NaTextFieldOptionsGeneric
              ? baseOptions
              : null
            ;

            return NaTextFieldOptionsMaterial(
              decoration: baseDecoration.copyWith(
                border            : InputBorder.none,
                enabledBorder     : InputBorder.none,
                focusedBorder     : InputBorder.none,
                disabledBorder    : InputBorder.none,
                errorBorder       : InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding    : baseDecoration.contentPadding ?? const EdgeInsets.symmetric(vertical: 12.0),
              ),
              selectionTheme       : materialOptions?.selectionTheme,
              mouseCursor          : materialOptions?.mouseCursor,
              placeholder          : genericOptions?.placeholder,
              obscuringCharacter   : genericOptions?.obscuringCharacter,
              obscureText          : genericOptions?.obscureText,
              showObscureTextToggle: genericOptions?.showObscureTextToggle,
              selectionControls    : genericOptions?.selectionControls,
              cursorColor          : genericOptions?.cursorColor,
              cursorHeight         : genericOptions?.cursorHeight,
              cursorWidth          : genericOptions?.cursorWidth,
              cursorRadius         : genericOptions?.cursorRadius,
              showCursor           : genericOptions?.showCursor,
              strutStyle           : genericOptions?.strutStyle,
              textAlignVertical    : genericOptions?.textAlignVertical,
              textDirection        : genericOptions?.textDirection,
            );
          }

          return baseOptions;
        },
      );
    }

    final ThemeData currentTheme = Theme.of(context);

    return Theme(
      data: currentTheme.copyWith(
        inputDecorationTheme: currentTheme.inputDecorationTheme.copyWith(
          border            : InputBorder.none,
          enabledBorder     : InputBorder.none,
          focusedBorder     : InputBorder.none,
          disabledBorder    : InputBorder.none,
          errorBorder       : InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding    : currentTheme.inputDecorationTheme.contentPadding ?? const EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
      child: resolvedField,
    );
  }

  /// Builds the title and text field layout maintaining equal space whether title is visible or not
  @override
  Widget build(BuildContext context) {
    final bool hasFocus  = _hasFocus || (_focusNode?.hasFocus ?? false);
    final bool hasText   = _controller?.text.isNotEmpty ?? false;
    final bool showTitle = widget.showWhenFocusedOrHasText
      ? (hasFocus || hasText)
      : (!hasFocus && !hasText)
    ;

    if (widget.titlePosition == NaTextFieldTitlePosition.onBorder) {
      return Stack(
        children: [
          // Text field container with top offset for overlapping title
          Padding(
            padding: EdgeInsets.only(
              top: _calculateTitleOffset(),
            ),
            child: _buildFieldContainer(context, hasFocus),
          ),
          // Title label overlapping the top border
          Positioned(
            top  : 0,
            left : _titleLeftPadding(context),
            child: Visibility(
              visible              : showTitle,
              maintainSize         : true,
              maintainAnimation    : true,
              maintainState        : true,
              maintainSemantics    : false,
              maintainInteractivity: false,
              child                : GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap   : () {
                  if (_focusNode != null) {
                    _focusNode?.requestFocus();
                  }
                },
                child: Container(
                  color  : _resolveTitleBackgroundColor(context),
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child  : Text(
                    widget.title,
                    style: widget.titleStyle ?? NaTextFieldTitle.defaultTitleStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      mainAxisSize      : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
        // Title label
        Visibility(
          visible              : showTitle,
          maintainSize         : true,
          maintainAnimation    : true,
          maintainState        : true,
          maintainSemantics    : false,
          maintainInteractivity: false,
          child                : Padding(
            padding: EdgeInsets.only(
              left: _titleLeftPadding(context),
            ),
            child: Text(
              widget.title,
              style: widget.titleStyle ?? NaTextFieldTitle.defaultTitleStyle,
            ),
          ),
        ),
        // Gap spacing
        SizedBox(height: widget.gap),
        // Text field container
        _buildFieldContainer(context, hasFocus),
      ],
    );
  }
}
