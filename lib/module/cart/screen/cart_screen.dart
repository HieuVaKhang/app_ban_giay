import 'package:app_ban_giay/module/cart/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/payment/payment_index.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Giỏ hàng",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: cart.isLoading > 0
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xffF15E2C)),
            )
          : (cart.isLoading < 0
              ? const Center(
                  child: Text("Đã có lỗi xảy ra, vui lòng thử lại sau"),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RefreshIndicator(
                    color: const Color(0xffF15E2C),
                    onRefresh: () => ref.read(cartProvider.notifier).getCart(),
                    child: SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 15),
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 10,
                          runSpacing: 10,
                          direction: Axis.horizontal,
                          children: cart.listProduct.isNotEmpty
                              ? cart.listProduct
                                  .map(
                                    (e) => SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  50 -
                                                  10) /
                                              2,
                                      child: ProductItemWidget(
                                        model: e,
                                        showCartCount: true,
                                        showCartCountEdit: true,
                                        showDelete: true,
                                      ),
                                    ),
                                  )
                                  .toList()
                              : [
                                  const Text(
                                      "Chưa có sản phẩm nào trong giỏ hàng"),
                                ],
                        ),
                      ),
                    ),
                  ))),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB((0.3 * 255).ceil(), 0, 0, 0),
                blurRadius: 10,
                offset: const Offset(0, 0)),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              Func.formatPrice(cart.total),
              style: const TextStyle(
                  color: Color(0xffF15E2C), fontSize: 16, height: 25 / 16),
            ),
            InkWell(
              onTap: () =>
                  context.push(Func.convertName(const PaymentIndex().key)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xffF15E2C),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30), right: Radius.circular(30)),
                ),
                child: const Text(
                  "Thanh toán",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, height: 25 / 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

 // return provider.when(
          //   data: (data) {
          //   },
          //   error: (error, stackTrace) {
          //   },
          //   loading: () {

          //   },
          // );
        