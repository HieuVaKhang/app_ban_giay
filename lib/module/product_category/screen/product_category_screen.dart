

import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/product_detail/product_detail_index.dart';
import 'package:app_ban_giay/module/product_detail/provider/product_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:app_ban_giay/module/home/repository/home_repo.dart';
import 'package:app_ban_giay/module/product/screen/widget/product_item_widget.dart';
import 'package:go_router/go_router.dart';

class ProductCategoryScreen extends StatelessWidget {
  const ProductCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Consumer(builder: (context, ref, child) {
                  final homelist = ref.watch(homeListProductProvider);
                  return homelist.when(
                    data: (data) {
                      return Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 15,
                          runSpacing: 15,
                          direction: Axis.horizontal,
                          children: data
                              .map(
                                (e) => InkWell(
                                  onTap: () {
                                    ref
                                        .read(productDetailProvider.notifier)
                                        .getDetail(e.model.id ?? "");
                                    context.push(Func.convertName(
                                        const ProductDetailIndex().key));
                                  },
                                  child: SizedBox(
                                    width: (MediaQuery.of(context).size.width -
                                            40 -
                                            10) /
                                        2,
                                    child: ProductItemWidget(model: e),
                                  ),
                                ),
                              )
                              .toList());
                    },
                    error: ((error, stackTrace) => const Text("Dữ liệu lỗi")),
                    loading: () => const CircularProgressIndicator(
                      color: Color(0xffF15E2C),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
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
