import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/libraries/firebase_auth_services.dart';
import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/home/home_index.dart';
import 'package:app_ban_giay/module/user/provider/user_provider.dart';
import 'package:app_ban_giay/module/user/screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: const Key("/login"));

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

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
                  return "Bạn chưa nhập email!";
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
              // keyboardType: TextInputType.visiblePassword,
              obscureText: _obscureText,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Bạn chưa nhập mật khẩu!";
                }
                return null;
              },
            ),
          ),
          InkWell(
              onTap: () async {
                String email = _emailController.text;
                String password = _passwordController.text;

                await _auth
                    .signInWithEmailAndPassword(email, password, context)
                    .then((value) async {
                  print(value);
                  if (value?.uid.isNotEmpty ?? false) {
                    await getUser(value?.uid ?? "").then((value) {
                      if (Config.providerContainer
                              .read(userProvider)
                              .id
                              ?.isNotEmpty ??
                          false) {
                        context.go(Func.convertName(const HomeIndex().key));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                            'Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin đăng nhập.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )),
                        );
                      }
                    });
                  } else {
                    print('Some error occured!');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                        'Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin đăng nhập.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )),
                    );
                  }
                });
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

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
