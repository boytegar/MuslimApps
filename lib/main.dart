import 'package:flutter/material.dart';
import 'package:market_app/ui/ui_login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Color(0xffE4E4E4),

      ),
      debugShowCheckedModeBanner: false,
      home: LoginUi(),
      
    );
  }
}