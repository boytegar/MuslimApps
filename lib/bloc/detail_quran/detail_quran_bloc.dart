import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';
import 'package:muslimapps/request/base_request.dart';
import './bloc.dart';

class DetailQuranBloc extends HydratedBloc<DetailQuranEvent, DetailQuranState> {

  @override
  DetailQuranState get initialState =>  InitialDetailQuranState();

  @override
  Stream<DetailQuranState> mapEventToState(
    DetailQuranEvent event,
  ) async* {

     if(event is openBoxEvent){
      String no = event.no;
      await Hive.openBox("surat_$no");
      yield  getDetailQuranState();
    }
    else if(event is getDataEvent){
      var no =event.no;
      var ayat = event.ayat;
      final dio = Dio();
      final client = RestClient(dio);
      int ay = int.parse(ayat);
      try {
        var list_ayat = Hive.box("surat_$no");
        if(list_ayat.length == 0){

         //download proses
         if (ay <= 10) {
           await client.getDetailListQuran(no, "1-$ayat").then((value) =>
               value.ayat.proses.forEach((element) {
                 ListSurat listSurat = ListSurat();
                 listSurat.id = element;
                 listSurat.surat = int.parse(value.surat.nomor);
                 listSurat.teks_arab = value.ayat.data.ar[element-1].teks;
                 listSurat.teks_arti = value.ayat.data.id[element-1].teks;
                 listSurat.teks_transliterasi = value.ayat.data.idt[element-1].teks;
                 listSurat.bookmark = "false";
                 list_ayat.add(listSurat);
               })
           );

         } else if(ay%10==0){
           int foo = (ay / 10).floor();
           for (var i = 0; i < foo; i++) {
             print(i);
             await client.getDetailListQuran(no, "${i}1-$ayat")
                 .then((value) =>
                 value.ayat.proses.forEach((element) {

                   ListSurat listSurat = ListSurat();
                   listSurat.id = element;
                   listSurat.surat = int.parse(value.surat.nomor);
                   listSurat.teks_arab = value.ayat.data.ar[element-((i*10)+1)].teks;
                   listSurat.teks_arti = value.ayat.data.id[element-((i*10)+1)].teks;
                   listSurat.teks_transliterasi = value.ayat.data.idt[element-((i*10)+1)].teks;
                   listSurat.bookmark = "false";
                   list_ayat.add(listSurat);

                 })
             )
                 .whenComplete(() =>
                 print("success")
             );
           }
         }
         else {
           int foo = (ay / 10).floor();
           for (var i = 0; i <= foo; i++) {
             print(i);
             if(i==foo){
               i-1;
             }
             await client.getDetailListQuran(no, "${i}1-$ayat")
                 .then((value) =>
                 value.ayat.proses.forEach((element) {
                   ListSurat listSurat = ListSurat();
                   listSurat.id = element;
                   listSurat.surat = int.parse(value.surat.nomor);
                   listSurat.teks_arab = value.ayat.data.ar[element-((i*10)+1)].teks;
                   listSurat.teks_arti = value.ayat.data.id[element-((i*10)+1)].teks;
                   listSurat.teks_transliterasi = value.ayat.data.idt[element-((i*10)+1)].teks;
                   listSurat.bookmark = "false";
                   list_ayat.add(listSurat);
                 })
             )
                 .whenComplete(() =>
                 print("success")
             );
           }
         }

         //end proses

         yield getListDetailQuranState(list_surat: list_ayat);
        }else{
          yield getListDetailQuranState(list_surat: list_ayat);
        }
      } catch (e, s) {
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
