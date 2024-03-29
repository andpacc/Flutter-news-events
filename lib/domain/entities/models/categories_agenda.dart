// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoriesAgenda {
  final int id;
  final String name;
  CategoriesAgenda({
    required this.id,
    required this.name,
  });

  CategoriesAgenda copyWith({
    int? id,
    String? name,
  }) {
    return CategoriesAgenda(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CategoriesAgenda.fromMap(Map<String, dynamic> map) {
    return CategoriesAgenda(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesAgenda.fromJson(String source) =>
      CategoriesAgenda.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesAgenda(id: $id, name: $name)';

  @override
  bool operator ==(covariant CategoriesAgenda other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
