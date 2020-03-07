// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'City.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) {
  return City(
    kota: (json['kota'] as List)
        .map((e) => Kota.fromJson(e as Map<String, dynamic>))
        .toList(),
    query: Query.fromJson(json['query'] as Map<String, dynamic>),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'kota': instance.kota,
      'query': instance.query,
      'status': instance.status,
    };

Kota _$KotaFromJson(Map<String, dynamic> json) {
  return Kota(
    id: json['id'] as String,
    nama: json['nama'] as String,
  );
}

Map<String, dynamic> _$KotaToJson(Kota instance) => <String, dynamic>{
      'id': instance.id,
      'nama': instance.nama,
    };

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
    format: json['format'] as String,
    nama: json['nama'] as String,
  );
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'format': instance.format,
      'nama': instance.nama,
    };
