import 'package:flutter/material.dart';
import 'dart:convert';

List<Payload> payloadFromJson(String str) =>
    List<Payload>.from(json.decode(str).map((x) => Payload.fromJson(x)));

String payloadToJson(List<Payload> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payload {
  String nama;

  Payload({
    this.nama,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
      };
}



class Absen3 extends StatefulWidget {
  Absen3({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _Absen3State createState() => _Absen3State();
}

String jsonString = '[{"table_no": "1","nama": "hhhhhhhhh"},{"table_no": "2","nama": "jjjj"},{"table_no": "3","nama": "iuiu"}]';
List<Payload> payload = payloadFromJson(jsonString);

List<Map> _myJson = [];

class _Absen3State extends State<Absen3> {
  String _mySelection;

  @override
  void initState() {
    for (var i = 0; i < payload.length; i++) {
      _myJson.add({'id': payload[i].nama, 'name': payload[i].nama});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 500.0,
              child: Center(
                child: DropdownButton<String>(
                  isDense: true,
                  hint: Text("${payload[0].nama}"),
                  value: _mySelection,
                  onChanged: (String Value) {
                    setState(() {
                      _mySelection = Value;
                    });
                    print(_mySelection);
                  },
                  items: _myJson.map((Map map) {
                    return DropdownMenuItem<String>(
                      value: map["id"].toString(),
                      child: Text(
                        map["name"],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}