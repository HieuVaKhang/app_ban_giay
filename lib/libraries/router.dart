import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:app_ban_giay/module/payment/payment_index.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> danhsachRoute = [
  Func.addGoRouter(const HomeIndex()),
  Func.addGoRouter(const CartIndex()),
  Func.addGoRouter(const PaymentIndex()),
];

const String initRouter = "/cart";