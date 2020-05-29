import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key key, this.selectedIndex: 0, @required this.onChanged})
    : super(key: key);

  final int selectedIndex ;
  final ValueChanged<int> onChanged;

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedIndex = 0;
   
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onChanged(_selectedIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem( icon: Icon( Icons.home), title: Text('Beranda') ),
          //BottomNavigationBarItem( icon: Icon( Icons.shopping_cart), title: Text('Pesanan') ),
          BottomNavigationBarItem( icon: Icon( Icons.account_box), title: Text('Akun') ),
        ], 
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        );
  }
}