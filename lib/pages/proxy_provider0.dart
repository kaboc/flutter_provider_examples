import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/value_notifier_counter.dart';

class ProxyProvider0Page extends StatefulWidget {
  const ProxyProvider0Page();

  @override
  _ProxyProvider0PageState createState() => _ProxyProvider0PageState();
}

class _ProxyProvider0PageState extends State<ProxyProvider0Page> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProxyProvider0()'),
      ),
      body: ChangeNotifierProxyProvider0<VnCounter>(
        create: (_) => VnCounter(),
        update: (_, counter) => counter..value = _value,
        child: const _CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() => _value++),
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<VnCounter>(context);

    return Center(
      child: Text(counter.value.toString()),
    );
  }
}
