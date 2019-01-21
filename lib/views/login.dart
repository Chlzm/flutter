import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '登录',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.white,
          elevation:4.0,
          title: Text('登录',style: TextStyle(fontSize: 16.0,color: Colors.black)),
        ),
        body:Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 60.0),
              child: Image.asset("assets/image/logo.png")
            )
          ],
        )
      ),
    );
  }
}

Widget _swiperBuilder(BuildContext context, int index) {
  var str = "";
  var list = [
    "http://wc.xiechangqing.cn/images/files/20181215/2329198gW9QDOJ.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/232947fNxJS6xa.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/232958MvXh9yBL.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/2330092MquMgIm.jpg"
  ];
  return (
      Image.network(
        list[index],
        fit: BoxFit.fill,
      ));
}