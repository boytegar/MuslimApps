import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DetailQuran.g.dart';

@JsonSerializable(nullable: false)
class DetailQuran extends Equatable {
  List<Hasil> hasil;
  Query query;
  String status;

  DetailQuran({this.hasil, this.query, this.status});

  factory DetailQuran.fromJson(Map<String, dynamic> json) =>
      _$DetailQuranFromJson(json);

  Map<String, dynamic> toJson() => _$DetailQuranToJson(this);

  @override
  List<Object> get props => [hasil, query, status];
}

@JsonSerializable(nullable: false)
class Hasil {
  String arti;
  String asma;
  String ayat;
  String keterangan;
  String nama;
  String name;
  String nomor;
  String rukuk;
  String start;
  String type;
  String urut;

  Hasil(
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
      this.urut});

  factory Hasil.fromJson(Map<String, dynamic> json) => _$HasilFromJson(json);

  Map<String, dynamic> toJson() => _$HasilToJson(this);
}

@JsonSerializable(nullable: false)
class Query {
  String format;
  String surat;

  Query({this.format, this.surat});

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

  Map<String, dynamic> toJson() => _$QueryToJson(this);
}
