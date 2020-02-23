import 'package:flutter/material.dart';

class ListAndFP extends StatelessWidget {
  final List<String> items = ['apple', 'banana', 'orange', 'lemon'];

  //  for in (require dart 2.2.2 SDK or later)
  Widget method1() {
    return Column(
      children: <Widget>[
        Text('You can put other Widgets here'),
        for (var item in items) Text(item),
      ],
    );
  }

  // map() + toList() + Spread Property
  Widget method2() {
    return Column(
      children: <Widget>[
        Text('You can put other Widgets here'),
       // items.map((item) => Text(item)).toList(),
      ],
    );
  }

  // map() + toList()
  Widget method3() {
    return Column(
      // Text('You CANNOT put other Widgets here'),
      children: items.map((item) => Text(item)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: method1(),
    );
  }
}