import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/user/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: const Key("/register"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage('assets/images/logo.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Đăng Ký Tài Khoản",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            width: (MediaQuery.of(context).size.width) - 50,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.mail),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(0, 33, 149, 243)),
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
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                prefixIcon: const Icon(Icons.lock),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color.fromARGB(0, 33, 149, 243)),
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
            child: Text(
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
                  child: Text(
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
    );
  }
}
