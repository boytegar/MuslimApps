import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class getInitHomeEvent extends HomeEvent{

  @override
  List<Object> get props => [];
}


class getDataHomeEvent extends HomeEvent{
  @override
  List<Object> get props => [];

}

class getLocationHomeEvent extends HomeEvent{
  @override
  List<Object> get props => [];

}
