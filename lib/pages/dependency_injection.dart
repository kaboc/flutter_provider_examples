import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dependency_injection_counter.dart';

class DependencyInjectionPage extends StatelessWidget {
  const DependencyInjectionPage();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterContainer>(
      create: (_) => CounterContainer()..newCounter = DecCounter(),
      builder: (context, child) {
        return ChangeNotifierProvider<CounterInterface>.value(
          value: context.watch<CounterContainer>().counter,
          child: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dependency Injection'),
          actions: const <Widget>[_Switch()],
        ),
        body: const _CounterText(),
        floatingActionButton: const _FloatingButton(),
      ),
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch();

  @override
  Widget build(BuildContext context) {
    final container = context.watch<CounterContainer>();
    final counter = container.counter;

    return Switch(
      value: counter.runtimeType == BinCounter,
      onChanged: (value) {
        container.newCounter = value ? BinCounter() : DecCounter();
        container.counter.setNumber(counter.number);
      },
      activeColor: Colors.white,
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    final type =
        context.select((CounterInterface counter) => counter.runtimeType);

    return FloatingActionButton(
      onPressed: () => context.read<CounterInterface>().increment(),
      child: const Icon(Icons.add),
      backgroundColor: type == DecCounter ? Colors.blue : Colors.green,
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterInterface>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            counter.runtimeType.toString(),
            style: const TextStyle(fontSize: 16.0),
          ),
          Text(counter.numberString),
        ],
      ),
    );
  }
}
