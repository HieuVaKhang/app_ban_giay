import 'package:flutter/material.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget(
      {Key? key,
      this.isSelected = false,
      required this.photo,
      required this.name})
      : super(key: key);

  final bool isSelected;
  final String photo;
  final String name;
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
      child: InkWell(
        splashColor: const Color(0xffF15E2C),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.only(right: 15),
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Image.asset(
                  photo,
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                )),
            Expanded(
                child: Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 13),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )),
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(left: 15),
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
      ),
    );
  }
}
