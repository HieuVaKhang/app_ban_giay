import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/payment/screen/widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      "Nhà",
      "Cơ quan",
      "Xưởng",
      "Công ty",
    ];
    final List<String> addresses = [
      "123 Quang Trung, Gò Vấp, Tp. HCM",
      "CVPM Quang Trung, P. Tân Chánh Hiệp",
      "CVPM Quang Trung, P. Tân Chánh Hiệp",
      "CVPM Quang Trung, P. Tân Chánh Hiệp",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Địa chỉ giao hàng",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Wrap(
                runSpacing: 20,
                children: List.generate(
                  4,
                  (index) => UserInfoWidget(
                    model: UserInfoModel(
                        name: names[index], address: addresses[index]),
                    isDefault: index == 0,
                    isSelected: index == 0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Color(0xffE7E7E7),
                    ),
                    child: const Center(
                      child: Text(
                        "Thêm địa chị mới",
                        style: TextStyle(
                            color: Color(0xff222222),
                            fontSize: 15,
                            height: 25 / 15),
                      ),
                    ),
                  ),
                ),
              )
            ],
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
          onTap: () => context.pop(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xffF15E2C),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30), right: Radius.circular(30)),
            ),
            child: const Text(
              "Apply",
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
