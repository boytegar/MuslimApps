import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class DetailQuranBloc extends Bloc<DetailQuranEvent, DetailQuranState> {
  @override
  DetailQuranState get initialState => InitialDetailQuranState();

  @override
  Stream<DetailQuranState> mapEventToState(
    DetailQuranEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
