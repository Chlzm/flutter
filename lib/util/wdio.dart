import 'package:dio/dio.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Wdio {
  Dio wdio;

  Wdio(){
    wdio = new Dio();
    wdio.options.baseUrl = "http://wc.xiechangqing.cn";
    wdio.options.connectTimeout = 5000; //5s
    wdio.options.receiveTimeout = 3000;
    wdio.options.contentType = ContentType.parse("application/x-www-form-urlencoded");
    wdio.interceptors.add(InterceptorsWrapper(
        onRequest:(RequestOptions options) async{
          //DioLogger.onSend(TAG, options);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String StrData = prefs.get("data");
          if(StrData == null){
            return options;
          }
          Map<String,dynamic> res = json.decode(StrData);
          if(options.path != "/rest/account/login"){
            options.headers['wanchi-ACCESS-TOKEN'] = res["accessToken"];
            options.headers['wanchi-ACCESS-USER'] = res["username"];
          }
          return options;
        },
        onResponse: (Response response){
          //DioLogger.onSuccess(TAG, response);
          /*if(response.data['code'] != "00000"){

          }*/
          return response;
        },
        onError: (DioError error){
          //DioLogger.onError(TAG, error);
          return error;
        }
    ));
  }

}

