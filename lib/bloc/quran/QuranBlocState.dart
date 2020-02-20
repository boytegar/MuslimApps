import 'package:equatable/equatable.dart';
import 'package:market_app/model/Quran.dart';

//Base class for all the Bloc states
abstract class QuranBlocState extends Equatable{

}

class GetListState extends QuranBlocState{
  final Quran quran;

  GetListState({this.quran});

  //overide this method as base class extends equatable and pass property inside props list
  @override
  List<Object> get props => [quran];
}

class InitQuranState extends QuranBlocState{


  //overide this method as base class extends equatable and pass property inside props list
  @override
  List<Object> get props => [];
}