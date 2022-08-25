import 'package:flutter/material.dart';
import 'package:search_bar/components/bottom_nav.dart';
import 'package:search_bar/components/providers_list.dart';
import 'package:search_bar/components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //STATIC VARIABLES
  Icon helpIcon = const Icon(Icons.help_center_outlined);

  //STATEFUL VARIABLES
  List providers = [];
  List foundUsers = [];

  @override
  void initState() {
    foundUsers = providers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: helpIcon,
          )
        ],
        title: const Text('Provider MarketPlace'),
      ),
      body: //INSERT SEARCH BAR AND LISTS HERE
          Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(providers: providers, foundUsers: foundUsers),
          ProvidersList(providers: providers, foundUsers: foundUsers),
        ],
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
