import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/reserve/reserve_detail_attention.dart';
import 'package:flutter_app1/views/reserve/reserve_confirm.dart';

class ReserveDetail extends StatefulWidget {
  ReserveDetail({Key key, this.title, this.id, this.type}) : super(key: key);
  final String title;
  final int id;
  final int type;

  @override
  State<StatefulWidget> createState() {
    return _ReserveDetailState();
  }
}

class _ReserveDetailState extends State<ReserveDetail> {
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
              style: TextStyle(fontSize: 16.0, color: Colors.black))
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            left: 0.0,
            width: MediaQuery.of(context).size.width,
            child: Container(
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReserveConfirm(title: '确认订单',)));;
                  },
                  color: Color.fromRGBO(190, 39, 33, 1.0),
                  child: Container(
                    padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                    alignment: Alignment.center,
                    child: Text('立即预约',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                  ),
                )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      child: Row(
                        children: <Widget>[
                          Image.network(
                            "http://wc.xiechangqing.cn/images/files/activityfile/bike_default.jpg",
                            fit: BoxFit.fill,
                            width: 80.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('自行车4月2', style: TextStyle(fontSize: 18.0)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('预约时间：',
                                        style: TextStyle(color: Colors.black54)),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('2019-04-11 | 星期四',
                                              style:
                                              TextStyle(color: Colors.black54)),
                                          Text('10:00 - 12:00',
                                              style:
                                              TextStyle(color: Colors.black54)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('场次编号：',
                                        style: TextStyle(color: Colors.black54)),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('WANCHIZX20190119002',
                                              style:
                                              TextStyle(color: Colors.black54)),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: BorderDirectional(
                              top: BorderSide(width: 0.5, color: Colors.black26))),
                      margin: EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('¥0.01',
                              style: TextStyle(
                                  color: Color.fromRGBO(190, 39, 33, 1.0),
                                  fontSize: 18.0)),
                          Text('¥2.00',
                              style: TextStyle(
                                  color: Colors.black38,
                                  decoration: TextDecoration.lineThrough))
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.all(10.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: BorderDirectional(
                              bottom: BorderSide(
                                  color: Colors.black26,
                                  width: 0.5
                              )
                          )
                      ),
                      padding: EdgeInsets.only(bottom: 5.0),
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text('预约截止时间：'),
                                Text('2019-04-10 14:38:03',style: TextStyle(color:Colors.black54)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                            child: Row(
                              children: <Widget>[
                                Text('我的预约状态：'),
                                Text('可使用',style: TextStyle(color: Color.fromRGBO(190, 39, 33, 1.0)),),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('预约名额：（ 剩余名额: 89）'),
                          Container(
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.0),
                                        border: Border.all(
                                          color: Colors.black38,
                                          width: 0.5,
                                        )
                                    ),
                                    child: Icon(Icons.remove,color: Colors.black54,size: 24.0,),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text('1'),
                                  width: 24.0,
                                ),
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.0),
                                        border: Border.all(
                                          color: Colors.black38,
                                          width: 0.5,
                                        )
                                    ),
                                    child: Icon(Icons.add,color: Colors.black54,size: 24.0,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: ReserveDetailAttention(),
              ),

            ],
          )
        ],
      ),
    );
  }
}
