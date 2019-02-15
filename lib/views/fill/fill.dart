import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/apply/apply.dart';

class Fill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FillState();
  }
}

class _FillState extends State<Fill> {
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
        title: Text('填写预约单',
          style: TextStyle(fontSize: 16.0, color: Colors.black)
        )
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              _batchInfo(context),
              _orderInfo(),
            ],
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
                            text: '金额：',
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
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>AppliedPerson()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      color: Color.fromRGBO(190, 39, 33, 1.0),
                      child: Text('立即预约',style:TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _batchInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: BorderDirectional(
                    bottom: BorderSide(color: Colors.black12, width: 0.5))),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  child: Text('4s店预约', style: TextStyle(fontSize: 16.0)),
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                ),
                Text('试驾时间：2019-05-24 13:00-15:00',
                    style: TextStyle(height: 1.2)),
                Text('截止时间：2019-05-23', style: TextStyle(height: 1.2)),
                Text('场次编号：WANCHI4S20190119002', style: TextStyle(height: 1.2)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Image.asset(
                  "assets/image/icon-smile.png",
                  width: 30.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '请在截止日期前进行预约，如预约的场次因故取消，可申请退款，请放心预约！',
                    style: TextStyle(
                        color: Color.fromRGBO(190, 39, 33, 1.0), height: 1.2),
                    softWrap: true,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  Widget _orderInfo() {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          item(context,'4S店名称：','请输入4S店名称',0),
          item(context,'预约人：','请输入预约人姓名',0),
          item(context,'联系方式：','请输入联系人方式',2),
          item(context,'试驾车型：','多种车型请用“，”格开',0),
          item(context,'报名截止：','',3),

        ],
      ),
    );
  }

  Widget item(BuildContext context,String title,String placeholder,int type){
    List<TextInputType> types =[
      TextInputType.text,
      TextInputType.number,
      TextInputType.phone,
      TextInputType.datetime,
    ];

    return Container(
      padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 5.0,bottom: 5.0),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title),
          Container(
            width: 260.0,
            child: CupertinoTextField(
              keyboardType: types[type],
              placeholder: placeholder,
              decoration: BoxDecoration(
                border: Border.all(width: 0.0,color: Colors.transparent)
              ),
            ),
          )
        ],
      ),
    );
  }


}


