import 'package:flutter/foundation.dart';

abstract class CounterInterface with ChangeNotifier {
  int _number = 0;

  int get number => _number;
  String get numberString;

  void setNumber(int number) => _number = number;

  void increment() {
    _number++;
    notifyListeners();
  }
}

class DecCounter extends CounterInterface {
  @override
  String get numberString => _number.toString();
}

class BinCounter extends CounterInterface {
  @override
  String get numberString => _number.toRadixString(2);
}

class CounterContainer with ChangeNotifier {
  CounterInterface _counter;

  CounterInterface get counter => _counter;

  set newCounter(CounterInterface counter) {
    _counter = counter;
    notifyListeners();
  }
}
