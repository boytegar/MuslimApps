import 'package:hive/hive.dart';

part 'City.g.dart';

@HiveType(typeId: 2)
class City extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String city;
  City({this.id, this.city});
}