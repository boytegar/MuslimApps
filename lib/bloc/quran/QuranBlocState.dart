import 'package:equatable/equatable.dart';
import 'package:muslimapps/model/Quran.dart';

//Base class for all the Bloc states
abstract class QuranBlocState extends Equatable{

}

class GetListState extends QuranBlocState{
   var quran;

  GetListState({this.quran});

  //overide this method as base class extends equatable and pass property inside props list
  @override
  List<Object> get props => [quran];
}

class GetListStateFromDb extends QuranBlocState{

  var list_quran;

  GetListStateFromDb({this.list_quran});

  @override
  List<Object> get props =>[list_quran] ;

}

class getStatusInsertState extends QuranBlocState{

  var status;

  getStatusInsertState({this.status});

  @override
  List<Object> get props =>[status] ;

}

class InitQuranState extends QuranBlocState{

  //overide this method as base class extends equatable and pass property inside props list
  @override
  List<Object> get props => [];
}