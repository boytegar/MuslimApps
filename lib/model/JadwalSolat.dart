import 'package:json_annotation/json_annotation.dart';
part 'JadwalSolat.g.dart';

@JsonSerializable(nullable: false)
class JadwalSolat {
    Jadwal jadwal;
    Query query;
    String status;

    JadwalSolat({this.jadwal, this.query, this.status});

    factory JadwalSolat.fromJson(Map<String, dynamic> json) => _$JadwalSolatFromJson(json);

    Map<String, dynamic> toJson() => _$JadwalSolatToJson(this);
}

@JsonSerializable(nullable: false)
class Jadwal {
    Data data;
    String status;

    Jadwal({this.data, this.status});

    factory Jadwal.fromJson(Map<String, dynamic> json) => _$JadwalFromJson(json);

    Map<String, dynamic> toJson() => _$JadwalToJson(this);
}

@JsonSerializable(nullable: false)
class Data {
    String ashar;
    String dhuha;
    String dzuhur;
    String imsak;
    String isya;
    String maghrib;
    String subuh;
    String tanggal;
    String terbit;

    Data({this.ashar, this.dhuha, this.dzuhur, this.imsak, this.isya, this.maghrib, this.subuh, this.tanggal, this.terbit});

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(nullable: false)
class Query {
    String format;
    String kota;
    String tanggal;

    Query({this.format, this.kota, this.tanggal});

    factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

    Map<String, dynamic> toJson() => _$QueryToJson(this);
}