import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FutureProviderPage extends StatelessWidget {
  const FutureProviderPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider()'),
      ),
      body: FutureProvider<String>(
        create: (_) => Future.delayed(
          const Duration(seconds: 3),
          () => '3 seconds elapsed.',
        ),
        initialData: 'Wait for 3 seconds...',
        child: const _FutureText(),
      ),
    );
  }
}

class _FutureText extends StatelessWidget {
  const _FutureText();

  @override
  Widget build(BuildContext context) {
    final description = Provider.of<String>(context);

    return Center(
      child: Text(
        description,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
