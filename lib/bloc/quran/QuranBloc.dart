import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market_app/bloc/quran/QuranBlocState.dart';
import 'package:market_app/bloc/quran/QuranBlocEvent.dart';
import 'package:market_app/model/Quran.dart';
import 'package:market_app/request/base_request.dart';


class QuranBloc extends Bloc<QuranBLocEvent, QuranBlocState>{

  @override
  QuranBlocState get initialState => InitQuranState();

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

    }

  }

}