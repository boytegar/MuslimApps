import 'package:equatable/equatable.dart';

abstract class DetailQuranEvent extends Equatable {
  const DetailQuranEvent();
}
class getInitDetailEvent extends DetailQuranEvent{

  @override
  List<Object> get props => [];
}

class openBoxEvent extends DetailQuranEvent{
  String no;
  openBoxEvent({this.no});
  @override
  List<Object> get props => [no];
}

class getDataEvent extends DetailQuranEvent{
  String no;
  String ayat;

  getDataEvent({this.no, this.ayat});
  @override
  List<Object> get props => [no, ayat];

}

