import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:go_router/go_router.dart';

import '../module/user/user_index.dart';

final List<GoRoute> danhsachRoute = [
  Func.addGoRouter(const HomeIndex()),
  Func.addGoRouter(const CartIndex()),
  Func.addGoRouter(const UserIndex()),
];

const String initRouter = "/welcome";

