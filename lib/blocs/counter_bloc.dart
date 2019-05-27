import 'dart:async';

class CounterBloc {
  final _valueController = StreamController<String>();
  Stream<String> get value => _valueController.stream;

  int _number = 0;

  void increment() {
    _number++;
    _valueController.sink.add(_number.toString());
  }

  void dispose() {
    _valueController.close();
  }
}
