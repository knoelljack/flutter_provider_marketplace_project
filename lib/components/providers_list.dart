import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_bar/models/provider.dart';
import 'dart:convert';

class ProvidersList extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ProvidersList({Key? key, required this.providers}) : super(key: key);

  List providers;

  @override
  State<ProvidersList> createState() => _ProvidersListState();
}

class _ProvidersListState extends State<ProvidersList> {
  //FETCH JSON FILE
  Future<void> readJsonFile() async {
    final String res =
        await rootBundle.loadString('assets/data/providers.json');
    final data = await json.decode(res);

    setState(() {
      widget.providers = data['providers'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: readJsonFile, child: const Text('Load Providers')),
        ),
        widget.providers.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: widget.providers.length,
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
                                          title: Text(
                                              widget.providers[index]['name']),
                                          subtitle: Text(widget.providers[index]
                                              ['description']),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: const [
                                                Icon(Icons.phone_enabled),
                                                Icon(Icons
                                                    .calendar_month_outlined),
                                                Icon(Icons.email_outlined)
                                              ]),
                                        ),
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                    }))
            : const Center(child: Text('Click to load providers'))
      ]),
    );
  }
}
