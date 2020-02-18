import 'package:flutter/material.dart';
import 'package:market_app/helper/SizeConfig.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:market_app/ui/ui_date.dart';
import 'package:market_app/ui/ui_home.dart';
import 'package:market_app/ui/ui_notifications.dart';
import 'package:market_app/ui/ui_profile.dart';

class MainUi extends StatefulWidget {
  @override
  _MainUiState createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  int _selectedBottom = 0;

  final _listMenu = <Widget>[
    HomeUi(),
    DateUi(),
    NotificationsUi(),
    ProfileUi()
  ];

  void onBarTap(int index) {
    setState(() {
      _selectedBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listMenu[_selectedBottom],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
                onTap: () => onBarTap(0),
//              onTap: () { onBarTap(0); },
                child: Icon(
                  Icons.home,
                  color: (_selectedBottom == 0) ? Colors.blue : Colors.black12,
                )),
            GestureDetector(
                onTap: () => onBarTap(1),
//              onTap: () { onBarTap(0); },
                child: Icon(Icons.calendar_today, color: (_selectedBottom == 1) ? Colors.blue : Colors.black12)),
            GestureDetector(
                onTap: () => onBarTap(2),
//              onTap: () { onBarTap(0); },
                child: Icon(Icons.notifications, color: (_selectedBottom == 2) ? Colors.blue : Colors.black12)),
            GestureDetector(
                onTap: () => onBarTap(3),
//              onTap: () { onBarTap(0); },
                child: Icon(Icons.person, color: (_selectedBottom == 3) ? Colors.blue : Colors.black12)),
          ],
        ),
      ),
    );
  }
}
