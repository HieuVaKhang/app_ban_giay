import 'dart:developer';
import 'dart:math';

import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/cart/provider/cart_state.dart';
import 'package:app_ban_giay/module/cart/repository/cart_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState(total: 0, isLoading: false, error: false);
  }

  void getCartModelList() {
    inspect("Bấm vào laod ra");
    state = state.copyWith(isLoading: true);
    final modal = ref.watch(getCartVariantList);
    modal.when(
      data: (data) {
        state = state.copyWith(listProduct: data, isLoading: false, total: caculateTotal());
      },
      error: (error, stackTrace) {
        inspect("Lỗi mẹ r");
        state = state.copyWith(error: true, isLoading: false);
      },
      loading: () {
        inspect({"đang tải"});
      },
    );
  }

  double caculateTotal() {
    if (state.listProduct?.isEmpty ?? true) {
      return 0;
    }
    double totalPrice = 0;
    for (var element in state.listProduct ?? []) {
      totalPrice += element.salePrice ?? element.price;
    }
    return totalPrice;
  }

  int getCartNumber() {
    final box = Hive.box<int>(Config.orderBox);
    return box.keys.length;
  }

  Future<void> factoryBox() async {
    final box = Hive.box<int>(Config.orderBox),
        listVariant = [
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
