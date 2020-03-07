// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListSurat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListSuratAdapter extends TypeAdapter<ListSurat> {
  @override
  final typeId = 4;

  @override
  ListSurat read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListSurat(
      id: fields[0] as int,
      surat: fields[1] as int,
      teks_arab: fields[2] as String,
      teks_transliterasi: fields[3] as String,
      teks_arti: fields[4] as String,
      bookmark: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListSurat obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.surat)
      ..writeByte(2)
      ..write(obj.teks_arab)
      ..writeByte(3)
      ..write(obj.teks_transliterasi)
      ..writeByte(4)
      ..write(obj.teks_arti)
      ..writeByte(5)
      ..write(obj.bookmark);
  }
}
