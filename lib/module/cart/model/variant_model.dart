// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';

class VariantModel {
  final String id;
  final ProductModel model;
  final ColorModel color;
  final SizeModel size;
  final double price;
  final double salePrice;
  final int quantity;

  VariantModel({
    required this.id,
    required this.model,
    required this.color,
    required this.size,
    required this.price,
    required this.salePrice,
    required this.quantity,
  });

  VariantModel copyWith({
    String? id,
    ProductModel? model,
    ColorModel? color,
    SizeModel? size,
    double? price,
    double? salePrice,
    int? quantity,
  }) {
    return VariantModel(
      id: id ?? this.id,
      model: model ?? this.model,
      color: color ?? this.color,
      size: size ?? this.size,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'model': model.toMap(),
      'color': color.toMap(),
      'size': size.toMap(),
      'price': price,
      'salePrice': salePrice,
      'quantity': quantity,
    };
  }

  factory VariantModel.fromMap(Map<String, dynamic> map) {
    return VariantModel(
      id: map['id'] as String,
      model: ProductModel.fromMap(map['model'] as Map<String,dynamic>),
      color: ColorModel.fromMap(map['color'] as Map<String,dynamic>),
      size: SizeModel.fromMap(map['size'] as Map<String,dynamic>),
      price: map['price'] as double,
      salePrice: map['salePrice'] as double,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VariantModel.fromJson(String source) => VariantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VariantModel(id: $id, model: $model, color: $color, size: $size, price: $price, salePrice: $salePrice, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant VariantModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.model == model &&
      other.color == color &&
      other.size == size &&
      other.price == price &&
      other.salePrice == salePrice &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      model.hashCode ^
      color.hashCode ^
      size.hashCode ^
      price.hashCode ^
      salePrice.hashCode ^
      quantity.hashCode;
  }
}
