import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/counter_bloc.dart';

class ProviderValuePage extends StatefulWidget {
  @override
  ProviderValueState createState() => ProviderValueState();
}

class ProviderValueState extends State<ProviderValuePage> {
  final _bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider.value()'),
      ),
      body: Provider<CounterBloc>.value(
        value: _bloc,
        child: CounterText(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bloc.increment,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CounterBloc>(context);

    return StreamBuilder<String>(
      stream: bloc.value,
      builder: (context, snapshot) {
        return Center(
          child: Text(
            snapshot?.data ?? '0',
            style: TextStyle(fontSize: 24.0),
          ),
        );
      },
    );
  }
}
