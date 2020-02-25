import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslimapps/model/QuranAcak.dart';
import 'package:muslimapps/request/base_request.dart';

import 'bloc.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
 // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  HomeState get initialState => super.initialState ?? InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);

    if (event is getDataHomeEvent) {
      QuranAcak quran_acak = await client.getQuranAcak();

     // print(pos.latitude.toString());
  //    log('data: ${pos.latitude}');


   //   log('data: $kota');

      yield getDataHomeState(quran_acak: quran_acak);
    } else {}
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
