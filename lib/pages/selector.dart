import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/change_notifier_counter.dart';

class SelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CnCounter>(
      create: (_) => CnCounter(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Selector()'),
        ),
        body: _CounterText(),
        floatingActionButton: _FloatingButton(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CnCounter>(context);

    return FloatingActionButton(
      onPressed: counter.increment,
      child: const Icon(Icons.add),
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<CnCounter>(
            builder: (_, counter, __) => Text(counter.number.toString()),
          ),
          const SizedBox(height: 32.0),
          const Text(
            'Only even',
            style: TextStyle(fontSize: 16.0),
          ),
          Selector<CnCounter, int>(
            selector: (_, counter) => counter.number,
            shouldRebuild: (_, next) => next % 2 == 0,
            builder: (_, number, __) => Text(number.toString()),
          ),
        ],
      ),
    );
  }
}
