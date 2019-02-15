import 'package:flutter_app1/util/wdio.dart';
import 'package:dio/dio.dart';

class ActivityApi {
  Wdio di = new Wdio();
  Future<Response> getActivityOfRunning() async {
    Response res = await di.wdio.get("/rest/activity/runninglist");
    return res;
  }

  Future<Response> getActivityOfBike() async {
    Response res = await di.wdio.get("/rest/activity/bikelist");
    return res;
  }

  Future<Response> getActivityOfCar() async {
    Response res = await di.wdio.get("/rest/activity/toycarlist");
    return res;
  }

  Future<Response> getActivityOfTrack() async {
    Response res = await di.wdio.get("/rest/activity/tracklist");
    return res;
  }

  Future<Response> getActivityDetail(int id) async {
    Response res = await di.wdio.get("/rest/activity/detail",queryParameters: {"id":id.toString()});
    return res;
  }



}