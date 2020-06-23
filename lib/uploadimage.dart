import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class image extends StatefulWidget {
  @override
  _imageState createState() => _imageState();
}

class _imageState extends State<image> {
  TextEditingController controllertitle = new TextEditingController();

  File _image;
  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    
    setState(() {
      _image = imageFile;
    });
  }

  Future upload(File imageFile)async{
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://localhost/smart_security/insertdata.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("image", stream, length,filename: basename(imageFile.path));
    request.fields['title'] = controllertitle.text;
    request.files.add(multipartFile);

    var response = await request.send();
    if(response.statusCode==200){
      print("image uploaded");
    }else{
      print("image failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Absensi"),
          backgroundColor: Colors.teal,
        ),
      body: Container(
         decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logos/pattern.png"), fit: BoxFit.cover)
          ),
        padding: const EdgeInsets.all(25),
        child: Form(
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
                    new Center(
                      child: _image == null
                          ? Text('Belum Mengambil Gambar.')
                          : Image.file(_image),
                    ),
                    
                    Row(
                      children: <Widget>[
                        RaisedButton(
                          child: Icon(Icons.image),
                          onPressed: getImageCamera,
                        ),
                      ],
                    ),
                    TextField(
                      controller: controllertitle,
                      decoration: new InputDecoration(
                        hintText:"title"
                      )
                    ),
                    new RaisedButton(
                      child: new Text("OK"),
                      color: Colors.teal[200],
                      onPressed:(){
                        upload(_image);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
/////coba