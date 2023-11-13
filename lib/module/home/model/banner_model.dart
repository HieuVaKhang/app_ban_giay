// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BannerModel {
  final String? id;
  final String? name;
  final String? photo;
  final String? type;
  BannerModel({
    this.id,
    this.name,
    this.photo,
    this.type,
  });

  BannerModel copyWith({
    String? id,
    String? name,
    String? photo,
    String? type,
  }) {
    return BannerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo,
      'type': type,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BannerModel.fromJson(String source) =>
      BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BannerModel(id: $id, name: $name, photo: $photo, type: $type)';
  }

  @override
  bool operator ==(covariant BannerModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.photo == photo &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ photo.hashCode ^ type.hashCode;
  }
}
