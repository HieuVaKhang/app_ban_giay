import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/cart/provider/cart_provider.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:app_ban_giay/module/home/repository/home_repo.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:app_ban_giay/module/news/model/news_model.dart';
import 'package:app_ban_giay/module/news/screen/widget/news_item_widget.dart';
import 'package:app_ban_giay/module/product_detail/product_detail_index.dart';
import 'package:app_ban_giay/module/user/screen/user_screen.dart';
import 'package:app_ban_giay/module/user/user_index.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';

final List<String> imageList = [
  "https://ananas.vn/wp-content/uploads/Web1920-1.jpeg",
  "https://ananas.vn/wp-content/uploads/Hi-im-Mule_1920x1050-Desktop.jpg",
  "https://ananas.vn/wp-content/uploads/BMPL_Desktop_1920x10501.jpg",
  "https://ananas.vn/wp-content/uploads/Banner_Sale-off-1.jpg",
  "https://ananas.vn/wp-content/uploads/banner-phu%CC%A3_2m-600x320.jpg",
  "https://ananas.vn/wp-content/uploads/Banner_Clothing.jpg"
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                context.push(Func.convertName(const UserScreen().key));
              },
              child: Image.asset(
                'assets/images/avatar.png',
                height: 50,
                width: 50,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Text(
                    'User',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer(
                builder: (context, ref, child) {
                  return InkWell(
                    onTap: () {
                      context.push(Func.convertName(const CartIndex().key));
                    },
                    child: Stack(children: [
                      Center(
                        child: Image.asset('assets/images/icon_cart.png'),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                                color: Color(0xffF15E2C),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(
                              child: Text(
                                ref
                                    .read(cartProvider.notifier)
                                    .getCartNumber()
                                    .toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          )),
                    ]),
                  );
                },
              )),
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: GFCarousel(
                    height: 250.0,
                    autoPlay: true,
                    viewportFraction: 1.0,
                    items: imageList.map(
                      (url) {
                        return ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(21.0)),
                          child: Image.network(url,
                              fit: BoxFit.cover, width: 1000.0),
                        );
                      },
                    ).toList(),
                    onPageChanged: (index) {
                      setState(() {
                        index;
                      });
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'SẢN PHẨM PHỔ BIẾN',
                    style: TextStyle(
                        color: Color(0xffF15E2C),
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  final categories = ref.watch(getCategoryProductProvider);
                  return categories.when(
                    data: (data) {
                      return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 17, left: 20, right: 20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Wrap(
                                spacing: 13,
                                children: data
                                    .map(
                                      (e) => Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF15E2C),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Text(
                                          e.name ?? "",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList()),
                          ));
                    },
                    error: (error, stackTrace) => const Text("Lỗi đã xảy ra"),
                    loading: () => const CircularProgressIndicator(
                      color: Color(0xffF15E2C),
                    ),
                  );
                }),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  direction: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => InkWell(
                      onTap: () => context
                          .push(Func.convertName(const ProductDetailIndex().key)),
                      child: SizedBox(
                        width:
                            (MediaQuery.of(context).size.width - 40 - 10) / 2,
                        child: ProductItemWidget(
                          model: ProductModel(
                              name: "Tên sản phẩm",
                              salePrice: 200000,
                              price: 300000,
                              photo:
                                  "https://ananas.vn/wp-content/uploads/Pro_AV00165_1-500x500.jpeg"),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 17, bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  decoration: const BoxDecoration(
                    color: Color(0xffF15E2C),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Text(
                    'Xem Thêm',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'TIN TỨC & BÀI VIẾT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffF15E2C),
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  direction: Axis.horizontal,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: (MediaQuery.of(context).size.width - 40 - 10) / 2,
                      child: NewsItemWidget(
                        model: NewsModel(
                            name: "Sneaker Fest Vietnam và sự kết hợp",
                            description:
                                "Urbas Corluray Pack đem đến lựa chọn “làm mới mình” với sự kết hợp 5 gam màu mang sắc thu; phù hợp với những...",
                            photo:
                                "https://ananas.vn/wp-content/uploads/kvngang_mobile_web-300x160.jpg"),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 17, bottom: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  decoration: const BoxDecoration(
                    color: Color(0xffF15E2C),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Text(
                    'Xem Thêm',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xffFF9672),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BottomNavigationBar(
          onTap: (value) {
            switch (value) {
              case 0:
                context.go(Func.convertName(const HomeIndex().key));
                break;
              case 1:
                context.push(Func.convertName(const CartIndex().key));
                break;
              case 2:
                context.go(Func.convertName(const HomeIndex().key));
                break;
              case 3:
                context.go(Func.convertName(const UserScreen().key));
                break;
              default:
                context.push(Func.convertName(const HomeIndex().key));
            }
          },
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
