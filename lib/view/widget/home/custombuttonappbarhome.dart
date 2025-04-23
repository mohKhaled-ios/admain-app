import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustombuttonappBarHome extends GetView<Homescreencontrollerimp> {
  const CustombuttonappBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              controller.listpage.length,
              (index) => Custombuttonabpar(
                    icon: controller.iconappparbottom[index],
                    title: controller.bottombartitle[index],
                    coloritemselected: Colors.blue,
                    onPressed: () {
                      controller.changepage(index);
                    },
                    active: controller.curentpage == index ? true : false,
                  ))
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Custombuttonabpar(
          //       icon: Icons.home,
          //       title: 'Home',
          //       coloritemselected: Colors.blue,
          //       onPressed: () {
          //         controller.changepage(0);
          //       },
          //       active: controller.curentpage == 0 ? true : false,
          //     ),
          //     Custombuttonabpar(
          //       icon: Icons.settings,
          //       title: 'Settings',
          //       coloritemselected: Colors.blue,
          //       onPressed: () {
          //         controller.changepage(1);
          //       },
          //       active: controller.curentpage == 1 ? true : false,
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
