// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GenderModel {
  final String? id;
  final String? name;
  GenderModel({
    this.id,
    this.name,
  });

  GenderModel copyWith({
    String? id,
    String? name,
  }) {
    return GenderModel(
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

  factory GenderModel.fromMap(Map<String, dynamic> map) {
    return GenderModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenderModel.fromJson(String source) =>
      GenderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenderModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant GenderModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
