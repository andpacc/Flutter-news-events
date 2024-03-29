// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agenda.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AgendaAdapter extends TypeAdapter<Agenda> {
  @override
  final int typeId = 0;

  @override
  Agenda read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Agenda(
      id: fields[0] as int,
      titulo: fields[1] as String,
      lugar: fields[2] as int,
      fechahora: fields[3] as DateTime,
      precio: fields[4] as String,
      localidad: fields[5] as int,
      categoria: fields[6] as int,
      markkdown: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Agenda obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titulo)
      ..writeByte(2)
      ..write(obj.lugar)
      ..writeByte(3)
      ..write(obj.fechahora)
      ..writeByte(4)
      ..write(obj.precio)
      ..writeByte(5)
      ..write(obj.localidad)
      ..writeByte(6)
      ..write(obj.categoria)
      ..writeByte(7)
      ..write(obj.markkdown);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgendaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
