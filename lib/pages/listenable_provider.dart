import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/value_notifier_counter.dart';

class ListenableProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableProvider<VnCounter>(
      builder: (_) => VnCounter(),
      dispose: (_, counter) => counter.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListenableProvider()'),
        ),
        body: _CounterText(),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Widget _floatingButton() {
    return Consumer<VnCounter>(
      builder: (_, counter, __) {
        return FloatingActionButton(
          onPressed: counter.increment,
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<VnCounter>(context);

    return Center(
      child: Text(
        counter.value.toString(),
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
