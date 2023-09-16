import 'package:flutter/material.dart';
import 'package:heavy_metals/constant.dart';
import 'package:heavy_metals/presentation/screens/home.dart';
import 'package:heavy_metals/presentation/screens/search/search.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key, this.index = 0}) : super(key: key);

  final int index;

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
                // color: kPrimaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                // color: kPrimaryColor,
                size: 25,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info_outline,
                // color: kPrimaryColor,
                size: 25,
              ),
              label: 'About',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kGrey,
          showUnselectedLabels: true,
          // unselectedLabelStyle: const TextStyle(color: kGrey),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
