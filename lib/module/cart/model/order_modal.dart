// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModal {
  final String? id;
  final String? idUser;
  final String? idStatus;
  final String? idPayment;
  final String? idUserInfo;
  final double? total;
  final int? dateCreated;
  OrderModal({
    this.id,
    this.idUser,
    this.idStatus,
    this.idPayment,
    this.idUserInfo,
    this.total,
    this.dateCreated,
  });

  OrderModal copyWith({
    String? id,
    String? idUser,
    String? idStatus,
    String? idPayment,
    String? idUserInfo,
    double? total,
    int? dateCreated,
  }) {
    return OrderModal(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      idStatus: idStatus ?? this.idStatus,
      idPayment: idPayment ?? this.idPayment,
      idUserInfo: idUserInfo ?? this.idUserInfo,
      total: total ?? this.total,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUser': idUser,
      'idStatus': idStatus,
      'idPayment': idPayment,
      'idUserInfo': idUserInfo,
      'total': total,
      'dateCreated': dateCreated,
    };
  }

  factory OrderModal.fromMap(Map<String, dynamic> map) {
    return OrderModal(
      id: map['id'] != null ? map['id'] as String : null,
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
      idStatus: map['idStatus'] != null ? map['idStatus'] as String : null,
      idPayment: map['idPayment'] != null ? map['idPayment'] as String : null,
      idUserInfo: map['idUserInfo'] != null ? map['idUserInfo'] as String : null,
      total: map['total'] != null ? map['total'] as double : null,
      dateCreated: map['dateCreated'] != null ? map['dateCreated'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModal.fromJson(String source) => OrderModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderModal(id: $id, idUser: $idUser, idStatus: $idStatus, idPayment: $idPayment, idUserInfo: $idUserInfo, total: $total, dateCreated: $dateCreated)';
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
      total.hashCode ^
      dateCreated.hashCode;
  }
}
