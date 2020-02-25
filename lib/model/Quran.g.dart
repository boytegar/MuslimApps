// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Quran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quran _$QuranFromJson(Map<String, dynamic> json) {
  return Quran(
    status: json['status'] as String,
    query: Query.fromJson(json['query'] as Map<String, dynamic>),
    hasil: (json['hasil'] as List)
        .map((e) => Hasil.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuranToJson(Quran instance) => <String, dynamic>{
      'status': instance.status,
      'query': instance.query,
      'hasil': instance.hasil,
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

Hasil _$HasilFromJson(Map<String, dynamic> json) {
  return Hasil(
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

Map<String, dynamic> _$HasilToJson(Hasil instance) => <String, dynamic>{
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
