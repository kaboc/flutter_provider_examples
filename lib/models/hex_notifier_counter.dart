import 'package:flutter/material.dart';

class HexCounter extends ValueNotifier<String> {
  @override
  String value;

  HexCounter(int decimal)
      : value = decimal.toRadixString(16),
        super(decimal.toString());
}
