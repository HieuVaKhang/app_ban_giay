import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/payment/provider/payment_state.dart';

class UserInfoNotifier extends Notifier<UserInfoState> {
  @override
  UserInfoState build() {
    return UserInfoState(
        listModal: [], loading: false, selected: UserInfoModel());
  }

  final db = FirebaseFirestore.instance;

  Future<void> getData() async {
    state = state.copyWith(loading: true);
    final result = await db
        .collection("userinfo")
        .where('idUser', isEqualTo: "")
        .get()
        .then((value) {
      var list = <UserInfoModel>[];
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          list.add(
            UserInfoModel(
              id: element.id,
              address: element.data()['address'],
              fullname: element.data()['fullname'],
              phone: element.data()['phone'],
            ),
          );
        }
      }
      return list;
    });
    state = state.copyWith(listModal: result, loading: false);
  }

  Future<void> saveUserInfo(UserInfoModel model) async {
    state = state.copyWith(loading: true);
    if (model.id?.isNotEmpty ?? false) {
      await db
          .collection("userinfo")
          .doc(model.id)
          .set(model.toMap(), SetOptions(merge: true));
    } else {
      await db
          .collection("userinfo")
          .add(model.toMap())
          .then((value) => value.get().then((value) {
                return UserInfoModel(
                    id: value.id,
                    address: value.data()?['address'] ?? "",
                    fullname: value.data()?['fullname'] ?? "",
                    phone: value.data()?['phone'] ?? "");
              }));
    }
    state = state.copyWith(selected: model);
    getData();
  }

  void changeSelected(UserInfoModel model) {
    state = state.copyWith(selected: model);
  }
}

final userInfoProvider =
    NotifierProvider<UserInfoNotifier, UserInfoState>(UserInfoNotifier.new);

final getUserInfoProvider = FutureProvider<List<UserInfoModel>>((ref) async {
  final db = FirebaseFirestore.instance;
  final result = await db
      .collection("userinfo")
      .where('idUser', isEqualTo: null)
      .get()
      .then((value) {
    var list = <UserInfoModel>[];
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        list.add(
          UserInfoModel(
            id: element.id,
            address: element.data()['address'],
            fullname: element.data()['fullname'],
            phone: element.data()['phone'],
          ),
        );
      }
    }
    return list;
  });
  print(result.toList());
  return result;
});
