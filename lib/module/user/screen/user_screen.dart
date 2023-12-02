import 'package:app_ban_giay/module/user/model/user_model.dart';
import 'package:app_ban_giay/module/user/provider/user_provider.dart';
import 'package:app_ban_giay/module/user/screen/login_screen.dart';
import 'package:app_ban_giay/module/user/screen/register_screen.dart';
import 'package:app_ban_giay/module/user/user_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../libraries/function.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: const Key('/account'));

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _fullNameController = TextEditingController();
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
                  // onTap: () =>
                  //     context.push(Func.convertName(const CartIndex().key)),
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
          child: Consumer(builder: (context, ref, child) {
            final user = ref.watch(UserProvider);
            return Column(
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.fullname ?? "",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          user.email ?? "",
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
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Consumer(builder: (context, ref, child) {
                          final user = ref.watch(UserProvider);
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: Colors.white,
                            ),
                            child: Form(
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            user.fullname ?? "",
                                            style: TextStyle(
                                              fontSize: 30,
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 20),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) -
                                                50,
                                            child: TextFormField(
                                              controller: _fullNameController,
                                              keyboardType: TextInputType.text,
                                              decoration: const InputDecoration(
                                                labelText: "Nhập tên mới",
                                                prefixIcon: Icon(
                                                    Icons.people_alt_outlined),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromARGB(
                                                          0, 33, 149, 243)),
                                                  borderRadius:
                                                      BorderRadius.horizontal(
                                                    left: Radius.circular(30),
                                                    right: Radius.circular(30),
                                                  ),
                                                ),
                                                filled:
                                                    true, // Cho phép đổ màu nền
                                                fillColor: Color(
                                                    0xffF4F4F4), // Màu sắc của nền
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                                2,
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 15),
                                            child: Text(
                                              'Sửa',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          onTap: () async {
                                            await updateUser(user.id.toString(),
                                                user.fullname.toString());
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'Sửa Thành Công!',
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF15E2C),
                                            ),
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) /
                                                2,
                                            padding: EdgeInsets.only(
                                                top: 15, bottom: 15),
                                            child: Text(
                                              'Huỷ',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          );
                        });
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    child: Row(
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
                  ),
                ),
                // const SizedBox(
                //   height: 30,
                // ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    child: Row(
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
                  ),
                ),

                InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    width:
                                        (MediaQuery.of(context).size.width) / 2,
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
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF15E2C),
                                    ),
                                    width:
                                        (MediaQuery.of(context).size.width) / 2,
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
                    child: Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Đăng xuất',
                            style: TextStyle(fontSize: 13, color: Colors.black),
                          ),
                          Container(
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            );
          }),
        ));
  }
}

final UserProvider = StateProvider<UserModel>((ref) {
  return UserModel(
      id: 'nYMTbRoUTaWSS23PH7DGd3N8uz93',
      email: '123@123.com',
      fullname: 'tesst fullname');
  // return UserModel(id: '', email: '', fullname: '');
});
