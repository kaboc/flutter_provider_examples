import 'package:flutter/foundation.dart';

class VnCounter extends ValueNotifier<int> {
  VnCounter() : super(0);

  void increment() => value++;
}
