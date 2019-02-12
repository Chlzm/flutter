import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/reserve/reserve_detail.dart';

class ReserveApp extends StatefulWidget {
  ReserveApp({Key key, this.title}) : super(key: key);
  final String title;


  @override
  State<StatefulWidget> createState() {
    return ReserveAppState();
  }
}

class ReserveAppState extends State<ReserveApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text('已预约2场次，共1次', style: TextStyle(color: Colors.white)),
          ),
          Image.network(
              "http://wc.xiechangqing.cn/dist/images/8cea8be151c51faa97b9b8ee02b5bb5d.jpg"),
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
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: BorderDirectional(
                    bottom: BorderSide(width: 0.5, color: Colors.black12)
                  )
                ),
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
                          Text('4/19',
                              style:
                                  TextStyle(color: Colors.white, height: 1.2)),
                          Text('2019年',
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
                          Text('16:00 - 18:00',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black54)),
                          Text('截止至4月18日',
                              style: TextStyle(color: Colors.black38))
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('￥1.0',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(190, 39, 33, 1.0))),
                          Text('￥2.0',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black38)),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReserveDetail(title: '跑步预约详情',id: 39,type: 2)));
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
                          Text('4/19',
                              style:
                                  TextStyle(color: Colors.white, height: 1.2)),
                          Text('2019年',
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
                          Text('16:00 - 18:00',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black54)),
                          Text('截止至4月18日',
                              style: TextStyle(color: Colors.black38))
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('￥1.0',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(190, 39, 33, 1.0))),
                          Text('￥2.0',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black38)),
                          FlatButton(
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReserveDetail(title: '跑步预约详情',id: 39,type: 2)));
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
