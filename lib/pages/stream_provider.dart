import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderPage extends StatefulWidget {
  @override
  _StreamProviderState createState() => _StreamProviderState();
}

class _StreamProviderState extends State<StreamProviderPage> {
  final _streamController = StreamController<int>();
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider()'),
      ),
      body: StreamProvider<int>(
        create: (_) => _streamController.stream,
        initialData: 0,
        child: _CounterText(),
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
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<int>(context);

    return Center(
      child: Text(
        number.toString(),
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
