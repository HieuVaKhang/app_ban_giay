import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/model/user_info_model.dart';
import 'package:app_ban_giay/module/user_info/user_info_index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget(
      {Key? key,
      required this.model,
      this.isDefault = false,
      this.canEdit = false,
      this.isSelected = false})
      : super(key: key);

  final UserInfoModel model;
  final bool isDefault;
  final bool canEdit;
  final bool isSelected;

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
                  Icons.location_on,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: (MediaQuery.of(context).size.width - 40) / 2),
            child: Flexible(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      runSpacing: 5,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          model.name ?? "",
                          overflow: TextOverflow.ellipsis,
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
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Color(0xff686868), fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (canEdit)
            InkWell(
              onTap: () =>
                  context.push(Func.convertName(const UserInfoIndex().key)),
              child: const Icon(
                Icons.edit,
                size: 24,
                color: Color(0xffF15E2C),
              ),
            )
          else
            Container(
              width: 20,
              height: 20,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xffF15E2C)),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(color: Colors.white, width: 1),
                  color: isSelected ? const Color(0xffF15E2C) : Colors.white,
                ),
              ),
            )
        ],
      ),
    );
  }
}
