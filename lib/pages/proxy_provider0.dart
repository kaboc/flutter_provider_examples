import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hex_counter.dart';
import '../models/value_notifier_counter.dart';

class ProxyProvider0Page extends StatelessWidget {
  const ProxyProvider0Page();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VnCounter>(
          create: (_) => VnCounter(),
        ),
        Consumer<VnCounter>(
          builder: (_, vnCounter, child) => ProxyProvider0<HexCounter>(
            create: (_) => HexCounter(),
            update: (_, prev) => prev..newValue = vnCounter.value,
            child: child,
          ),
        ),
      ],
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
    final counter = Provider.of<VnCounter>(context, listen: false);

    return FloatingActionButton(
      onPressed: counter.increment,
      child: const Icon(Icons.add),
    );
  }
}

class _CounterResults extends StatelessWidget {
  const _CounterResults();

  @override
  Widget build(BuildContext context) {
    final decCounter = Provider.of<VnCounter>(context);
    final hexCounter = Provider.of<HexCounter>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Decimal',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(decCounter.value.toString()),
          const SizedBox(height: 32.0),
          const Text(
            'Hexadecimal',
            style: TextStyle(fontSize: 16.0),
          ),
          Text(hexCounter.hex),
        ],
      ),
    );
  }
}
