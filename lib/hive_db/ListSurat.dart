import 'package:hive/hive.dart';

part 'ListSurat.g.dart';

@HiveType(typeId: 1)
class ListSurat extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  int surat;
  @HiveField(2)
  String teks_arab;
  @HiveField(3)
  String teks_transliterasi;
  @HiveField(4)
  String teks_arti;
  @HiveField(5)
  String bookmark;

  ListSurat({this.id, this.surat, this.teks_arab, this.teks_transliterasi, this.teks_arti, this.bookmark});
}
