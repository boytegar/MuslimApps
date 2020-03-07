// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Bookmark.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookmarkAdapter extends TypeAdapter<Bookmark> {
  @override
  final typeId = 3;

  @override
  Bookmark read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bookmark(
      keys: fields[0] as String,
      surat: fields[1] as int,
      ayat: fields[2] as int,
      nama: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bookmark obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.keys)
      ..writeByte(1)
      ..write(obj.surat)
      ..writeByte(2)
      ..write(obj.ayat)
      ..writeByte(3)
      ..write(obj.nama);
  }
}
