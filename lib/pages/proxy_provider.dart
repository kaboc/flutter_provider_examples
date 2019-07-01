import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/hex_notifier_counter.dart';
import '../models/value_notifier_counter.dart';

class ProxyProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<VnCounter>(
          builder: (_) => VnCounter(),
          dispose: (_, decCounter) => decCounter.dispose(),
        ),
        ListenableProxyProvider<VnCounter, HexCounter>(
          initialBuilder: (_) => HexCounter(),
          builder: (_, decCounter, prevHexCounter) {
            return prevHexCounter..setValue(decCounter.value);
          },
          dispose: (_, hexCounter) => hexCounter.dispose(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ProxyProvider()'),
        ),
        body: _CounterResults(),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Widget _floatingButton() {
    return Consumer<VnCounter>(
      builder: (_, counter, __) {
        return FloatingActionButton(
          onPressed: counter.increment,
          child: const Icon(Icons.add),
        );
      },
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
          const Text('Decimal'),
          Text(
            decCounter.value.toString(),
            style: TextStyle(fontSize: 24.0),
          ),
          const SizedBox(height: 32.0),
          const Text('Hexadecimal'),
          Text(
            hexCounter.value.toString(),
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
