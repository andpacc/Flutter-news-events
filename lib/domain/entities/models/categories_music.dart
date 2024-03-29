// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CategoryMusic {
  final int id;
  final String name;
  final String image;
  CategoryMusic({
    required this.id,
    required this.name,
    required this.image,
  });

  CategoryMusic copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return CategoryMusic(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory CategoryMusic.fromMap(Map<String, dynamic> map) {
    return CategoryMusic(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryMusic.fromJson(String source) =>
      CategoryMusic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryMusic(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant CategoryMusic other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
