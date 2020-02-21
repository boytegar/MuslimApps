// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListDetailQuran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListDetailQuran _$ListDetailQuranFromJson(Map<String, dynamic> json) {
  return ListDetailQuran(
    ayat: Ayat.fromJson(json['ayat'] as Map<String, dynamic>),
    bahasa: Bahasa.fromJson(json['bahasa'] as Map<String, dynamic>),
    query: Query.fromJson(json['query'] as Map<String, dynamic>),
    status: json['status'] as String,
    surat: Surat.fromJson(json['surat'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListDetailQuranToJson(ListDetailQuran instance) =>
    <String, dynamic>{
      'ayat': instance.ayat,
      'bahasa': instance.bahasa,
      'query': instance.query,
      'status': instance.status,
      'surat': instance.surat,
    };

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
    ayat: json['ayat'] as String,
    ayat2: (json['ayat2'] as List).map((e) => e as int).toList(),
    bahasa: json['bahasa'] as String,
    bahasa2: (json['bahasa2'] as List).map((e) => e as String).toList(),
    format: json['format'] as String,
    surat: json['surat'] as String,
  );
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'ayat': instance.ayat,
      'ayat2': instance.ayat2,
      'bahasa': instance.bahasa,
      'bahasa2': instance.bahasa2,
      'format': instance.format,
      'surat': instance.surat,
    };

Bahasa _$BahasaFromJson(Map<String, dynamic> json) {
  return Bahasa(
    keterangan: (json['keterangan'] as List).map((e) => e as String).toList(),
    proses: (json['proses'] as List).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$BahasaToJson(Bahasa instance) => <String, dynamic>{
      'keterangan': instance.keterangan,
      'proses': instance.proses,
    };

Surat _$SuratFromJson(Map<String, dynamic> json) {
  return Surat(
    arti: json['arti'] as String,
    asma: json['asma'] as String,
    ayat: json['ayat'] as String,
    keterangan: json['keterangan'] as String,
    nama: json['nama'] as String,
    name: json['name'] as String,
    nomor: json['nomor'] as String,
    rukuk: json['rukuk'] as String,
    start: json['start'] as String,
    type: json['type'] as String,
    urut: json['urut'] as String,
  );
}

Map<String, dynamic> _$SuratToJson(Surat instance) => <String, dynamic>{
      'arti': instance.arti,
      'asma': instance.asma,
      'ayat': instance.ayat,
      'keterangan': instance.keterangan,
      'nama': instance.nama,
      'name': instance.name,
      'nomor': instance.nomor,
      'rukuk': instance.rukuk,
      'start': instance.start,
      'type': instance.type,
      'urut': instance.urut,
    };

Ayat _$AyatFromJson(Map<String, dynamic> json) {
  return Ayat(
    sdata: Data.fromJson(json['sdata'] as Map<String, dynamic>),
    proses: (json['proses'] as List).map((e) => e as int).toList(),
  );
}

Map<String, dynamic> _$AyatToJson(Ayat instance) => <String, dynamic>{
      'sdata': instance.sdata,
      'proses': instance.proses,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    ar: (json['ar'] as List)
        .map((e) => Ar.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: (json['id'] as List)
        .map((e) => Id.fromJson(e as Map<String, dynamic>))
        .toList(),
    idt: (json['idt'] as List)
        .map((e) => Idt.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ar': instance.ar,
      'id': instance.id,
      'idt': instance.idt,
    };

Idt _$IdtFromJson(Map<String, dynamic> json) {
  return Idt(
    ayat: json['ayat'] as String,
    id: json['id'] as String,
    surat: json['surat'] as String,
    teks: json['teks'] as String,
  );
}

Map<String, dynamic> _$IdtToJson(Idt instance) => <String, dynamic>{
      'ayat': instance.ayat,
      'id': instance.id,
      'surat': instance.surat,
      'teks': instance.teks,
    };

Ar _$ArFromJson(Map<String, dynamic> json) {
  return Ar(
    ayat: json['ayat'] as String,
    id: json['id'] as String,
    surat: json['surat'] as String,
    teks: json['teks'] as String,
  );
}

Map<String, dynamic> _$ArToJson(Ar instance) => <String, dynamic>{
      'ayat': instance.ayat,
      'id': instance.id,
      'surat': instance.surat,
      'teks': instance.teks,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    ayat: json['ayat'] as String,
    id: json['id'] as String,
    surat: json['surat'] as String,
    teks: json['teks'] as String,
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'ayat': instance.ayat,
      'id': instance.id,
      'surat': instance.surat,
      'teks': instance.teks,
    };
