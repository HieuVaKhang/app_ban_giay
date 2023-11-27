import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCategoryProductProvider =
    FutureProvider<List<CategoryModel>>((ref) async {
  var listCategory = <CategoryModel>[];
  final db = FirebaseFirestore.instance;
  await db.collection('category').get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listCategory.add(CategoryModel(name: element.data()['name']));
      }
    }
  });
  await db.collection('material').get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listCategory.add(CategoryModel(name: element.data()['name']));
      }
    }
  });
  await db.collection('gender').get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listCategory.add(CategoryModel(name: element.data()['name']));
      }
    }
  });

  return listCategory;
});

final homeListProductProvider = FutureProvider<List<ProductModel>>((ref) async {
  final db = FirebaseFirestore.instance;
  final result = await db.collection('product').get().then((value) async {
    if (value.docs.isNotEmpty) {
      var listSP = [];
      for (var element in value.docs) {
        final varial = await db
            .collection('variant')
            .where("idProduct",
                isEqualTo: db.collection("product").doc(element.id))
            .get()
            .then((value) => value.docs.first.data()['photo'] ?? "");
        listSP.add(ProductModel(
            id: element.id,
            name: element.data()['name'],
            photo: varial ?? "",
            price: (element.data()['price'] as int).toDouble(),
            salePrice: (element.data()['salePrice'] as int).toDouble()));
      }
      return listSP;
    }
    return <ProductModel>[];
  });
  return <ProductModel>[];
});

final homeScreenActiveCategoryProvider = StateProvider<CategoryModel>((ref) {

  return CategoryModel();
});
