import 'package:flutter/widgets.dart';

import '../models/ui-type.model.dart';

/// Holds the platform-specific icon data for a [NaIcon].
class NaIconData {
  /// The default icon to use if the current [NaUiType] is not found in [platformIcons].
  /// Usually set to a Material icon.
  final IconData defaultIcon;

  /// A map defining specific [IconData] for various UI types.
  final Map<NaUiType, IconData> platformIcons;

  const NaIconData(this.defaultIcon, {this.platformIcons = const {}});

  /// Resolves the icon to use based on the provided [uiType].
  IconData resolve(NaUiType uiType) {
    return platformIcons[uiType] ?? defaultIcon;
  }
}
