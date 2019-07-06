class HexCounter {
  final int _decimal;

  HexCounter(this._decimal);

  String get valueString => _decimal.toRadixString(16);
}
