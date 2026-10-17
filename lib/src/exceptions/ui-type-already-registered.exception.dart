import 'package:nanna/nanna.dart';

/// Exception thrown when attempting to register a [NaUiType] that is already registered.
class NaUiTypeAlreadyRegisteredException extends NaException {
  /// Creates a [NaUiTypeAlreadyRegisteredException] with an optional error [message].
  NaUiTypeAlreadyRegisteredException([
    super.message = 'AlreadyRegisteredException',
  ]);
}
