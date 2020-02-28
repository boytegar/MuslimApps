import 'dart:async';
import 'dart:developer';

import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslimapps/bloc/detail_quran/detail_quran_repository.dart';


import './bloc.dart';

class DetailQuranBloc extends HydratedBloc<DetailQuranEvent, DetailQuranState> {

 final DetailQuranRepository detailQuranRepository;

  DetailQuranBloc({this.detailQuranRepository});

  @override
  DetailQuranState get initialState =>  InitialDetailQuranState();

  @override
  Stream<DetailQuranState> mapEventToState(DetailQuranEvent event) async* {
    if(event is openBoxEvent){
      String no = event.no;
      try {
        await Hive.openBox("surat_$no");
      } catch (e, s) {
        print(s);
        log("ERROR", name: "$e -- $s");
      }
      yield  getDetailQuranState();
    }
    else if(event is getDataEvent){
      var no =event.no;
      var ayat = event.ayat;
      try {
        var list_ayat = Hive.box("surat_$no");
        if(list_ayat.length == 0){
          var list = await detailQuranRepository.insertDetailQuran(no, ayat);
          yield getListDetailQuranState(list_surat: list);

        }else{
          var list = await detailQuranRepository.getDetailQuran(no);
          yield getListDetailQuranState(list_surat: list);
        }
      } catch (e, s) {
        log("ERROR", name: "$e -- $s");
        print(s);
      }
    }
  }


  @override
  DetailQuranState fromJson(Map<String, dynamic> json) {
    try {
      return json['state'] as DetailQuranState;
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(DetailQuranState state) {
    try {
      return {'state': state.toString()};
    } catch (_) {
      return null;
    }
  }
}
