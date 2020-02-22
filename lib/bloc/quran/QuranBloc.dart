import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:muslimapps/bloc/quran/QuranBlocState.dart';
import 'package:muslimapps/bloc/quran/QuranBlocEvent.dart';
import 'package:muslimapps/model/Quran.dart';
import 'package:muslimapps/request/base_request.dart';


class QuranBloc extends HydratedBloc<QuranBLocEvent, QuranBlocState>{

  @override
  QuranBlocState get initialState => super.initialState ?? InitQuranState();

  @override
  Stream<QuranBlocState> mapEventToState(QuranBLocEvent event) async*{
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
   // Quran quran;

//    client.getListQuran().then((it) =>
//  //  (quran = it)
//        print(it.status.toString())
//    );
    if(event is GetListQuranEvent){
      Quran currentQuran = await client.getListQuran();
      yield GetListState(quran: currentQuran);
    }else{
      yield InitQuranState();
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