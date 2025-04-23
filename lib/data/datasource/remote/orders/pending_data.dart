import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrderpendingData {
  Crud crud;
  OrderpendingData(this.crud);
  pendingData() async {
    var response = await crud.postData(AppLink.viewpending, {});
    return response.fold((l) => l, (r) => r);
  }

  approveData(String orderid, String userid) async {
    var response = await crud.postData(
        AppLink.approveordersss, {"ordersid": orderid, "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
