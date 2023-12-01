import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/home/provider/home_state.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = StateProvider<CategoryModel>((ref) {
  return CategoryModel();
});

