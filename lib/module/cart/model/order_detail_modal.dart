// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_ban_giay/module/cart/model/order_modal.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';

class OrderDetailModal {
  final String? id;
  final VariantModel? idVariant;
  final OrderModal? idOrder;
  final double? price;
  final double? salePrice;
  final int? quantity;
  OrderDetailModal({
    this.id,
    this.idVariant,
    this.idOrder,
    this.price,
    this.salePrice,
    this.quantity,
  });

  OrderDetailModal copyWith({
    String? id,
    VariantModel? idVariant,
    OrderModal? idOrder,
    double? price,
    double? salePrice,
    int? quantity,
  }) {
    return OrderDetailModal(
      id: id ?? this.id,
      idVariant: idVariant ?? this.idVariant,
      idOrder: idOrder ?? this.idOrder,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idVariant': idVariant?.toMap(),
      'idOrder': idOrder?.toMap(),
      'price': price,
      'salePrice': salePrice,
      'quantity': quantity,
    };
  }

  factory OrderDetailModal.fromMap(Map<String, dynamic> map) {
    return OrderDetailModal(
      id: map['id'] != null ? map['id'] as String : null,
      idVariant: map['idVariant'] != null ? VariantModel.fromMap(map['idVariant'] as Map<String,dynamic>) : null,
      idOrder: map['idOrder'] != null ? OrderModal.fromMap(map['idOrder'] as Map<String,dynamic>) : null,
      price: map['price'] != null ? map['price'] as double : null,
      salePrice: map['salePrice'] != null ? map['salePrice'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailModal.fromJson(String source) => OrderDetailModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderDetailModal(id: $id, idVariant: $idVariant, idOrder: $idOrder, price: $price, salePrice: $salePrice, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant OrderDetailModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idVariant == idVariant &&
      other.idOrder == idOrder &&
      other.price == price &&
      other.salePrice == salePrice &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idVariant.hashCode ^
      idOrder.hashCode ^
      price.hashCode ^
      salePrice.hashCode ^
      quantity.hashCode;
  }
}
