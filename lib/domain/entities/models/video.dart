// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Video {
  final int id;
  final String autor;
  final String markdown;
  final String video;
  final String foto;
  final String title;
  final int categoria;
  Video({
    required this.id,
    required this.autor,
    required this.markdown,
    required this.video,
    required this.foto,
    required this.title,
    required this.categoria,
  });

  Video copyWith({
    int? id,
    String? autor,
    String? markdown,
    String? video,
    String? foto,
    String? title,
    int? categoria,
  }) {
    return Video(
      id: id ?? this.id,
      autor: autor ?? this.autor,
      markdown: markdown ?? this.markdown,
      video: video ?? this.video,
      foto: foto ?? this.foto,
      title: title ?? this.title,
      categoria: categoria ?? this.categoria,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'autor': autor,
      'markdown': markdown,
      'video': video,
      'foto': foto,
      'title': title,
      'categoria': categoria,
    };
  }

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] as int,
      autor: map['autor'] as String,
      markdown: map['markdown'] as String,
      video: map['video'] as String,
      foto: map['foto'] as String,
      title: map['title'] as String,
      categoria: map['categoria'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) =>
      Video.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Video(id: $id, autor: $autor, markdown: $markdown, video: $video, foto: $foto, title: $title, categoria: $categoria)';
  }

  @override
  bool operator ==(covariant Video other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.autor == autor &&
        other.markdown == markdown &&
        other.video == video &&
        other.foto == foto &&
        other.title == title &&
        other.categoria == categoria;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        autor.hashCode ^
        markdown.hashCode ^
        video.hashCode ^
        foto.hashCode ^
        title.hashCode ^
        categoria.hashCode;
  }
}
