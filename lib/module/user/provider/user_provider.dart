import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/user/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<UserModel>((ref) {
  return UserModel();
});

Future<void> getUser(String id) async {
  final db = FirebaseFirestore.instance;
  await db
      .collection("users")
      .where('id', isEqualTo: id)
      .limit(1)
      .get()
      .then((value) {
    if (value.docs.isNotEmpty) {
      Config.providerContainer
          .read(userProvider.notifier)
          .update((state) => UserModel(id: value.docs.first.id));
    }
  });
}
