import 'package:flutter/material.dart';
import 'change_notifier_provider.dart';
import 'change_notifier_provider_value.dart';
import 'dependency_injection.dart';
import 'future_provider.dart';
import 'listenable_provider.dart';
import 'provider.dart';
import 'provider_value.dart';
import 'proxy_provider.dart';
import 'proxy_provider0.dart';
import 'selector.dart';
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
        children: const <Widget>[
          _ListTile(title: 'Provider()', page: ProviderPage()),
          _ListTile(title: 'Provider.value()', page: ProviderValuePage()),
          _ListTile(title: 'StreamProvider()', page: StreamProviderPage()),
          _ListTile(title: 'StreamProvider.value()', page: StreamProviderValuePage()),
          _ListTile(title: 'ChangeNotifierProvider()', page: CnProviderPage()),
          _ListTile(title: 'ChangeNotifierProvider.value()', page: CnProviderValuePage()),
          _ListTile(title: 'ValueListenableProvider()', page: VlProviderPage()),
          _ListTile(title: 'ValueListenableProvider.value()', page: VlProviderValuePage()),
          _ListTile(title: 'ListenableProvider()', page: ListenableProviderPage()),
          _ListTile(title: 'FutureProvider()', page: FutureProviderPage()),
          _ListTile(title: 'ProxyProvider()', page: ProxyProviderPage()),
          _ListTile(title: 'ProxyProvider0()', page: ProxyProvider0Page()),
          _ListTile(title: 'Selector()', page: SelectorPage()),
          _ListTile(title: 'Dependency Injection', page: DependencyInjectionPage()),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({@required this.title, @required this.page});

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => page),
      ),
    );
  }
}

