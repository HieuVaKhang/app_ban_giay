import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:app_ban_giay/module/news/repository/news_repo.dart';
import 'package:app_ban_giay/module/news/screen/widget/news_item_widget.dart';
import 'package:app_ban_giay/module/user/user_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class NewsCategoryScreen extends StatelessWidget {
  const NewsCategoryScreen({Key? key})
      : super(key: const Key('/news_category'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                children: [
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
                  Consumer(builder: (context, ref, child) {
                    final newsList = ref.watch(getNewsCategoryProvider);
                    return newsList.when(
                      data: (data) {
                        return Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 15,
                            runSpacing: 15,
                            direction: Axis.horizontal,
                            children: data
                                .map(
                                  (e) => SizedBox(
                                    width: (MediaQuery.of(context).size.width -
                                            40 -
                                            10) /
                                        2,
                                    child: NewsItemWidget(
                                      model: e,
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
      ),
      bottomNavigationBar: Container(
        color: const Color(0xffFF9672),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BottomNavigationBar(
          onTap: (value) {
            print(value);
            switch (value) {
              case 0:
                context.go(Func.convertName(const HomeIndex().key));
                break;
              case 1:
                context.push(Func.convertName(const CartIndex().key));
                break;
              case 2:
                context.go(Func.convertName(const NewsCategoryScreen().key));
                break;
              case 3:
                context.go(Func.convertName(const UserIndex().key));
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
