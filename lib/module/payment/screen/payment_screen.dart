import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/payment/screen/widget/user_info_widget.dart';
import 'package:app_ban_giay/module/payment_method/payment_method_index.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Thủ tục thanh toán",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    "Địa chỉ giao hàng",
                    style: TextStyle(fontSize: 15, color: Color(0xff222222)),
                  ),
                ),
                UserInfoWidget(
                  model: UserInfoModel(
                      name: "Nhà", address: "123 Quang Trung, Gò Vấp, Tp. HCM"),
                  canEdit: true,
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
                    style: TextStyle(color: Color(0xff222222), fontSize: 15),
                  ),
                ),
                Wrap(
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
                            salePrice: 200000,
                            price: 300000,
                            photo:
                                "https://ananas.vn/wp-content/uploads/Pro_AV00165_1-500x500.jpeg"),
                        showCartCount: true,
                      ),
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
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color:
                                Color.fromARGB((0.05 * 225).round(), 0, 0, 0),
                            blurRadius: 10,
                            offset: const Offset(0, 0))
                      ]),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tổng:",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      Text(
                        "101.030.000đ",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      )
                    ],
                  ),
                )
              ],
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
        child: InkWell(
          onTap: () =>
              context.push(Func.convertName(const PaymentMethodIndex().key)),
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
