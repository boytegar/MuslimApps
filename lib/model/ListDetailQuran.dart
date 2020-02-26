import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ListDetailQuran.g.dart';

@JsonSerializable(nullable: false)
class ListDetailQuran extends Equatable{
    Ayat ayat;
    Bahasa bahasa;
    Query query;
    String status;
    Surat surat;

    ListDetailQuran({this.ayat, this.bahasa, this.query, this.status, this.surat});

    factory ListDetailQuran.fromJson(Map<String, dynamic> json) => _$ListDetailQuranFromJson(json);


    Map<String, dynamic> toJson() => _$ListDetailQuranToJson(this);

  @override
  List<Object> get props => [];
}
@JsonSerializable(nullable: false)
class Ayat {
    Data data;
    List<int> proses;

    Ayat({this.data, this.proses});

    factory Ayat.fromJson(Map<String, dynamic> json) => _$AyatFromJson(json);


    Map<String, dynamic> toJson() => _$AyatToJson(this);
}

@JsonSerializable(nullable: false)
class Data {
    List<Ar> ar;
    List<Id> id;
    List<Idt> idt;

    Data({this.ar, this.id, this.idt});

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(nullable: false)
class Ar {
    String ayat;
    String id;
    String surat;
    String teks;

    Ar({this.ayat, this.id, this.surat, this.teks});

    factory Ar.fromJson(Map<String, dynamic> json) => _$ArFromJson(json);


    Map<String, dynamic> toJson() => _$ArToJson(this);
}

@JsonSerializable(nullable: false)
class Idt {
    String ayat;
    String id;
    String surat;
    String teks;

    Idt({this.ayat, this.id, this.surat, this.teks});

    factory Idt.fromJson(Map<String, dynamic> json) => _$IdtFromJson(json);
    Map<String, dynamic> toJson() => _$IdtToJson(this);
}

@JsonSerializable(nullable: false)
class Id {
    String ayat;
    String id;
    String surat;
    String teks;

    Id({this.ayat, this.id, this.surat, this.teks});

    factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
    Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable(nullable: false)
class Surat {
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

    Surat({this.arti, this.asma, this.ayat, this.keterangan, this.nama, this.name, this.nomor, this.rukuk, this.start, this.type, this.urut});

    factory Surat.fromJson(Map<String, dynamic> json) => _$SuratFromJson(json);

    Map<String, dynamic> toJson() => _$SuratToJson(this);
}

@JsonSerializable(nullable: false)
class Bahasa {
    List<String> keterangan;
    List<String> proses;

    Bahasa({this.keterangan, this.proses});

    factory Bahasa.fromJson(Map<String, dynamic> json) => _$BahasaFromJson(json);


    Map<String, dynamic> toJson() => _$BahasaToJson(this);
}

@JsonSerializable(nullable: false)
class Query {
    String ayat;
    List<int> ayat2;
    String bahasa;
    List<String> bahasa2;
    String format;
    String surat;

    Query({this.ayat, this.ayat2, this.bahasa, this.bahasa2, this.format, this.surat});

    factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

    Map<String, dynamic> toJson() => _$QueryToJson(this);
}