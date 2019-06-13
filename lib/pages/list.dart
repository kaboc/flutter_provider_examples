import 'package:flutter/material.dart';
import 'change_notifier_provider.dart';
import 'change_notifier_provider_value.dart';
import 'provider.dart';
import 'provider_value.dart';
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
        ],
      ),
    );
  }

  Widget _listTile(BuildContext context, String title, Widget pageWidget) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pageWidget),
      ),
    );
  }
}
