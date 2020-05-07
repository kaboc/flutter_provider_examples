import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/change_notifier_counter.dart';

class CnProviderValuePage extends StatefulWidget {
  const CnProviderValuePage();

  @override
  _CnProviderValueState createState() => _CnProviderValueState();
}

class _CnProviderValueState extends State<CnProviderValuePage> {
  final _counter = CnCounter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CnCounter>.value(
      value: _counter,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ChangeNotifierProvider.value()'),
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
    final number = context.select((CnCounter counter) => counter.number);

    return Center(
      child: Text(number.toString()),
    );
  }
}
