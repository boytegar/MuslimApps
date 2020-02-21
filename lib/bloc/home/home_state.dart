import 'package:equatable/equatable.dart';
import 'package:market_app/model/DetailQuran.dart';
import 'package:market_app/model/QuranAcak.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitialHomeState extends HomeState {
  @override
  List<Object> get props => [];
}

class getDataHomeState extends HomeState {

  QuranAcak quran_acak;

  getDataHomeState({this.quran_acak});
  @override
  List<Object> get props => [quran_acak];
}
