import 'package:flutter/material.dart';
import 'package:market_app/ui/detail/ui_pray.dart';

class MosqueUi extends StatefulWidget {
  @override
  _MosqueUiState createState() => _MosqueUiState();
}

class _MosqueUiState extends State<MosqueUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
            onTap: (){
              setState(() {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return PrayUi();
                    },
                    fullscreenDialog: true
                ));
              });
            },
            child: Text("MOSQUE", style: TextStyle(color: Colors.purpleAccent),)),
      ),
    );
  }
}
