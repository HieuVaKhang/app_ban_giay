import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/cart/provider/cart_provider.dart';
import 'package:app_ban_giay/module/cart/repository/cart_repository.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartBottomSheetModalWidget extends StatelessWidget {
  const CartBottomSheetModalWidget({Key? key, required this.model})
      : super(key: key);

  final VariantModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      child: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 2,
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: Color(0xffD9D9D9),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Xoá khỏi giỏ hàng",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 40,
              height: 1,
              color: const Color(0xffF0F0F0),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 50 - 10) / 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ProductItemWidget(
                model: model,
                showCartCount: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width - 40,
              height: 1,
              color: const Color(0xffF0F0F0),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: const EdgeInsets.only(top: 14, bottom: 14),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                children: [
                  InkWell(
                    onTap: () => context.pop(),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 60 - 10) / 2,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(25),
                            right: Radius.circular(25)),
                        color: Color(0xffE7E7E7),
                      ),
                      child: const Center(
                        child: Text(
                          "Huỷ",
                          style: TextStyle(
                              fontSize: 15,
                              height: 25 / 15,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await Config.providerContainer
                          .read(cartProvider.notifier)
                          .deleteCartItem(model.id)
                          .then((value) {
                        Config.providerContainer
                            .refresh(getCartVariantList)
                            .when(
                              data: (data) => context.pop(),
                              error: (error, stackTrace) {},
                              loading: () {
                                showDialog(context: context, builder: (context) {
                                    return CircularProgressIndicator(color: Color(0xffF15E2C),);
                                },);
                              },
                            );
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 60 - 10) / 2,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(25),
                            right: Radius.circular(25)),
                        color: Color(0xffF15E2C),
                      ),
                      child: const Center(
                        child: Text(
                          "Đồng ý xoá",
                          style: TextStyle(
                              fontSize: 15,
                              height: 25 / 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
