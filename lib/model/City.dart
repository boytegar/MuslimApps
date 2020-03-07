import 'package:json_annotation/json_annotation.dart';
part 'City.g.dart';

@JsonSerializable(nullable: false)
class City {
    List<Kota> kota;
    Query query;
    String status;

    City({this.kota, this.query, this.status});

    factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

    Map<String, dynamic> toJson() => _$CityToJson(this);
}
@JsonSerializable(nullable: false)
class Kota {
    String id;
    String nama;

    Kota({this.id, this.nama});

    factory Kota.fromJson(Map<String, dynamic> json) => _$KotaFromJson(json);

    Map<String, dynamic> toJson() => _$KotaToJson(this);
}
@JsonSerializable(nullable: false)
class Query {
    String format;
    String nama;

    Query({this.format, this.nama});

    factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);

    Map<String, dynamic> toJson() => _$QueryToJson(this);
}
