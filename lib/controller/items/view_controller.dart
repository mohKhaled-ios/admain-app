import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handingdatacontroller.dart';
import 'package:ecommercecourse/data/datasource/remote/category/category_data.dart';
import 'package:ecommercecourse/data/datasource/remote/items/items_data.dart';
import 'package:ecommercecourse/data/model/categorymodel.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class ItemsController extends GetxController {
  ItemsData testData = ItemsData(Get.find());

  List<ItemsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => ItemsModel.fromJson(e)));
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
    getData();
    super.onInit();
  }

  Callback() {
    Get.offAllNamed(AppRoute.homepage);
    return Future.value(false);
  }

  deletecategory(String id, String imsgename) {
    testData.deletedata(id, imsgename);
    data.removeWhere((element) => element.categoriesId == id);
    update();
  }
}
