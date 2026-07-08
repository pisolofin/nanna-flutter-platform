class NaUiType {
  final int value;

  const NaUiType(this.value);

  static const NaUiType none = NaUiType(0);
  static const NaUiType material = NaUiType(1);
  static const NaUiType cupertino = NaUiType(2);

  static const List<NaUiType> values = [none, material, cupertino];
}
