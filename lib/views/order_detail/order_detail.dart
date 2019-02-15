import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_app1/api/detail.dart';
import 'package:dio/dio.dart';

class OrderDetail extends StatefulWidget {

  OrderDetail({Key key,this.orderId}):super(key:key);
  int orderId;
  @override
  State<StatefulWidget> createState() {
    return _OrderDetailState();
  }
}

class _OrderDetailState extends State<OrderDetail> {
  DetailApi api = new DetailApi();
  var detail;

  void _launchURL(String tel) async{
    var url = 'tel: '+ tel;
    await launch(url);
  }

  Future getDetail(int id) async{
    Response res = await api.getDetail(id);
    if(res.data['code'] != "00000"){
      return;
    }
    setState(() {
      detail = res.data['body'];
    });
  }

  @override
  void initState() {
    getDetail(widget.orderId);
    super.initState();
  }

  Widget buildQrCode(content){
    if(content == null){
      return Text('');
    }
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 15.0),
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('入场码',style: TextStyle(fontSize: 16.0)),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                QrImage(
                  data: content,
                  size: 150.0,
                ),
                Padding(
                  child: Text(
                    content,
                    style: TextStyle(
                        color: Colors.black54
                    ),
                  ),
                  padding: EdgeInsets.only(top: 5.0),
                ),
                Padding(
                  child: Text(
                    '请在入场时出示（可在已预约的订单中查看）',
                    style: TextStyle(
                        color: Color.fromRGBO(190, 39, 33, 1.0),
                        fontSize: 14.0
                    ),
                  ),
                  padding: EdgeInsets.only(top: 5.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context){
    if(detail == null){
      return Container(
        child: Center(
          child: Text('加载中...'),
        ),
      );
    }
    return Container(
      child: ListView(
        children: <Widget>[
          Image.asset("assets/image/pay-success.png"),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            height: 90.0,
            child: Row(
              children: <Widget>[
                Image.network(
                  detail['activityImgUrl'],
                  fit: BoxFit.fill,
                  width: 70.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(detail['activityName'], style: TextStyle(fontSize: 18.0)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('预约时间：',
                              style: TextStyle(color: Colors.black54)
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('${detail['activityDateStr']} | ${detail['activityStartHour']} - ${detail['activityEndHour']}',
                                    style:
                                    TextStyle(color: Colors.black54)
                                ),
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
                                Text(detail['activityCode'],
                                    style:
                                    TextStyle(color: Colors.black54)
                                ),
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
          buildQrCode(detail['qrCodeVerifyUrl']),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('江苏万驰赛车场',style: TextStyle(fontSize: 16.0)),
                GestureDetector(
                  child: Icon(Icons.call,color: Color.fromRGBO(190, 39, 33, 1.0)),
                  onTap: (){
                    _launchURL(detail['username']);
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.0),
            padding: EdgeInsets.all(10.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('订单金额',style: TextStyle(fontSize: 16.0)),
                    Text('¥${detail['paymoney']}',style: TextStyle(color: Color.fromRGBO(190, 39, 33, 1.0))),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.0,bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('订单编号：',style: TextStyle(color: Colors.black54)),
                      Text(detail['orderNo'],style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('订单状态：',style: TextStyle(color: Colors.black54)),
                      Text(detail['orderStatusStr'],style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('支付方式：',style: TextStyle(color: Colors.black54)),
                      Text('未支付',style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('创建时间：',style: TextStyle(color: Colors.black54)),
                      Text(detail['orderCreateTimeStr'],style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('手机号码：',style: TextStyle(color: Colors.black54)),
                      Text(detail['username'],style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text('预约人数：',style: TextStyle(color: Colors.black54)),
                      Text(detail['applyNum'].toString(),style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black38,size: 18.0),
          onPressed: () {
            Navigator.pop(context);
          }),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4.0,
        title: Text('预约详情',style: TextStyle(fontSize: 16.0, color: Colors.black)
        )
      ),
      body: buildContent(context),
    );
  }
}

