import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen", style: TextStyle(color: Color(0xffF15E2C))),
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
            child: InkWell(
              onTap: () => context.go(Func.convertName(const CartIndex().key)),
              child: const Text('Go to cart'),
            ),
          ))
        ],
      ),
    );
  }
}
