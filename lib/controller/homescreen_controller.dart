import 'package:ecommercecourse/view/screen/home.dart';
import 'package:ecommercecourse/view/screen/order/accepted.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../view/screen/order/pending.dart';

abstract class Homescreencontroller extends GetxController {
  changepage(int curentpage);
}

class Homescreencontrollerimp extends Homescreencontroller {
  int curentpage = 0;
  List<String> bottombartitle = [
    'pendening',
    'accapted',
    'Setting',
  ];
  List iconappparbottom = [
    Icons.home,
    Icons.add_shopping_cart_outlined,
    Icons.settings,
  ];

  List<Widget> listpage = [
    OrdersPending(),
    OrdersAccepted(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("Setting screen"),
        )
      ],
    ),
  ];
  @override
  changepage(int i) {
    curentpage = i;
    update();
  }
}
