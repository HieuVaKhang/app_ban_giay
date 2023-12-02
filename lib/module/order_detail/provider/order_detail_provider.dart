import 'package:app_ban_giay/module/cart/model/order_detail_modal.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/order_detail/provider/order_detail_state.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailNotifier extends Notifier<OrderDetailState> {
  @override
  OrderDetailState build() {
    return OrderDetailState(
        list: [],
        selectedStatus: CategoryModel(),
        listStatus: [],
        total: 0,
        loading: 0);
  }

  final db = FirebaseFirestore.instance;

  Future<void> getOrderDetail(
      String orderID, CategoryModel selectedStatus, double total) async {
    state = state.copyWith(loading: 1);
    await db
        .collection("orderdetail")
        .where('idOrder', isEqualTo: db.doc("order/$orderID"))
        .get()
        .then((value) async {
      List<OrderDetailModal> list = [];
      if (value.docs.isNotEmpty) {
        for (var v in value.docs) {
          final data = v.data();
          VariantModel variant = VariantModel(
              id: '',
              model: ProductModel(),
              color: ColorModel(),
              size: SizeModel(),
              price: 0,
              salePrice: 0,
              quantity: 0);
          if (data['idVariant'] != null) {
            variant = await (data['idVariant'] as DocumentReference)
                .get()
                .then((element) async {
              final vdata = element.data() as Map<String, dynamic>;
              final colorRef = await (vdata['idColor'] as DocumentReference)
                  .get()
                  .then((value) =>
                      ColorModel.fromMap(value.data() as Map<String, dynamic>));

              final sizeRef = await (vdata['idSize'] as DocumentReference)
                  .get()
                  .then((value) =>
                      SizeModel.fromMap(value.data() as Map<String, dynamic>));

              final proRef = await (vdata['idProduct'] as DocumentReference)
                  .get()
                  .then((value) async {
                var result = value.data() as Map<String, dynamic>;
                return ProductModel(
                  id: value.id,
                  name: result['name'] ?? '',
                  description: result['description'],
                  price: double.parse(result['price'].toString()),
                  salePrice: double.parse(result['salePrice'].toString()),
                  photo: vdata['photo'],
                  colorName: colorRef.name,
                  sizeName: sizeRef.name,
                );
              });

              return VariantModel(
                  id: element.id,
                  model: proRef,
                  color: colorRef,
                  size: sizeRef,
                  quantity: v.data()['quantity'],
                  price: proRef.price ?? 0,
                  salePrice: proRef.salePrice ?? 0);
            });
          }

          list.add(
            OrderDetailModal(
                idVariant: variant,
                price: v.data()['price'],
                salePrice: v.data()['salePrice'],
                quantity: v.data()['quantity']),
          );
        }

        final listStatus =
            await db.collection('statusorder').get().then((value) {
          return value.docs
              .map((e) => CategoryModel(id: e.id, name: e.data()['name']))
              .toList();
        });
        state = state.copyWith(
            list: list,
            loading: 0,
            total: total,
            listStatus: listStatus,
            selectedStatus: selectedStatus);
      }
    });
  }
}

final orderDetailProvider =
    NotifierProvider<OrderDetailNotifier, OrderDetailState>(
        OrderDetailNotifier.new);
