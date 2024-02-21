import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingapp/core.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}): super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Center(child: Text('Wishlist')),
    const Center(child: Text('Wallet')),
    const Center(child: Text('Card')),
  ];

  void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false, // Hide selected tab label
        showUnselectedLabels: false, // Hide unselected tab labels
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bag),
            label: '', // Empty label
          ),
          
        ],
      ),
    );
  }
}

