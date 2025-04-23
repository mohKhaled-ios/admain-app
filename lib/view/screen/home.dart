// import 'package:ecommercecourse/controller/homescreen_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Homescreencontrollerimp homescreencontrollerimp =
//         Get.put(Homescreencontrollerimp());
//     return GetBuilder<Homescreencontrollerimp>(
//         builder: (controller) => Container(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: ListView(
//                 children: [],
//               ),
//             ));
//   }
// }
import 'package:ecommercecourse/core/constant/imgaeasset.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/widget/home/cardAdmain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        GridView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisExtent: 150),
          children: [
            CardAdmin(
              onTap: () {
                Get.toNamed(AppRoute.viewcategory);
              },
              imag: '${AppImageAsset.logo}',
              title: "Categoryes",
            ),
            CardAdmin(
              onTap: () {},
              imag: '${AppImageAsset.logo}',
              title: "Notification",
            ),
            CardAdmin(
              onTap: () {
                Get.toNamed(AppRoute.viewitems);
              },
              imag: '${AppImageAsset.logo}',
              title: "Producte",
            ),
            CardAdmin(
              onTap: () {
                Get.toNamed(AppRoute.homescreenorders);
              },
              imag: '${AppImageAsset.logo}',
              title: "Orders",
            ),
            CardAdmin(
              onTap: () {},
              imag: '${AppImageAsset.logo}',
              title: "Message",
            ),
            CardAdmin(
              onTap: () {},
              imag: '${AppImageAsset.logo}',
              title: "Reports",
            ),
          ],
        ),
      ],
    ));
  }
}
