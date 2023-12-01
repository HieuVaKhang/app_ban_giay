import 'package:app_ban_giay/module/cart/cart_index.dart';
import 'package:app_ban_giay/module/user/user_index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../libraries/function.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: const Key('/account'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Row(
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 35,
                width: 20,
              ),
              Padding(padding: EdgeInsets.only(left: 21)),
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
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: const Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 17,
                    ),
                  )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
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
                  const Column(
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
                  margin: const EdgeInsets.only(top: 25, bottom: 25),
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: const Color(0xffF0F0F0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InkWell(
                      child: Text(
                    'Chỉnh sửa thông tin',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )),
                  Container(
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const InkWell(
                      child: Text(
                    'Địa chỉ',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )),
                  Container(
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width:
                                          (MediaQuery.of(context).size.width) /
                                              2,
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Text(
                                        'Đăng xuất',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    onTap: () async {
                                      // Thực hiện đăng xuất
                                      context.push(Func.convertName(
                                          const UserIndex().key));
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Đăng xuất thành công!',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFF15E2C),
                                      ),
                                      width:
                                          (MediaQuery.of(context).size.width) /
                                              2,
                                      padding:
                                          EdgeInsets.only(top: 15, bottom: 15),
                                      child: Text(
                                        'Huỷ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Đăng xuất',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      )),
                  Container(
                    child: const Icon(
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
