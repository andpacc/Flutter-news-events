// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LugarEventos {
  final int id;
  final String nombre;
  final double latitud;
  final double longitud;
  LugarEventos({
    required this.id,
    required this.nombre,
    required this.latitud,
    required this.longitud,
  });

  LugarEventos copyWith({
    int? id,
    String? nombre,
    double? latitud,
    double? longitud,
  }) {
    return LugarEventos(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      latitud: latitud ?? this.latitud,
      longitud: longitud ?? this.longitud,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'latitud': latitud,
      'longitud': longitud,
    };
  }

  factory LugarEventos.fromMap(Map<String, dynamic> map) {
    return LugarEventos(
      id: map['id'] as int,
      nombre: map['nombre'] as String,
      latitud: map['latitud'] as double,
      longitud: map['longitud'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LugarEventos.fromJson(String source) =>
      LugarEventos.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LugarEventos(id: $id, nombre: $nombre, latitud: $latitud, longitud: $longitud)';
  }

  @override
  bool operator ==(covariant LugarEventos other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nombre == nombre &&
        other.latitud == latitud &&
        other.longitud == longitud;
  }

  @override
  int get hashCode {
    return id.hashCode ^ nombre.hashCode ^ latitud.hashCode ^ longitud.hashCode;
  }
}
