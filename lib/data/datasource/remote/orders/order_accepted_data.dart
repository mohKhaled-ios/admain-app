import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrderacceptedData {
  Crud crud;
  OrderacceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewaccepted, {});
    return response.fold((l) => l, (r) => r);
  }

  doneprepare(String ordersid, String userid, String ordertype) async {
    var response = await crud.postData(AppLink.prepareorders,
        {"ordersid": ordersid, "usersid": userid, "ordertype": ordertype});
    return response.fold((l) => l, (r) => r);
  }
}
