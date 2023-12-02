// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_ban_giay/module/cart/model/order_detail_modal.dart';
import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';

class OrderModal {
  final String? id;
  final String? idUser;
  final CategoryModel? idStatus;
  final CategoryModel? idPayment;
  final UserInfoModel? idUserInfo;
  final OrderDetailModal? detail;
  final double? total;
  final DateTime? dateCreated;
  OrderModal({
    this.id,
    this.idUser,
    this.idStatus,
    this.idPayment,
    this.idUserInfo,
    this.detail,
    this.total,
    this.dateCreated,
  });

  OrderModal copyWith({
    String? id,
    String? idUser,
    CategoryModel? idStatus,
    CategoryModel? idPayment,
    UserInfoModel? idUserInfo,
    OrderDetailModal? detail,
    double? total,
    DateTime? dateCreated,
  }) {
    return OrderModal(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      idStatus: idStatus ?? this.idStatus,
      idPayment: idPayment ?? this.idPayment,
      idUserInfo: idUserInfo ?? this.idUserInfo,
      detail: detail ?? this.detail,
      total: total ?? this.total,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUser': idUser,
      'idStatus': idStatus?.toMap(),
      'idPayment': idPayment?.toMap(),
      'idUserInfo': idUserInfo?.toMap(),
      'detail': detail?.toMap(),
      'total': total,
      'dateCreated': dateCreated?.millisecondsSinceEpoch,
    };
  }

  factory OrderModal.fromMap(Map<String, dynamic> map) {
    return OrderModal(
      id: map['id'] != null ? map['id'] as String : null,
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
      idStatus: map['idStatus'] != null ? CategoryModel.fromMap(map['idStatus'] as Map<String,dynamic>) : null,
      idPayment: map['idPayment'] != null ? CategoryModel.fromMap(map['idPayment'] as Map<String,dynamic>) : null,
      idUserInfo: map['idUserInfo'] != null ? UserInfoModel.fromMap(map['idUserInfo'] as Map<String,dynamic>) : null,
      detail: map['detail'] != null ? OrderDetailModal.fromMap(map['detail'] as Map<String,dynamic>) : null,
      total: map['total'] != null ? map['total'] as double : null,
      dateCreated: map['dateCreated'] != null ? DateTime.fromMillisecondsSinceEpoch(map['dateCreated'] as int) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModal.fromJson(String source) => OrderModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModal(id: $id, idUser: $idUser, idStatus: $idStatus, idPayment: $idPayment, idUserInfo: $idUserInfo, detail: $detail, total: $total, dateCreated: $dateCreated)';
  }

  @override
  bool operator ==(covariant OrderModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idUser == idUser &&
      other.idStatus == idStatus &&
      other.idPayment == idPayment &&
      other.idUserInfo == idUserInfo &&
      other.detail == detail &&
      other.total == total &&
      other.dateCreated == dateCreated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idUser.hashCode ^
      idStatus.hashCode ^
      idPayment.hashCode ^
      idUserInfo.hashCode ^
      detail.hashCode ^
      total.hashCode ^
      dateCreated.hashCode;
  }
}
