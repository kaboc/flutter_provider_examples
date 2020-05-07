class HexCounter {
  HexCounter();

  int _decimal;

  set newValue(int newValue) => _decimal = newValue;

  String get hex => _decimal.toRadixString(16);
}
