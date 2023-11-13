// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SizeModel {
  final String? id;
  final String? name;
  SizeModel({
    this.id,
    this.name,
  });

  SizeModel copyWith({
    String? id,
    String? name,
  }) {
    return SizeModel(
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

  factory SizeModel.fromMap(Map<String, dynamic> map) {
    return SizeModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SizeModel.fromJson(String source) =>
      SizeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SizeModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant SizeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
