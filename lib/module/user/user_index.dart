import 'package:app_ban_giay/module/user/screen/login_screen.dart';
import 'package:app_ban_giay/module/user/screen/register_screen.dart';
import 'package:app_ban_giay/module/user/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

class UserIndex extends StatelessWidget {
  const UserIndex({Key? key}) : super(key: const Key('/welcome'));

  @override
  Widget build(BuildContext context) {
    return LoginScreen();
  }
}
