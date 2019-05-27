import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/value_notifier_counter.dart';

class VlProviderValuePage extends StatefulWidget {
  @override
  VlProviderValueState createState() => VlProviderValueState();
}

class VlProviderValueState extends State<VlProviderValuePage> {
  final _counter = VnCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueListenableProvider.value()'),
      ),
      body: ValueListenableProvider<int>.value(
        valueListenable: _counter,
        child: CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final number = Provider.of<int>(context);

    return Center(
      child: Text(
        number.toString(),
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
