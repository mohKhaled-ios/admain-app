// late TextEditingController name;
// late TextEditingController namear;
// late TextEditingController desc;
// late TextEditingController descar;
// late TextEditingController count;
// late TextEditingController discount;
// late TextEditingController price;
import 'package:drop_down_list/model/selected_list_item.dart';

import 'package:ecommercecourse/controller/items/add_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/shared/customdrobdownshearch.dart';
import 'package:ecommercecourse/shared/customtextformglobal.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttonauth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/functions/uploadimage.dart';

class Additems extends StatelessWidget {
  const Additems({super.key});

  @override
  Widget build(BuildContext context) {
    AdditemsController addCategoryController = Get.put(AdditemsController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Add items'),
        ),
        body: GetBuilder<AdditemsController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                      child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      CustomTextFormGlobal(
                          hinttext: 'items name',
                          labeltext: 'items name',
                          iconData: Icons.category,
                          mycontroller: addCategoryController.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),

                      CustomTextFormGlobal(
                          hinttext: 'items nameAr',
                          labeltext: 'items nameAr',
                          iconData: Icons.category,
                          mycontroller: addCategoryController.namear,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      ///////////////////////////////////////
                      CustomTextFormGlobal(
                          hinttext: 'items desc',
                          labeltext: 'items desc',
                          iconData: Icons.description,
                          mycontroller: addCategoryController.desc,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      CustomTextFormGlobal(
                          hinttext: 'items descar',
                          labeltext: 'items descar',
                          iconData: Icons.category,
                          mycontroller: addCategoryController.descar,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      CustomTextFormGlobal(
                          hinttext: 'items count',
                          labeltext: 'items count',
                          iconData: Icons.numbers,
                          mycontroller: addCategoryController.count,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: true),
                      CustomTextFormGlobal(
                          hinttext: 'items discount',
                          labeltext: 'items discount',
                          iconData: Icons.numbers,
                          mycontroller: addCategoryController.discount,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: true),
                      CustomTextFormGlobal(
                          hinttext: 'items price',
                          labeltext: 'items price',
                          iconData: Icons.numbers,
                          mycontroller: addCategoryController.price,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: true),

                      MaterialButton(
                        color: Colors.grey,
                        onPressed: () {
                          controller.choseimage();
                        },
                        child: Text('Chose image items'),
                      ),
                      //////////////////
                      Customdropdownsearch(
                          title: 'chose category',
                          drobdownselectname: controller.catname,
                          listdata: controller.dropdownlist,
                          drobdoselectedid: controller.catid),

                      if (controller.file != null)
                        SvgPicture.file(controller.file!),

                      CustomButtomAuth(
                        text: "Add",
                        onPressed: () {
                          addCategoryController.addData();
                        },
                      ),
                    ]),
                  )),
                ))));
  }
}
