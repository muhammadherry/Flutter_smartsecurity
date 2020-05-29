

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menuitem.dart';



class FavMenuItem extends StatelessWidget {
  FavMenuItem(this.menus);
  
  //const favmenuitem({Key key}) : super(key: key);
  final MenuItems menus;
  //FavMenuItem(this.menus);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[

    new Text(
            "FAVORIT MENU",            
            style: new TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontFamily: "NeoSansBold"),
          ),
    Container(
      height: 85,
      //color: Colors.amber[600],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index){
        return FlatButton(onPressed: null, child: Column(children: <Widget>[
                 new Image.asset(
                          menus.items[index].icon,// "assets/icons/add-user-48.png",
                          width: 32.0,
                          height: 32.0,                    
                  ),
              Padding(padding: EdgeInsets.only(top: 10)),
              new Text(
                          menus.items[index].caption,// "Tambah Tamu",
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                    
                  )

        ],));
      }),
    ),
      ]
      ),
    );
  }
}