import 'package:flutter/material.dart';
import 'package:search_bar/data/providers.json' as provider_data;
import 'package:search_bar/models/provider.dart';
import 'dart:convert';

class ProvidersList extends StatefulWidget {
  const ProvidersList({Key? key}) : super(key: key);

  @override
  State<ProvidersList> createState() => _ProvidersListState();
}

class _ProvidersListState extends State<ProvidersList> {
  getJsonData() {
    var providers_from_data = jsonDecode(provider_data)['providers'] as List;
    List<Provider> providerObjs = providers_from_data.map((pfd) => {
      Provider.fromJson(pfd)).toList();
    })
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 72.0),
            title: Text('Sample List Tile'),
            subtitle: Text('Sample description goes here'),
            trailing: Icon(Icons.calendar_month_outlined),
            isThreeLine: true,
          ),
        )
      ],
    );
  }
}
