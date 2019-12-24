import 'package:flutter/material.dart';
import 'change_notifier_provider.dart';
import 'change_notifier_provider_value.dart';
import 'dependency_injection.dart';
import 'future_provider.dart';
import 'listenable_provider.dart';
import 'provider.dart';
import 'provider_value.dart';
import 'proxy_provider.dart';
import 'stream_provider.dart';
import 'stream_provider_value.dart';
import 'value_listenable_provider.dart';
import 'value_listenable_provider_value.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('provider examples')),
      body: ListView(
        children: <Widget>[
          _listTile(context, 'Provider()', ProviderPage()),
          _listTile(context, 'Provider.value()', ProviderValuePage()),
          _listTile(context, 'StreamProvider()', StreamProviderPage()),
          _listTile(context, 'StreamProvider.value()', StreamProviderValuePage()),
          _listTile(context, 'ChangeNotifierProvider()', CnProviderPage()),
          _listTile(context, 'ChangeNotifierProvider.value()', CnProviderValuePage()),
          _listTile(context, 'ValueListenableProvider()', VlProviderPage()),
          _listTile(context, 'ValueListenableProvider.value()', VlProviderValuePage()),
          _listTile(context, 'ListenableProvider()', ListenableProviderPage()),
          _listTile(context, 'FutureProvider()', FutureProviderPage()),
          _listTile(context, 'ProxyProvider()', ProxyProviderPage()),
          _listTile(context, 'Dependency Injection', DependencyInjectionPage()),
        ],
      ),
    );
  }

  Widget _listTile(BuildContext context, String title, Widget pageWidget) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => pageWidget),
      ),
    );
  }
}
