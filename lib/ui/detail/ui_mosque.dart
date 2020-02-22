import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muslimapps/helper/API_KEY.dart';
import 'package:muslimapps/model/MosquePlace.dart';

class MosqueUi extends StatefulWidget {

  var text;
  MosqueUi({Key key, @required this.text}) : super(key: key);

  @override
  _MosqueUiState createState() => _MosqueUiState();
}

class _MosqueUiState extends State<MosqueUi> {

  double _lat;
  double _lng;
  List<Marker> _markers = [];
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex;



  @override
  void dispose() {
    super.dispose();
  }
 @override
  void initState() {
   _lat = widget.text[0];
   _lng = widget.text[1];

   _kGooglePlex = CameraPosition(
     target: LatLng(_lat, _lng),
     zoom: 16.4746,
     tilt: 5

   );
   Future.delayed(const Duration(seconds: 3), () {
     getData(_lat, _lng);
   });
    super.initState();
  }


  getData(double lat, double lng) async {
    String api_key = api_keys().google_api;

    try{
      final response = await Dio().get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=300&type=mosque&key=$api_key');
      var statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        MosquePlace data = MosquePlace.fromJson(response.data);
        data.results.forEach((element)  {
          print(element.name);
          setState(() {
            _markers.add(Marker(
              markerId: MarkerId(element.id),
              position: LatLng(element.geometry.location.lat, element.geometry.location.lng),
              infoWindow: InfoWindow(
                title: element.name,
              ),
              icon: BitmapDescriptor.defaultMarker,

            ));
          });
        });



      } else {
        throw Exception('Error');
      }
    }
    catch(e){
      print(e.toString());
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: SafeArea(
       child: Stack(
         children: <Widget>[
           Container(
             height: double.infinity,
             width: double.infinity,
             child: GoogleMap(
            //   mapType: MapType.hybrid,
               markers: Set<Marker>.of(_markers),
               myLocationEnabled: true,
               compassEnabled: false,
               initialCameraPosition: _kGooglePlex,
               onMapCreated: (GoogleMapController controller) {
                 _controller.complete(controller);
               },
             ),
           ),
           Align(
             alignment: Alignment.bottomCenter,
             child: RaisedButton(
               onPressed: () => getData(_lat, _lng),
               child: Text("COBA"),
             ),
           ),
         ],
       ),
     ),
    );
  }
}
