import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/reserve/reserve_detail.dart';
import 'package:flutter_app1/api/activity.dart';
import 'package:dio/dio.dart';

class ReserveApp extends StatefulWidget {
  ReserveApp({Key key, this.title, this.type}) : super(key: key);
  final String title;
  final int type;

  @override
  State<StatefulWidget> createState() {
    return ReserveAppState();
  }
}

class ReserveAppState extends State<ReserveApp> {
  int total = 0;
  int userApplied = 0;
  List<dynamic> list = [];
  List<Widget> content = [];
  List<String> banners = [
    '',
    'http://wc.xiechangqing.cn/dist/images/8cea8be151c51faa97b9b8ee02b5bb5d.jpg',
    'http://wc.xiechangqing.cn/dist/images/5b4ce5931cdad4a4fcb4b07a84bfd72b.jpg',
    'http://wc.xiechangqing.cn/dist/images/71f8fa046f3b6dadb27b8ee859567ee2.jpg',
    'http://wc.xiechangqing.cn/dist/images/bff601057d0480f052dd6eb5d95b7c51.jpg',
  ];
  ActivityApi api = new ActivityApi();

  @override
  void initState() {
    super.initState();
    getItem();
  }

  Future<void> getItem() async {
    Response res;
    switch(widget.type){
      case 1 :
        res = await api.getActivityOfRunning();
        break;
      case 2:
        res = await api.getActivityOfBike();
        break;
      case 3:
        res = await api.getActivityOfCar();
        break;
      case 4:
        res = await api.getActivityOfTrack();
        break;
    }
    setState(() {
      list = res.data['body']['activitys'];
      total = res.data['body']['activityCount'];
      userApplied = res.data['body']['userCount'];
    });
    renderObject(list);
  }

  List<Widget> renderObject(List<dynamic> list) {
    
    for(var item in list){
      content.add(
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: BorderDirectional(
                  bottom: BorderSide(width: 0.5, color: Colors.black12))),
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Color.fromRGBO(190, 39, 33, 1.0),
                width: 70.0,
                height: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(DateTime.parse(item['applyEndTimeStr']).month.toString() + '/' + DateTime.parse(item['applyEndTimeStr']).day.toString(),
                        style:
                        TextStyle(color: Colors.white, height: 1.2)),
                    Text(DateTime.parse(item['applyEndTimeStr']).year.toString() + '年',
                        style:
                        TextStyle(color: Colors.white, height: 1.2)),
                  ],
                ),
              ),
              Container(
                height: 70.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item['startHour'].toString() + " - " +  item['endHour'].toString(),
                        style: TextStyle(
                            fontSize: 18.0, color: Colors.black54)),
                    Text('截止至'+DateTime.parse(item['applyEndTimeStr']).month.toString()+'月'+DateTime.parse(item['applyEndTimeStr']).day.toString()+'日',
                        style: TextStyle(color: Colors.black38))
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(item['discountPrice'].toString() ,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(190, 39, 33, 1.0))),
                    Text(item['price'].toString(),
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black38)),
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ReserveDetail(
                                    title: '跑步预约详情', id: item['id'], type: widget.type)));
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        alignment: Alignment.center,
                        child: Text(
                          '预约',
                          style: TextStyle(
                              color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                      color: Color.fromRGBO(190, 39, 33, 1.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
      appBar: AppBar(
          leading: IconButton(
              icon:
                  Icon(Icons.arrow_back_ios, color: Colors.black38, size: 18.0),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 4.0,
          title: Text(widget.title,
              style: TextStyle(fontSize: 16.0, color: Colors.black))),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
            color: Colors.black26,
            child: Text('已预约'+userApplied.toString()+'场次，共'+total.toString()+'次', style: TextStyle(color: Colors.white)),
          ),
          Image.network(
              banners[widget.type]),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 10.0),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
            child: Row(
              children: <Widget>[
                Image.asset("assets/image/icon-smile.png"),
                Text(
                  '  采用现场手机扫码方式入场',
                  style: TextStyle(color: Color.fromRGBO(190, 39, 33, 1.0)),
                )
              ],
            ),
          ),
          Column(
            children: content,
          ),
        ],
      ),
    );
  }
}
