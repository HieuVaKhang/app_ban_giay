import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/user/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Image(
              image: AssetImage('assets/images/welcome_app.png'),
            ),
            Text(
              "Let's Start",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            InkWell(
              onTap: ()=> context.push(Func.convertName(const LoginScreen().key)),
              child: Container(
                margin: const EdgeInsets.only(top: 45,bottom: 20),
                alignment: Alignment.center,
                width:  (MediaQuery.of(context).size.width) - 50,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFFF15E2C),
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30),
                    right: Radius.circular(30),
                  ),
                ),
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                    fontSize: 15,
                    height: 25/15,
                    color: Colors.white,
                  ),
                ),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Bạn đã có tài khoản?",
                  style: TextStyle(
                    fontSize: 13,
                    height: 25/13,
                    color: Colors.grey,
                    
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
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
          ]
        ),
      ),
    );
  }
}

