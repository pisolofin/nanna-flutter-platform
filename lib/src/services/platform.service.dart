import '../models/ui-type.model.dart';
import 'platform-ui-type.service.dart';

/// Initializes the platform service.
void naPlatformServiceInit() {
  // Register known types
  for (NaUiType knowUiType in NaUiType.values) {
    naPlatformServiceRegisterUiType(styleId: '', uiType: knowUiType);
  }
}
