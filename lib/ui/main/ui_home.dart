import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslimapps/bloc/home/bloc.dart';
import 'package:muslimapps/helper/SizeConfig.dart';
import 'package:muslimapps/model/ButtonMenu.dart';
import 'package:muslimapps/model/QuranAcak.dart';
import 'package:muslimapps/ui/detail/ui_mosque.dart';
import 'package:muslimapps/ui/detail/ui_pray.dart';
import 'package:muslimapps/ui/detail/ui_qibla.dart';
import 'package:muslimapps/ui/detail/ui_quran.dart';


class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}


class _HomeUiState extends State<HomeUi> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  //value
  bool mute = true;
  String city = "sedang mengambil lokasi";
  Position _nowPosition;



  List<ButtonMenu> _btn_list_one = [
    ButtonMenu(0, 'Prayer Time',
        Icon(FontAwesomeIcons.mosque, color: Color(0xffF65D53),
        )
    ),
    ButtonMenu(1, 'Al-Quraan',
        Icon(FontAwesomeIcons.quran, color: Color(0xffE0A84E),
        )
    ),
    ButtonMenu(2, 'Qibla',
        Icon(FontAwesomeIcons.kaaba, color: Color(0xff81CD2D),
        )
    ),
    ButtonMenu(3, 'Mosque',
        Icon(FontAwesomeIcons.placeOfWorship, color: Color(0xff6096FC),
        )
    ),
  ];

  List<ButtonMenu> _btn_list_two = [
    ButtonMenu(0, 'Duas',
        Icon(FontAwesomeIcons.prayingHands, color: Color(0xff717DF8),
        )
    ),
    ButtonMenu(1, 'Zakat',
        Icon(FontAwesomeIcons.calculator, color: Color(0xffF16F72),
        )
    ),
    ButtonMenu(2, 'Hadist',
        Icon(FontAwesomeIcons.book, color: Color(0xff0FA4C6),
        )
    ),
    ButtonMenu(3, 'Soon',
        Icon(FontAwesomeIcons.exclamation, color: Colors.purpleAccent,
        )
    ),
  ];


  HomeBloc _homeBloc;

  String ayat = "";
  
  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc?.close();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    switch(state) {
      case AppLifecycleState.resumed:

        break;
      case AppLifecycleState.inactive:
      // Handle this case
        break;
      case AppLifecycleState.paused:
       // _homeBloc?.
        break;
      case AppLifecycleState.detached:

        break;
    }

  }

  void _navigateBtnOne(int pos) async {

    List<Widget> pages = [
      PrayUi(),
      QuranUi(),
      QiblaUi(),
      MosqueUi(text: [_nowPosition.latitude, _nowPosition.longitude],)
    ];
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) => pages[pos],
        fullscreenDialog: true
    ));
  }

  void del() {
    Navigator.of(context).pop();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) => QuranUi(),
          fullscreenDialog: true
      ));
    });
  }

  Future<void> _showDialogs() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(
                  child: CircularProgressIndicator(),
                ),
                Text('Sedang Mengambil Data Quran'),
              ],
            ),
          ),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('Regret'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
        );
      },
    );
  }

  //Banner Top
  Widget _topBanner(double ratio) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Theme
                  .of(context)
                  .primaryColor, Color(0xff74C6EF)])),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        mute = !mute;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(7)
                      ),
                      padding: EdgeInsets.all(ratio * 2),
                      child: Center(
                        child: Icon((mute) ? Icons.notifications : Icons
                            .notifications_off, color: Colors.white,),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text((mute) ? "Mute" : "Unmute",
                    style: TextStyle(color: Colors.white, fontSize: ratio * 5),)
                ],
              ),
              Text("14.33", style: TextStyle(color: Colors.white,
                  fontSize: ratio * 10,
                  fontWeight: FontWeight.bold),)
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Set Reminder",
                style: TextStyle(color: Colors.white, fontSize: ratio * 5),),
              Text("2 Hours left Until Maghrib",
                  style: TextStyle(color: Colors.white, fontSize: ratio * 5))
            ],
          ),

        ],
      ),
    );
  }

  Widget _listButtonMenu(double ratio) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _btn_list_one.map((item) =>
                _btnMenu(item.id, item.icon, item.name, ratio)).toList(),
          ),
          const SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _btn_list_two.map((item) =>
                _btnMenu(item.id, item.icon, item.name, ratio)).toList(),
          )
        ],
      ),
    );
  }

  Widget _btnMenu(int id, Icon icons, String name, double ratio) {
    return GestureDetector(
      onTap: () => _navigateBtnOne(id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            Container(
              width: ratio * 20,
              height: ratio * 20,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: icons,
            ),
          SizedBox(height: 10,),
          Text(name, style: TextStyle(fontSize: ratio * 4),)
        ],
      ),
    );
  }

  Widget _infoBottom(double ratio, QuranAcak quran){
    return Card(
      elevation: 1,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Theme
                  .of(context)
                  .primaryColor, Color(0xff74C6EF)])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,

          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white30,
              ),
              child: Text("${quran.surat.nama} ${quran.surat.nomor}", style: TextStyle(
                  fontSize: ratio * 4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),),
            ),
            SizedBox(height: ratio * 9,),
            Center(
              child: Padding(

                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "${quran.acak.ar.teks}َ",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: ratio * 8,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: ratio * 7,),
            Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
              "${quran.acak.id.teks}",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: ratio * 5, color: Colors.white),),
                ))
          ],

        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _getCurrentLocation() async {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print(position.latitude);
      //  _currentPosition = position;
      _getAddressFromLatLng(position);
    }).catchError((e) {
      return 0;
    });
  }

 _getAddressFromLatLng(Position _currentPosition) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);
      Placemark place = p[0];
//      print(place.country);
//      print(place.position);
//      print(place.locality);
//      print(place.administrativeArea);
//      print(place.postalCode);
//      print(place.name);
//      print(place.subAdministrativeArea);
//      print(place.isoCountryCode);
//      print(place.subLocality);
//      print(place.subThoroughfare);
//      print(place.thoroughfare);

      setState(() {
        _nowPosition = _currentPosition;
        city = place.subAdministrativeArea;
      });

      //  "${place.locality}, ${place.postalCode}, ${place.country}";

    } catch (e) {
   //   return "error";
    }
  }


  Widget MainPage(double ratio, QuranAcak quran) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.paddingTop,),
          Container(
            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("TODAY", style: TextStyle(color: Colors.black54,
                    fontSize: ratio * 8,
                    fontWeight: FontWeight.bold),),
                GestureDetector(
                  onTap: ()=> _getCurrentLocation(),
                  child: Text(city,
                    style: TextStyle(color: Colors.black26, fontSize: ratio * 6),),
                )
              ],
            ),
          ),
          SizedBox(height: ratio * 4,),
          Card(
            elevation: ratio,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: _topBanner(ratio),),
          SizedBox(height: ratio * 10,),
          _listButtonMenu(ratio),
          SizedBox(height: ratio*10,),
          _infoBottom(ratio, quran)
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double ratio = SizeConfig.screenRatio;

    return Container(
      color: Color(0xffF9F9FB),
      margin: EdgeInsets.all(ratio * 5),
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: _homeBloc,
        builder: (context, state){

          if(state is InitialHomeState){
            Future.delayed(const Duration(seconds: 3), () {
              _homeBloc.add(getDataHomeEvent());
            });

            return buildLoading();
          }else{
            QuranAcak quran = (state as getDataHomeState).quran_acak;

            print(quran);
            return MainPage(ratio, quran);
          }
        },
      ),
    );
  }
}
