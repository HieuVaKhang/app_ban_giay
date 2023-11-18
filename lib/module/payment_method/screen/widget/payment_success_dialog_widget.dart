import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessDialogWidget extends StatelessWidget {
  const PaymentSuccessDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                "assets/images/order_success.png",
                width: 175,
                height: 169,
              )),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: const Text(
              "Đặt hàng thành công",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: const Text(
              "Chúc mừng bạn đã đặt hàng thành công",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff5B5B5B), fontSize: 14, height: 25 / 14),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(60), right: Radius.circular(60)),
              color: Color(0xffF15E2C),
            ),
            child: InkWell(
              splashColor: const Color.fromARGB(255, 241, 74, 44),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: const Center(
                  child: Text(
                    "Xem đơn hàng",
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, height: 25 / 15),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(60), right: Radius.circular(60)),
              color: Color(0xffE7E7E7),
            ),
            child: InkWell(
              onTap: () =>
                  context.push(Func.convertName(const HomeIndex().key)),
              splashColor: const Color.fromARGB(255, 231, 231, 231),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                child: const Center(
                  child: Text(
                    "Trang chủ",
                    style: TextStyle(
                        color: Colors.black, fontSize: 15, height: 25 / 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
