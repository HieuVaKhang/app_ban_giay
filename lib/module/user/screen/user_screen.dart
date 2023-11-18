import 'dart:math';

import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/user/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../libraries/function.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: const Key('/account'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 35,
                width: 20,
              ),
              Padding(padding: const EdgeInsets.only(left: 21)),
              Text(
                'Tài Khoản',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () =>
                      context.push(Func.convertName(const CartIndex().key)),
                  child: Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 17,
                    ),
                  )),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/avatar.png',
                              height: 66,
                              width: 66,
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                alignment: Alignment.center,
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                    color: Color(0xffF15E2C),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                                child: const Center(
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nguyễn Văn A',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'abc@gmal.com',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 25, bottom: 25),
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Color(0xffF0F0F0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: const Text(
                    'Chỉnh sửa thông tin',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )),
                  Container(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: const Text(
                    'Địa chỉ',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )),
                  Container(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () =>
                          context.push(Func.convertName(const LoginScreen().key)),
                      child: const Text(
                        'Đăng xuất',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      )),
                  Container(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
