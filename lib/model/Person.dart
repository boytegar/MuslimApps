import 'package:equatable/equatable.dart';

class Person extends Equatable{
  String name;

  @override
  // TODO: implement props
  List<Object> get props => [name];
}