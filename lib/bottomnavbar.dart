import 'package:flutter/material.dart';
import 'package:smartsecurity/account.dart';
import 'package:smartsecurity/homepage.dart';

class MyBottomNavBar extends StatefulWidget {
  @override
  _MyBottomNavBarState createState() => new _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _bottomNavCurrentIndex = 0;
  final List<Widget> _container = [
    new MyHomePage(),
    new Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _container[_bottomNavCurrentIndex],
        bottomNavigationBar: _buildBottomNavigation()
    );
  }

  Widget _buildBottomNavigation(){
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _bottomNavCurrentIndex = index;
        });
      },
      currentIndex: _bottomNavCurrentIndex,
      items: [
        BottomNavigationBarItem(
          
          icon: new Icon(
            Icons.home,
            color: Colors.grey,
          ),
          title: new Text(
            'Beranda',
          ),
        ),
        
        BottomNavigationBarItem(
          
          icon: new Icon(
            Icons.person,
            color: Colors.grey,
          ),

          title: new Text('Akun'),
        ),
      ],
    );
  }
}