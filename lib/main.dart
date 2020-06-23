import 'package:flutter/material.dart';
import 'package:smartsecurity/absensi.dart';
import 'package:smartsecurity/absensi2.dart';
import 'package:smartsecurity/absensi3.dart';
import 'package:smartsecurity/bottomnavbar.dart';
import 'package:smartsecurity/homepage.dart';
import 'package:smartsecurity/uploadimage.dart';
import 'package:smartsecurity/uploadimage2.dart';

import 'login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: image(),

      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

