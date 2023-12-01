import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedCategoryProvider = StateProvider<CategoryModel>((ref) {
  return CategoryModel();
});
