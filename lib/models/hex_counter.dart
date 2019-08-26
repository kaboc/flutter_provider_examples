class HexCounter {
  int _decimal;

  HexCounter();

  set newValue(int newValue) => _decimal = newValue;

  String get valueString => _decimal.toRadixString(16);
}
