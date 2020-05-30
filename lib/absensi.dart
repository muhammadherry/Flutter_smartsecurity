import 'dart:convert';

import 'package:flutter/material.dart';

class absensi extends StatefulWidget{
  @override
  _absensiState createState(){
    return _absensiState();
  }
}

class _absensiState extends State<absensi>{
  final String data = '[{"id":"1","info":"muhammaf"},{"id":"2","info":"mu"},{"id":"3","info":"jghg"}]';
  List<Security> _security=[];
  String dropdownValue;

  Widget build(BuildContext context){
    var json= JsonDecoder().convert(data);
    _security=(json).map<Security>((data)
      {
          return Security.fromJson(data);
      }
    ).toList();
    dropdownValue=_security[0].info;

    return Scaffold(appBar: AppBar(
      title: Text("Absensi"),
    ),

    body: Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String newvalue)
        {
          setState((){
            dropdownValue=newvalue;
          });
        },
        items: _security.map((Security data){
          return DropdownMenuItem<String>(
            value: data.info,
            child: Text(data.info),
          );
        }).toList() ,
      ),

    ),
    );
  }
}

class Security{
  String id;
  String info;
  Security({this.id,this.info});

  factory Security.fromJson(Map<String,dynamic>json){
    return Security(
      id:json["id"],
      info:json["info"]
    );
  }
}
