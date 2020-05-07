import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dependency_injection_counter.dart';

class DependencyInjectionPage extends StatelessWidget {
  const DependencyInjectionPage();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterContainer>(
          create: (_) => CounterContainer()..newCounter = DecCounter(),
        ),
        Consumer<CounterContainer>(
          builder: (_, container, child) {
            return ChangeNotifierProvider<CounterInterface>.value(
              value: container.counter,
              child: child,
            );
          },
        ),
      ],
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
    final container = Provider.of<CounterContainer>(context);
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
    final counter = Provider.of<CounterInterface>(context);

    return FloatingActionButton(
      onPressed: counter.increment,
      child: const Icon(Icons.add),
      backgroundColor:
          counter.runtimeType == DecCounter ? Colors.blue : Colors.green,
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterInterface>(context);

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
