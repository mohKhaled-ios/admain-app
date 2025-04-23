import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/category/view_controller.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/test_controller.dart';

class ViewCategory extends StatelessWidget {
  const ViewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.addddcategory);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<CategoryController>(
          builder: (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: WillPopScope(
              onWillPop: () {
                return controller.Callback();
              },
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: SvgPicture.network(
                              "${AppLink.imagestatic}/${controller.data[index].categoriesImage}",
                              height: 100,
                            )),
                        Expanded(
                            flex: 3,
                            child: ListTile(
                              trailing: IconButton(
                                  onPressed: () {
                                    Get.defaultDialog(
                                        title: "تحذير ",
                                        middleText: "هل انت متاكد من الحذف",
                                        onCancel: () {},
                                        onConfirm: () {
                                          controller.deletecategory(
                                              controller
                                                  .data[index].categoriesId!,
                                              controller.data[index]
                                                  .categoriesImage!);
                                        });
                                    Get.back();
                                  },
                                  icon: Icon(Icons.delete)),
                              subtitle: Text(
                                  controller.data[index].categoriesDatetime!),
                              title:
                                  Text(controller.data[index].categoriesName!),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
