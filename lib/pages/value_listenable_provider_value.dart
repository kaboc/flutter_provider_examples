import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/value_notifier_counter.dart';

class VlProviderValuePage extends StatelessWidget {
  const VlProviderValuePage();

  @override
  Widget build(BuildContext context) {
    final counter = VnCounter();

    return ValueListenableProvider<int>.value(
      value: counter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ValueListenableProvider.value()'),
        ),
        body: const _CounterText(),
        floatingActionButton: FloatingActionButton(
          onPressed: counter.increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final number = context.watch<int>();

    return Center(
      child: Text(number.toString()),
    );
  }
}
