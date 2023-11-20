// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
  final String? id;
  final String? name;
  final String? description;
  final String? content;
  final String? photo;
  NewsModel({
    this.id,
    this.name,
    this.description,
    this.content,
    this.photo,
  });

  NewsModel copyWith({
    String? id,
    String? name,
    String? description,
    String? content,
    String? photo,
  }) {
    return NewsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      content: content ?? this.content,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'content': content,
      'photo': photo,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NewsModel(id: $id, name: $name, description: $description, content: $content, photo: $photo)';
  }

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.content == content &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        content.hashCode ^
        photo.hashCode;
  }
}
