// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JadwalSolat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JadwalSolat _$JadwalSolatFromJson(Map<String, dynamic> json) {
  return JadwalSolat(
    jadwal: Jadwal.fromJson(json['jadwal'] as Map<String, dynamic>),
    query: Query.fromJson(json['query'] as Map<String, dynamic>),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$JadwalSolatToJson(JadwalSolat instance) =>
    <String, dynamic>{
      'jadwal': instance.jadwal,
      'query': instance.query,
      'status': instance.status,
    };

Jadwal _$JadwalFromJson(Map<String, dynamic> json) {
  return Jadwal(
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$JadwalToJson(Jadwal instance) => <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    ashar: json['ashar'] as String,
    dhuha: json['dhuha'] as String,
    dzuhur: json['dzuhur'] as String,
    imsak: json['imsak'] as String,
    isya: json['isya'] as String,
    maghrib: json['maghrib'] as String,
    subuh: json['subuh'] as String,
    tanggal: json['tanggal'] as String,
    terbit: json['terbit'] as String,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ashar': instance.ashar,
      'dhuha': instance.dhuha,
      'dzuhur': instance.dzuhur,
      'imsak': instance.imsak,
      'isya': instance.isya,
      'maghrib': instance.maghrib,
      'subuh': instance.subuh,
      'tanggal': instance.tanggal,
      'terbit': instance.terbit,
    };

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
    format: json['format'] as String,
    kota: json['kota'] as String,
    tanggal: json['tanggal'] as String,
  );
}

Map<String, dynamic> _$QueryToJson(Query instance) => <String, dynamic>{
      'format': instance.format,
      'kota': instance.kota,
      'tanggal': instance.tanggal,
    };
