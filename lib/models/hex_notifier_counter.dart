import 'package:flutter/material.dart';

class HexCounter extends ValueNotifier<String> {
  HexCounter() : super('0');

  void setValue(int decimal) {
    value = decimal.toRadixString(16);
  }
}
