// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titular.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TitularAdapter extends TypeAdapter<Titular> {
  @override
  final int typeId = 1;

  @override
  Titular read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Titular(
      id: fields[0] as int,
      titulo: fields[1] as String,
      foto: fields[2] as String,
      descripcion: fields[3] as String,
      fechahora: fields[4] as DateTime,
      categoria: fields[5] as int,
      markdown: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Titular obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.foto)
      ..writeByte(3)
      ..write(obj.descripcion)
      ..writeByte(4)
      ..write(obj.fechahora)
      ..writeByte(5)
      ..write(obj.categoria)
      ..writeByte(6)
      ..write(obj.markdown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitularAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
