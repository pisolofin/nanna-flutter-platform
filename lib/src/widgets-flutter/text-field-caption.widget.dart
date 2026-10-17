import 'package:flutter/widgets.dart';

import 'text-field.widget.dart';
import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';

/// Caption for a text field
class NaTextFieldCaption extends StatelessWidget {
  /// The caption text displayed below the text field.
  final String caption;
  /// The underlying [NaTextField] wrapped by this widget.
  final NaTextField textField;
  /// The text style of the caption.
  final TextStyle? captionStyle;
  /// The vertical space between the text field and the caption.
  final double? gap;

  /// Creates a [NaTextFieldCaption].
  const NaTextFieldCaption({
    super.key,
    required this.caption,
    required this.textField,
    this.captionStyle,
    this.gap = 0,
  });

  /// Creates a copy of this [NaTextFieldCaption] with the given fields replaced with the new values.
  NaTextFieldCaption copyWith({
    Key? key,
    String? caption,
    NaTextField? textField,
    TextStyle? captionStyle,
    double? gap,
  }) {
    return NaTextFieldCaption(
      key         : key ?? this.key,
      caption     : caption ?? this.caption,
      textField   : textField ?? this.textField,
      captionStyle: captionStyle ?? this.captionStyle,
      gap         : gap ?? this.gap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize      : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
        Padding(
          padding: EdgeInsets.only(
            left: this._getLeftPadding(context),
          ),
          child: Text(
            this.caption,
            style: this.captionStyle,
          ),
        ),
        SizedBox(height: this.gap),
        this.textField,
      ],
    );
  }

  /// Left margit for fields
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
