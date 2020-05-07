import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hex_counter.dart';
import '../models/value_notifier_counter.dart';

class ProxyProviderPage extends StatelessWidget {
  const ProxyProviderPage();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VnCounter>(
          create: (_) => VnCounter(),
        ),
        ProxyProvider<VnCounter, HexCounter>(
          create: (_) => HexCounter(),
          update: (_, decCounter, prevHexCounter) =>
              prevHexCounter..newValue = decCounter.value,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ProxyProvider()'),
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
