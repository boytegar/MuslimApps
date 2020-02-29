import 'package:flutter/material.dart';
import 'package:muslimapps/helper/SizeConfig.dart';
import 'package:muslimapps/ui/main/ui_date.dart';
import 'package:muslimapps/ui/main/ui_home.dart';
import 'package:muslimapps/ui/main/ui_notifications.dart';
import 'package:muslimapps/ui/main/ui_profile.dart';
import 'package:flutter/services.dart';

class MainUi extends StatefulWidget {
  @override
  _MainUiState createState() => _MainUiState();
}

class _MainUiState extends State<MainUi> {
  int _selectedBottom = 0;

  final _listMenu = <Widget>[
    HomePageUI(),
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
    SizeConfig().init(context);
    double sizeRatio = SizeConfig.screenRatio;

//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
//      statusBarBrightness: Brightness.light
//    ));

    return Scaffold(
        body: _listMenu[_selectedBottom],
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child:  Icon(Icons.add), onPressed: () {},),

        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: sizeRatio,
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => onBarTap(0),
//              onTap: () { onBarTap(0); },
                child: Container(
                    height: sizeRatio * 20,
                    width: sizeRatio * 10,
                    child: Icon(
                      Icons.home,
                      color: (_selectedBottom == 0) ? Colors.blue : Colors
                          .black12,
                    )
                ),),
              GestureDetector(
                onTap: () => onBarTap(1),
//              onTap: () { onBarTap(0); },
                child: Container(
                  height: sizeRatio * 20,
                  width: sizeRatio * 25,
                  child: Icon(Icons.calendar_today,
                      color: (_selectedBottom == 1) ? Colors.blue : Colors
                          .black12),
                ),
//                child: Icon(Icons.calendar_today, color: (_selectedBottom == 1) ? Colors.blue : Colors.black12)
              ),

              SizedBox(width: 5,),

              GestureDetector(
                onTap: () => onBarTap(2),
//              onTap: () { onBarTap(0); },
                child: Container(
                  height: sizeRatio * 20,
                  width: sizeRatio * 25,
                  child: Icon(Icons.notifications,
                      color: (_selectedBottom == 2) ? Colors.blue : Colors
                          .black12),
                ),
              ),
              GestureDetector(
                onTap: () => onBarTap(3),
//              onTap: () { onBarTap(0); },
                child: Container(
                    height: sizeRatio * 20,
                    width: sizeRatio * 10,
                    child: Icon(Icons.person,
                        color: (_selectedBottom == 3) ? Colors.blue : Colors
                            .black12)
                ),
              ),
            ],
          ),
        )
    );
  }
}
