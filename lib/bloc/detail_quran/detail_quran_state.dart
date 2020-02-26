import 'package:equatable/equatable.dart';
import 'package:muslimapps/bloc/quran/QuranBlocState.dart';

abstract class DetailQuranState extends Equatable {
  const DetailQuranState();
}

class InitialDetailQuranState extends DetailQuranState {
  @override
  List<Object> get props => [];
}

class getDetailQuranState extends DetailQuranState{
  @override
  List<Object> get props => [];
}
class getListDetailQuranState extends DetailQuranState{
  var list_surat;
  getListDetailQuranState({this.list_surat});
  @override
  List<Object> get props => [list_surat];
}

