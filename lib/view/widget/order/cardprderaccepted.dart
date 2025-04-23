import 'package:ecommercecourse/controller/orders/accepted_controller.dart';
import 'package:ecommercecourse/controller/orders/pending_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/ordersmodel.dart';
import 'package:ecommercecourse/view/screen/order/accepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersaccepted extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersaccepted({Key? key, required this.listdata})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersacceptedController ordersacceptedController =
        Get.put(OrdersacceptedController());
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(),
              // Text(
              //     "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersPrice} \$"),
              Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              // Text(
              //     "Order Status : ${controller.printOrderStatus(listdata.ordersStatus!)} "),
              const Divider(),
              Row(
                children: [
                  Text("Total Price : ${listdata.ordersId} \$ ",
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.orderdetailssss,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.primaryColor,
                    textColor: Colors.white,
                    child: const Text("Details"),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  if (listdata.ordersStatus! == "1")
                    MaterialButton(
                      onPressed: () {
                        //    controller.deleteOrder(listdata.ordersId!);
                        ordersacceptedController.doneprepare(listdata.ordersId!,
                            listdata.ordersUsersid!, listdata.ordersType!);
                      },
                      color: AppColor.primaryColor,
                      textColor: Colors.white,
                      child: const Text("Done"),
                    ),
                  SizedBox(width: 10),
                  // if (listdata.ordersStatus! == "0")
                  // MaterialButton(
                  //   onPressed: () {
                  //     //    controller.deleteOrder(listdata.ordersId!);
                  //     controller.approveorder(
                  //         listdata.ordersUsersid!, listdata.ordersId!);
                  //   },
                  //   color: AppColor.primaryColor,
                  //   textColor: Colors.white,
                  //   child: const Text("approve"),
                  // )
                ],
              ),
            ],
          )),
    );
  }
}
