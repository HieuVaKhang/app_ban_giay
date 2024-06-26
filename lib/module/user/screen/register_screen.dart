import 'dart:ffi';

import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/user/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:app_ban_giay/libraries/firebase_auth_services.dart';
import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/user/model/user_model.dart';
import 'package:app_ban_giay/module/user/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: const Key("/register"));

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [
            const Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Đăng Ký Tài Khoản",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: (MediaQuery.of(context).size.width) - 50,
              child: TextFormField(
                controller: _fullNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Họ và tên",
                  prefixIcon: Icon(Icons.people_alt_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 33, 149, 243)),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30),
                    ),
                  ),
                  filled: true, // Cho phép đổ màu nền
                  fillColor: Color(0xffF4F4F4), // Màu sắc của nền
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              width: (MediaQuery.of(context).size.width) - 50,
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 33, 149, 243)),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30),
                    ),
                  ),
                  filled: true, // Cho phép đổ màu nền
                  fillColor: Color(0xffF4F4F4), // Màu sắc của nền
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width) - 50,
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Mật khẩu",
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(0, 33, 149, 243)),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30),
                    ),
                  ),
                  filled: true, // Cho phép đổ màu nền
                  fillColor: Color(0xffF4F4F4), // Màu sắc của nền
                ),
              ),
            ),
            InkWell(
                onTap: () async {
                  User? user = await _auth.signUpWithEmailAndPassword(
                      _emailController.text, _passwordController.text, context);
                  String id = user?.uid ?? "";
        
                  if (id.isNotEmpty) {
                    Config.providerContainer
                        .read(userProvider.notifier)
                        .state
                        .copyWith(
                            id: id,
                            email: _emailController.text,
                            fullname: _fullNameController.text);
        
                    await _auth
                        .addUser(
                            id, _emailController.text, _fullNameController.text)
                        .then((value) {
                      print('Đăng ký thành công!');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                          'Đăng ký thành công!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                      );
        
                      context.go(Func.convertName(const LoginScreen().key));
                    });
                  } else {
                    print('Some error occured!');
                    _showSnackBar(
                        'Đăng ký thất bại. Vui lòng kiểm tra lại thông tin đăng nhập.');
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width) - 50,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF15E2C),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(
                      fontSize: 15,
                      height: 25 / 15,
                      color: Colors.white,
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bạn đã có tài khoản?",
                  style: TextStyle(
                    fontSize: 13,
                    height: 25 / 13,
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () =>
                      context.push(Func.convertName(const LoginScreen().key)),
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                        fontSize: 13,
                        height: 25 / 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

// final UserProvider = StateProvider<UserModel>((ref) {
//   // return UserModel(id: 'nYMTbRoUTaWSS23PH7DGd3N8uz93', email: '123@123.com', fullname: 'tesst fullname');
//   // return UserModel(id: '', email: '', fullname: '');
// });
