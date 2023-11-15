// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';

class PaymentModel {
  final List<ProductModel> products;
  final UserInfoModel? selectedUserInfo;
  final PaymentModel? selectedPayment;
  final double? temp;
  final double? total;
  PaymentModel({
    required this.products,
    this.selectedUserInfo,
    this.selectedPayment,
    this.temp,
    this.total,
  });
  

  PaymentModel copyWith({
    List<ProductModel>? products,
    UserInfoModel? selectedUserInfo,
    PaymentModel? selectedPayment,
    double? temp,
    double? total,
  }) {
    return PaymentModel(
      products: products ?? this.products,
      selectedUserInfo: selectedUserInfo ?? this.selectedUserInfo,
      selectedPayment: selectedPayment ?? this.selectedPayment,
      temp: temp ?? this.temp,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'selectedUserInfo': selectedUserInfo?.toMap(),
      'selectedPayment': selectedPayment?.toMap(),
      'temp': temp,
      'total': total,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      products: List<ProductModel>.from((map['products'] as List<int>).map<ProductModel>((x) => ProductModel.fromMap(x as Map<String,dynamic>),),),
      selectedUserInfo: map['selectedUserInfo'] != null ? UserInfoModel.fromMap(map['selectedUserInfo'] as Map<String,dynamic>) : null,
      selectedPayment: map['selectedPayment'] != null ? PaymentModel.fromMap(map['selectedPayment'] as Map<String,dynamic>) : null,
      temp: map['temp'] != null ? map['temp'] as double : null,
      total: map['total'] != null ? map['total'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) => PaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentModel(products: $products, selectedUserInfo: $selectedUserInfo, selectedPayment: $selectedPayment, temp: $temp, total: $total)';
  }

  @override
  bool operator ==(covariant PaymentModel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.products, products) &&
      other.selectedUserInfo == selectedUserInfo &&
      other.selectedPayment == selectedPayment &&
      other.temp == temp &&
      other.total == total;
  }

  @override
  int get hashCode {
    return products.hashCode ^
      selectedUserInfo.hashCode ^
      selectedPayment.hashCode ^
      temp.hashCode ^
      total.hashCode;
  }
}
