import 'package:flutter/material.dart';
import 'package:ifind/page/home.dart';
import 'package:ifind/page/login.dart';
import 'package:ifind/page/userregister.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
