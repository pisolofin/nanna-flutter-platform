import 'package:flutter/widgets.dart';

import 'ui-type.model.dart';

/// Base interface for all widget options.
abstract class NaWidgetOptions {}

/// Type definition for widget options builder.
typedef NaWidgetOptionsBuilder<T extends NaWidgetOptions> =
    T? Function(BuildContext context, NaUiType uiType);
