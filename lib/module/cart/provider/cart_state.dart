// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/payment_method/model/payment_method_model.dart';

class CartState {
  final List<VariantModel>? listProduct;
  final UserInfoModel? selectUserInfo;
  final PaymentMethodModel? selectePaymentMethod;
  final double total;
  final bool isLoading;
  final bool error;
  CartState({
    this.listProduct,
    this.selectUserInfo,
    this.selectePaymentMethod,
    required this.total,
    required this.isLoading,
    required this.error,
  });

  CartState copyWith({
    List<VariantModel>? listProduct,
    UserInfoModel? selectUserInfo,
    PaymentMethodModel? selectePaymentMethod,
    double? total,
    bool? isLoading,
    bool? error,
  }) {
    return CartState(
      listProduct: listProduct ?? this.listProduct,
      selectUserInfo: selectUserInfo ?? this.selectUserInfo,
      selectePaymentMethod: selectePaymentMethod ?? this.selectePaymentMethod,
      total: total ?? this.total,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listProduct': listProduct?.map((x) => x.toMap()).toList() ?? [],
      'selectUserInfo': selectUserInfo?.toMap(),
      'selectePaymentMethod': selectePaymentMethod?.toMap(),
      'total': total,
      'isLoading': isLoading,
      'error': error,
    };
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      listProduct: map['listProduct'] != null ? List<VariantModel>.from((map['listProduct'] as List<int>).map<VariantModel?>((x) => VariantModel.fromMap(x as Map<String,dynamic>),),) : null,
      selectUserInfo: map['selectUserInfo'] != null ? UserInfoModel.fromMap(map['selectUserInfo'] as Map<String,dynamic>) : null,
      selectePaymentMethod: map['selectePaymentMethod'] != null ? PaymentMethodModel.fromMap(map['selectePaymentMethod'] as Map<String,dynamic>) : null,
      total: map['total'] as double,
      isLoading: map['isLoading'] as bool,
      error: map['error'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState.fromJson(String source) => CartState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartState(listProduct: $listProduct, selectUserInfo: $selectUserInfo, selectePaymentMethod: $selectePaymentMethod, total: $total, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(covariant CartState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.listProduct, listProduct) &&
      other.selectUserInfo == selectUserInfo &&
      other.selectePaymentMethod == selectePaymentMethod &&
      other.total == total &&
      other.isLoading == isLoading &&
      other.error == error;
  }

  @override
  int get hashCode {
    return listProduct.hashCode ^
      selectUserInfo.hashCode ^
      selectePaymentMethod.hashCode ^
      total.hashCode ^
      isLoading.hashCode ^
      error.hashCode;
  }
}
