import 'package:flutter/material.dart';
import 'screens/homescreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Icon searchIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (searchIcon.icon == Icons.search) {
                    searchIcon = const Icon(Icons.cancel);
                    customSearchBar = const ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for doctor...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    searchIcon = const Icon(Icons.search);
                    customSearchBar = const Text('Search');
                  }
                });
              },
              icon: searchIcon)
        ]);
  }
}
