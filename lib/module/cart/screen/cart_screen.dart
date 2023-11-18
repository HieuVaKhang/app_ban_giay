import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/payment/payment_index.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              direction: Axis.horizontal,
              children: List.generate(
                10,
                (index) => SizedBox(
                  width: (MediaQuery.of(context).size.width - 50 - 10) / 2,
                  child: ProductItemWidget(
                    model: ProductModel(
                        name: "Tên sản phẩm",
                        colorName: "Đỏ",
                        sizeName: "XXL",
                        salePrice: 200000,
                        price: 300000,
                        photo:
                            "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
                    showCartCount: true,
                    showCartCountEdit: true,
                    showDelete: true,
                  ),
                ),
              ),
            ),
          ),
        ),
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
            const Text(
              "101.030.000đ",
              style: TextStyle(
                  color: Color(0xffF15E2C), fontSize: 16, height: 25 / 16),
            ),
            InkWell(
              onTap: () => context.push(Func.convertName(const PaymentIndex().key)),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
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
