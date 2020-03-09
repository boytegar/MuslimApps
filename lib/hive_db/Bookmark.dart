import 'package:hive/hive.dart';
part 'Bookmark.g.dart';

@HiveType(typeId: 3)
class Bookmark extends HiveObject{
  @HiveField(0)
  String keys;
  @HiveField(1)
  int surat;
  @HiveField(2)
  int ayat;
  @HiveField(3)
  String nama;

  Bookmark({this.keys, this.surat, this.ayat, this.nama});

}