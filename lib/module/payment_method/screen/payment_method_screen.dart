import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:app_ban_giay/module/payment_method/screen/widget/payment_method_item_widget.dart';
import 'package:app_ban_giay/module/payment_method/screen/widget/payment_success_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> name = [
      "Thanh toán khi nhận hàng",
      "Mono",
      "Ngân hàng điện tử",
    ];
    final List<String> photo = [
      "assets/images/cod.png",
      "assets/images/momo.png",
      "assets/images/bank.png",
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Giỏ hàng",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Chọn phương thức thanh toán bạn muốn sử dụng",
                  style: TextStyle(color: Color(0xff222222), fontSize: 13),
                ),
              ),
              Wrap(
                runSpacing: 20,
                children: List.generate(
                    3,
                    (index) => PaymentMethodItemWidget(
                          photo: photo[index],
                          name: name[index],
                          isSelected: index == 0,
                        )),
              ),
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
          onTap: () => showDialog(
              context: context,
              barrierColor: Color.fromARGB((0.7 * 255).round(), 0, 0, 0),
              builder: (context) =>
                  const PaymentSuccessDialogWidget()).then(
              (value) => context.go(Func.convertName(const HomeIndex().key))),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 12),
            decoration: const BoxDecoration(
              color: Color(0xffF15E2C),
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(30), right: Radius.circular(30)),
            ),
            child: const Text(
              "Xác nhận thanh toán",
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
