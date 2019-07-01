import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dependency_injection_counter.dart';

class DependencyInjectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterContainer>(
      builder: (_) {
        return CounterContainer()..newCounter = DecCounter();
      },
      child: Consumer<CounterContainer>(
        builder: (_, container, __) {
          return ChangeNotifierProvider<CounterInterface>.value(
            value: container.counter,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Dependency Injection'),
                actions: <Widget>[_switch()],
              ),
              body: _CounterText(),
              floatingActionButton: _floatingButton(),
            ),
          );
        },
      ),
    );
  }

  Widget _floatingButton() {
    return Consumer<CounterInterface>(
      builder: (_, counter, __) {
        return FloatingActionButton(
          onPressed: counter.increment,
          child: const Icon(Icons.add),
          backgroundColor:
              counter.runtimeType == DecCounter ? Colors.blue : Colors.green,
        );
      },
    );
  }

  Widget _switch() {
    return Consumer2<CounterContainer, CounterInterface>(
      builder: (_, container, counter, __) {
        return Switch(
          value: counter.runtimeType == BinCounter,
          onChanged: (value) {
            container.newCounter = value ? BinCounter() : DecCounter();
            container.counter.setNumber(counter.number);
          },
          activeColor: Colors.white,
        );
      },
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterInterface>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(counter.runtimeType.toString()),
          Text(
            counter.numberString,
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
