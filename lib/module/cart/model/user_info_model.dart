// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserInfoModel {
  final String? id;
  final String? idUser;
  final String? fullname;
  final String? address;
  final String? phone;
  UserInfoModel({
    this.id,
    this.idUser,
    this.fullname,
    this.address,
    this.phone,
  });

  UserInfoModel copyWith({
    String? id,
    String? idUser,
    String? fullname,
    String? address,
    String? phone,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      idUser: idUser ?? this.idUser,
      fullname: fullname ?? this.fullname,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idUser': idUser,
      'fullname': fullname,
      'address': address,
      'phone': phone,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      id: map['id'] != null ? map['id'] as String : null,
      idUser: map['idUser'] != null ? map['idUser'] as String : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfoModel(id: $id, idUser: $idUser, fullname: $fullname, address: $address, phone: $phone)';
  }

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.idUser == idUser &&
      other.fullname == fullname &&
      other.address == address &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      idUser.hashCode ^
      fullname.hashCode ^
      address.hashCode ^
      phone.hashCode;
  }
}
