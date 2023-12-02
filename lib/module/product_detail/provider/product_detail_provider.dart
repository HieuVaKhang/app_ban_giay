import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:app_ban_giay/module/product_detail/provider/product_detail_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProductDetailNotifier extends Notifier<ProductDetailState> {
  @override
  build() {
    return ProductDetailState(
        loading: 0,
        product: ProductModel(),
        colors: <ColorModel>[],
        sizes: <SizeModel>[],
        quantity: 1,
        variants: <VariantModel>[]);
  }

  final db = FirebaseFirestore.instance;
  var box = Hive.box<int>(Config.orderBox);

  void changeSelectedColor(ColorModel color) {
    final img = state.variants
            .firstWhere((element) => element.color.id == color.id)
            .model
            .photo ??
        Config.noImage;
    state = state.copyWith(
        product: state.product
            .copyWith(colorId: color.id, colorName: color.name, photo: img));
  }

  void changeSelectedSize(SizeModel size) {
    state = state.copyWith(
        product: state.product.copyWith(sizeId: size.id, sizeName: size.name));
  }

  void changeQuantity(bool isAdd) {
    int qtt = state.quantity;
    if (qtt < 1) qtt = 1;
    isAdd ? qtt += 1 : qtt -= 1;
    if (qtt < 1) qtt = 1;
    state = state.copyWith(quantity: qtt);
  }

  Future<void> getDetail(String idProduct) async {
    print(idProduct);
    state = state.copyWith(loading: 1);
    await db.collection('product').doc(idProduct).get().then((value) async {
      final data = value.data() as Map<String, dynamic>;
      if (value.id.isEmpty) {
        state = state.copyWith(loading: -1);
      }
      var colors = <ColorModel>[];
      var sizes = <SizeModel>[];

      final variants = await (db
              .collection('variant')
              .where('idProduct', isEqualTo: db.doc('product/$idProduct')))
          .get()
          .then((value) async {
        final listVariant = <VariantModel>[];
        if (value.docs.isNotEmpty) {
          for (var element in value.docs) {
            final color =
                await ((element.data())['idColor'] as DocumentReference)
                    .get()
                    .then((value) => ColorModel(
                          id: value.id,
                          name: (value.data() as Map<String, dynamic>)['name'],
                        ));
            if (!colors.contains(color)) {
              colors.add(color);
            }
            final size = await ((element.data())['idSize'] as DocumentReference)
                .get()
                .then((value) => SizeModel(
                      id: value.id,
                      name: (value.data() as Map<String, dynamic>)['name'],
                    ));
            if (!sizes.contains(size)) {
              sizes.add(size);
            }
            listVariant.add(
              VariantModel(
                  model: ProductModel(
                    photo: element.data()['photo'],
                  ),
                  id: element.id,
                  color: color,
                  size: size,
                  price: 0,
                  salePrice: 0,
                  quantity: box.get(element.id) ?? 0),
            );
          }
        }
        return listVariant;
      });
      var product = ProductModel(
        id: value.id,
        name: data['name'],
        description: data['description'],
        price: (data['price'] as int).toDouble(),
        salePrice: (data['salePrice'] as int).toDouble(),
        colorName: colors.first.name,
        colorId: colors.first.id,
        sizeName: sizes.first.name,
        sizeId: sizes.first.id,
        photo: variants.first.model.photo ?? "",
      );
      state = state.copyWith(
          product: product,
          variants: variants,
          colors: colors,
          sizes: sizes,
          quantity: variants.first.quantity,
          loading: 0);
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}

final productDetailProvider =
    NotifierProvider<ProductDetailNotifier, ProductDetailState>(
        ProductDetailNotifier.new);
