import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/cart/model/variant_model.dart';
import 'package:app_ban_giay/module/cart/screen/widget/cart_bottom_sheet_modal_widget.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(
      {Key? key,
      required this.model,
      this.showDelete = false,
      this.showCartCount = false,
      this.showCartCountEdit = false})
      : super(key: key);
  final VariantModel model;
  final bool showDelete;
  final bool showCartCount;
  final bool showCartCountEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 14),
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
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                model.model.photo ?? "",
                fit: BoxFit.cover,
                height: 160,
                width: double.infinity,
              ),
              Text(
                model.model.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black, fontSize: 13, height: 25 / 13),
                textAlign: TextAlign.center,
              ),
              Container(
                padding:
                    const EdgeInsets.only(top: 6, left: 6, right: 6, bottom: 0),
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
                          color: Color(0xffF15E2C),
                          fontSize: 13,
                          height: 25 / 13),
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
              ),
              if (showCartCount)
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 12, 10, 0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                  decoration: const BoxDecoration(
                      color: Color(0xffF3F3F3),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: showCartCountEdit
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (showCartCountEdit)
                        const InkWell(
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 10,
                            ),
                          ),
                        ),
                      const Text(
                        "2",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      if (showCartCountEdit)
                        const InkWell(
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.black,
                            size: 10,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
          if (showDelete)
            Positioned(
              right: 10,
              top: 10,
              child: InkWell(
                onTap: () => showModalBottomSheet(
                  barrierColor: Color.fromARGB((0.7 * 255).round(), 0, 0, 0),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => CartBottomSheetModalWidget(
                    model: model,
                  ),
                ),
                child: Container(
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffF15E2C),
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          if (model.color.name != null || model.size.name != null)
            Positioned(
                top: 5,
                left: 5,
                right: 0,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (model.color.name != null)
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffF15E2C),
                          ),
                          width: constraints.maxWidth / 2,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            model.color.name ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                      if (model.size.name != null)
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xffF15E2C),
                          ),
                          width: constraints.maxWidth / 2,
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            model.size.name ?? "",
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                        ),
                    ],
                  );
                }))
        ],
      ),
    );
  }
}
