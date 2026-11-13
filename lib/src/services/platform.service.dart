import 'package:flutter/foundation.dart';

import '../models/ui-type.model.dart';

import 'platform-ui-type.service.dart';

/// Returns the default [NaUiType] for the current platform:
/// [NaUiType.cupertino] on Apple platforms (iOS/macOS), otherwise [NaUiType.material].
NaUiType naPlatformServiceGetDefaultUiType() {
  if ((defaultTargetPlatform == TargetPlatform.iOS) ||
      (defaultTargetPlatform == TargetPlatform.macOS)) {
    return NaUiType.cupertino;
  }

  return NaUiType.material;
}

/// Initializes the platform service.
void naPlatformServiceInit() {
  // Register known types
  for (NaUiType knowUiType in NaUiType.values) {
    try {
      naPlatformServiceRegisterUiType(styleId: 'builtin', uiType: knowUiType);
    }catch (_) {
      // Ignored if already registered
    }
  }
}
