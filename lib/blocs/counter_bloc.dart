import 'dart:async';

class CounterBloc {
  final _valueController = StreamController<int>();
  Stream<int> get value => _valueController.stream;

  int _number = 0;

  void increment() {
    _number++;
    _valueController.sink.add(_number);
  }

  void dispose() {
    _valueController.close();
  }
}
