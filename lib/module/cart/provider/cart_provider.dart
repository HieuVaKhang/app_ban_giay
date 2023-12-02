import 'dart:math';

import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/cart/provider/cart_state.dart';
import 'package:app_ban_giay/module/payment_method/model/payment_method_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:app_ban_giay/module/user/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState(
        totalQTT: box.keys.length,
        listProduct: [],
        listUserInfo: [],
        listPaymentMethod: [],
        selectUserInfo: UserInfoModel(),
        selectePaymentMethod: PaymentMethodModel(),
        total: 0,
        isLoading: 0);
  }

  final db = FirebaseFirestore.instance;
  var box = Hive.box<int>(Config.orderBox);

  void changeCartQuantity(String id, bool isAdd) {
    int index = state.listProduct.indexWhere((element) => element.id == id);
    if (index > -1) {
      int qtt = state.listProduct[index].quantity;
      if (isAdd) {
        qtt += 1;
      } else {
        qtt -= 1;
      }
      if (qtt < 1) qtt = 1;
      box.put(id, qtt);
      state.listProduct[index] =
          state.listProduct[index].copyWith(quantity: qtt);
      final total = caculateTotal(state.listProduct);
      state = state.copyWith(listProduct: [...state.listProduct], total: total);
    }
  }

  void changePaymentMethod(PaymentMethodModel model) {
    state = state.copyWith(selectePaymentMethod: model);
  }

  Future<void> getPaymentMethod() async {
    state = state.copyWith(isLoading: 1);
    await db.collection("paymentmethod").get().then((value) {
      List<PaymentMethodModel> list = [];
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          list.add(PaymentMethodModel(
              id: element.id,
              name: element.data()['name'],
              photo: element.data()['photo']));
        }
      }
      PaymentMethodModel selected = state.selectePaymentMethod;
      selected = list.first;
      print(list.toString());
      state = state.copyWith(
          listPaymentMethod: list,
          isLoading: 0,
          selectePaymentMethod: selected);
    }).onError((error, stackTrace) {
      print(error);
      state = state.copyWith(isLoading: -1);
    });
  }

  Future<void> changeUserSelected(UserInfoModel model) async {
    state = state.copyWith(isLoading: 1);
    final snapshot = await db
        .collection("userinfo")
        .where("isDefault", isEqualTo: true)
        .get();
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    for (var doc in snapshot.docs) {
      batch.update(doc.reference, {'isDefault': false});
    }
    await batch.commit();
    await db.doc("userinfo/${model.id}").update({
      "isDefault": true,
    });
    state = state.copyWith(selectUserInfo: model, isLoading: 0);
  }

  Future<void> getUserInfo() async {
    state = state.copyWith(isLoading: 1);
    final result = await db
        .collection("userinfo")
        .where('idUser', isEqualTo: ref.read(userProvider).id)
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
              isDefault: element.data()['isDefault'],
            ),
          );
        }
      }
      return list;
    });
    final selected = result.firstWhere(
      (element) => element.isDefault,
      orElse: () => UserInfoModel(),
    );
    state = state.copyWith(
        listUserInfo: result, isLoading: 0, selectUserInfo: selected);
  }

  Future<void> saveUserInfo(UserInfoModel model) async {
    state = state.copyWith(isLoading: 1);
    final getUserInfoDefault = state.listUserInfo.firstWhere(
      (element) => element.isDefault == true,
      orElse: () => UserInfoModel(),
    );
    try {
      if (model.id?.isNotEmpty ?? false) {
        bool isDefault = ((getUserInfoDefault.id?.isNotEmpty ?? false) &&
            getUserInfoDefault.id == model.id);
        await db.collection("userinfo").doc(model.id).set({
          "fullname": model.fullname,
          "address": model.address,
          "phone": model.phone,
          "idUser": ref.read(userProvider).id,
          "isDefault": isDefault,
        }, SetOptions(merge: true));
      } else {
        bool isDefault = getUserInfoDefault.id?.isEmpty ?? false;
        await db.collection("userinfo").add({
          "fullname": model.fullname,
          "address": model.address,
          "phone": model.phone,
          "idUser": ref.read(userProvider).id,
          "isDefault": isDefault,
        }).then((value) => value.get().then((value) {
              return UserInfoModel(
                id: value.id,
                address: value.data()?['address'] ?? "",
                fullname: value.data()?['fullname'] ?? "",
                phone: value.data()?['phone'] ?? "",
              );
            }));
      }
      state = state.copyWith(selectUserInfo: model, isLoading: 0);
    } catch (e) {
      state = state.copyWith(selectUserInfo: model, isLoading: -1);
    }
  }

  Future<void> getCart() async {
    if (box.keys.isEmpty) {
      state = state.copyWith(listProduct: [], isLoading: 0);
      return;
    }
    state = state.copyWith(isLoading: 1);
    await db
        .collection("variant")
        .where(FieldPath.documentId, whereIn: box.keys.toList())
        .get()
        .then((value) async {
      List<VariantModel> listModel = [];
      double total = 0;
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          final quantity = box.get(element.id) ?? 1;
          final colorRef =
              await (element.data()['idColor'] as DocumentReference).get().then(
                  (value) =>
                      ColorModel.fromMap(value.data() as Map<String, dynamic>));

          final sizeRef = await (element.data()['idSize'] as DocumentReference)
              .get()
              .then((value) =>
                  SizeModel.fromMap(value.data() as Map<String, dynamic>));

          final proRef =
              await (element.data()['idProduct'] as DocumentReference)
                  .get()
                  .then((value) async {
            var result = value.data() as Map<String, dynamic>;
            return ProductModel(
              id: value.id,
              name: result['name'] ?? '',
              description: result['description'],
              price: double.parse(result['price'].toString()),
              salePrice: double.parse(result['salePrice'].toString()),
              photo: element.data()['photo'],
              colorName: colorRef.name,
              sizeName: sizeRef.name,
            );
          });

          listModel.add(VariantModel(
              id: element.id,
              model: proRef,
              color: colorRef,
              size: sizeRef,
              quantity: quantity,
              price: proRef.price ?? 0,
              salePrice: proRef.salePrice ?? 0));
          total += (quantity *
              ((proRef.salePrice == 0 ? proRef.price : proRef.salePrice) ?? 0));
        }
        final UserInfoModel? userInfo = await db
            .collection("userinfo")
            .where('idUser', isEqualTo: ref.read(userProvider).id)
            .where("isDefault", isEqualTo: true)
            .limit(1)
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            final data = value.docs.first.data();
            return UserInfoModel(
                id: value.docs.first.id,
                address: data['address'] ?? "",
                fullname: data['fullname'] ?? "",
                isDefault: data['isDefault'] ?? "",
                phone: data['phone'] ?? "");
          }
          return null;
        });
        state = state.copyWith(
            isLoading: 0,
            listProduct: listModel,
            selectUserInfo: userInfo ?? UserInfoModel(),
            total: total);
      }
    });
  }

  Future<bool> addToCart(VariantModel model) async {
    try {
      if (model.quantity < 1) model = model.copyWith(quantity: 1);
      await box.put(model.id, model.quantity);
      getCartNumber();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  double caculateTotal(List<VariantModel> listProduct) {
    double total = 0;
    for (var v in listProduct) {
      double prive = v.salePrice == 0 ? v.price : v.salePrice;
      total += (v.quantity * prive);
    }
    return total;
  }

  void getCartNumber() {
    state = state.copyWith(totalQTT: box.keys.length);
  }

  Future<bool> deleteCartItem(String id) async {
    final box = Hive.box<int>(Config.orderBox);
    try {
      await box.delete(id);
      int index = state.listProduct.indexWhere((element) => element.id == id);
      if (index > -1) {
        state.listProduct.removeAt(index);
        state = state.copyWith(
            listProduct: [...state.listProduct], totalQTT: box.keys.length);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> saveOrder() async {
    state = state.copyWith(isLoading: 1);
    await db.collection("order").add({
      "idUser": ref.read(userProvider).id,
      "idStatus": db.doc("statusorder/da-dat"),
      "idPayment": db.doc("paymentmethod/${state.selectePaymentMethod.id}"),
      "idUserInfo": db.doc("userinfo/${state.selectUserInfo.id}"),
      "total": state.total,
      "date_created": DateTime.now(),
    }).then((value) async {
      for (var element in state.listProduct) {
        await db.collection("orderdetail").add({
          "idVariant": db.doc("variant/${element.id}"),
          "idOrder": value,
          "price": element.price,
          "salePrice": element.salePrice,
          "quantity": element.quantity,
        });
      }
      await box.clear();
      state = state.copyWith(
          totalQTT: 0,
          total: 0,
          listProduct: [],
          selectUserInfo: UserInfoModel(),
          isLoading: 0,
          listPaymentMethod: [],
          listUserInfo: [],
          selectePaymentMethod: PaymentMethodModel());
    });
  }

  Future<void> factoryBox() async {
    final box = Hive.box<int>(Config.orderBox),
        listVariant = [
          "0bbffYoFKf7dLHYjnyna",
          "0kcAmuKAqOUhBTyNbmgX",
          "1BtGNlorAAh6LnSst8xG",
          "1GL042QTM1JyEalRNNce",
          "1HxCrzTMKk0vL32rI1j6",
          "1cvs1BeSze4bbrWjqNXU",
          "1dt66pnNRubcKacjObGU",
          "294rmqRmu49GRSc7wPGc",
        ];
    box.clear();
    for (var element in listVariant) {
      await box.put(element, 1 + Random().nextInt(10 - 1 + 1));
    }
  }
}

final cartProvider =
    NotifierProvider<CartNotifier, CartState>(CartNotifier.new);
