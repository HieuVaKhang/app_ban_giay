// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? id;
  final String? userName;
  final String? fullname;
  final String? password;
  UserModel({
    this.id,
    this.userName,
    this.fullname,
    this.password,
  });

  UserModel copyWith({
    String? id,
    String? userName,
    String? fullname,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      fullname: fullname ?? this.fullname,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'fullname': fullname,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $userName, fullname: $fullname, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userName == userName &&
      other.fullname == fullname &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userName.hashCode ^
      fullname.hashCode ^
      password.hashCode;
  }
}
