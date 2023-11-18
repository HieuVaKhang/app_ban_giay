import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:app_ban_giay/module/news/model/news_model.dart';
import 'package:app_ban_giay/module/news/screen/widget/news_item_widget.dart';
import 'package:app_ban_giay/module/user/screen/register_screen.dart';
import 'package:app_ban_giay/module/user/screen/user_screen.dart';

import 'package:flutter/material.dart';
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
              onTap: () =>
                  context.push(Func.convertName(const UserScreen().key)),
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
            child: InkWell(
              onTap: () =>
                  context.push(Func.convertName(const CartIndex().key)),
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
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Center(
                        child: Text(
                          '4',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    )),
              ]),
            ),
          )
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
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 17, left: 20, right: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(spacing: 13, children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xffF15E2C),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            'Giày Nam',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xffF15E2C),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            'Giày Nữ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xffF15E2C),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            'Phụ kiện khác',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xffF15E2C),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: const Text(
                            'Phụ kiện khác 2',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]),
                    )),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 15,
                  runSpacing: 15,
                  direction: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => SizedBox(
                      width: (MediaQuery.of(context).size.width - 40 - 10) / 2,
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
    );
  }
}
