import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/pay/pay.dart';

class ReserveConfirm extends StatefulWidget {
  ReserveConfirm({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ReserveConfirmState();
  }
}

class _ReserveConfirmState extends State<ReserveConfirm> {
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
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 16.0, color: Colors.black)
        )
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  height: 100.0,
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
                                      Text('2019-04-11 | 10:00 - 12:00',
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
                      top: BorderSide(
                        width: 0.5,
                        color: Colors.black26
                      )
                    )
                  ),
                  padding: EdgeInsets.all(10.0),
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
          Positioned(
            bottom: 0.0,
            left: 0.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0),
                    height: 50.0,
                    color: Colors.white,
                    child: Text.rich(
                        TextSpan(
                            text: '总金额：',
                            children: <TextSpan>[
                              TextSpan(text: '¥500.0',style: TextStyle(fontSize: 16.0,color:Color.fromRGBO(190, 39, 33, 1.0)))
                            ]
                        )
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>Pay(title: '支付订单',)));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      color: Color.fromRGBO(190, 39, 33, 1.0),
                      child: Text('提交订单',style:TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
