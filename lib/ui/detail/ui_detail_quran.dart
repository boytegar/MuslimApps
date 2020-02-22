import 'package:flutter/material.dart';

class DetailQuranUi extends StatefulWidget {
  var text;


  DetailQuranUi({Key key, @required this.text}) : super(key: key);

  @override
  _DetailQuranUiState createState() => _DetailQuranUiState();
}

class _DetailQuranUiState extends State<DetailQuranUi> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.text.toString()),
    );
  }
}
