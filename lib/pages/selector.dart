import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/change_notifier_counter.dart';

class SelectorPage extends StatelessWidget {
  const SelectorPage();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CnCounter>(
      create: (_) => CnCounter(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Selector()'),
        ),
        body: const _CounterText(),
        floatingActionButton: const _FloatingButton(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<CnCounter>().increment(),
      child: const Icon(Icons.add),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Selector<CnCounter, int>(
            selector: (_, counter) => counter.number,
            builder: (_, number, __) => Text(number.toString()),
          ),
          const SizedBox(height: 32.0),
          const Text(
            'Only even',
            style: TextStyle(fontSize: 16.0),
          ),
          Selector<CnCounter, int>(
            selector: (_, counter) => counter.number,
            shouldRebuild: (_, next) => next.isEven,
            builder: (_, number, __) => Text(number.toString()),
          ),
        ],
      ),
    );
  }
}
