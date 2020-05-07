import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/counter_bloc.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage();

  @override
  Widget build(BuildContext context) {
    return Provider<CounterBloc>(
      create: (_) => CounterBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Provider()'),
        ),
        body: const _CounterText(),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Widget _floatingButton() {
    // Using Consumer here rather than Selector does not affect the performance
    // badly because CounterBloc is not ChangeNotifier, meaning that changes of
    // values in CounterBloc does not trigger rebuilds.
    return Consumer<CounterBloc>(
      builder: (_, bloc, child) {
        return FloatingActionButton(
          onPressed: bloc.increment,
          child: child,
        );
      },
      child: const Icon(Icons.add),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    // Using context.read<CounterBloc>() inside build() causes an exception.
    // Either of Provider.of(), context.watch() or context.select() has to be
    // used instead.
    final bloc = Provider.of<CounterBloc>(context, listen: false);

    return StreamBuilder<String>(
      stream: bloc.value,
      builder: (_, snapshot) {
        return Center(
          child: Text(snapshot.data ?? '0'),
        );
      },
    );
  }
}
