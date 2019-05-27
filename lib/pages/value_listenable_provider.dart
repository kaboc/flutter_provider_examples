import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/value_notifier_counter.dart';

class VlProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = VnCounter();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableProvider()'),
      ),
      body: ValueListenableProvider<int>(
        builder: (_) => counter,
        child: CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
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
