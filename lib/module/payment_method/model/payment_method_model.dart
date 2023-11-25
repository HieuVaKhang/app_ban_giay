// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PaymentMethodModel {
  final String? id;
  final String? name;
  final String? photo;
  PaymentMethodModel({
    this.id,
    this.name,
    this.photo,
  });

  PaymentMethodModel copyWith({
    String? id,
    String? name,
    String? photo,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      name: name ?? this.name,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'photo': photo,
    };
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromJson(String source) => PaymentMethodModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PaymentMethodModel(id: $id, name: $name, photo: $photo)';

  @override
  bool operator ==(covariant PaymentMethodModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.photo == photo;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ photo.hashCode;
}
