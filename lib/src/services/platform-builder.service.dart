import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';
import '../widgets/na-widget.widget.dart';

/// Typdef for a generic platform widget builder
typedef NaWidgetBuilder =
    Widget Function(BuildContext context, dynamic widget);

final Map<Type, Map<NaUiType, NaWidgetBuilder>> _widgetBuilders = {};

/// Registers a specific widget builder for a UI type.
void naPlatformServiceRegisterWidgetBuilder<T extends NaWidget>(
  NaUiType uiType,
  Widget Function(BuildContext context, T widget) builder,
) {
  if (!_widgetBuilders.containsKey(T)) {
    _widgetBuilders[T] = {};
  }
  _widgetBuilders[T]![uiType] = (BuildContext context, dynamic widget) {
    return builder(context, widget as T);
  };
}

/// Gets a registered widget builder for a widget type and UI type.
NaWidgetBuilder? naPlatformServiceGetWidgetBuilder(
  Type widgetType,
  NaUiType uiType,
) {
  if (_widgetBuilders.containsKey(widgetType) &&
      _widgetBuilders[widgetType]!.containsKey(uiType)) {
    return _widgetBuilders[widgetType]![uiType];
  }
  return null;
}
