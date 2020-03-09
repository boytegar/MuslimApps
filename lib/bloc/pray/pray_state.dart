import 'package:equatable/equatable.dart';

abstract class PrayState extends Equatable {
  const PrayState();
}

class InitialPrayState extends PrayState {
  @override
  List<Object> get props => [];
}
