import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrderArchiveData {
  Crud crud;
  OrderArchiveData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.archiveordersssss, {});
    return response.fold((l) => l, (r) => r);
  }
}
