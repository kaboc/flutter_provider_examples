import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/counter_bloc.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<CounterBloc>(
      builder: (_) => CounterBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider()'),
        ),
        body: _CounterText(),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Widget _floatingButton() {
    return Consumer<CounterBloc>(
      builder: (_, bloc, __) {
        return FloatingActionButton(
          onPressed: bloc.increment,
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CounterBloc>(context);

    return StreamBuilder<String>(
      stream: bloc.value,
      builder: (context, snapshot) {
        return Center(
          child: Text(
            snapshot.data ?? '0',
            style: TextStyle(fontSize: 24.0),
          ),
        );
      },
    );
  }
}
