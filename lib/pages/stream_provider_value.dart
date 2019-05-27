import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderValuePage extends StatefulWidget {
  @override
  StreamProviderValueState createState() => StreamProviderValueState();
}

class StreamProviderValueState extends State<StreamProviderValuePage> {
  final _streamController = StreamController<int>();
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider.value()'),
      ),
      body: StreamProvider<int>.value(
        stream: _streamController.stream,
        initialData: 0,
        child: CounterText(),
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

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<int>(context);

    return Center(
      child: Text(
        count.toString(),
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
