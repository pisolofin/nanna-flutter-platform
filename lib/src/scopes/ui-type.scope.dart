import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';

/// Injects a list of [NaUiType] into the widget tree to define a fallback chain.
///
/// All `NaWidget` descendants within this scope will attempt to
/// render themselves according to the first supported `uiType` in the list.
///
/// Example usage:
/// ```dart
/// NaUiTypeScope(
///   uiTypes: [NaUiType('macos'), NaUiType.cupertino],
///   child: MyApp(),
/// )
/// ```
class NaUiTypeScope extends InheritedWidget {
  final List<NaUiType> uiTypes;

  const NaUiTypeScope({ super.key, required this.uiTypes, required super.child });

  /// Retrieves the current active list of [NaUiType] from the closest [NaUiTypeScope] ancestor.
  /// If no scope is found, defaults to [[NaUiType.material]].
  static List<NaUiType> of(BuildContext context) {
    final NaUiTypeScope? scope = context
        .dependOnInheritedWidgetOfExactType<NaUiTypeScope>();
    return scope?.uiTypes ?? [NaUiType.material];
  }

  @override
  bool updateShouldNotify(NaUiTypeScope oldWidget) {
    if (uiTypes.length != oldWidget.uiTypes.length) {
      return true;
    }
    for (int index = 0; index < uiTypes.length; index++) {
      if (uiTypes[index] != oldWidget.uiTypes[index]) {
        return true;
      }
    }
    return false;
  }
}
