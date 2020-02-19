import 'package:equatable/equatable.dart';

//Base class for all the Bloc states
abstract class QuranBlocState extends Equatable{

}

class GetListState extends QuranBlocState{
  final int newCounterValue;

  GetListState({this.newCounterValue});

  //overide this method as base class extends equatable and pass property inside props list
  @override
  List<Object> get props => [newCounterValue];
}