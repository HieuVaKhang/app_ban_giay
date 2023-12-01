import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/payment/provider/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoBottomSheetWidget extends StatefulWidget {
  const UserInfoBottomSheetWidget({Key? key}) : super(key: key);

  @override
  State<UserInfoBottomSheetWidget> createState() => _UserInfoBottomSheetWidgetState();
}

class _UserInfoBottomSheetWidgetState extends State<UserInfoBottomSheetWidget> {
    final TextEditingController fullnaneCtrl = TextEditingController();

    final TextEditingController addressCtrl = TextEditingController();

    final TextEditingController phoneCtrl = TextEditingController();

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 32,
                height: 2,
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Color(0xffD9D9D9),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Thêm địa chỉ mới",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width - 40,
                height: 1,
                color: const Color(0xffF0F0F0),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                width: MediaQuery.of(context).size.width - 40,
                height: 1,
                color: const Color(0xffF0F0F0),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: fullnaneCtrl,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Họ và tên",
                    prefixIcon: Icon(
                      Icons.person,
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
                    filled: true,
                    fillColor: Color(0xffF4F4F4),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Bạn chưa nhập họ tên ";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: addressCtrl,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Địa chỉ",
                    prefixIcon: Icon(
                      Icons.location_on_rounded,
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
                    filled: true,
                    fillColor: Color(0xffF4F4F4),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Bạn chưa nhập địa chỉ";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Số điện thoại",
                    prefixIcon: Icon(
                      Icons.phone,
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
                    filled: true,
                    fillColor: Color(0xffF4F4F4),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Bạn chưa nhập số điện thoại";
                    }
                    final checker =
                        RegExp(r'(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b');
                    if (value.length < 10 || !checker.hasMatch(value)) {
                      return "Số điện thoại không hợp lệ";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 14, bottom: 14),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  children: [
                    InkWell(
                      onTap: () => context.pop(),
                      child: Container(
                        width:
                            (MediaQuery.of(context).size.width - 60 - 15) / 2,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(25),
                              right: Radius.circular(25)),
                          color: Color(0xffE7E7E7),
                        ),
                        child: const Center(
                          child: Text(
                            "Huỷ",
                            style: TextStyle(
                                fontSize: 15,
                                height: 25 / 15,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xffF15E2C),
                              ),
                            ),
                          );
                          await Config.providerContainer
                              .read(userInfoProvider.notifier)
                              .saveUserInfo(UserInfoModel(
                                  address: addressCtrl.text,
                                  fullname: fullnaneCtrl.text,
                                  phone: phoneCtrl.text))
                              .then((value) async {
                            await Config.providerContainer
                                .read(userInfoProvider.notifier)
                                .getData().then((value) {
                                  context.pop();
                                  context.pop();
                                });
                          });
                        }
                      },
                      child: Container(
                        width:
                            (MediaQuery.of(context).size.width - 60 - 10) / 2,
                        height: 50,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(25),
                              right: Radius.circular(25)),
                          color: Color(0xffF15E2C),
                        ),
                        child: const Center(
                          child: Text(
                            "Thêm",
                            style: TextStyle(
                                fontSize: 15,
                                height: 25 / 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
