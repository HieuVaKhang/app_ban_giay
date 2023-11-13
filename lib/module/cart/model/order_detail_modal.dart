// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderDetailModal {
  final String? id;
  final String? idVariant;
  final String? idOrder;
  final double? price;
  final double? priceScale;
  final int? quantity;
  OrderDetailModal({
    this.id,
    this.idVariant,
    this.idOrder,
    this.price,
    this.priceScale,
    this.quantity,
  });

  OrderDetailModal copyWith({
    String? id,
    String? idVariant,
    String? idOrder,
    double? price,
    double? priceScale,
    int? quantity,
  }) {
    return OrderDetailModal(
      id: id ?? this.id,
      idVariant: idVariant ?? this.idVariant,
      idOrder: idOrder ?? this.idOrder,
      price: price ?? this.price,
      priceScale: priceScale ?? this.priceScale,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idVariant': idVariant,
      'idOrder': idOrder,
      'price': price,
      'priceScale': priceScale,
      'quantity': quantity,
    };
  }

  factory OrderDetailModal.fromMap(Map<String, dynamic> map) {
    return OrderDetailModal(
      id: map['id'] != null ? map['id'] as String : null,
      idVariant: map['idVariant'] != null ? map['idVariant'] as String : null,
      idOrder: map['idOrder'] != null ? map['idOrder'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      priceScale: map['priceScale'] != null ? map['priceScale'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailModal.fromJson(String source) => OrderDetailModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderDetailModal(id: $id, idVariant: $idVariant, idOrder: $idOrder, price: $price, priceScale: $priceScale, quantity: $quantity)';
  }

  @override
  bool operator ==(covariant OrderDetailModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idVariant == idVariant &&
      other.idOrder == idOrder &&
      other.price == price &&
      other.priceScale == priceScale &&
      other.quantity == quantity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idVariant.hashCode ^
      idOrder.hashCode ^
      price.hashCode ^
      priceScale.hashCode ^
      quantity.hashCode;
  }
}
