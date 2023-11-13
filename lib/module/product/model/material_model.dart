// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MaterialModel {
  final String? id;
  final String? name;
  MaterialModel({
    this.id,
    this.name,
  });

  MaterialModel copyWith({
    String? id,
    String? name,
  }) {
    return MaterialModel(
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

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialModel.fromJson(String source) =>
      MaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MaterialModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant MaterialModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
