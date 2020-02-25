import 'package:equatable/equatable.dart';

abstract class DetailQuranEvent extends Equatable {
  const DetailQuranEvent();
}
class getInitDetailEvent extends DetailQuranEvent{

  @override
  List<Object> get props => [];
}

class getDataEvent extends DetailQuranEvent{
  String no;
  String ayat;

  getDataEvent({this.no, this.ayat});
  @override
  List<Object> get props => [no, ayat];

}

class regetDataEvent extends DetailQuranEvent{
  @override
  List<Object> get props => [];

}