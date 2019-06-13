import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/change_notifier_counter.dart';

class CnProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CnCounter>(
      builder: (_) => CnCounter(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ChangeNotifierProvider()'),
        ),
        body: _CounterText(),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Widget _floatingButton() {
    return Consumer<CnCounter>(
      builder: (_, counter, __) {
        return FloatingActionButton(
          onPressed: counter.increment,
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CnCounter>(context);

    return Center(
      child: Text(
        counter.number.toString(),
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
