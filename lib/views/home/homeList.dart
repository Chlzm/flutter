import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/order_detail/order_detail.dart';
import 'package:flutter_app1/api/home.dart';
import 'package:dio/dio.dart';

List mlist = [];
class HomeList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeListState();
  }
}

class _HomeListState extends State<HomeList>{
  List subjects = [];
  String title = '';
  HomeApi api = new HomeApi();
  getBody(){
    if (subjects.length != 0) {
      return ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (BuildContext context, int position) {
            return getItem(subjects[position]);
          });
    } else {
      // 加载菊花
      return Text('加载中...');
    }
  }

  getItem(var subject) {
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
                  Text('订单号：' + subject['orderNo'],style: TextStyle(color: Colors.black45),),
                  Text(subject['orderStatusStr'],style: TextStyle(color: Colors.black45)),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    //subject['images']['large'],
                    subject['activityImgUrl'],
                    width: 80.0, height: 80.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 8.0),
                      height: 80.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                            child: Text(
                              subject['activityName'],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black87
                              ),
                              maxLines: 1,
                            ),
                          ),
                          Text(
                            //'预约时间：${subject['rating']['average']}',
                            '预约时间： ${subject['activityDateStr']} ${subject['activityStartHour']}-${subject['activityEndHour']}',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black45
                            ),
                          ),
                          Text(
                            '场次编号：${subject['activityCode']}',
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
                  Text('¥${subject['paymoney'].toString()}',style: TextStyle(color: Colors.red,fontSize: 18.0)),
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
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>OrderDetail(orderId: subject['orderId'])));
          //print(subject);
        },
      ),
    );
  }

  Future loadData() async {
    if(mlist.length != 0){
      subjects = mlist;
      return;
    }
    Response response = await api.getList();
    setState(() {
      mlist = subjects = response.data['body'];
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
    return Container(
      padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
      child: Center(
      child: getBody(),
      ),
    );
  }
}