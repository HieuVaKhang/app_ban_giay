// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final String? id;
  final String? idCategory;
  final String? idMaterial;
  final String? idGender;
  final String? name;
  final double? price;
  final double? salePrice;
  final String? description;
  final String? photo;
  final String? colorId;
  final String? colorName;
  final String? sizeId;
  final String? sizeName;
  ProductModel({
    this.id,
    this.idCategory,
    this.idMaterial,
    this.idGender,
    this.name,
    this.price,
    this.salePrice,
    this.description,
    this.photo,
    this.colorId,
    this.colorName,
    this.sizeId,
    this.sizeName,
  });

  ProductModel copyWith({
    String? id,
    String? idCategory,
    String? idMaterial,
    String? idGender,
    String? name,
    double? price,
    double? salePrice,
    String? description,
    String? photo,
    String? colorId,
    String? colorName,
    String? sizeId,
    String? sizeName,
  }) {
    return ProductModel(
      id: id ?? this.id,
      idCategory: idCategory ?? this.idCategory,
      idMaterial: idMaterial ?? this.idMaterial,
      idGender: idGender ?? this.idGender,
      name: name ?? this.name,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      description: description ?? this.description,
      photo: photo ?? this.photo,
      colorId: colorId ?? this.colorId,
      colorName: colorName ?? this.colorName,
      sizeId: sizeId ?? this.sizeId,
      sizeName: sizeName ?? this.sizeName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idCategory': idCategory,
      'idMaterial': idMaterial,
      'idGender': idGender,
      'name': name,
      'price': price,
      'salePrice': salePrice,
      'description': description,
      'photo': photo,
      'colorId': colorId,
      'colorName': colorName,
      'sizeId': sizeId,
      'sizeName': sizeName,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as String : null,
      idCategory: map['idCategory'] != null ? map['idCategory'] as String : null,
      idMaterial: map['idMaterial'] != null ? map['idMaterial'] as String : null,
      idGender: map['idGender'] != null ? map['idGender'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      salePrice: map['salePrice'] != null ? map['salePrice'] as double : null,
      description: map['description'] != null ? map['description'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      colorId: map['colorId'] != null ? map['colorId'] as String : null,
      colorName: map['colorName'] != null ? map['colorName'] as String : null,
      sizeId: map['sizeId'] != null ? map['sizeId'] as String : null,
      sizeName: map['sizeName'] != null ? map['sizeName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, idCategory: $idCategory, idMaterial: $idMaterial, idGender: $idGender, name: $name, price: $price, salePrice: $salePrice, description: $description, photo: $photo, colorId: $colorId, colorName: $colorName, sizeId: $sizeId, sizeName: $sizeName)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idCategory == idCategory &&
      other.idMaterial == idMaterial &&
      other.idGender == idGender &&
      other.name == name &&
      other.price == price &&
      other.salePrice == salePrice &&
      other.description == description &&
      other.photo == photo &&
      other.colorId == colorId &&
      other.colorName == colorName &&
      other.sizeId == sizeId &&
      other.sizeName == sizeName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idCategory.hashCode ^
      idMaterial.hashCode ^
      idGender.hashCode ^
      name.hashCode ^
      price.hashCode ^
      salePrice.hashCode ^
      description.hashCode ^
      photo.hashCode ^
      colorId.hashCode ^
      colorName.hashCode ^
      sizeId.hashCode ^
      sizeName.hashCode;
  }
}
