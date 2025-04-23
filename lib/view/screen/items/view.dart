import 'package:ecommercecourse/controller/items/view_controller.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Viewitems extends StatelessWidget {
  const Viewitems({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsController controller = Get.put(ItemsController());
    return Scaffold(
        appBar: AppBar(
          title: Text('products'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoute.additems);
          },
          child: Icon(Icons.add),
        ),
        body: GetBuilder<ItemsController>(
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
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXL3pzss2ct5thTUhSGAc4026lQyOBkdAvN5DDleNRst4KJXi7aKs2OyXtOp5xj4U38mQ&usqp=CAU",
                              height: 100,
                            )),
                        Expanded(
                            flex: 3,
                            child: ListTile(
                              trailing: IconButton(
                                  onPressed: () {
                                    //   Get.defaultDialog(
                                    //       title: "تحذير ",
                                    //       middleText: "هل انت متاكد من الحذف",
                                    //       onCancel: () {},
                                    //       onConfirm: () {
                                    //         controller.deletecategory(
                                    //             controller
                                    //                 .data[index].categoriesId!,
                                    //             controller.data[index]
                                    //                 .categoriesImage!);
                                    //       });
                                    //   Get.back();
                                    //
                                  },
                                  icon: Icon(Icons.delete)),
                              subtitle: Text(controller.data[index].itemsDate!),
                              title: Text(controller.data[index].itemsName!),
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
