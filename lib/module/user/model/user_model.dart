// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? id;
  final String? userName;
  final String? password;
  final String? email;
  UserModel({
    this.id,
    this.userName,
    this.password,
    this.email,
  });

  set state(UserModel state) {}

  

  UserModel copyWith({
    String? id,
    String? userName,
    String? password,
    String? email,
  }) {
    return UserModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userName': userName,
      'password': password,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $userName, password: $password, email: $email)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.userName == userName &&
      other.password == password &&
      other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userName.hashCode ^
      password.hashCode ^
      email.hashCode;
  }
}
