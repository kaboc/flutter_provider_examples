import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/change_notifier_counter.dart';

class CnProviderPage extends StatelessWidget {
  const CnProviderPage();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CnCounter>(
      create: (_) => CnCounter(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ChangeNotifierProvider()'),
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
      // OK
      // - onPressed: () => context.read<CnCounter>().increment()
      // - onPressed: context.watch<CnCounter>().increment
      // Bad
      // - onPressed: context.read<CnCounter>().increment
      // - onPressed: () => context.watch<CnCounter>().increment()
      onPressed: () => context.read<CnCounter>().increment(),
      child: const Icon(Icons.add),
    );
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
