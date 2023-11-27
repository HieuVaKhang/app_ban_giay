import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final getCartVariantList = FutureProvider<List<VariantModel>>((ref) async {
  final db = FirebaseFirestore.instance;
  var box = Hive.box<int>(Config.orderBox);
  if (box.keys.isEmpty) {
    return [];
  }
  print(box.keys);
  final result = await db
      .collection("variant")
      .where(FieldPath.documentId, whereIn: box.keys.toList())
      .get()
      .then((value) async {
    if (value.docs.isNotEmpty) {
      List<VariantModel> listModel = [];
      for (var element in value.docs) {
        final quantity = box.get(element.id) ?? 0;
        final colorRef = await (element.data()['idColor'] as DocumentReference)
            .get()
            .then((value) =>
                ColorModel.fromMap(value.data() as Map<String, dynamic>));
        final sizeRef = await (element.data()['idColor'] as DocumentReference)
            .get()
            .then((value) =>
                SizeModel.fromMap(value.data() as Map<String, dynamic>));
        final proRef = await (element.data()['idProduct'] as DocumentReference)
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
      }
      return listModel;
    }
    return <VariantModel>[];
  });
  return result;
});
