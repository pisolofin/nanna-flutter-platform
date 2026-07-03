import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';

/// Generic Widget that change its apparence according to the [NaUiType]
abstract class NaPlatformWidget extends StatelessWidget {
  /// The UI type to use for this widget. If not provided, the [NaUiTypeScope] will be used.
  final NaUiType? uiType;
  final dynamic options;

  const NaPlatformWidget({super.key, this.uiType, this.options});

  /// Renders widget for active UI type
  Widget renderForUIType(NaUiType uiType);

  @override
  Widget build(BuildContext context) {
    final NaUiType currentUiType = this.uiType ?? NaUiTypeScope.of(context);
    return renderForUIType(currentUiType);
  }
}
