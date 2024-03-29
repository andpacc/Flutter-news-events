// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Music {
  final int id;
  final String autor;
  final String markdown;
  final String foto;
  final String video;
  final String title;
  final int categoria;

  Music({
    required this.id,
    required this.autor,
    required this.markdown,
    required this.foto,
    required this.video,
    required this.title,
    required this.categoria,
  });

  Music copyWith({
    int? id,
    String? autor,
    String? markdown,
    String? foto,
    String? video,
    String? title,
    int? categoria,
  }) {
    return Music(
      id: id ?? this.id,
      autor: autor ?? this.autor,
      markdown: markdown ?? this.markdown,
      foto: foto ?? this.foto,
      video: video ?? this.video,
      title: title ?? this.title,
      categoria: categoria ?? this.categoria,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'autor': autor,
      'markdown': markdown,
      'foto': foto,
      'video': video,
      'title': title,
      'categoria': categoria,
    };
  }

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      id: map['id'] as int,
      autor: map['autor'] as String,
      markdown: map['markdown'] as String,
      foto: map['foto'] as String,
      video: map['video'] as String,
      title: map['title'] as String,
      categoria: map['categoria'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Music.fromJson(String source) =>
      Music.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Music(id: $id, autor: $autor, markdown: $markdown, foto: $foto, video: $video, title: $title, categoria: $categoria)';
  }

  @override
  bool operator ==(covariant Music other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.autor == autor &&
        other.markdown == markdown &&
        other.foto == foto &&
        other.video == video &&
        other.title == title &&
        other.categoria == categoria;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        autor.hashCode ^
        markdown.hashCode ^
        foto.hashCode ^
        video.hashCode ^
        title.hashCode ^
        categoria.hashCode;
  }
}
