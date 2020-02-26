import 'package:equatable/equatable.dart';
import 'package:muslimapps/model/Quran.dart';

//Base class for all the Bloc states
abstract class QuranBlocState extends Equatable{

}

class getListState extends QuranBlocState{
   var quran;

  getListState({this.quran});

  //overide this method as base class extends equatable and pass property inside props list
  @override
  List<Object> get props => [quran];
}

class getListStateFromDb extends QuranBlocState{

  var list_quran_data;

  getListStateFromDb({this.list_quran_data});

  @override
  List<Object> get props =>[list_quran_data] ;

}




class initQuranState extends QuranBlocState{

  //overide this method as base class extends equatable and pass property inside props list
  @override
  List<Object> get props => [];
}