import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key, required this.providers, required this.foundUsers})
      : super(key: key);

  late List foundUsers;
  late List providers;

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      foundUsers = providers;
    } else {
      print(providers);
      print(enteredKeyword);
      foundUsers = providers
          .where((provider) => provider["name"]
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) => runFilter(value),
        decoration: const InputDecoration(
          labelText: 'Search',
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
