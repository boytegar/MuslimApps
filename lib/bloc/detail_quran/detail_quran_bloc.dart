import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart';
import 'package:muslimapps/request/base_request.dart';
import './bloc.dart';
import 'package:hive/hive.dart';

class DetailQuranBloc extends Bloc<DetailQuranEvent, DetailQuranState> {
  @override
  DetailQuranState get initialState => InitialDetailQuranState();

  @override
  Stream<DetailQuranState> mapEventToState(
    DetailQuranEvent event,
  ) async* {

    if(event is getDataEvent){
      var no = getDataEvent().no;
      var ayat = getDataEvent().ayat;
      Hive.openBox("surat_$n").then((value) =>
          (value.length == 0)?
          _downloadData(no, ayat)
           : false
      );

      yield getDetailQuranState();
    }else if(event is regetDataEvent){

      yield regetDetailQuranState();
    }else{

    }
  }

  Future<void> _downloadData(String no, String ayat) async {
    final dio = Dio();
    final client = RestClient(dio);
    int ay = int.parse(ayat);
    if (ay <= 10) {
      await client.getDetailListQuran(no, "1-$ayat")
          .then((value) =>
          value.ayat.data_.ar.forEach((element) {
            print(element.surat);
          })
      )
          .whenComplete(() =>
          print("success")
      );

    }
    else if(ay%10==0){
      int foo = (ay / 10).floor();
      for (var i = 0; i < foo; i++) {
        print(i);
        await client.getDetailListQuran(no, "${i}1-$ayat")
            .then((value) =>
            value.ayat.proses.forEach((element) {
              int a = element-1;
              print(value.ayat);
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
              int a = element-1;
              print(value.ayat.data_.ar[a].surat);
            })
        )
            .whenComplete(() =>
            print("success")
        );
      }
    }
  }
}
