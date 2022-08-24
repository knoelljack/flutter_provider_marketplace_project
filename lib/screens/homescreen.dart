import 'package:flutter/material.dart';
import 'package:search_bar/components/bottom_nav.dart';
import 'package:search_bar/components/providers_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon helpIcon = const Icon(Icons.help_center_outlined);

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
      body:
          //INSERT LIST VIEW OF PROFILE CARDS HERE
          ProvidersList(),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
