import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/provider/cart_provider.dart';
import 'package:app_ban_giay/module/payment/payment_index.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Giỏ hàng",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final provider = ref.watch(cartProvider);
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xffF15E2C)),
            );
          } else if (provider.error) {
            return const Center(
              child: Text("Đã có lỗi xảy ra, vui lòng thử lại sau"),
            );
          } else {
            print(provider.listProduct.toString());
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      direction: Axis.horizontal,
                      children: provider.listProduct?.isNotEmpty ?? false
                          ? provider.listProduct
                                  ?.map(
                                    (e) => SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  50 -
                                                  10) /
                                              2,
                                      child: ProductItemWidget(
                                        model: e.model,
                                        showCartCount: true,
                                        showCartCountEdit: true,
                                        showDelete: true,
                                      ),
                                    ),
                                  )
                                  .toList() ??
                              [
                                const Text(
                                    "Chưa có sản phẩm nào trong giỏ hàng"),
                              ]
                          : [
                              const Text("Chưa có sản phẩm nào trong giỏ hàng"),
                            ],
                    ),
                  ),
                ));
          }
        },
      ),
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
            Consumer(builder: (context, ref, child) {
              final provider = ref.watch(cartProvider);
              return Text(
                Func.formatPrice(provider.total),
                style: const TextStyle(
                    color: Color(0xffF15E2C), fontSize: 16, height: 25 / 16),
              );
            }),
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
