import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.ordersdetailsssss, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
