import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CategoryTitulares {
  int id;
  String name;
  String image;
  CategoryTitulares({
    required this.id,
    required this.name,
    required this.image,
  });

  CategoryTitulares copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return CategoryTitulares(
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

  factory CategoryTitulares.fromMap(Map<String, dynamic> map) {
    return CategoryTitulares(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryTitulares.fromJson(String source) =>
      CategoryTitulares.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoryTitulares(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant CategoryTitulares other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
