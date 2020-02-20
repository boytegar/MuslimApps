import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

part 'Quran.g.dart';

@JsonSerializable(nullable: false)
class Quran extends Equatable {
  String status;
  Query query;
  List<Hasil> hasil;
  Quran({this.status, this.query, this.hasil});

  factory Quran.fromJson(Map<String, dynamic> json) => _$QuranFromJson(json);
  Map<String, dynamic> toJson() => _$QuranToJson(this);

  List<Object> get props => [status, query, hasil];

}


@JsonSerializable(nullable: false)
class Query {
  String format;
  String surat;
  Query({this.format, this.surat});
  factory Query.fromJson(Map<String, dynamic> json)  => _$QueryFromJson(json);
  Map<String, dynamic> toJson() => _$QueryToJson(this);
}

@JsonSerializable(nullable: false)
class Hasil {
  String nomor;
  String nama;
  String asma;
  String name;
  String start;
  String ayat;
  String type;
  String urut;
  String rukuk;
  String arti;
  String keterangan;

  Hasil(
      {this.nomor,
        this.nama,
        this.asma,
        this.name,
        this.start,
        this.ayat,
        this.type,
        this.urut,
        this.rukuk,
        this.arti,
        this.keterangan});

  factory Hasil.fromJson(Map<String, dynamic> json)  => _$HasilFromJson(json);
  Map<String, dynamic> toJson() => _$HasilToJson(this);
}