// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Localidad {
  final int id;
  final String nombre;
  Localidad({
    required this.id,
    required this.nombre,
  });

  Localidad copyWith({
    int? id,
    String? nombre,
  }) {
    return Localidad(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nombre': nombre,
    };
  }

  factory Localidad.fromMap(Map<String, dynamic> map) {
    return Localidad(
      id: map['id'] as int,
      nombre: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Localidad.fromJson(String source) =>
      Localidad.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Localidad(id: $id, nombre: $nombre)';

  @override
  bool operator ==(covariant Localidad other) {
    if (identical(this, other)) return true;

    return other.id == id && other.nombre == nombre;
  }

  @override
  int get hashCode => id.hashCode ^ nombre.hashCode;
}
