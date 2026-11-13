import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';

import 'text-field.widget.dart';

/// Position of the caption relative to the text field container.
enum NaTextFieldCaptionPosition {
  /// Display the caption above the text field.
  above,

  /// Display the caption below the text field.
  below,
}

/// Caption label for a text field.
class NaTextFieldCaption extends StatelessWidget {
  /// The caption text displayed with the text field.
  final String caption;

  /// The underlying [NaTextField] wrapped by this widget.
  final NaTextField textField;

  /// The text style of the caption.
  final TextStyle? captionStyle;

  /// The vertical space between the text field and the caption.
  final double? gap;

  /// Position of the caption relative to the text field.
  final NaTextFieldCaptionPosition position;

  /// Creates a [NaTextFieldCaption].
  const NaTextFieldCaption({
    super.key,
    required this.caption,
    required this.textField,
    this.captionStyle,
    this.gap = 0,
    this.position = NaTextFieldCaptionPosition.above,
  });

  /// Creates a copy of this [NaTextFieldCaption] with the given fields replaced with the new values.
  NaTextFieldCaption copyWith({
    Key? key,
    String? caption,
    NaTextField? textField,
    TextStyle? captionStyle,
    double? gap,
    NaTextFieldCaptionPosition? position,
  }) {
    return NaTextFieldCaption(
      key         : key ?? this.key,
      caption     : caption ?? this.caption,
      textField   : textField ?? this.textField,
      captionStyle: captionStyle ?? this.captionStyle,
      gap         : gap ?? this.gap,
      position    : position ?? this.position,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget labelWidget = Padding(
      padding: EdgeInsets.only(
        left: this._getLeftPadding(context),
      ),
      child: Text(
        this.caption,
        style: this.captionStyle,
      ),
    );

    if (this.position == NaTextFieldCaptionPosition.below) {
      return Column(
        mainAxisSize      : MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children          : [
          // Text field
          this.textField,
          // Spacing
          SizedBox(height: this.gap),
          // Caption label
          labelWidget,
        ],
      );
    }

    return Column(
      mainAxisSize      : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
        // Caption label
        labelWidget,
        // Spacing
        SizedBox(height: this.gap),
        // Text field
        this.textField,
      ],
    );
  }

  /// Left margin for fields
  double _getLeftPadding(BuildContext context) {
    final List<NaUiType> uiTypes = NaUiTypeScope.of(context);

    for (final NaUiType type in uiTypes) {
      if (type == NaUiType.cupertino) {
        return 6.0;
      }
      if (type == NaUiType.material) {
        return 0.0;
      }
    }

    return 0.0;
  }
}
