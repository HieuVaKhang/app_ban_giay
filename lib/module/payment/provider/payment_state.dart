// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:app_ban_giay/module/cart/model/user_info_model.dart';

class UserInfoState {
  final List<UserInfoModel> listModal;
  final UserInfoModel selected;
  final bool loading;
  UserInfoState({
    required this.listModal,
    required this.selected,
    required this.loading,
  });

  UserInfoState copyWith({
    List<UserInfoModel>? listModal,
    UserInfoModel? selected,
    bool? loading,
  }) {
    return UserInfoState(
      listModal: listModal ?? this.listModal,
      selected: selected ?? this.selected,
      loading: loading ?? this.loading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listModal': listModal.map((x) => x.toMap()).toList(),
      'selected': selected.toMap(),
      'loading': loading,
    };
  }

  factory UserInfoState.fromMap(Map<String, dynamic> map) {
    return UserInfoState(
      listModal: List<UserInfoModel>.from((map['listModal'] as List<int>).map<UserInfoModel>((x) => UserInfoModel.fromMap(x as Map<String,dynamic>),),),
      selected: UserInfoModel.fromMap(map['selected'] as Map<String,dynamic>),
      loading: map['loading'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoState.fromJson(String source) =>
      UserInfoState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserInfoState(listModal: $listModal, selected: $selected, loading: $loading)';

  @override
  bool operator ==(covariant UserInfoState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.listModal, listModal) &&
      other.selected == selected &&
      other.loading == loading;
  }

  @override
  int get hashCode => listModal.hashCode ^ selected.hashCode ^ loading.hashCode;
}
