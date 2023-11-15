import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget(
      {Key? key,
      required this.model,
      this.isDefault = false,
      this.canEdit = false})
      : super(key: key);

  final UserInfoModel model;
  final bool isDefault;
  final bool canEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB((0.05 * 255).round(), 0, 0, 0),
                blurRadius: 10,
                offset: const Offset(0, 0))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color(0xffEAF5FD),
              ),
              child: Container(
                width: 34,
                height: 34,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color(0xffF15E2C),
                ),
                child: const Icon(
                  Icons.pin_drop,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: (MediaQuery.of(context).size.width - 40) / 2),
            child: InkWell(
              child: Container(
                clipBehavior: Clip.hardEdge,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      runSpacing: 5,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          model.name ?? "",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        if (isDefault)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xffE7E7E7)),
                            child: const Text(
                              "Mặc định",
                              style:
                                  TextStyle(fontSize: 8, color: Colors.black),
                            ),
                          )
                      ],
                    ),
                    Text(
                      model.address ?? "",
                      style: const TextStyle(
                          color: Color(0xff686868), fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
