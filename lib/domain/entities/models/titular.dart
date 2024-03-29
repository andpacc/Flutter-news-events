// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
import 'dart:convert';

part 'titular.g.dart';

@HiveType(typeId: 1)
class Titular {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String titulo;
  @HiveField(2)
  final String foto;
  @HiveField(3)
  final String descripcion;
  @HiveField(4)
  final DateTime fechahora;
  @HiveField(5)
  final int categoria;
  @HiveField(6)
  final String markdown;
  Titular({
    required this.id,
    required this.titulo,
    required this.foto,
    required this.descripcion,
    required this.fechahora,
    required this.categoria,
    required this.markdown,
  });

  Titular copyWith({
    int? id,
    String? titulo,
    String? foto,
    String? descripcion,
    DateTime? fechahora,
    int? categoria,
    String? markdown,
  }) {
    return Titular(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      foto: foto ?? this.foto,
      descripcion: descripcion ?? this.descripcion,
      fechahora: fechahora ?? this.fechahora,
      categoria: categoria ?? this.categoria,
      markdown: markdown ?? this.markdown,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'foto': foto,
      'descripcion': descripcion,
      'fechahora': fechahora.millisecondsSinceEpoch,
      'categoria': categoria,
      'markdown': markdown,
    };
  }

  factory Titular.fromMap(Map<String, dynamic> map) {
    return Titular(
      id: map['id'] as int,
      titulo: map['titulo'] as String,
      foto: map['foto'] as String,
      descripcion: map['descripcion'] as String,
      fechahora: DateTime.parse(map['fechahora']),
      categoria: map['categoria'] as int,
      markdown: map['markdown'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Titular.fromJson(String source) =>
      Titular.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Titular(id: $id, titulo: $titulo, foto: $foto, descripcion: $descripcion, fechahora: $fechahora, categoria: $categoria, markkdown: $markdown)';
  }

  @override
  bool operator ==(covariant Titular other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.foto == foto &&
        other.descripcion == descripcion &&
        other.fechahora == fechahora &&
        other.categoria == categoria &&
        other.markdown == markdown;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        foto.hashCode ^
        descripcion.hashCode ^
        fechahora.hashCode ^
        categoria.hashCode ^
        markdown.hashCode;
  }
}
