import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Scaffold;
import 'package:flutter/cupertino.dart' show CupertinoPageScaffold, CupertinoTabScaffold;

import '../models/ui-type.model.dart';

/// Injects a list of [NaUiType] into the widget tree to define a fallback chain.
///
/// All `NaWidget` descendants within this scope will attempt to
/// render themselves according to the first supported `uiType` in the list.
///
/// Example usage:
/// ```dart
/// NaUiTypeScope(
///   uiTypes: const [NaUiType.cupertino, NaUiType.material],
///   child: const MyApp(),
/// )
/// ```
class NaUiTypeScope extends InheritedWidget {
  final List<NaUiType> uiTypes;

  const NaUiTypeScope({ super.key, required this.uiTypes, required super.child });

  /// Retrieves the current active list of [NaUiType] from the closest [NaUiTypeScope] ancestor.
  /// If no scope is found, defaults to [[NaUiType.material]].
  static List<NaUiType> of(BuildContext context) {
    final NaUiTypeScope? scope =
        context.dependOnInheritedWidgetOfExactType<NaUiTypeScope>();
    return scope?.uiTypes ?? [NaUiType.material];
  }

  /// Resolves the active [NaUiType] from the closest [NaUiTypeScope].
  /// Returns the first [NaUiType] in the fallback chain, or [defaultType] if the scope is empty.
  static NaUiType resolveUiType(BuildContext context, {NaUiType defaultType = NaUiType.material}) {
    final List<NaUiType> uiTypes = NaUiTypeScope.of(context);
    if (uiTypes.isNotEmpty) {
      return uiTypes.first;
    }
    return defaultType;
  }

  /// Checks if the current context is hosted inside a Material [Scaffold].
  static bool isMaterial(BuildContext context) {
    return context.findAncestorWidgetOfExactType<Scaffold>() != null;
  }

  /// Checks if the current context is hosted inside a Cupertino scaffold ([CupertinoPageScaffold] or [CupertinoTabScaffold]).
  static bool isCupertino(BuildContext context) {
    return context.findAncestorWidgetOfExactType<CupertinoPageScaffold>() != null
      || context.findAncestorWidgetOfExactType<CupertinoTabScaffold>() != null
    ;
  }

  /// Checks if the current context is hosted inside a scaffold of type [T].
  static bool isScaffold<T extends Widget>(BuildContext context) {
    return context.findAncestorWidgetOfExactType<T>() != null;
  }

  @override
  bool updateShouldNotify(NaUiTypeScope oldWidget) {
    if (this.uiTypes.length != oldWidget.uiTypes.length) {
      return true;
    }
    for (int index = 0; index < this.uiTypes.length; index++) {
      if (this.uiTypes[index] != oldWidget.uiTypes[index]) {
        return true;
      }
    }
    return false;
  }
}
