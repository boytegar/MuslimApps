import 'dart:async';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:muslimapps/helper/API_KEY.dart';
import 'package:muslimapps/model/MosquePlace.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:url_launcher/url_launcher.dart';

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
  List<Result> _results = [];
  String api_key = api_keys().google_api;

  var f = NumberFormat("##.##");
  //controller
  Completer<GoogleMapController> _controller = Completer();
  PageController _pageController = PageController(
      initialPage: 0, viewportFraction: 0.8);

  //
  CameraPosition _kGooglePlex;
  BitmapDescriptor pinLocationIcon;


  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

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
     // tilt: 5

   );
   Future.delayed(const Duration(seconds: 3), () {
     getData(_lat, _lng);
   });

   setCustomMapPin();
    super.initState();
  }


  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/marker.png');
  }

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  getData(double lat, double lng) async {
    try{
      final response = await Dio().get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=300&type=mosque&key=$api_key');
      var statusCode = response.statusCode;
      if (statusCode == 201 || statusCode == 200) {
        MosquePlace data = MosquePlace.fromJson(response.data);
        data.results.forEach((element)  {

          setState(() {
            _results.add(element);
            _markers.add(Marker(
              markerId: MarkerId(element.id),
              position: LatLng(element.geometry.location.lat, element.geometry.location.lng),
              infoWindow: InfoWindow(
                title: element.name,
              ),
              icon: pinLocationIcon,

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

  Future<void> _goToThePlace(Result result) async {
    final CameraPosition _kLake = CameraPosition(
      //  bearing: 192.8334901395799,
        target: LatLng(
            result.geometry.location.lat, result.geometry.location.lng),
        //tilt: 59.440717697143555,
        zoom: 16.4746);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


  Widget _ListMosque(Result result, ScreenUtil screenUtil) {


    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => _launchMapsUrl(result.geometry.location.lat, result.geometry.location.lng),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: (result.photos == null) ?
                Image.asset('assets/images/mosque_error.jpg',
                    height: screenUtil.setHeight(double.infinity),
                    width: screenUtil.setWidth(200),
                    fit: BoxFit.cover)
                    : Image.network(
                  'https://maps.googleapis.com/maps/api/place/photo?photoreference=${result
                      .photos[0]
                      .photo_reference}&sensor=false&maxheight=400&maxwidth=200&key=$api_key',
                  height: screenUtil.setHeight(double.infinity),
                  width: screenUtil.setWidth(200),
                  fit: BoxFit.cover,)),
          ),
          const SizedBox(width: 10,),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(result.name, overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(result.vicinity, overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500,),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RatingBar(
                        itemSize: 15,
                        initialRating: (result.rating==null)? 0.0:(result.rating as num).toDouble(),
                        //(result.rating==int)? "${result.rating}.0" as double: result.rating as double,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        tapOnlyMode: false,
                        ignoreGestures: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.only(right: 4.0),
                        itemBuilder: (context, _) =>
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                      ),
                      //SizedBox(width: 10,),
                      Text("${result.user_ratings_total} ratings", style: TextStyle(color: Colors.grey[500], fontSize: 8))
                    ],
                  ),
                  Text("${f.format(calculateDistance(_lat, _lng, result.geometry.location.lat, result.geometry.location.lng))} km from your location"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    ScreenUtil.init(context, allowFontScaling: true);
    ScreenUtil _screenUtil = ScreenUtil();

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
                mapToolbarEnabled: false,

                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: _screenUtil.setHeight(350),
                child: PageView.builder(
                  onPageChanged: (value) {
                    _goToThePlace(_results[value]);
                  },
                  controller: _pageController,
                  itemCount: _results.length,
                  itemBuilder: (context, index) {
                    return _ListMosque(_results[index], _screenUtil);
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: (platform == TargetPlatform.android)? SizedBox(): Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black45),
                child: GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.arrow_back, color: Colors.white,size: 20,
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
