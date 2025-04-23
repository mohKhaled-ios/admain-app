import 'dart:io';

import 'package:ecommercecourse/controller/category/view_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/functions/uploadimage.dart';
import 'package:ecommercecourse/data/datasource/remote/category/category_data.dart';
import 'package:ecommercecourse/data/model/categorymodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryController extends GetxController {
  CategoryData testData = CategoryData(Get.find());
  late TextEditingController name;
  late TextEditingController namear;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<Categoriesmodel> data = [];

  StatusRequest? statusRequest = StatusRequest.none;
  File? file;
  choseimage() async {
    file = await fileubloadGalary();
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("error", "please chose image svg");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
      };
      var response = await testData.addData(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar('success', "Category add success");
          Get.offNamed(AppRoute.viewcategory);
          CategoryController c = Get.find();
          c.getData();
          // List listdata = response['data'];
          // data.addAll(listdata.map((e) => Categoriesmodel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }
  // getData() async {
  //   data.clear();
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await testData.getData();
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       // Get.snackbar("Done", "orders already delivery");
  //       List listdata = response['categories']['data'];
  //       data.addAll(listdata.map((e) => Categoriesmodel.fromJson(e)));
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }

  @override
  void onInit() {
    // getData();
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
