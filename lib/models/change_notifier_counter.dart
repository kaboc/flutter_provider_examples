import 'package:flutter/foundation.dart';

class CnCounter with ChangeNotifier {
  int _number = 0;
  int get number => _number;

  void increment() {
    _number++;
    notifyListeners();
  }
}
