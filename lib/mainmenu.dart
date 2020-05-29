import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smartsecurity/menuitem.dart';

class MainMenu extends StatelessWidget {
  
  MenuItems menus;

  void getMenus(){
    String jsonmenu='{"menuitems":[{"icon":"assets/icons/add-user-48.png", "caption":"Tambah Tamu"},{"icon":"assets/icons/add-user-48.png", "caption":"Tambah Tamu2"},{"icon":"assets/icons/add-user-48.png", "caption":"Tambah Tamu3"}]}' ;
    menus=MenuItems.fromJson (jsonDecode(jsonmenu));
  }


  Widget build(BuildContext context){
    getMenus();

    return new Container(
    height: 350.0,
    //color:Color(0xff3164bd),
    decoration: new BoxDecoration(         
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,          
          colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
          
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
    child: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
    Container(
      height: 320,
      //color: Colors.amber[600],
      child: CustomScrollView(
  slivers: <Widget>[
    // const SliverAppBar(
    //   pinned: true,
    //   expandedHeight: 250.0,
    //   flexibleSpace: FlexibleSpaceBar(
    //     title: Text('Demo'),
    //   ),
    // ),
    SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.0,
        
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,            
            //color: Colors.teal[100 * (index % 9)],
            child: FlatButton(onPressed: null, child: Column(children: <Widget>[
                 new Image.asset(
                          menus.items[index].icon,// "assets/icons/add-user-48.png",
                          width: 32.0,
                          height: 32.0,                    
                  ),
              Padding(padding: EdgeInsets.only(top: 10)),
              new Text( 
                          menus.items[index].caption,// "Tambah Tamu",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                    
                  )

        ],)),
          );
        },
        childCount: menus.items.length,
      ),
    ),
    
  ],
),
    ),
      ]
      )
      );
  }
      
}

