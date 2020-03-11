import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslimapps/model/QuranAcak.dart';
import 'package:muslimapps/request/base_request.dart';

class HomeRepository {
  final dio = Dio();
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

//final client = RestClient(dio);

  Future<QuranAcak> getQuranAcak() async {
    final client = RestClient(dio);
    QuranAcak quran_acak = await client.getQuranAcak();
    return quran_acak;
  }

  Future<String> getCurrentLocation() async {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      return getAddressFromLatLng(position);
    });
  }

  Future<Position> getPosition() async {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print(position.latitude);
      //  _currentPosition = position;
      getAddressFromLatLng(position);
    }).catchError((e) {
      return 0;
    });
  }

  Future<String> getAddressFromLatLng(Position _currentPosition) async {
    String city;
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

      city = place.subAdministrativeArea;
    } catch (e) {
      city = "Error Get Location";
    }

    return city;
  }
}
