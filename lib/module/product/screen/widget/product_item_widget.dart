import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/product/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({Key? key, required this.model}) : super(key: key);
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(21, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 0)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            model.photo ?? "",
            fit: BoxFit.cover,
            height: 160,
             width: double.infinity,
          ),
          Text(
            model.name ?? "",
            style: const TextStyle(
                color: Colors.black, fontSize: 13, height: 25 / 13),
            textAlign: TextAlign.center,
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.salePrice != 0
                      ? Func.formatPrice(model.salePrice)
                      : (model.price != 0
                          ? Func.formatPrice(model.price)
                          : "Liên hệ"),
                  style: const TextStyle(
                      color: Color(0xffF15E2C), fontSize: 13, height: 25 / 13),
                ),
                if (model.salePrice != 0)
                  Text(
                    Func.formatPrice(model.price),
                    style: const TextStyle(
                        color: Color(0xff181818),
                        fontSize: 11,
                        height: 25 / 11,
                        decoration: TextDecoration.lineThrough),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
