import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StreamProviderPage extends StatefulWidget {
  @override
  StreamProviderState createState() => StreamProviderState();
}

class StreamProviderState extends State<StreamProviderPage> {
  int _number = 0;

  @override
  Widget build(BuildContext context) {
    final streamController = StreamController<int>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider()'),
      ),
      body: StreamProvider<int>(
        builder: (_) => streamController,
        initialData: 0,
        child: CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => streamController.sink.add(++_number),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
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
