// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';

class ProductDetailState {
  final int loading;
  final ProductModel product;
  final List<VariantModel> variants;
  final List<ColorModel> colors;
  final List<SizeModel> sizes;
  final int quantity;
  ProductDetailState({
    required this.loading,
    required this.product,
    required this.variants,
    required this.colors,
    required this.sizes,
    required this.quantity,
  });

  ProductDetailState copyWith({
    int? loading,
    ProductModel? product,
    List<VariantModel>? variants,
    List<ColorModel>? colors,
    List<SizeModel>? sizes,
    int? quantity,
  }) {
    return ProductDetailState(
      loading: loading ?? this.loading,
      product: product ?? this.product,
      variants: variants ?? this.variants,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'loading': loading,
      'product': product.toMap(),
      'variants': variants.map((x) => x.toMap()).toList(),
      'colors': colors.map((x) => x.toMap()).toList(),
      'sizes': sizes.map((x) => x.toMap()).toList(),
      'quantity': quantity,
    };
  }

  factory ProductDetailState.fromMap(Map<String, dynamic> map) {
    return ProductDetailState(
      loading: map['loading'] as int,
      product: ProductModel.fromMap(map['product'] as Map<String,dynamic>),
      variants: List<VariantModel>.from((map['variants'] as List<int>).map<VariantModel>((x) => VariantModel.fromMap(x as Map<String,dynamic>),),),
      colors: List<ColorModel>.from((map['colors'] as List<int>).map<ColorModel>((x) => ColorModel.fromMap(x as Map<String,dynamic>),),),
      sizes: List<SizeModel>.from((map['sizes'] as List<int>).map<SizeModel>((x) => SizeModel.fromMap(x as Map<String,dynamic>),),),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDetailState.fromJson(String source) => ProductDetailState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductDetailState(loading: $loading, product: $product, variants: $variants, colors: $colors, sizes: $sizes, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant ProductDetailState other) {
    if (identical(this, other)) return true;
  
    return 
      other.loading == loading &&
      other.product == product &&
      listEquals(other.variants, variants) &&
      listEquals(other.colors, colors) &&
      listEquals(other.sizes, sizes) &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return loading.hashCode ^
      product.hashCode ^
      variants.hashCode ^
      colors.hashCode ^
      sizes.hashCode ^
      quantity.hashCode;
  }
}
