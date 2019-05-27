import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/change_notifier_counter.dart';

class CnProviderValuePage extends StatefulWidget {
  @override
  CnProviderValueState createState() => CnProviderValueState();
}

class CnProviderValueState extends State<CnProviderValuePage> {
  final _counter = CnCounter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifierProvider.value()'),
      ),
      body: ChangeNotifierProvider<CnCounter>.value(
        notifier: _counter,
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
    final counter = Provider.of<CnCounter>(context);

    return Center(
      child: Text(
        counter.number.toString(),
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
