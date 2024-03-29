import 'dart:convert';
import 'package:hive/hive.dart';
part 'agenda.g.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
@HiveType(typeId: 0)
class Agenda {
  @HiveField(0)
  int id;
  @HiveField(1)
  String titulo;
  @HiveField(2)
  int lugar;
  @HiveField(3)
  DateTime fechahora;
  @HiveField(4)
  String precio;
  @HiveField(5)
  int localidad;
  @HiveField(6)
  int categoria;
  @HiveField(7)
  String markkdown;

  Agenda({
    required this.id,
    required this.titulo,
    required this.lugar,
    required this.fechahora,
    required this.precio,
    required this.localidad,
    required this.categoria,
    required this.markkdown,
  });

  Agenda copyWith({
    int? id,
    String? titulo,
    int? lugar,
    DateTime? fechahora,
    String? precio,
    int? localidad,
    int? categoria,
    String? markkdown,
  }) {
    return Agenda(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      lugar: lugar ?? this.lugar,
      fechahora: fechahora ?? this.fechahora,
      precio: precio ?? this.precio,
      localidad: localidad ?? this.localidad,
      categoria: categoria ?? this.categoria,
      markkdown: markkdown ?? this.markkdown,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'lugar': lugar,
      'fechahora': fechahora.millisecondsSinceEpoch,
      'precio': precio,
      'localidad': localidad,
      'categoria': categoria,
      'markkdown': markkdown,
    };
  }

  factory Agenda.fromMap(Map<String, dynamic> map) {
    return Agenda(
      id: map['id'] as int,
      titulo: map['titulo'] as String,
      lugar: map['lugar'] as int,
      fechahora: DateTime.parse(map['fechahora']),
      precio: map['precio'] as String,
      localidad: map['localidad'] as int,
      categoria: map['categoria'] as int,
      markkdown: map['markkdown'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Agenda.fromJson(String source) =>
      Agenda.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Agenda(id: $id, titulo: $titulo, lugar: $lugar, fechahora: $fechahora, precio: $precio, localidad: $localidad, categoria: $categoria, markkdown: $markkdown)';
  }

  @override
  bool operator ==(covariant Agenda other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.lugar == lugar &&
        other.fechahora == fechahora &&
        other.precio == precio &&
        other.localidad == localidad &&
        other.categoria == categoria &&
        other.markkdown == markkdown;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        lugar.hashCode ^
        fechahora.hashCode ^
        precio.hashCode ^
        localidad.hashCode ^
        categoria.hashCode ^
        markkdown.hashCode;
  }
}
