import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/ui-type.model.dart';
import '../scopes/ui-type.scope.dart';

/// A utility class for generating platform-adaptive page routes.
class NaPageRoute {
  /// Creates the appropriate native [PageRoute] based on the current [NaUiType].
  ///
  /// This requires the [BuildContext] to resolve the current UI type from the [NaUiTypeScope].
  static PageRoute<T> create<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    String? title,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    bool allowSnapshotting = true,
  }) {
    final List<NaUiType> uiTypes = NaUiTypeScope.of(context);

    // Find the first matching natively supported route
    for (final NaUiType type in uiTypes) {
      if (type == NaUiType.cupertino) {
        return CupertinoPageRoute<T>(
          builder: builder,
          title: title,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        );
      }
      if (type == NaUiType.material) {
        return MaterialPageRoute<T>(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
          allowSnapshotting: allowSnapshotting,
        );
      }
    }

    // Ultimate fallback
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
    );
  }
}
