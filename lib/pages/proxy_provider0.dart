import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hex_counter.dart';
import '../models/value_notifier_counter.dart';

class ProxyProvider0Page extends StatelessWidget {
  const ProxyProvider0Page();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VnCounter>(
      create: (_) => VnCounter(),
      builder: (context, child) => ProxyProvider0<HexCounter>(
        create: (_) => HexCounter(),
        update: (context, prev) => prev
          ..newValue = context.select((VnCounter vnCounter) => vnCounter.value),
        child: child,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ProxyProvider0()'),
        ),
        body: const _CounterResults(),
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
      onPressed: () => context.read<VnCounter>().increment(),
      child: const Icon(Icons.add),
    );
  }
}

class _CounterResults extends StatelessWidget {
  const _CounterResults();

  @override
  Widget build(BuildContext context) {
    final dec = context.select((VnCounter counter) => counter.value);
    final hex = context.select((HexCounter counter) => counter.hex);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Decimal',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(dec.toString()),
          const SizedBox(height: 32.0),
          const Text(
            'Hexadecimal',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(hex),
        ],
      ),
    );
  }
}
