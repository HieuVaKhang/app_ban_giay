import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/home/provider/home_provider.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCategoryProductProvider =
    FutureProvider<List<CategoryModel>>((ref) async {
  var listCategory = <CategoryModel>[];
  final db = FirebaseFirestore.instance;
  await db.collection('category').get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listCategory.add(CategoryModel(
            name: element.data()['name'], id: element.id, type: 'Category'));
      }
    }
  });
  await db.collection('material').get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listCategory.add(CategoryModel(
            name: element.data()['name'], id: element.id, type: 'Material'));
      }
    }
  });
  await db.collection('gender').get().then((value) {
    if (value.docs.isNotEmpty) {
      for (var element in value.docs) {
        listCategory.add(CategoryModel(
            name: element.data()['name'], id: element.id, type: 'Gender'));
      }
    }
  });

  return listCategory;
});

final homeListProductProvider = FutureProvider<List<ProductModel>>((ref) async {
  final selectedCategory = ref.watch(selectedCategoryProvider);
  final db = FirebaseFirestore.instance;
  if (selectedCategory.id?.isNotEmpty ?? false) {
    final result = await db
        .collection('product')
        .where('id${selectedCategory.type}',
            isEqualTo: db.doc(
                '${selectedCategory.type?.toLowerCase()}/${selectedCategory.id}'))
        .limit(8)
        .get()
        .then((value) async {
      if (value.docs.isNotEmpty) {
        var listSP = <ProductModel>[];
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
    return result;
  }
  final result =
      await db.collection('product').limit(8).get().then((value) async {
    if (value.docs.isNotEmpty) {
      var listSP = <ProductModel>[];
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
  return result;
});

final homeScreenActiveCategoryProvider = StateProvider<CategoryModel>((ref) {
  return CategoryModel();
});

final selectedProductDetailProvider = StateProvider<String>((ref) {
  return '';
});

final selectedColorProductDetailProvider = StateProvider<String>((ref) {
  return '';
});

final productDetailProvider = FutureProvider<ProductModel>((ref) async {
  final selected = ref.watch(selectedProductDetailProvider);
  if (selected.isEmpty) {
    return ProductModel();
  }
  final db = FirebaseFirestore.instance;
  final result =
      await db.collection('product').doc(selected).get().then((value) async {
    final categoryId = await ((value.data()
            as Map<String, dynamic>)['idCategory'] as DocumentReference)
        .get()
        .then((value) => CategoryModel(
              id: value.id,
              name: (value.data() as Map<String, dynamic>)['name'],
            ));
    final materialId = await ((value.data()
            as Map<String, dynamic>)['idMaterial'] as DocumentReference)
        .get()
        .then((value) => CategoryModel(
              id: value.id,
              name: (value.data() as Map<String, dynamic>)['name'],
            ));
    final genderId = await ((value.data() as Map<String, dynamic>)['idGender']
            as DocumentReference)
        .get()
        .then((value) => CategoryModel(
              id: value.id,
              name: (value.data() as Map<String, dynamic>)['name'],
            ));
    final variantId = await (db
            .collection('variant')
            .where('idProduct', isEqualTo: db.doc('product/${selected}')))
        .get()
        .then((value) async {
      final list_variant = <VariantModel>[];
      if (value.docs.isNotEmpty) {
        for (var element in value.docs) {
          final color = await ((element.data()
                  as Map<String, dynamic>)['idColor'] as DocumentReference)
              .get()
              .then((value) => ColorModel(
                    id: value.id,
                    name: (value.data() as Map<String, dynamic>)['name'],
                  ));
          final size = await ((element.data() as Map<String, dynamic>)['idSize']
                  as DocumentReference)
              .get()
              .then((value) => SizeModel(
                    id: value.id,
                    name: (value.data() as Map<String, dynamic>)['name'],
                  ));
          list_variant.add(VariantModel(
              model: ProductModel(
                photo: element.data()['photo'],
              ),
              id: element.id,
              color: color,
              size: size,
              price: 0,
              salePrice: 0,
              quantity: 0));
        }
      }
      return list_variant;
    });
    print(variantId.toString());
    final listColor = <ColorModel>[];
    final listSize = <SizeModel>[];
    if (variantId.isNotEmpty) {
      for (var element in variantId) {
        if (!listColor.contains(element.color)) {
          listColor.add(element.color);
        }
        if (!listSize.contains(element.size)) {
          listSize.add(element.size);
        }
      }
      ref
          .read(colorProductDetailProvider.notifier)
          .update((state) => [...listColor]);
      ref
          .read(sizeProductDetailProvider.notifier)
          .update((state) => [...listSize]);
  
    }
    ref
        .read(variantProductDetailProvider.notifier)
        .update((state) => [...variantId]);
    final valueData = (value.data() as Map<String, dynamic>);

    String productImg = variantId.first.model.photo ?? '';

    return ProductModel(
      id: value.id,
      photo: productImg,
      name: valueData['name'],
      description: valueData['description'],
      price: (valueData['price'] as int).toDouble(),
      salePrice: (valueData['salePrice'] as int).toDouble(),
    );
  });

  return result;
});

final colorProductDetailProvider = StateProvider<List<ColorModel>>((ref) {
  return [];
});
final sizeProductDetailProvider = StateProvider<List<SizeModel>>((ref) {
  return [];
});
final variantProductDetailProvider = StateProvider<List<VariantModel>>((ref) {
  return [];
});
