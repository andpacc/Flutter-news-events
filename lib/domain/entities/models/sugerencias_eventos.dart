// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Sugerencias {
  final String titulo;
  final String precio;
  final String lugar;
  final String descripcion;
  final DateTime fechaHora;
  final String categoria;
  final String localidad;
  Sugerencias({
    required this.titulo,
    required this.precio,
    required this.lugar,
    required this.descripcion,
    required this.fechaHora,
    required this.categoria,
    required this.localidad,
  });

  Sugerencias copyWith({
    String? titulo,
    String? precio,
    String? lugar,
    String? descripcion,
    DateTime? fechaHora,
    String? categoria,
    String? localidad,
  }) {
    return Sugerencias(
      titulo: titulo ?? this.titulo,
      precio: precio ?? this.precio,
      lugar: lugar ?? this.lugar,
      descripcion: descripcion ?? this.descripcion,
      fechaHora: fechaHora ?? this.fechaHora,
      categoria: categoria ?? this.categoria,
      localidad: localidad ?? this.localidad,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'precio': precio,
      'lugar': lugar,
      'descripcion': descripcion,
      'fechaHora': fechaHora.toUtc().toIso8601String(),
      'categoria': categoria,
      'localidad': localidad,
    };
  }

  factory Sugerencias.fromMap(Map<String, dynamic> map) {
    return Sugerencias(
      titulo: map['titulo'] as String,
      precio: map['precio'] as String,
      lugar: map['lugar'] as String,
      descripcion: map['descripcion'] as String,
      fechaHora: DateTime.fromMillisecondsSinceEpoch(map['fechahora'] as int),
      categoria: map['categoria'] as String,
      localidad: map['localidad'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sugerencias.fromJson(String source) =>
      Sugerencias.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Sugerencias(titulo: $titulo, precio: $precio, lugar: $lugar, descripcion: $descripcion, fechahora: $fechaHora, categoria: $categoria, localidad: $localidad)';
  }

  @override
  bool operator ==(covariant Sugerencias other) {
    if (identical(this, other)) return true;

    return other.titulo == titulo &&
        other.precio == precio &&
        other.lugar == lugar &&
        other.descripcion == descripcion &&
        other.fechaHora == fechaHora &&
        other.categoria == categoria &&
        other.localidad == localidad;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^
        precio.hashCode ^
        lugar.hashCode ^
        descripcion.hashCode ^
        fechaHora.hashCode ^
        categoria.hashCode ^
        localidad.hashCode;
  }
}
