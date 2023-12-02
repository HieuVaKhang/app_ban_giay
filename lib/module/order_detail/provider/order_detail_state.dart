// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_ban_giay/module/cart/model/order_detail_modal.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';

class OrderDetailState {
  final List<OrderDetailModal> list;
  final CategoryModel selectedStatus;
  final List<CategoryModel> listStatus;
  final double total;
  final int loading;
  OrderDetailState({
    required this.list,
    required this.selectedStatus,
    required this.listStatus,
    required this.total,
    required this.loading,
  });

  OrderDetailState copyWith({
    List<OrderDetailModal>? list,
    CategoryModel? selectedStatus,
    List<CategoryModel>? listStatus,
    double? total,
    int? loading,
  }) {
    return OrderDetailState(
      list: list ?? this.list,
      selectedStatus: selectedStatus ?? this.selectedStatus,
      listStatus: listStatus ?? this.listStatus,
      total: total ?? this.total,
      loading: loading ?? this.loading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': list.map((x) => x.toMap()).toList(),
      'selectedStatus': selectedStatus.toMap(),
      'listStatus': listStatus.map((x) => x.toMap()).toList(),
      'total': total,
      'loading': loading,
    };
  }

  factory OrderDetailState.fromMap(Map<String, dynamic> map) {
    return OrderDetailState(
      list: List<OrderDetailModal>.from((map['list'] as List<int>).map<OrderDetailModal>((x) => OrderDetailModal.fromMap(x as Map<String,dynamic>),),),
      selectedStatus: CategoryModel.fromMap(map['selectedStatus'] as Map<String,dynamic>),
      listStatus: List<CategoryModel>.from((map['listStatus'] as List<int>).map<CategoryModel>((x) => CategoryModel.fromMap(x as Map<String,dynamic>),),),
      total: map['total'] as double,
      loading: map['loading'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDetailState.fromJson(String source) => OrderDetailState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderDetailState(list: $list, selectedStatus: $selectedStatus, listStatus: $listStatus, total: $total, loading: $loading)';
  }

  @override
  bool operator ==(covariant OrderDetailState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.list, list) &&
      other.selectedStatus == selectedStatus &&
      listEquals(other.listStatus, listStatus) &&
      other.total == total &&
      other.loading == loading;
  }

  @override
  int get hashCode {
    return list.hashCode ^
      selectedStatus.hashCode ^
      listStatus.hashCode ^
      total.hashCode ^
      loading.hashCode;
  }
}
