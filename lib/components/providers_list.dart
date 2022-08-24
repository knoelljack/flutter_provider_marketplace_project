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
  List _providers = [];

  //FETCH JSON FILE
  Future<void> readJsonFile() async {
    final String res =
        await rootBundle.loadString('assets/data/providers.json');
    final data = await json.decode(res);

    setState(() {
      _providers = data['providers'];
    });
  }

  // List<Provider> providersList = [];
  // List _items = [];
  // bool isLoaded = false;

  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('/data/providers.json');
  //   final data = await json.decode(response);

  //   setState(() {
  //     _items = data['providers'];
  //     isLoaded = true;
  //   });
  //   // var jsonData = json.decode(provider_data.data.toString());

  //   // final List<dynamic> providersFromData =
  //   //     jsonDecode(provider_data)['providers'] as List;
  //   // print(providersFromData);

  //   // providersFromData.map((p) => providersList.add(Provider.fromJson(p)));
  //   // setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: readJsonFile, child: const Text('Load Providers')),
        ),
        _providers.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: _providers.length,
                    itemBuilder: (BuildContext context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  flex: 1,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/default_profile_pic.png'),
                                    height: 60,
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title:
                                              Text(_providers[index]['name']),
                                          subtitle: Text(
                                              _providers[index]['description']),
                                        ),
                                        Row(children: const [
                                          Icon(Icons.phone_enabled),
                                          Icon(Icons.calendar_month_outlined),
                                          Icon(Icons.email_outlined)
                                        ]),
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                    }))
            : const Text('Click to load providers')
      ]),
    );
  }
}
