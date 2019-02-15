import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app1/api/home.dart';

class Message extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MessageState();
  }
}

class _MessageState extends State<Message>{

  List<dynamic> list = [];
  List<Widget> widgets = [
//    Container(
//      child: Text('loading...'),
//    )
  ];
  HomeApi api = new HomeApi();

  Future<void> getNotice() async{
    Response res = await api.getNotice();
    if(res.data['code'] != "00000"){
      return;
    }
    setState(() {
      list = res.data['body'];
    });

  }

  Widget buildWidgets(BuildContext context){
    if(list.length != 0){

      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int i) {
            var date = DateTime.fromMillisecondsSinceEpoch(list[i]['createTime'],isUtc: true);
            return item(
                list[i]['noticeTitle'],
                '${list[i]['createTimeStr']} ${date.hour.toString()}:${date.minute.toString()}:${date.second.toString()}',
                list[i]['noticeContent']
            );
          });
    }

    return Center(
      child: Text('加载中...'),
    );
  }

  @override
  void initState() {
    getNotice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation:4.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black38,size: 18.0),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        title: Text('消息中心',style: TextStyle(fontSize: 16.0,color: Colors.black)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: buildWidgets(context)
      ),
    );
  }

  Widget item(String title,String date,String decoration){
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: BorderDirectional(
            bottom: BorderSide(
                color: Colors.black26,
                width: 0.5
            )
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 16.0)),
              Text(date,style: TextStyle(color: Colors.black54))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              decoration,
              style: TextStyle(
                  color: Colors.black54,
                  height: 1.2
              ),
            ),
          )
        ],
      ),
    );
  }
}