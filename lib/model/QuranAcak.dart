
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generate/QuranAcak.g.dart';

//@JsonSerializable(nullable: false)
class QuranAcak extends Equatable {
  String status;
  Query query;
  Acak acak;
  Surat surat;

  QuranAcak({this.status, this.query, this.acak, this.surat});




  factory QuranAcak.fromJson(Map<String, dynamic> json)  => _$QuranAcakFromJson(json);
  Map<String, dynamic> toJson() => _$QuranAcakToJson(this);

  List<Object> get props => [status, query, acak, surat];
}

//@JsonSerializable(nullable: false)
class Query {
  String format;

  Query({this.format});

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);
  Map<String, dynamic> toJson() => _$QueryToJson(this);
}

//@JsonSerializable(nullable: false)
class Acak {
  Id id;
  Id ar;

  Acak({this.id, this.ar});

  factory Acak.fromJson(Map<String, dynamic> json) => _$AcakFromJson(json);
  Map<String, dynamic> toJson() => _$AcakToJson(this);
}

//@JsonSerializable(nullable: false)
class Id {
  String id;
  String surat;
  String ayat;
  String teks;

  Id({this.id, this.surat, this.ayat, this.teks});

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
  Map<String, dynamic> toJson()  => _$IdToJson(this);
}

//@JsonSerializable(nullable: false)
class Surat {
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

  Surat(
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

  factory Surat.fromJson(Map<String, dynamic> json) => _$SuratFromJson(json);

  Map<String, dynamic> toJson() => _$SuratToJson(this);
}
