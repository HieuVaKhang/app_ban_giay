import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/order_detail/provider/order_detail_provider.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final p = ref.watch(orderDetailProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chi tiết đơn hàng",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: p.loading > 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : (p.loading < 0
              ? Center(
                  child: Text("Đã có lỗi xảy ra"),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 10,
                          runSpacing: 10,
                          direction: Axis.horizontal,
                          children: p.list.isNotEmpty
                              ? p.list
                                  .map(
                                    (e) => SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  50 -
                                                  10) /
                                              2,
                                      child: ProductItemWidget(
                                        model: e.idVariant ??
                                            VariantModel(
                                                id: '',
                                                model: ProductModel(),
                                                color: ColorModel(),
                                                size: SizeModel(),
                                                price: 0,
                                                salePrice: 0,
                                                quantity: 0),
                                        showCartCount: true,
                                        showCartCountEdit: false,
                                        showDelete: false,
                                      ),
                                    ),
                                  )
                                  .toList()
                              : [
                                  const Text(
                                      "Chưa có sản phẩm nào trong giỏ hàng"),
                                ],
                        ),
                        Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(
                                          (0.05 * 225).round(), 0, 0, 0),
                                      blurRadius: 10,
                                      offset: const Offset(0, 0))
                                ]),
                            child: Column(
                              children: [
                                Row(
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
                                      Func.formatPrice(p.total),
                                      style: const TextStyle(
                                          color: Color(0xffF15E2C),
                                          fontSize: 16,
                                          height: 25 / 16),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Tình trạng:",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black),
                                    ),
                                    Text(
                                      p.selectedStatus.name ?? "",
                                      style: const TextStyle(
                                          color: Color(0xffF15E2C),
                                          fontSize: 16,
                                          height: 25 / 16),
                                    )
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                )),
    );
  }
}
