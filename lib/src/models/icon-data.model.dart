import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';

/// Holds the platform-specific icon data for a [NaIcon].
class NaIconData {
  /// Internal map storing registered platform icon maps for external platform packages.
  static final Map<NaUiType, Map<NaIconData, IconData>>
      _registeredPlatformMaps = {};

  /// The default icon to use if the current [NaUiType] is not found in [platformIcons].
  /// Usually set to a Material icon.
  final IconData defaultIcon;

  /// A map defining specific [IconData] for various UI types.
  final Map<NaUiType, IconData> platformIcons;

  const NaIconData(this.defaultIcon, {this.platformIcons = const {}});

  /// Registers a custom platform icon map for a given [uiType].
  static void registerPlatformIcons(
    NaUiType uiType,
    Map<NaIconData, IconData> iconMap,
  ) {
    _registeredPlatformMaps[uiType] = iconMap;
  }

  /// Unregisters the platform icon map for a given [uiType].
  static void unregisterPlatformIcons(NaUiType uiType) {
    _registeredPlatformMaps.remove(uiType);
  }

  /// Resolves the icon to use based on the provided [uiType].
  IconData resolve(NaUiType uiType) {
    if (this.platformIcons.containsKey(uiType)) {
      return this.platformIcons[uiType]!;
    }

    final Map<NaIconData, IconData>? externalMap =
        _registeredPlatformMaps[uiType];
    if ((externalMap != null) && externalMap.containsKey(this)) {
      return externalMap[this]!;
    }

    return this.defaultIcon;
  }
}
