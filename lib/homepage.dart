import 'package:flutter/material.dart';
import 'package:smartsecurity/bottomnavbar.dart';
import 'package:smartsecurity/favMenu.dart';
import 'package:smartsecurity/mainmenu.dart';
import 'package:smartsecurity/topbar.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //int _selectedindexnavbar=0;


   void _handleBottomNavChanged(int newValue) {
    setState(() {
      //_selectedindexnavbar = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MyTopbar(),
      body:new Container(
        child: new ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              new Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom:10.00),
                  //color: Colors.blue[100],
                  child: new Column(
                    children: <Widget>[
                      GuestMenu(),
                    ],
                  )),
              new Container(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom:10.00),
                  //color: Colors.blue[100],
                  child: new Column(
                    children: <Widget>[
                      MainMenu(),
                    ],
                  )),

            ],

        ),
      )  ,
      bottomNavigationBar: MyBottomNavBar( onChanged: _handleBottomNavChanged,),
    );
  }

  Widget buildSubHeaderMenu() {
  return new SizedBox(
    width: double.infinity,
    height: 220.0,
    child: new Container(
        margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: GridView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: 8,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, position) {
              return MainMenu();
            }
        )
      )
  );
}


  @override
  void initState() {
    super.initState();   
  }
  
}

