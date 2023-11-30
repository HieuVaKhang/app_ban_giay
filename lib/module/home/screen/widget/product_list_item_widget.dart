import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/module/home/provider/home_provider.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductListItemWidget extends StatelessWidget {
  const ProductListItemWidget(
      {Key? key, required this.isChecked, required this.model})
      : super(key: key);
  final bool isChecked;
  final CategoryModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Config.providerContainer
          .read(selectedCategoryProvider.notifier)
          .update((state) => model),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: isChecked ? Color(0xffF15E2C) : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: isChecked
                ? null
                : Border.all(
                    width: 1,
                    color: Colors.black,
                  )),
        child: Text(
          model.name ?? "",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: isChecked ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
