import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset('assets/images/pro_detail.png',
                fit: BoxFit.cover, width: double.infinity),
          ),
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: const Text(
              "Giày Nam",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Color(0xffE7E7E7)),
              child: const Text(
                'Đã bán 8.374',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffF0F0F0)))),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        '29.390.000đ',
                        style:
                            TextStyle(color: Color(0xffF15E2C), fontSize: 18),
                      ),
                    ),
                    Text(
                      '35.269.000đ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Màu sắc: Nâu',
                  style: TextStyle(color: Color(0xff222222), fontSize: 15),
                ),
                DropdownButton(items: const [
                  DropdownMenuItem(
                      child: Text(
                    'Size',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ))
                ], onChanged: null)
              ],
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 78,
                  height: 78,
                  child: Image.asset(
                    'assets/images/pro_detail.png',
                  ),
                ),
                SizedBox(
                  width: 78,
                  height: 78,
                  child: Image.asset(
                    'assets/images/pro_detail.png',
                  ),
                ),
                SizedBox(
                  width: 78,
                  height: 78,
                  child: Image.asset(
                    'assets/images/pro_detail.png',
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'iPhone 14 Pro Max comes with 6.7 inches LTPO Super Retina XDR OLED, 120Hz, Dolby Vision Display, Chipset Apple A16 Bionic (4 nm), OS iOS 16, CPU Hexa-core, GPU Apple GPU (5-core graphics), 128GB Storage. It having 48 MP + 12 MP + 12 MP Triple Rear Camera & 12 MP Front Camera.',
              style:
                  TextStyle(height: 2, fontSize: 12, color: Color(0xff5B5B5B)),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffF0F0F0)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Mô tả sản phẩm ',
                    style: TextStyle(fontSize: 12, color: Color(0xff5B5B5B)),
                  ),
                  Image.asset(
                    'assets/images/arrow.png',
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 5),
            child: Text(
              'Số lượng',
              style: TextStyle(fontSize: 13, color: Color(0xff5B5B5B)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 116,
                  height: 49,
                  margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                  decoration: const BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: Colors.black,
                            size: 10,
                          ),
                        ),
                      ),
                      Text(
                        "2",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.add_rounded,
                          color: Colors.black,
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  decoration: const BoxDecoration(
                      color: Color(0xffF15E2C),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/cart.png',
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Thêm vào giỏ hàng',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
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
