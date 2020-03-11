import 'package:equatable/equatable.dart';

abstract class PrayEvent extends Equatable {
  const PrayEvent();
}

class initEvent extends PrayEvent{
  @override

  List<Object> get props => [];
}

class getDataEvent extends PrayEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
