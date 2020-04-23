import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenableProviderPage extends StatefulWidget {
  const ListenableProviderPage();

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
        child: const Center(
          child: _Spinner(),
        ),
      ),
    );
  }
}

class _Spinner extends StatelessWidget {
  const _Spinner();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AnimationController>(context);

    return Transform.rotate(
      angle: controller.value * 2.0 * math.pi,
      child: const SizedBox(
        width: 200.0,
        height: 200.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
        ),
      ),
    );
  }
}
