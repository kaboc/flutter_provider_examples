import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// This page may be removed if AnimatedProvider is introduced and
/// it can achieve the same behaviour with a simpler code.
class ListenableProviderPage extends StatefulWidget {
  @override
  _ListenableProviderState createState() => _ListenableProviderState();
}

class _ListenableProviderState extends State<ListenableProviderPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListenableProvider()'),
      ),
      body: ListenableProvider<AnimationController>(
        create: (_) => AnimationController(
          duration: const Duration(seconds: 10),
          vsync: this,
        )..repeat(),
        dispose: (_, controller) => controller.dispose(),
        child: Center(
          child: Spinner(),
        ),
      ),
    );
  }
}

class Spinner extends StatelessWidget {
  final _child = Container(width: 200.0, height: 200.0, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnimationController>(context);

    return Transform.rotate(
      angle: controller.value * 2.0 * math.pi,
      child: _child,
    );
  }
}
