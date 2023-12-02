// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/payment_method/model/payment_method_model.dart';

class CartState {
  final List<VariantModel> listProduct;
  final UserInfoModel selectUserInfo;
  final List<UserInfoModel> listUserInfo;
  final List<PaymentMethodModel> listPaymentMethod;
  final PaymentMethodModel selectePaymentMethod;
  final int totalQTT;
  final double total;
  final int isLoading;
  CartState({
    required this.listProduct,
    required this.selectUserInfo,
    required this.listUserInfo,
    required this.listPaymentMethod,
    required this.selectePaymentMethod,
    required this.totalQTT,
    required this.total,
    required this.isLoading,
  });

  CartState copyWith({
    List<VariantModel>? listProduct,
    UserInfoModel? selectUserInfo,
    List<UserInfoModel>? listUserInfo,
    List<PaymentMethodModel>? listPaymentMethod,
    PaymentMethodModel? selectePaymentMethod,
    int? totalQTT,
    double? total,
    int? isLoading,
  }) {
    return CartState(
      listProduct: listProduct ?? this.listProduct,
      selectUserInfo: selectUserInfo ?? this.selectUserInfo,
      listUserInfo: listUserInfo ?? this.listUserInfo,
      listPaymentMethod: listPaymentMethod ?? this.listPaymentMethod,
      selectePaymentMethod: selectePaymentMethod ?? this.selectePaymentMethod,
      totalQTT: totalQTT ?? this.totalQTT,
      total: total ?? this.total,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listProduct': listProduct.map((x) => x.toMap()).toList(),
      'selectUserInfo': selectUserInfo.toMap(),
      'listUserInfo': listUserInfo.map((x) => x.toMap()).toList(),
      'listPaymentMethod': listPaymentMethod.map((x) => x.toMap()).toList(),
      'selectePaymentMethod': selectePaymentMethod.toMap(),
      'totalQTT': totalQTT,
      'total': total,
      'isLoading': isLoading,
    };
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      listProduct: List<VariantModel>.from((map['listProduct'] as List<int>).map<VariantModel>((x) => VariantModel.fromMap(x as Map<String,dynamic>),),),
      selectUserInfo: UserInfoModel.fromMap(map['selectUserInfo'] as Map<String,dynamic>),
      listUserInfo: List<UserInfoModel>.from((map['listUserInfo'] as List<int>).map<UserInfoModel>((x) => UserInfoModel.fromMap(x as Map<String,dynamic>),),),
      listPaymentMethod: List<PaymentMethodModel>.from((map['listPaymentMethod'] as List<int>).map<PaymentMethodModel>((x) => PaymentMethodModel.fromMap(x as Map<String,dynamic>),),),
      selectePaymentMethod: PaymentMethodModel.fromMap(map['selectePaymentMethod'] as Map<String,dynamic>),
      totalQTT: map['totalQTT'] as int,
      total: map['total'] as double,
      isLoading: map['isLoading'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState.fromJson(String source) => CartState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartState(listProduct: $listProduct, selectUserInfo: $selectUserInfo, listUserInfo: $listUserInfo, listPaymentMethod: $listPaymentMethod, selectePaymentMethod: $selectePaymentMethod, totalQTT: $totalQTT, total: $total, isLoading: $isLoading)';
  }

  @override
  bool operator ==(covariant CartState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.listProduct, listProduct) &&
      other.selectUserInfo == selectUserInfo &&
      listEquals(other.listUserInfo, listUserInfo) &&
      listEquals(other.listPaymentMethod, listPaymentMethod) &&
      other.selectePaymentMethod == selectePaymentMethod &&
      other.totalQTT == totalQTT &&
      other.total == total &&
      other.isLoading == isLoading;
  }

  @override
  int get hashCode {
    return listProduct.hashCode ^
      selectUserInfo.hashCode ^
      listUserInfo.hashCode ^
      listPaymentMethod.hashCode ^
      selectePaymentMethod.hashCode ^
      totalQTT.hashCode ^
      total.hashCode ^
      isLoading.hashCode;
  }
}
