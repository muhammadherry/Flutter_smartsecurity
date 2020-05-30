import 'package:flutter/material.dart';
import 'package:smartsecurity/absensi2.dart';
import 'package:smartsecurity/login/login.dart';

class Account extends StatefulWidget{
 
  @override
  AccountState createState() =>  AccountState();
}
class AccountState extends State<Account>{
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Akun"),
          backgroundColor: Colors.teal,
        ),
        body: new Container(
          child:ListView(
            children: <Widget>[
              ListTile(
                trailing: Icon(Icons.account_box ),
                title: Text('Masuk / Daftar'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                trailing: Icon(Icons.book ),
                title: Text('Absen'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Absensi(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Bantuan'),
              ),
              ListTile(
                title: Text('Nilai Blibli App'),
              ),
              ListTile(
                title: Text('Blibli Friends'),
              ),
              ListTile(
                title: Text('Pengaturan'),
              ),
            ],
          )
        ),
      );
    }
}
     