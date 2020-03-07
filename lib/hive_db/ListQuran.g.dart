// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListQuran.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListQuranAdapter extends TypeAdapter<ListQuran> {
  @override
  final typeId = 0;

  @override
  ListQuran read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListQuran(
      arti: fields[0] as String,
      asma: fields[1] as String,
      ayat: fields[2] as String,
      keterangan: fields[3] as String,
      nama: fields[4] as String,
      name: fields[5] as String,
      nomor: fields[6] as String,
      rukuk: fields[7] as String,
      start: fields[8] as String,
      type: fields[9] as String,
      urut: fields[10] as String,
      status: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ListQuran obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.arti)
      ..writeByte(1)
      ..write(obj.asma)
      ..writeByte(2)
      ..write(obj.ayat)
      ..writeByte(3)
      ..write(obj.keterangan)
      ..writeByte(4)
      ..write(obj.nama)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(6)
      ..write(obj.nomor)
      ..writeByte(7)
      ..write(obj.rukuk)
      ..writeByte(8)
      ..write(obj.start)
      ..writeByte(9)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.urut)
      ..writeByte(11)
      ..write(obj.status);
  }
}
