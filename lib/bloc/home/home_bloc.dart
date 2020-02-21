import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:market_app/model/QuranAcak.dart';
import 'package:market_app/request/base_request.dart';

import 'bloc.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => this.initialState ?? InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);

    if (event is getDataHomeEvent) {
      QuranAcak quran_acak = await client.getQuranAcak();
      yield getDataHomeState(quran_acak: quran_acak);
    }
    else {}
  }

  @override
  HomeState fromJson(Map<String, dynamic> json) {
    try{
      return json['state'] as HomeState;
    }
    catch(_){
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(HomeState state) {
    try{
      return{'state': state.toString()};
    }
    catch(_){
      return null;
    }
  }
}
