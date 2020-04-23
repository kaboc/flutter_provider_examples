import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderValuePage extends StatefulWidget {
  const StreamProviderValuePage();

  @override
  _StreamProviderValueState createState() => _StreamProviderValueState();
}

class _StreamProviderValueState extends State<StreamProviderValuePage> {
  final _streamController = StreamController<int>();
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider.value()'),
      ),
      body: StreamProvider<int>.value(
        value: _streamController.stream,
        initialData: 0,
        child: const _CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _streamController.sink.add(++_number),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final number = Provider.of<int>(context);

    return Center(
      child: Text(number.toString()),
    );
  }
}
