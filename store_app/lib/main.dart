import 'package:flutter/material.dart';
import 'package:store_app/Cart.dart';
import 'package:store_app/ProductWidget.dart';

import 'UserDetail.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductWidget(),
    Cart(),
    UserDetailPage(), // เพิ่มหน้า "userDetail" ที่ตำแหน่งที่ 3
  ];

  static get optionStyle => null;

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UserDetailPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> appBarTitles = ['สินค้า', 'ตระกร้าสินค้า', 'บัญชีของฉัน'];

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[_selectedIndex]),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_rounded),
            label: 'สินค้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel_sharp),
            label: 'ตระกร้าสินค้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_circle_rounded),
            label: 'บัญชีของฉัน',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
