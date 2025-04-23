import "package:ecommercecourse/view/widget/home/custombuttonappbarhome.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "package:get/get_state_manager/src/simple/get_state.dart";

import "../../../controller/homescreen_controller.dart";

class HomescreenOrders extends StatelessWidget {
  const HomescreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Homescreencontrollerimp homescreencontrollerimp =
        Get.put(Homescreencontrollerimp());
    return GetBuilder<Homescreencontrollerimp>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text('orders'),
          ),
          drawer: Drawer(),
          bottomNavigationBar: CustombuttonappBarHome(),
          body: controller.listpage.elementAt(controller.curentpage));
    });
  }
}
