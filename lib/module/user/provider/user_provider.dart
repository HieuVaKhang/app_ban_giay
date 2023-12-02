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
      Config.providerContainer.read(userProvider.notifier).update((state) =>
          state.copyWith(
              id: value.docs.first.id,
              fullname: value.docs.first.data()['fullname'],
              email: value.docs.first.data()['email']));
    }
  });
}

Future<void> updateUser(String id, String fullname) async {
  final db = FirebaseFirestore.instance;
  final post = await db
      .collection("users")
      .where(FieldPath.documentId, isEqualTo: id)
      .limit(1)
      .get()
      .then((value) {
    return value.docs.first.id;
  });
  await db.doc('users/$post').update({'fullname': fullname});
}
