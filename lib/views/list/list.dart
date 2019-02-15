import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widget/bottomNavgitorBar.dart';

List mlist = [];

class MyList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '我的订单',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyListApp(title:'ssss')
    );
  }
}

class MyListApp extends StatefulWidget{
  final String title;
  MyListApp({Key key,this.title}) :super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyListAppState();
  }
}

class _MyListAppState extends State<MyListApp>{
  List subjects = [];
  String title = '';
  getBody(){
    if (subjects.length != 0) {
      return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(subjects[position]);
          });
    } else {
      return Text('加载中...');
    }
  }

  getItem(var subject) {
//    演员列表
    var avatars = List.generate(subject['casts'].length, (int index) =>
        Container(
          margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),

          child: CircleAvatar(
              backgroundColor: Colors.white10,
              backgroundImage: NetworkImage(
                  subject['casts'][index]['avatars']['small']
              )
          ),
        ),
    );
    var row = Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:10.0,bottom: 10.0),
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black12
                )
              )
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('订单号11：PB20190119144607129533',style: TextStyle(color: Colors.black45),),
                Text('可使用',style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  //subject['images']['large'],
                  'http://wc.xiechangqing.cn/images/files/activityfile/bike_default.jpg',
                  width: 101.0, height: 99.0,
                  fit: BoxFit.fill,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8.0),
                  height: 100.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                        child: Text(
                          //subject['title'],
                          '跑步活动',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black87
                          ),
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        //'预约时间：${subject['rating']['average']}',
                        '预约时间：2019-04-20 16:00-18:00',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black45
                        ),
                      ),
                      Text(
                        '场次编号：PB20190119144607129533',
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black45
                        ),
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top:10.0,bottom: 10.0),
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Colors.black12
                    )
                )
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('¥1000.00',style: TextStyle(color: Colors.red,fontSize: 18.0)),
                Text(''),
              ],
            ),
          ),
        ],
      )
    );
    return Card(
      margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 15.0),
      child: GestureDetector(
        child: row,
        onTap: (){
        },
      ),
    );
  }

  loadData() async {
    if(mlist.length != 0){
      subjects = mlist;
      return;
    }
    String loadRUL = "https://api.douban.com/v2/movie/in_theaters";
    http.Response response = await http.get(loadRUL);
    var result = json.decode(response.body);
    setState(() {
      title = result['title'];
      print('title: $title');
      mlist = subjects = result['subjects'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '我的订单',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor:Colors.white,
            elevation:4.0,
            title: Text('我的订单',style: TextStyle(fontSize: 16.0,color: Colors.black)),
          ),
          body:Container(
            padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
            child: Center(
              child: getBody(),
            ),
          )
      ),
    );
  }
}