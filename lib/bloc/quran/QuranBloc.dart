import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market_app/bloc/quran/QuranBlocState.dart';
import 'package:market_app/bloc/quran/QuranBlocEvent.dart';
import 'package:market_app/model/Quran.dart';
import 'package:market_app/request/base_request.dart';


class QuranBloc extends Bloc<QuranBLocEvent, QuranBlocState>{

  //Set Initial State of Counter Bloc by return the LatestCounterState Object with newCounterValue = 0



  @override
  QuranBlocState get initialState => GetListState(quran: null);

  @override
  Stream<QuranBlocState> mapEventToState(QuranBLocEvent event) async*{
    final dio = Dio(); // Provide a dio instance
    final client = RestClient(dio);
    Quran quran;

    client.getListQuran().then((it) =>
    (quran = it)
    );
    if(event is GetListQuranSelect){
      Quran currentQuran = quran;
      yield GetListState(quran: currentQuran);

    }

  }

}