// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ColorModel {
  final String? id;
  final String? name;
  final String? code;
  ColorModel({
    this.id,
    this.name,
    this.code,
  });

  ColorModel copyWith({
    String? id,
    String? name,
    String? code,
  }) {
    return ColorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
    };
  }

  factory ColorModel.fromMap(Map<String, dynamic> map) {
    return ColorModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ColorModel.fromJson(String source) =>
      ColorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ColorModel(id: $id, name: $name, code: $code)';

  @override
  bool operator ==(covariant ColorModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.code == code;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ code.hashCode;
}
