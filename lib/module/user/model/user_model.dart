// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? id;
  final String? email;
  final String? fullname;
  UserModel({
    this.id,
    this.email,
    this.fullname,
  });

  UserModel copyWith({
    String? id,
    String? email,
    String? fullname,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'fullname': fullname,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      fullname: map['fullname'] != null ? map['fullname'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(id: $id, email: $email, fullname: $fullname)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.email == email &&
      other.fullname == fullname;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ fullname.hashCode;
}
