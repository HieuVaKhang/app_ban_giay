import 'package:app_ban_giay/libraries/config.dart';
import 'package:app_ban_giay/libraries/function.dart';
import 'package:app_ban_giay/module/order/provider/order_provider.dart';
import 'package:app_ban_giay/module/order_detail/order_detail_index.dart';
import 'package:app_ban_giay/module/order_detail/provider/order_detail_provider.dart';
import 'package:app_ban_giay/module/product/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final op = ref.watch(orderNotifierProvider);
    final list = (op.viewComplete ? op.listOrderComplete : op.listOrder);
    print(list.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Đơn hàng",
          style: TextStyle(color: Color(0xff222222), fontSize: 20),
        ),
      ),
      body: op.loading > 1
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (op.loading < 0
              ? const Center(
                  child: Text("đã xảy ra lỗi"),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await ref.read(orderNotifierProvider.notifier).getOrder();
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  ref
                                      .read(orderNotifierProvider.notifier)
                                      .changeView(false);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 2,
                                              color: !op.viewComplete
                                                  ? Colors.orange
                                                  : Colors.grey))),
                                  child: const Center(child: Text("Đang đặt")),
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  ref
                                      .read(orderNotifierProvider.notifier)
                                      .changeView(true);
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 2,
                                              color: op.viewComplete
                                                  ? Colors.orange
                                                  : Colors.grey))),
                                  child:
                                      const Center(child: Text("Hoàn thành")),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              child: Column(
                                children: list.isNotEmpty
                                    ? list
                                        .map((e) => InkWell(
                                              onTap: () {
                                                ref
                                                    .read(orderDetailProvider
                                                        .notifier)
                                                    .getOrderDetail(
                                                        e.id ?? "",
                                                        e.idStatus ??
                                                            CategoryModel(),
                                                        e.total ?? 0);
                                                context.push(Func.convertName(
                                                    const OrderDetailIndex()
                                                        .key));
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.network(
                                                          e
                                                                  .detail
                                                                  ?.idVariant
                                                                  ?.model
                                                                  .photo ??
                                                              Config.noImage,
                                                          width: 50,
                                                          height: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Expanded(
                                                            child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(e
                                                                      .detail
                                                                      ?.idVariant
                                                                      ?.model
                                                                      .name ??
                                                                  "unknow"),
                                                              Text(e
                                                                      .detail
                                                                      ?.idVariant
                                                                      ?.size
                                                                      .name ??
                                                                  "unknow"),
                                                              Text(e
                                                                      .detail
                                                                      ?.idVariant
                                                                      ?.color
                                                                      .name ??
                                                                  "unknow"),
                                                            ],
                                                          ),
                                                        ))
                                                      ],
                                                    ),
                                                    Text(e.idStatus?.name ??
                                                        "unknow"),
                                                    Text(
                                                        "Ngày đặt: ${DateFormat('dd/MM/yyyy').format(e.dateCreated ?? DateTime(1970))}")
                                                  ],
                                                ),
                                              ),
                                            ))
                                        .toList()
                                    : [
                                        Center(
                                          child: Column(
                                            children: [
                                              Image.network(Config.noImage),
                                              const Text(
                                                  "Chưa có đơn hàng nào"),
                                            ],
                                          ),
                                        )
                                      ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }
}
