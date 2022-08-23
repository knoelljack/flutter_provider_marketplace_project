import 'package:flutter/material.dart';

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
      body: ListView(),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.grey,
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Messages',
            backgroundColor: Colors.grey),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Messages',
            backgroundColor: Colors.grey),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp),
            label: 'Messages',
            backgroundColor: Colors.grey),
      ]),
    );
  }
}
