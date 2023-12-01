import 'dart:developer';
import 'dart:math';

import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/cart/provider/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState(total: 0, isLoading: false, error: false);
  }

  // void getCartModelList() {
  //   inspect("Bấm vào laod ra");
  //   state = state.copyWith(isLoading: true);
  //   final modal = ref.watch(getCartVariantList);
  //   modal.when(
  //     data: (data) {
  //       state = state.copyWith(listProduct: data, isLoading: false, total: caculateTotal());
  //     },
  //     error: (error, stackTrace) {
  //       inspect("Lỗi mẹ r");
  //       state = state.copyWith(error: true, isLoading: false);
  //     },
  //     loading: () {
  //       inspect({"đang tải"});
  //     },
  //   );
  // }

  void updateListProduct(List<VariantModel> listModal) {
    double totalPrice = 0;
    for (var element in listModal) {
      totalPrice += element.salePrice ?? element.price;
    }
  }

  double caculateTotal(List<VariantModel> listModal) {
    if (listModal.isNotEmpty) {
      return 0;
    }
    double totalPrice = 0;
    for (var element in listModal) {
      totalPrice += element.salePrice;
    }
    return totalPrice;
  }

  int getCartNumber() {
    final box = Hive.box<int>(Config.orderBox);
    return box.keys.length;
  }

  Future<bool> deleteCartItem(String id) async {
    final box = Hive.box<int>(Config.orderBox);
    try {
      await box.delete(id);
      print(box.keys);
      return true;
    } catch (e) {
      return false;
    }
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
