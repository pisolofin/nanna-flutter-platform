/// Identifies a UI design system or platform appearance (e.g., Material, Cupertino).
class NaUiType {
  /// The integer value representing this UI type.
  final int value;

  /// Creates a new [NaUiType] with the given [value].
  const NaUiType(this.value);

  /// No specific UI type fallback.
  static const NaUiType none = NaUiType(0);

  /// Material Design UI type.
  static const NaUiType material = NaUiType(1);

  /// Cupertino (iOS/macOS) UI type.
  static const NaUiType cupertino = NaUiType(2);

  /// All default [NaUiType] values.
  static const List<NaUiType> values = [none, material, cupertino];
}
