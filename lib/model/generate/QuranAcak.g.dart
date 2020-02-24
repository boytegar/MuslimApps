// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../QuranAcak.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranAcak _$QuranAcakFromJson(Map<String, dynamic> json) {
  return QuranAcak(
    status: json['status'] as String,
    query: Query.fromJson(json['query'] as Map<String, dynamic>),
    acak: Acak.fromJson(json['acak'] as Map<String, dynamic>),
    surat: Surat.fromJson(json['surat'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$QuranAcakToJson(QuranAcak instance) => <String, dynamic>{
      'status': instance.status,
      'query': instance.query,
      'acak': instance.acak,
      'surat': instance.surat,
    };

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
    format: json['format'] as String,
  );
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'format': instance.format,
    };

Acak _$AcakFromJson(Map<String, dynamic> json) {
  return Acak(
    id: Id.fromJson(json['id'] as Map<String, dynamic>),
    ar: Id.fromJson(json['ar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AcakToJson(Acak instance) => <String, dynamic>{
      'id': instance.id,
      'ar': instance.ar,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    id: json['id'] as String,
    surat: json['surat'] as String,
    ayat: json['ayat'] as String,
    teks: json['teks'] as String,
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'id': instance.id,
      'surat': instance.surat,
      'ayat': instance.ayat,
      'teks': instance.teks,
    };

Surat _$SuratFromJson(Map<String, dynamic> json) {
  return Surat(
    nomor: json['nomor'] as String,
    nama: json['nama'] as String,
    asma: json['asma'] as String,
    name: json['name'] as String,
    start: json['start'] as String,
    ayat: json['ayat'] as String,
    type: json['type'] as String,
    urut: json['urut'] as String,
    rukuk: json['rukuk'] as String,
    arti: json['arti'] as String,
    keterangan: json['keterangan'] as String,
  );
}

Map<String, dynamic> _$SuratToJson(Surat instance) => <String, dynamic>{
      'nomor': instance.nomor,
      'nama': instance.nama,
      'asma': instance.asma,
      'name': instance.name,
      'start': instance.start,
      'ayat': instance.ayat,
      'type': instance.type,
      'urut': instance.urut,
      'rukuk': instance.rukuk,
      'arti': instance.arti,
      'keterangan': instance.keterangan,
    };
