import 'package:flutter/material.dart';
import 'package:muslimapps/ui/detail/ui_city.dart';

class PrayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrayUi();
  }
}

class PrayUi extends StatefulWidget {
  @override
  _PrayUiState createState() => _PrayUiState();
}

class _PrayUiState extends State<PrayUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CityUi(),
                    fullscreenDialog: true
                ));

          },
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 5, 30, 5),
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.my_location, color: Colors.white, size: 15,),
                  SizedBox(width: 10,),
                  Text(
                    "Pilih Kota",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )),
        ),
        centerTitle: true,
      ),
    );
  }
}
