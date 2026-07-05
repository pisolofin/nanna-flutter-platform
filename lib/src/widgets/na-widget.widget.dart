import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';
import '../services/platform-builder.service.dart';

/// Generic Widget that change its apparence according to the [NaUiType]
abstract class NaWidget extends StatelessWidget {
  /// The UI type to use for this widget. If not provided, the [NaUiTypeScope] will be used.
  final NaUiType? uiType;
  final dynamic options;

  const NaWidget({super.key, this.uiType, this.options});

  /// Renders widget for active UI type
  Widget renderForUIType(BuildContext context, NaUiType uiType);

  @override
  Widget build(BuildContext context) {
    final NaUiType currentUiType = this.uiType ?? NaUiTypeScope.of(context);

    final NaWidgetBuilder? builder = naPlatformServiceGetWidgetBuilder(
      this.runtimeType,
      currentUiType,
    );
    if (builder != null) {
      return builder(context, this);
    }

    return renderForUIType(context, currentUiType);
  }
}
