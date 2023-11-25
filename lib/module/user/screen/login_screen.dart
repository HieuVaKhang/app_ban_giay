import 'package:app_ban_giay/libraries/firebase_auth_services.dart';
import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:app_ban_giay/module/user/screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: const Key("/login"));

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Image(
            image: AssetImage('assets/images/logo.png'),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Đăng Nhập",
            style: TextStyle(
              fontSize: 30,
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
                prefixIcon: Icon(
                  Icons.mail,
                  color: Color(0xff222222),
                ),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Bạn chưa nhập Email ";
                }
                return null;
              },
              onChanged: (value) {},
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
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff222222),
                ),
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
              onTap: _SignIn,
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
                  "Đăng Nhập",
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
                    context.push(Func.convertName(const RegisterScreen().key)),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Đăng ký",
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


  void _SignIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if(user != null){
      print('Đăng nhập thành công!');
      context.push(Func.convertName(const HomeIndex().key));
    } else{
       print('Some error occured!');
    }
  }
}
