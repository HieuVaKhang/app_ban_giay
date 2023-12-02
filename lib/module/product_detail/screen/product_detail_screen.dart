import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/cart/provider/cart_provider.dart';
import 'package:app_ban_giay/module/product/model/color_model.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/model/size_model.dart';
import 'package:app_ban_giay/module/product_detail/provider/product_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final productProvider = ref.watch(productDetailProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: (productProvider.loading == 0)
          ? SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(productProvider.product.photo ?? "",
                          fit: BoxFit.cover, width: double.infinity),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 10),
                      child: Text(
                        productProvider.product.name ?? "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            productProvider.product.colorName ?? "",
                            style: const TextStyle(
                                color: Color(0xff222222), fontSize: 15),
                          ),
                          DropdownButton(
                            value: SizeModel(
                                id: productProvider.product.sizeId,
                                name: productProvider.product.sizeName),
                            items: productProvider.sizes
                                .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e.name ?? "",
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    )))
                                .toList(),
                            onChanged: (value) {
                              print(value.toString());
                              ref
                                  .read(productDetailProvider.notifier)
                                  .changeSelectedSize(
                                      value ?? productProvider.sizes.first);
                            },
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: productProvider.colors.map((e) {
                          final img = productProvider.variants.firstWhere(
                            (element) {
                              return element.color.id == e.id;
                            },
                          );
                          return InkWell(
                            onTap: () {
                              ref
                                  .read(productDetailProvider.notifier)
                                  .changeSelectedColor(e);
                            },
                            child: Opacity(
                              opacity: e.id == productProvider.product.colorId
                                  ? 1
                                  : 0.5,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                width: 78,
                                height: 78,
                                child: Image.network(
                                  img.model.photo ?? "",
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        productProvider.product.description ?? "",
                        style: const TextStyle(
                            height: 2, fontSize: 12, color: Color(0xff5B5B5B)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xffF0F0F0)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Mô tả sản phẩm ',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff5B5B5B)),
                            ),
                            Image.asset(
                              'assets/images/arrow.png',
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 15, left: 20, right: 20, bottom: 5),
                      child: Text(
                        'Số lượng',
                        style:
                            TextStyle(fontSize: 13, color: Color(0xff5B5B5B)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 15),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.end,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 116,
                            height: 49,
                            margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 7),
                            decoration: const BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () => ref
                                      .read(productDetailProvider.notifier)
                                      .changeQuantity(false),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  (productProvider.quantity == 0
                                          ? 1
                                          : productProvider.quantity)
                                      .toString(),
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                InkWell(
                                  onTap: () => ref
                                      .read(productDetailProvider.notifier)
                                      .changeQuantity(true),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_rounded,
                                        color: Colors.black,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (context) => const Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xffF15E2C),
                                  ),
                                ),
                              );
                              final variant =
                                  productProvider.variants.firstWhere(
                                (element) =>
                                    element.color.id ==
                                        productProvider.product.colorId &&
                                    element.size.id ==
                                        productProvider.product.sizeId,
                                orElse: () => VariantModel(
                                    id: '',
                                    model: ProductModel(),
                                    color: ColorModel(),
                                    size: SizeModel(),
                                    price: 0,
                                    salePrice: 0,
                                    quantity: 0),
                              );
                              ref
                                  .read(cartProvider.notifier)
                                  .addToCart(variant)
                                  .then((value) {
                                context.pop();
                                if (value) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content:
                                        Text("Thêm vào giỏ hàng thành công"),
                                    backgroundColor: Colors.green,
                                  ));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Thêm vào giỏ hàng Thất bại"),
                                    backgroundColor: Colors.orange,
                                  ));
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 12),
                              decoration: const BoxDecoration(
                                  color: Color(0xffF15E2C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/cart.png',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${productProvider.variants.firstWhere((element) => element.color.id == productProvider.product.colorId && element.size.id == productProvider.product.sizeId, orElse: () => VariantModel(id: '', model: ProductModel(), color: ColorModel(), size: SizeModel(), price: 0, salePrice: 0, quantity: 0)).quantity > 0 ? "Cập nhật" : "Thêm vào"} giỏ hàng',
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
// Padding(
//   padding: const EdgeInsets.only(left: 20, bottom: 10),
//   child: Container(
//     padding: const EdgeInsets.all(10),
//     decoration: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(6)),
//         color: Color(0xffE7E7E7)),
//     child: const Text(
//       'Đã bán 8.374',
//       textAlign: TextAlign.left,
//       style: TextStyle(
//         fontSize: 13,
//         color: Colors.black,
//       ),
//     ),
//   ),
// ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xffF0F0F0)))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  Func.formatPrice(
                                      (productProvider.product.salePrice ?? 0) *
                                          (productProvider.quantity == 0
                                              ? 1
                                              : productProvider.quantity)),
                                  style: const TextStyle(
                                      color: Color(0xffF15E2C), fontSize: 18),
                                ),
                              ),
                              Text(
                                Func.formatPrice(
                                    (productProvider.product.price ?? 0) *
                                        (productProvider.quantity == 0
                                            ? 1
                                            : productProvider.quantity)),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
          : (productProvider.loading > 0
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffF15E2C),
                  ),
                )
              : const Center(
                  child: Text("Đã có lỗi xảy ra, vui lòng thử lại sau"),
                )),
      bottomNavigationBar: Container(
        color: const Color(0xffFF9672),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BottomNavigationBar(
          elevation: 0,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          backgroundColor: const Color(0xffFF9672),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel_rounded),
              label: 'Giỏ hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_rounded),
              label: 'Tin tức',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind_outlined),
              label: 'Tài khoản',
            ),
          ],
        ),
      ),
    );
  }
}
