import 'dart:io';

import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommercecourse/controller/items/view_controller.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';

import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/core/functions/uploadimage.dart';
import 'package:ecommercecourse/data/datasource/remote/category/category_data.dart';

import 'package:ecommercecourse/data/datasource/remote/items/items_data.dart';
import 'package:ecommercecourse/data/model/categorymodel.dart';

import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditemsController extends GetxController {
  ItemsData testData = ItemsData(Get.find());
  CategoryData categoryData = CategoryData(Get.find());

  List<Categoriesmodel> catdata = [];

  late TextEditingController dropdowenname;
  late TextEditingController dropdowenid;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController desc;
  late TextEditingController descar;
  late TextEditingController count;
  late TextEditingController discount;
  late TextEditingController price;
  //////////////////////////////////
  late TextEditingController catid;
  late TextEditingController catname;
  List<SelectedListItem> dropdownlist = [];

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  List<ItemsModel> data = [];

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
        "desc": desc.text,
        "descar": descar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid.text,
        "datenow": DateTime.now().toString(),
      };
      var response = await testData.addData(data, file!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar('success', "items add success");
          Get.offNamed(AppRoute.viewitems);
          ItemsController c = Get.find();
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

  getcategoryData() async {
    catdata.clear();
    statusRequest = StatusRequest.loading;
    var response = await categoryData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        catdata.addAll(listdata.map((e) => Categoriesmodel.fromJson(e)));
        for (var i = 0; i < catdata.length; i++) {
          dropdownlist.add(SelectedListItem(
              name: catdata[i].categoriesName!,
              value: catdata[i].categoriesId));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
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
    getcategoryData();
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    discount = TextEditingController();
    price = TextEditingController();
    dropdowenname = TextEditingController();
    dropdowenid = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    super.onInit();
  }

  showdrobdown(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: "a"), SelectedListItem(name: "b")],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropdowenname.text = selectedListItem.name;
          //showSnackBar(list.toString());
        },
        enableMultipleSelection: true,
      ),
    ).showModal(context);
  }
}
