import 'dart:convert';

import 'package:flutter/material.dart';

import 'favmenuitem.dart';
import 'menuitem.dart';

class GuestMenu extends StatelessWidget {

  MenuItems menus;

  void getMenus(){
    String jsonmenu='{"menuitems":[{"icon":"assets/logos/absen.png", "caption":"Absen"}]}' ;
    menus=MenuItems.fromJson (jsonDecode(jsonmenu));
  }

  Widget build(BuildContext context){
    getMenus();
    return new Container(
    height: 123.0,
    decoration: new BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
        ),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0))),
    child:  FavMenuItem(menus)
      );
  }
      
}

