// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StatusOrderModel {
  final String? id;
  final String? name;
  StatusOrderModel({
    this.id,
    this.name,
  });

  StatusOrderModel copyWith({
    String? id,
    String? name,
  }) {
    return StatusOrderModel(
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

  factory StatusOrderModel.fromMap(Map<String, dynamic> map) {
    return StatusOrderModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusOrderModel.fromJson(String source) =>
      StatusOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StatusOrderModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant StatusOrderModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
