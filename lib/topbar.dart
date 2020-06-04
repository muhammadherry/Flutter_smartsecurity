
import 'package:flutter/material.dart';

class MyTopbar extends AppBar {
  MyTopbar()
  :super(             elevation: 0.25,
            backgroundColor: Colors.white,
            flexibleSpace: _buildMenuAppBar());


  static Widget _buildMenuAppBar() {
    return new Container(
      margin:EdgeInsets.only(top:20.0) ,
      padding: EdgeInsets.only(left: 5.0, right: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Image.asset(
            "assets/logos/toplog.png",
            height: 25.0,
            //width: 100.0,
          ),
                    new Container(
            child: new Row(
              children: <Widget>[
                new Container(
                  height: 28.0,
                  width: 28.0,
                  padding: EdgeInsets.all(6.0),
                  decoration: new BoxDecoration(
                      borderRadius:
                          new BorderRadius.all(new Radius.circular(100.0)),
                      color: Colors.blue),
                  alignment: Alignment.centerRight,
                  child: new Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ]
            ),
                    ),
          ]
));
  }
}