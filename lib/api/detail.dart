import 'package:flutter_app1/util/wdio.dart';
import 'package:dio/dio.dart';

class DetailApi {
  Wdio di = new Wdio();

  Future<Response> getDetail(int id) async {
    Response res = await di.wdio.get("/rest/my/order/detail",queryParameters: {"orderId":id.toString()});
    return res;
  }

}
