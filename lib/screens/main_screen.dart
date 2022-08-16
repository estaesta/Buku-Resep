import 'package:flutter/material.dart';

import 'favorite_page.dart';
import 'home_page.dart';
import 'search_page.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _autofocus = false;

  callback(int index, [bool autofocus = false]) {
    setState(() {
      _selectedIndex = index;
      _autofocus = autofocus;
    });
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      HomePage(
        callbackFunction: callback,
        controller: _controller,
      ),
      SearchPage(
        controller: _controller,
        autofocus: _autofocus,
      ),
      const FavoritePage(),
    ];
    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            _autofocus = false;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
