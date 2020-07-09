import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/reassembling_counter.dart';

class ReassembleHandlerPage extends StatelessWidget {
  const ReassembleHandlerPage();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<GlobalKey<ScaffoldState>>(
          create: (_) => GlobalKey<ScaffoldState>(),
        ),
        ChangeNotifierProvider<ReassemblingCounterNotifier>(
          create: (context) => ReassemblingCounterNotifier(context.read),
        ),
      ],
      builder: (context, child) => Scaffold(
        key: context.watch<GlobalKey<ScaffoldState>>(),
        appBar: AppBar(
          title: const Text('ReassembleHandler'),
        ),
        body: child,
        floatingActionButton: const _FloatingButton(),
      ),
      child: const Padding(
        padding: EdgeInsets.all(32.0),
        child: _CounterText(),
      ),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => context.read<ReassemblingCounterNotifier>().increment(),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final value = context.watch<ReassemblingCounterNotifier>().value;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Not only tapping on the FAB but also hot reloading '
            'increments the counter value.\n\n'
            'To see it happen, hot reload the app, or press the "Redraw" '
            'button to simulate the redraw that occurs after a hot reload.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0),
          ),
          const SizedBox(height: 16.0),
          Text(value.toString()),
          const SizedBox(height: 16.0),
          RaisedButton(
            child: const Text('Redraw'),
            onPressed: () {
              WidgetsBinding.instance.reassembleApplication();
            },
          ),
        ],
      ),
    );
  }
}
