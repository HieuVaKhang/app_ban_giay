import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/generate_product/generate_product_index.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:app_ban_giay/module/news/screen/widget/news_category_screen.dart';
import 'package:app_ban_giay/module/payment/payment_index.dart';
import 'package:app_ban_giay/module/payment_method/payment_method_index.dart';
import 'package:app_ban_giay/module/product_category/product_category_index.dart';
import 'package:app_ban_giay/module/product_detail/product_detail_index.dart';
import 'package:app_ban_giay/module/user/screen/login_screen.dart';
import 'package:app_ban_giay/module/user/screen/register_screen.dart';
import 'package:app_ban_giay/module/user/screen/user_screen.dart';
import 'package:app_ban_giay/module/user_info/user_info_index.dart';
import 'package:go_router/go_router.dart';

import '../module/user/user_index.dart';

final List<GoRoute> danhsachRoute = [
  Func.addGoRouter(const HomeIndex()),
  Func.addGoRouter(const CartIndex()),
  Func.addGoRouter(const PaymentIndex()),
  Func.addGoRouter(const UserInfoIndex()),
  Func.addGoRouter(const PaymentMethodIndex()),
  Func.addGoRouter(const UserIndex()),
  Func.addGoRouter(const LoginScreen()),
  Func.addGoRouter(const RegisterScreen()),
  Func.addGoRouter(const GenerateProductIndex()),
  Func.addGoRouter(const ProductDetailIndex()),
  Func.addGoRouter(const ProductCategoryIndex()),
  Func.addGoRouter(const NewsCategoryScreen()),

  Func.addGoRouter(const UserScreen()),
];
String initRouter = Func.convertName(const UserIndex().key);
