import 'package:flutter/material.dart';
import 'package:heavy_metals/constant.dart';
import 'package:heavy_metals/presentation/screens/demography/demography.dart';
import 'package:heavy_metals/presentation/screens/home.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key, this.index = 0}) : super(key: key);

  final int index;

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const DemographyScreen(),
    const Text('Profile Page',
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
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_chart_rounded,
                size: 25,
              ),
              label: 'Demography',
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
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
