import 'package:hive/hive.dart';

part 'ListQuran.g.dart';

@HiveType(typeId: 0)
class ListQuran extends HiveObject{

  @HiveField(0)
  String arti;
  @HiveField(1)
  String asma;
  @HiveField(2)
  String ayat;
  @HiveField(3)
  String keterangan;
  @HiveField(4)
  String nama;
  @HiveField(5)
  String name;
  @HiveField(6)
  String nomor;
  @HiveField(7)
  String rukuk;
  @HiveField(8)
  String start;
  @HiveField(9)
  String type;
  @HiveField(10)
  String urut;
  @HiveField(11)
  String status;


  ListQuran(
      {this.arti,
      this.asma,
      this.ayat,
      this.keterangan,
      this.nama,
      this.name,
      this.nomor,
      this.rukuk,
      this.start,
      this.type,
      this.urut,
      this.status
      });
  }


