// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_ban_giay/module/cart/model/order_modal.dart';

class OrderState {
  final List<OrderModal> listOrder;
  final List<OrderModal> listOrderComplete;
  final int loading;
  final bool viewComplete;
  OrderState({
    required this.listOrder,
    required this.listOrderComplete,
    required this.loading,
    required this.viewComplete,
  });

  OrderState copyWith({
    List<OrderModal>? listOrder,
    List<OrderModal>? listOrderComplete,
    int? loading,
    bool? viewComplete,
  }) {
    return OrderState(
      listOrder: listOrder ?? this.listOrder,
      listOrderComplete: listOrderComplete ?? this.listOrderComplete,
      loading: loading ?? this.loading,
      viewComplete: viewComplete ?? this.viewComplete,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listOrder': listOrder.map((x) => x.toMap()).toList(),
      'listOrderComplete': listOrderComplete.map((x) => x.toMap()).toList(),
      'loading': loading,
      'viewComplete': viewComplete,
    };
  }

  factory OrderState.fromMap(Map<String, dynamic> map) {
    return OrderState(
      listOrder: List<OrderModal>.from((map['listOrder'] as List<int>).map<OrderModal>((x) => OrderModal.fromMap(x as Map<String,dynamic>),),),
      listOrderComplete: List<OrderModal>.from((map['listOrderComplete'] as List<int>).map<OrderModal>((x) => OrderModal.fromMap(x as Map<String,dynamic>),),),
      loading: map['loading'] as int,
      viewComplete: map['viewComplete'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderState.fromJson(String source) => OrderState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderState(listOrder: $listOrder, listOrderComplete: $listOrderComplete, loading: $loading, viewComplete: $viewComplete)';
  }

  @override
  bool operator ==(covariant OrderState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.listOrder, listOrder) &&
      listEquals(other.listOrderComplete, listOrderComplete) &&
      other.loading == loading &&
      other.viewComplete == viewComplete;
  }

  @override
  int get hashCode {
    return listOrder.hashCode ^
      listOrderComplete.hashCode ^
      loading.hashCode ^
      viewComplete.hashCode;
  }
}
