import 'package:flutter/material.dart';

class VnCounter extends ValueNotifier<int> {
  VnCounter() : super(0);

  void increment() => value++;
}
