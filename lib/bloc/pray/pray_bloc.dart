import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PrayBloc extends Bloc<PrayEvent, PrayState> {
  @override
  PrayState get initialState => InitialPrayState();

  @override
  Stream<PrayState> mapEventToState(
    PrayEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
