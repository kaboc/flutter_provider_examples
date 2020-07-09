import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ReassemblingCounterNotifier extends ValueNotifier<int> with ReassembleHandler {
  ReassemblingCounterNotifier(this.locator) : super(0);

  Locator locator;

  @override
  void reassemble() {
    increment();
    _showRebuild();
  }

  void increment() {
    value++;
  }

  void _showRebuild() {
    locator<GlobalKey<ScaffoldState>>().currentState.showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 600),
        behavior: SnackBarBehavior.floating,
        content: Text('Rebuilt.'),
      ),
    );
  }
}
