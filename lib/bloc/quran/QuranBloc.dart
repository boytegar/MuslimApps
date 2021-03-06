import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslimapps/bloc/quran/QuranBlocState.dart';
import 'package:muslimapps/bloc/quran/QuranBlocEvent.dart';
import 'package:muslimapps/hive_db/ListQuran.dart';
import 'package:muslimapps/model/Quran.dart';
import 'package:muslimapps/request/base_request.dart';


class QuranBloc extends HydratedBloc<QuranBLocEvent, QuranBlocState>{



  @override
  QuranBlocState get initialState => super.initialState ?? initQuranState();

  @override
  Stream<QuranBlocState> mapEventToState(QuranBLocEvent event) async*{
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);

    client.getListQuran().then((value) {

    });

    if(event is GetListQuranEvent){
      await Hive.openBox("list_quran");
      yield getListState(quran: "success");
    }
    else if(event is InsertListToDbEvent){
      var list_quran =  Hive.box("list_quran");
      try {
        if(list_quran.length == 0 ){
          var fetch_data = await client.getListQuran();
          fetch_data.hasil.forEach((element) {
            ListQuran dats = ListQuran();
            dats.arti = element.arti;
            dats.asma = element.asma;
            dats.ayat = element.ayat;
            dats.keterangan = element.keterangan;
            dats.nama = element.nama;
            dats.name = element.name;
            dats.nomor = element.nomor;
            dats.rukuk = element.rukuk;
            dats.start = element.start;
            dats.type = element.type;
            dats.urut = element.urut;
            dats.status = "false";
            list_quran.add(dats);
          });
          yield getListStateFromDb(list_quran_data: list_quran);
        }else{
          yield getListStateFromDb(list_quran_data: list_quran);
        }
      } catch (e, s) {
        print(s);
      }

    }
  }



  @override
  QuranBlocState fromJson(Map<String, dynamic> json) {
    try{
      return json['state'] as QuranBlocState;
    }
    catch(_){
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(QuranBlocState state) {
    try{
      return{'state': state.toString()};
    }
    catch(_){
      return null;
    }
  }

}