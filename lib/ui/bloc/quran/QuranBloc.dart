import 'package:bloc/bloc.dart';
import 'package:market_app/ui/bloc/quran/QuranBlocState.dart';
import 'package:market_app/ui/bloc/quran/QuranBlocEvent.dart';


class CounterBloc extends Bloc<QuranBLocEvent, QuranBlocState>{

  //Set Initial State of Counter Bloc by return the LatestCounterState Object with newCounterValue = 0
  @override
  QuranBlocState get initialState => GetListState(newCounterValue: 0);

  @override
  Stream<QuranBlocState> mapEventToState(QuranBLocEvent event) async*{

    // TODO: implement mapEventToState
    if(event is IncreaseCounterEvent){
      int currentCounterValue = (state as GetListState).newCounterValue;
      int newCounterValue = currentCounterValue + 1;
      yield GetListState(newCounterValue: newCounterValue);

    }else if(event is DecreaseCounterEvent){
      int currentCounterValue = (state as GetListState).newCounterValue;
      int newCounterValue = currentCounterValue - 1;
      yield GetListState(newCounterValue: newCounterValue);

    }

  }

}