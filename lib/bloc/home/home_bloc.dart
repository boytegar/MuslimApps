import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:market_app/model/QuranAcak.dart';
import 'package:market_app/request/base_request.dart';
import 'package:geolocator/geolocator.dart';

import 'bloc.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  HomeState get initialState => super.initialState ?? InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    Position pos = await _getCurrentLocation();
    if (event is getDataHomeEvent) {
      QuranAcak quran_acak = await client.getQuranAcak();

     // print(pos.latitude.toString());
  //    log('data: ${pos.latitude}');


      String kota = await _getAddressFromLatLng(pos);

   //   log('data: $kota');

      yield getDataHomeState(quran_acak: quran_acak, kota: kota);
    } else {}
  }

  Future<Position> _getCurrentLocation() async {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      return position;
      //  _currentPosition = position;
    }).catchError((e) {
      return 0;
    });
  }

  Future<String>_getAddressFromLatLng(Position _currentPosition) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      return "${place.locality}";

    //  "${place.locality}, ${place.postalCode}, ${place.country}";

    } catch (e) {
      return "error";
    }
  }

  @override
  HomeState fromJson(Map<String, dynamic> json) {
    try {
      return json['state'] as HomeState;
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(HomeState state) {
    try {
      return {'state': state.toString()};
    } catch (_) {
      return null;
    }
  }
}
