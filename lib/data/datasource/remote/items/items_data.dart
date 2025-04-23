import 'dart:io';

import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.viewitems, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.addRequestWithImageOne(AppLink.additems, data, file);
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
