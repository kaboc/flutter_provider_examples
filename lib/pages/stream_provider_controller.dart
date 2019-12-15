import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderCtrlPage extends StatefulWidget {
  @override
  _StreamProviderCtrlState createState() => _StreamProviderCtrlState();
}

class _StreamProviderCtrlState extends State<StreamProviderCtrlPage> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    final streamController = StreamController<int>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider.controller()'),
      ),
      body: StreamProvider<int>.controller(
        create: (_) => streamController,
        initialData: 0,
        child: _CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => streamController.sink.add(++_number),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<int>(context);

    return Center(
      child: Text(number.toString()),
    );
  }
}
