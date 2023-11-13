// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VariantModel {
  final String? id;
  final String? idSize;
  final String? idColor;
  final String? idProduct;
  final String? photo;
  VariantModel({
    this.id,
    this.idSize,
    this.idColor,
    this.idProduct,
    this.photo,
  });

  VariantModel copyWith({
    String? id,
    String? idSize,
    String? idColor,
    String? idProduct,
    String? photo,
  }) {
    return VariantModel(
      id: id ?? this.id,
      idSize: idSize ?? this.idSize,
      idColor: idColor ?? this.idColor,
      idProduct: idProduct ?? this.idProduct,
      photo: photo ?? this.photo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idSize': idSize,
      'idColor': idColor,
      'idProduct': idProduct,
      'photo': photo,
    };
  }

  factory VariantModel.fromMap(Map<String, dynamic> map) {
    return VariantModel(
      id: map['id'] != null ? map['id'] as String : null,
      idSize: map['idSize'] != null ? map['idSize'] as String : null,
      idColor: map['idColor'] != null ? map['idColor'] as String : null,
      idProduct: map['idProduct'] != null ? map['idProduct'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VariantModel.fromJson(String source) =>
      VariantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VariantModel(id: $id, idSize: $idSize, idColor: $idColor, idProduct: $idProduct, photo: $photo)';
  }

  @override
  bool operator ==(covariant VariantModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.idSize == idSize &&
        other.idColor == idColor &&
        other.idProduct == idProduct &&
        other.photo == photo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idSize.hashCode ^
        idColor.hashCode ^
        idProduct.hashCode ^
        photo.hashCode;
  }
}
