import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslimapps/bloc/home/home_repository.dart';
import 'package:muslimapps/model/QuranAcak.dart';

import 'bloc.dart';

class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {

  final HomeRepository homeRepository;

  HomeBloc({this.homeRepository});

  @override
  HomeState get initialState => super.initialState ?? InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {

    if (event is getDataHomeEvent) {
      QuranAcak quranAcak = await homeRepository.getQuranAcak();

      yield getDataHomeState(quran_acak: quranAcak);
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
