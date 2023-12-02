import 'package:app_ban_giay/module/cart/provider/cart_provider.dart';
import 'package:app_ban_giay/module/user_info/user_info_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/payment/screen/widget/user_info_widget.dart';
import 'package:app_ban_giay/module/payment_method/payment_method_index.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final cartP = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thủ tục thanh toán",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: cartP.isLoading > 0
          ? const Center(
              child: CircularProgressIndicator(color: Color(0xffF15E2C)))
          : (cartP.isLoading < 0
              ? const Center(
                  child: Text("Đã có lỗi xảy ra"),
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RefreshIndicator(
                    color: const Color(0xffF15E2C),
                    onRefresh: () async =>
                        await ref.read(cartProvider.notifier).getCart(),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                "Địa chỉ giao hàng",
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff222222)),
                              ),
                            ),
                            if (cartP.selectUserInfo.id?.isNotEmpty ?? false)
                              UserInfoWidget(
                                model: cartP.selectUserInfo,
                                canEdit: true,
                              )
                            else
                              InkWell(
                                onTap: () {
                                  ref.read(cartProvider.notifier).getUserInfo();
                                  context.push(Func.convertName(
                                      const UserInfoIndex().key));
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 52, vertical: 12),
                                  decoration: const BoxDecoration(
                                    color: Color(0xffF15E2C),
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(30),
                                        right: Radius.circular(30)),
                                  ),
                                  child: const Text(
                                    "Thêm hoặt chọn địa chỉ giao hàng",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        height: 25 / 15),
                                  ),
                                ),
                              ),
                            const Divider(
                              thickness: 1,
                              color: Color(0xffF0F0F0),
                              indent: 0,
                              endIndent: 0,
                              height: 40,
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              child: const Text(
                                "Danh sách sản phẩm",
                                style: TextStyle(
                                    color: Color(0xff222222), fontSize: 15),
                              ),
                            ),
                            Center(
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                runSpacing: 10,
                                direction: Axis.horizontal,
                                children: cartP.listProduct
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
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: Color(0xffF0F0F0),
                              indent: 0,
                              endIndent: 0,
                              height: 40,
                            ),
                            Container(
                              height: 60,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(
                                            (0.05 * 225).round(), 0, 0, 0),
                                        blurRadius: 10,
                                        offset: const Offset(0, 0))
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Tổng:",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                  Text(
                                    Func.formatPrice(cartP.total),
                                    style: const TextStyle(
                                        color: Color(0xffF15E2C),
                                        fontSize: 16,
                                        height: 25 / 16),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
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
        child: InkWell(
          onTap: () {
            if (cartP.selectUserInfo.id?.isNotEmpty ?? false) {
              ref.read(cartProvider.notifier).getPaymentMethod();
              context.push(Func.convertName(const PaymentMethodIndex().key));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Vui lòng chọn địa chỉ giao hàng"),
                backgroundColor: Colors.orange,
              ));
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xffF15E2C),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30), right: Radius.circular(30)),
            ),
            child: const Text(
              "Tiếp tục thanh toán",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontSize: 15, height: 25 / 15),
            ),
          ),
        ),
      ),
    );
  }
}
