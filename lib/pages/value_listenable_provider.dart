import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/value_notifier_counter.dart';

class VlProviderPage extends StatelessWidget {
  const VlProviderPage();

  @override
  Widget build(BuildContext context) {
    final counter = VnCounter();

    return ValueListenableProvider<int>(
      create: (_) => counter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ValueListenableProvider()'),
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
    final number = Provider.of<int>(context);

    return Center(
      child: Text(number.toString()),
    );
  }
}
