import 'dart:io';
import 'package:async/async.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:smartsecurity/date.dart';
import 'package:smartsecurity/user_model.dart';
import 'package:http/http.dart' as http;

class cobaabsen extends StatefulWidget {
  @override
  _cobaabsenState createState() => _cobaabsenState();
}

class _cobaabsenState extends State<cobaabsen> {
    
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerDate_modified = new TextEditingController();
  TextEditingController controllerImage = new TextEditingController();

  void insertdata()
  {
    var url="http://10.0.2.2/smart_security/insertdata.php";

    http.post(url, body:{
      "nama":controllerNama.text,
      "image":controllerNama.text,
    });
  }

  final formats = {
    InputType.both: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
    InputType.date: DateFormat('yyyy-MM-dd'),
    InputType.time: DateFormat("HH:mm"),
  };
  InputType inputType = InputType.both;
  bool editable = true;
  DateTime date;

  final _formKey = GlobalKey<FormState>();

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future upload(File imageFile)async{
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://10.0.2.2/smart_security/insertdata.php");
    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile("image", stream, length,filename: basename(imageFile.path));
    request.files.add(multipartFile);
    var response = await request.send();
    if(response.statusCode==200){
      print("image uploaded");
    }else{
      print("image failed");
    }
  }

  String pilihTanggal,labelText;
  DateTime tgl= new DateTime.now();
  final TextStyle valueStyle = TextStyle(fontSize: 16.0);
  Future<Null> _selectedDate(BuildContext context)async{
    final DateTime picked = await showDatePicker(context: context, initialDate: tgl, firstDate: DateTime(2020), lastDate: DateTime(2030));
    if(picked !=null&& picked != tgl){
      setState(() {
        tgl = picked;
        pilihTanggal = new DateFormat.yMd().format(tgl);
      });
    }else{}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Absensi Security"),
          backgroundColor: Colors.teal,
        ),
      body: Container(
         decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logos/pattern.png"), fit: BoxFit.cover)
          ),
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: ListView(
              padding: EdgeInsets.all(4),
              children: <Widget>[

                DropdownSearch<UserModel>(
                  mode: Mode.BOTTOM_SHEET,
                  isFilteredOnline: true,
                  showClearButton: true,
                  showSearchBox: true,
                  label: 'SECURITY',
                  dropDownSearchDecoration: InputDecoration(
                      filled: true,
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor),
                  autoValidate: true,
                  validator: (UserModel u) =>
                      u == null ? "Nama Security Belum Di Pilih " : null,
                  onFind: (String filter) => getData(filter),
                  onChanged: (UserModel data) {
                    print(data);
                  },
                  dropdownBuilder: _customDropDownExample,
                  popupItemBuilder: _customPopupItemBuilderExample,
                ),
                Divider(),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),

                DateDropdown(
                  labelText: labelText,
                  valueText: tgl.toString(),
                  valueStyle: valueStyle,
                  onPressed: (){
                    _selectedDate(context);
                  },                  
                ),

                new Padding(padding: new EdgeInsets.only(top: 20.0),),
                    
                new Center(
                  child: _image == null
                      ? Text('Belum Mengambil Gambar.')
                      : Image.file(_image),
                ),
                IconButton(
                  icon: Icon(Icons.photo_camera,
                  color: Colors.teal,),
                  onPressed: getImage,
                ),

                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.teal[200],
                  onPressed:(){
                    upload(_image);
                    Navigator.pop(context);
                  },
                ),
                ///Menu Mode with no searchBox
                // DropdownSearch<String>(
                //   validator: (v) => v == null ? "required field" : null,
                //   hint: "Select a country",
                //   mode: Mode.MENU,
                //   showSelectedItem: true,
                //   items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                //   label: "Menu mode *",
                //   showClearButton: true,
                //   onChanged: print,
                //   popupItemDisabled: (String s) => s.startsWith('I'),
                //   selectedItem: "Brazil",
                // ),
                // Divider(),
                // new Padding(padding: new EdgeInsets.only(top: 20.0),),
                // new DateTimePickerFormField(
                //   controller: controllerDate_modified,
                //   inputType: inputType,
                //   format: formats[inputType],
                //   editable: false,
                //   decoration: new InputDecoration(
                //     hintText: "Date Modified",
                //     labelText: 'Date Modified',
                //     hasFloatingPlaceholder: false,
                //     border: new OutlineInputBorder(
                //       borderRadius: new BorderRadius.circular(20.0),
                //     ),
                //   ),
                //   onChanged: (dt) => setState(() => date = dt),
                // ),
                
                ///custom itemBuilder and dropDownBuilder
                // DropdownSearch<UserModel>(
                //   showSelectedItem: true,
                //   compareFn: (UserModel i, UserModel s) => i.isEqual(s),
                //   label: "Person",
                //   onFind: (String filter) => getData(filter),
                //   onChanged: (UserModel data) {
                //     print(data);
                //   },
                //   dropdownBuilder: _customDropDownExample,
                //   popupItemBuilder: _customPopupItemBuilderExample2,
                // ),
                // Divider(),

                ///BottomSheet Mode with no searchBox
                // DropdownSearch<String>(
                //   mode: Mode.BOTTOM_SHEET,
                //   maxHeight: 300,
                //   items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                //   label: "Custom BottomShet mode",
                //   onChanged: print,
                //   selectedItem: "Brazil",
                //   showSearchBox: true,
                //   searchBoxDecoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                //     labelText: "Search a country",
                //   ),
                //   popupTitle: Container(
                //     height: 50,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).primaryColorDark,
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //       ),
                //     ),
                //     child: Center(
                //       child: Text(
                //         'Country',
                //         style: TextStyle(
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                //   popupShape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(24),
                //       topRight: Radius.circular(24),
                //     ),
                //   ),
                // ),
                // Divider(),

                ///merge online and offline data in the same list and set custom max Height
                // DropdownSearch<UserModel>(
                //   items: [
                //     UserModel(name: "Offline name1", id: "999"),
                //     UserModel(name: "Offline name2", id: "0101")
                //   ],
                //   maxHeight: 300,
                //   onFind: (String filter) => getData(filter),
                //   label: "choose a user",
                //   onChanged: print,
                //   showSearchBox: true,
                // ),
                // Divider(),
              ],
            ),
          ),
      ),
    );
  }

  Widget _customDropDownExample(
      BuildContext context, UserModel item, String itemDesignation) {
    return Container(
      child: (item?.avatar == null)
          ? ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(),
              title: Text("Anda Belum Memilih"),
            )
          : ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.avatar),
              ),
              title: Text(item.name),
              subtitle: Text(
                item.createdAt.toString(),
              ),
            ),
    );
  }

  Widget _customPopupItemBuilderExample(
      BuildContext context, UserModel item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
      BuildContext context, UserModel item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name),
        subtitle: Text(item.createdAt.toString()),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(item.avatar),
        ),
      ),
    );
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://5ed86bde152c310016d85b5d.mockapi.io/api/satpam/user",
      queryParameters: {"filter": filter},
    );

    var models = UserModel.fromJsonList(response.data);
    return models;
  }
}