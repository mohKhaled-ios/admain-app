import 'package:ecommercecourse/controller/category/add_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/shared/customtextformglobal.dart';
import 'package:ecommercecourse/view/widget/auth/custombuttonauth.dart';
import 'package:ecommercecourse/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/functions/uploadimage.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    AddCategoryController addCategoryController =
        Get.put(AddCategoryController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Add category'),
        ),
        body: GetBuilder<AddCategoryController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest!,
                widget: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                      child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      CustomTextFormGlobal(
                          hinttext: 'category name',
                          labeltext: 'category name',
                          iconData: Icons.category,
                          mycontroller: addCategoryController.name,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      CustomTextFormGlobal(
                          hinttext: 'category nameAr',
                          labeltext: 'category nameAr',
                          iconData: Icons.category,
                          mycontroller: addCategoryController.namear,
                          valid: (val) {
                            return validInput(val!, 1, 30, "");
                          },
                          isNumber: false),
                      MaterialButton(
                        color: Colors.grey,
                        onPressed: () {
                          controller.choseimage();
                        },
                        child: Text('Chose image category'),
                      ),
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
