import 'package:flutter/widgets.dart';

import 'text-field.widget.dart';

class NaTextFieldCaption extends StatelessWidget {
  final String caption;
  final NaTextField textField;
  final TextStyle? captionStyle;
  final double? gap;

  const NaTextFieldCaption({
    super.key,
    required this.caption,
    required this.textField,
    this.captionStyle,
    this.gap = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize      : MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children          : [
        Text(
          this.caption,
          style: this.captionStyle,
        ),
        SizedBox(height: this.gap),
        this.textField,
      ],
    );
  }
}
