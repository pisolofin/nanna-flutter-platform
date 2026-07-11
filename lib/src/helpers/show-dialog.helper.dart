import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';

/// Displays a cross-platform dialog according to the current [NaUiType].
/// 
/// Uses [showDialog] on Material and [showCupertinoDialog] on Cupertino.
Future<T?> naShowDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color? barrierColor,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
}) {
  final List<NaUiType> uiTypes = NaUiTypeScope.of(context);

  for (final NaUiType type in uiTypes) {
    if (type == NaUiType.cupertino) {
      return showCupertinoDialog<T>(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
        barrierLabel: barrierLabel,
        useRootNavigator: useRootNavigator,
        routeSettings: routeSettings,
        anchorPoint: anchorPoint,
      );
    }
    if (type == NaUiType.material) {
      // Use default dialog and don't check other types
      break;
    }
  }

  // Fallback
  return showDialog<T>(
    context: context,
    builder: builder,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    anchorPoint: anchorPoint,
  );
}