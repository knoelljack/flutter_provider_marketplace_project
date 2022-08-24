import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_bar/models/provider.dart';
import 'dart:convert';

class ProvidersList extends StatefulWidget {
  const ProvidersList({Key? key}) : super(key: key);

  @override
  State<ProvidersList> createState() => _ProvidersListState();
}

class _ProvidersListState extends State<ProvidersList> {
  List<Provider> providersList = [];
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('/data/providers.json');
    final data = await json.decode(response);
    print(response);
    setState(() {
      _items = data['providers'];
    });
    // var jsonData = json.decode(provider_data.data.toString());

    // final List<dynamic> providersFromData =
    //     jsonDecode(provider_data)['providers'] as List;
    // print(providersFromData);

    // providersFromData.map((p) => providersList.add(Provider.fromJson(p)));
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _items.isNotEmpty
        ? Expanded(
            child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Text(_items[index]['id']),
                      title: Text(_items[index]['name']),
                      subtitle: Text(_items[index]['description']),
                    ),
                  );
                }))
        : Container();
  }
}
