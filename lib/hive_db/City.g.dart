// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'City.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityAdapter extends TypeAdapter<City> {
  @override
  final typeId = 2;

  @override
  City read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return City(
      id: fields[0] as int,
      city: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, City obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.city);
  }
}
