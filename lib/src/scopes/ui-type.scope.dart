import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';

/// Injects the [NaUiType] into the widget tree.
///
/// All `NaWidget` descendants within this scope will automatically
/// render themselves according to the specified `uiType`.
///
/// Example usage:
/// ```dart
/// NaUiTypeScope(
///   uiType: NaUiType.cupertino,
///   child: MyApp(),
/// )
/// ```
class NaUiTypeScope extends InheritedWidget {
  final NaUiType uiType;

  const NaUiTypeScope({ super.key, required this.uiType, required super.child });

  /// Retrieves the current active [NaUiType] from the closest [NaUiTypeScope] ancestor.
  /// If no scope is found, defaults to [NaUiType.material].
  static NaUiType of(BuildContext context) {
    final NaUiTypeScope? scope = context
        .dependOnInheritedWidgetOfExactType<NaUiTypeScope>();
    return scope?.uiType ?? NaUiType.material;
  }

  @override
  bool updateShouldNotify(NaUiTypeScope oldWidget) {
    return uiType != oldWidget.uiType;
  }
}
