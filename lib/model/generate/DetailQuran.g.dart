// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../DetailQuran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailQuran _$DetailQuranFromJson(Map<String, dynamic> json) {
  return DetailQuran(
    hasil: (json['hasil'] as List)
        .map((e) => Hasil.fromJson(e as Map<String, dynamic>))
        .toList(),
    query: Query.fromJson(json['query'] as Map<String, dynamic>),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$DetailQuranToJson(DetailQuran instance) =>
    <String, dynamic>{
      'hasil': instance.hasil,
      'query': instance.query,
      'status': instance.status,
    };

Hasil _$HasilFromJson(Map<String, dynamic> json) {
  return Hasil(
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

Map<String, dynamic> _$HasilToJson(Hasil instance) => <String, dynamic>{
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

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
    format: json['format'] as String,
    surat: json['surat'] as String,
  );
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'format': instance.format,
      'surat': instance.surat,
    };
