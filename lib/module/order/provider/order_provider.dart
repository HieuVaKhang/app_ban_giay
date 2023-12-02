import 'dart:developer';

import 'package:app_ban_giay/module/cart/model/order_detail_modal.dart';
import 'package:app_ban_giay/module/cart/model/order_modal.dart';
import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/order/provider/order_state.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:app_ban_giay/module/user/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderNotifier extends Notifier<OrderState> {
  @override
  build() {
    return OrderState(
        listOrder: [], listOrderComplete: [], loading: 1, viewComplete: false);
  }

  final db = FirebaseFirestore.instance;

  void changeView(bool viewComplete) {
    state = state.copyWith(viewComplete: viewComplete);
  }

  Future<void> getOrder() async {
    state = state.copyWith(loading: 1);
    final listO = await db
        .collection("order")
        .where("idStatus", isNotEqualTo: db.doc("statusorder/hoan-thanh"))
        .where("idUser", isEqualTo: ref.read(userProvider).id)
        .get()
        .then((value) async {
      List<OrderModal> list = [];
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          final data = element.data();
          final status = await (element.data()['idStatus'] as DocumentReference)
              .get()
              .then((value) {
            final data = value.data() as Map<String, dynamic>;
            return CategoryModel(name: data['name'], id: value.id);
          });
          final payment =
              await (element.data()['idPayment'] as DocumentReference)
                  .get()
                  .then((value) {
            final data = value.data() as Map<String, dynamic>;
            return CategoryModel(name: data['name'], id: value.id);
          });
          final userInfo =
              await (element.data()['idPayment'] as DocumentReference)
                  .get()
                  .then((value) {
            final data = value.data() as Map<String, dynamic>;
            return UserInfoModel(
                address: data['address'],
                fullname: data['fullname'],
                phone: data['phone']);
          });
          final detail = await db
              .collection("orderdetail")
              .where('idOrder', isEqualTo: db.doc("order/${element.id}"))
              .limit(1)
              .get()
              .then((value) async {
            if (value.docs.isEmpty) {
              return OrderDetailModal(
                idVariant: VariantModel(
                    id: '',
                    model: ProductModel(),
                    color: ColorModel(),
                    size: SizeModel(),
                    price: 0,
                    salePrice: 0,
                    quantity: 0),
                price: 0,
                salePrice: 0,
                quantity: 0,
              );
            }
            final element = value.docs.first;
            final data = element.data();
            print(data['idVariant']);
            final variant = await (data['idVariant'] as DocumentReference)
                .get()
                .then((value) async {
              if (!value.exists) {
                return VariantModel(
                    id: '',
                    model: ProductModel(),
                    color: ColorModel(),
                    size: SizeModel(),
                    price: 0,
                    salePrice: 0,
                    quantity: 0);
              }
              final data = value.data() as Map<String, dynamic>;

              final colorRef = await (data['idColor'] as DocumentReference)
                  .get()
                  .then((value) =>
                      ColorModel.fromMap(value.data() as Map<String, dynamic>));

              final sizeRef = await (data['idSize'] as DocumentReference)
                  .get()
                  .then((value) =>
                      SizeModel.fromMap(value.data() as Map<String, dynamic>));

              final proRef = await (data['idProduct'] as DocumentReference)
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
              return VariantModel(
                  id: element.id,
                  model: proRef,
                  color: colorRef,
                  size: sizeRef,
                  quantity: 0,
                  price: proRef.price ?? 0,
                  salePrice: proRef.salePrice ?? 0);
            });

            return OrderDetailModal(
              idVariant: variant,
              price: data['price'],
              salePrice: data['salePrice'],
              quantity: (data['quantity'] as int),
            );
          });
          list.add(OrderModal(
              dateCreated: (data['date_created'] as Timestamp).toDate(),
              id: element.id,
              idPayment: payment,
              idStatus: status,
              idUserInfo: userInfo,
              detail: detail,
              total: data['total']));
        }
        return list;
      }
    });
    final listCom = await db
        .collection("order")
        .where("idStatus", isEqualTo: db.doc("statusorder/hoan-thanh"))
        .where("idUser", isEqualTo: ref.read(userProvider).id)
        .get()
        .then((value) async {
      List<OrderModal> list = [];
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          final data = element.data();

          final status = await (element.data()['idStatus'] as DocumentReference)
              .get()
              .then((value) {
            final data = value.data() as Map<String, dynamic>;
            return CategoryModel(name: data['name'], id: value.id);
          });
          final payment =
              await (element.data()['idPayment'] as DocumentReference)
                  .get()
                  .then((value) {
            final data = value.data() as Map<String, dynamic>;
            return CategoryModel(name: data['name'], id: value.id);
          });
          final userInfo =
              await (element.data()['idPayment'] as DocumentReference)
                  .get()
                  .then((value) {
            final data = value.data() as Map<String, dynamic>;
            return UserInfoModel(
                address: data['address'],
                fullname: data['fullname'],
                phone: data['phone']);
          });
          final detail = await db
              .collection("orderdetail")
              .where('idOrder', isEqualTo: db.doc("order/${element.id}"))
              .limit(1)
              .get()
              .then((value) async {
            if (value.docs.isEmpty) {
              return OrderDetailModal(
                idVariant: VariantModel(
                    id: '',
                    model: ProductModel(),
                    color: ColorModel(),
                    size: SizeModel(),
                    price: 0,
                    salePrice: 0,
                    quantity: 0),
                price: 0,
                salePrice: 0,
                quantity: 0,
              );
            }
            final element = value.docs.first;
            final data = element.data();
            print(data['idVariant']);
            final variant = await (data['idVariant'] as DocumentReference)
                .get()
                .then((value) async {
              if (!value.exists) {
                return VariantModel(
                    id: '',
                    model: ProductModel(),
                    color: ColorModel(),
                    size: SizeModel(),
                    price: 0,
                    salePrice: 0,
                    quantity: 0);
              }
              final data = value.data() as Map<String, dynamic>;

              final colorRef = await (data['idColor'] as DocumentReference)
                  .get()
                  .then((value) =>
                      ColorModel.fromMap(value.data() as Map<String, dynamic>));

              final sizeRef = await (data['idSize'] as DocumentReference)
                  .get()
                  .then((value) =>
                      SizeModel.fromMap(value.data() as Map<String, dynamic>));

              final proRef = await (data['idProduct'] as DocumentReference)
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
              return VariantModel(
                  id: element.id,
                  model: proRef,
                  color: colorRef,
                  size: sizeRef,
                  quantity: 0,
                  price: proRef.price ?? 0,
                  salePrice: proRef.salePrice ?? 0);
            });

            return OrderDetailModal(
              idVariant: variant,
              price: data['price'],
              salePrice: data['salePrice'],
              quantity: (data['quantity'] as int),
            );
          });
          list.add(OrderModal(
              dateCreated: (data['date_created'] as Timestamp).toDate(),
              id: element.id,
              idPayment: payment,
              idStatus: status,
              idUserInfo: userInfo,
              detail: detail,
              total: data['total']));
        }
        return list;
      }
    });
    state = state.copyWith(
        listOrder: listO, listOrderComplete: listCom, loading: 0);
  }
}

final orderNotifierProvider =
    NotifierProvider<OrderNotifier, OrderState>(OrderNotifier.new);
