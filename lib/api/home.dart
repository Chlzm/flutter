import 'package:flutter_app1/util/wdio.dart';
import 'package:dio/dio.dart';

class HomeApi {
  Wdio di = new Wdio();

  Future<Response> getBanner(String url) async {
    Response res = await di.wdio.get(url);
    return res;
  }

  Future<Response> getList() async {
    Response res = await di.wdio.get("/rest/my/order/list");
    return res;
  }

  Future<Response> getNotice() async {
    Response res = await di.wdio.get("/rest/my/notice/list");
    return res;
  }
}
