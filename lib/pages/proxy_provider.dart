import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hex_counter.dart';
import '../models/value_notifier_counter.dart';

class ProxyProviderPage extends StatelessWidget {
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
        body: _CounterResults(),
        floatingActionButton: _FloatingButton(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
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
          Text(hexCounter.valueString),
        ],
      ),
    );
  }
}
