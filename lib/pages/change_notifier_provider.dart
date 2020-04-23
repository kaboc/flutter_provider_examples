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
    final counter = Provider.of<CnCounter>(context, listen: false);

    return FloatingActionButton(
      onPressed: counter.increment,
      child: const Icon(Icons.add),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CnCounter>(context);

    return Center(
      child: Text(counter.number.toString()),
    );
  }
}
