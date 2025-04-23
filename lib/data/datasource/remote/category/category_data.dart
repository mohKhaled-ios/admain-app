import 'dart:io';

import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class CategoryData {
  Crud crud;
  CategoryData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewcategory, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.addcategory, data, file);
    return response.fold((l) => l, (r) => r);
  }

  deletedata(String id, String imsgename) async {
    var response = await crud.postData(AppLink.deletecategory, {
      "id": id,
      "imagename": imsgename,
    });
    return response.fold((l) => l, (r) => r);
  }
}
