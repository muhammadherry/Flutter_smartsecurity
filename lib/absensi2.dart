import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsecurity/homepage.dart';
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

class Absensi extends StatefulWidget{
  Absensi({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AbsensiState createState() =>  _AbsensiState();
}

String jsonString = '[{"ID": "1","nama": "M HERRY RIDWANSYAH"},{"ID": "2","nama": "RE RISKY DWI ANDIKA"},{"ID": "3","nama": "MOH IZUDDIN AL QOSAM"},{"ID": "4","nama": "YOGI ARI WINANDA"}]';
List<Payload> payload = payloadFromJson(jsonString);

List<Map> _myJson = [];

class _AbsensiState extends State<Absensi>{
  
String _mySelection;
  
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
  @override
  void initState() {
    for (var i = 0; i < payload.length; i++) {
      _myJson.add({'id': payload[i].nama, 'name': payload[i].nama});
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Absensi Security"),
          backgroundColor: Colors.teal,
        ),
       
        body: new Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logos/pattern.png"), fit: BoxFit.cover)
          ),
          child: new ListView(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.only(top: 50.0),),
              
              new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    new Padding(padding: new EdgeInsets.only(top: 20.0),),
                    Container(
                      height: 100.0,
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
                     
                    new Padding(padding: new EdgeInsets.only(top: 20.0),),
                   
                    new Center(
                      child: _image == null
                          ? Text('No image selected.')
                          : Image.file(_image),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_a_photo, color: Colors.teal,),
                      onPressed: getImage,
                    ),
                    new RaisedButton(
                      child: new Text("OK"),
                      color: Colors.teal[200],
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );},
                    ),
                    new DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                      label: "Menu mode",
                      hint: "country in menu mode",
                      popupItemDisabled: (String s) => s.startsWith('I'),
                      onChanged: print,
                      selectedItem: "Brazil"
                    ),
                  ],
                ),
              ),
            ],
          ),
        )


    /*  floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
*/
    );
  }
}
