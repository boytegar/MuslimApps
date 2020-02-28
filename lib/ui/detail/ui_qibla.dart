import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math' as math;

class QiblaUi extends StatefulWidget {
  @override
  _QiblaUiState createState() => _QiblaUiState();
}

class _QiblaUiState extends State<QiblaUi> {
  double _direction;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events.listen((double direction) {
      setState(() {
        _direction = direction;
      });
    });
  }

  @override
  void dispose() {
    FlutterCompass().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                color: Colors.white,
                child: new Transform.rotate(
                  angle: (((_direction+65.0) ?? 0) * (math.pi / 180) * -1),
                  child: new Image.asset('assets/images/qibla_compass.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text("Pastikan Device Tidak Berdekatan Dengan Benda Yang Mengandung Magnet"),
            ),
          ],
        ),
      ),
    );
  }
}
