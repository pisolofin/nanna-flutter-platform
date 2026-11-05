import '../models/ui-type.model.dart';

import 'platform-ui-type.service.dart';

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
