import 'package:flutter/widgets.dart';

import 'text-field.widget.dart';
import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';

/// Caption for a text field
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
    this.gap = 0,
  });

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
