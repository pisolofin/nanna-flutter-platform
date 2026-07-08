import '../models/ui-type.model.dart';
import '../exceptions/ui-type-already-registered.exception.dart';

/// Holds registered UITypes for each style
final Map<String, dynamic> _registeredUiTypes = {};

/// Registers a specific UI type for a given style.
///
/// [styleId]: The identifier of the style.
/// [uiType]: The UI type to register for the style.
NaUiType naPlatformServiceRegisterUiType({
  required String styleId,
  required dynamic uiType,
}) {
  final String uniqueUITypeKey = '$styleId::${uiType.toString()}';
  // Check unique value
  if (_registeredUiTypes.containsKey(uniqueUITypeKey)) {
    throw NaUiTypeAlreadyRegisteredException('');
  }

  _registeredUiTypes[uniqueUITypeKey] = uiType;
  NaUiType systemUiType = NaUiType(_registeredUiTypes.length + 100);
  return systemUiType;
}
