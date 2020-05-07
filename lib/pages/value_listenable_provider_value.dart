import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/value_notifier_counter.dart';

class VlProviderValuePage extends StatefulWidget {
  const VlProviderValuePage();

  @override
  _VlProviderValueState createState() => _VlProviderValueState();
}

class _VlProviderValueState extends State<VlProviderValuePage> {
  final _counter = VnCounter();

  @override
  Widget build(BuildContext context) {
    return ValueListenableProvider<int>.value(
      value: _counter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ValueListenableProvider.value()'),
        ),
        body: const _CounterText(),
        floatingActionButton: FloatingActionButton(
          onPressed: _counter.increment,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
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
