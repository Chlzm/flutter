import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Pay extends StatefulWidget {
  Pay({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PayState();
  }
}

class _PayState extends State<Pay> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: _countDown(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: Colors.white,
            child: _payMethod(context),
          ),
          Container(
              padding: EdgeInsets.only(left: 20.0,right: 20.0),
              margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
              child: RaisedButton(
                onPressed: (){
                  //Navigator.push(context, CupertinoPageRoute(builder: (context)=>LoginModule()));
                },
                color: Color.fromRGBO(190, 39, 33, 1.0),
                child: Container(
                  padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                  alignment: Alignment.center,
                  child: Text('确认支付',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                ),
              )
          )
        ],
      ),
    );
  }

  int groupValue = 0;
  void updateGroupValue(int v){
    setState(() {
      groupValue=v;
    });
  }

  Widget _payMethod(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Text('请选择支付方式',style: TextStyle(fontSize: 16.0),),
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: Colors.black26,
                      width: 0.5
                  )
              )
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: Colors.black26,
                      width: 0.5
                  )
              )
          ),
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/image/icon-wechat.png",height: 43.0,),
              Container(
                height: 43.0,
                width: MediaQuery.of(context).size.width - 83.0,
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('微信支付',style: TextStyle(fontSize: 16.0),),
                        Text('推荐有微信账号的用户使用',style: TextStyle(color: Colors.black38)),
                      ],
                    ),
                    Radio(
                      value: 0,
                      groupValue:groupValue,
                      onChanged: (v){
                        updateGroupValue(v);
                      },
                      activeColor: Colors.red,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(
                      color: Colors.black26,
                      width: 0.5
                  )
              )
          ),
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 20.0,right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset("assets/image/icon-ant.png",height: 43.0,),
              Container(
                height: 43.0,
                width: MediaQuery.of(context).size.width - 83.0,
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('支付宝支付',style: TextStyle(fontSize: 16.0),),
                        Text('推荐有支付宝账号的用户使用',style: TextStyle(color: Colors.black38)),
                      ],
                    ),
                    Radio(
                      value: 1,
                      groupValue:groupValue,
                      onChanged: (v){
                        updateGroupValue(v);
                      },
                      activeColor: Colors.red,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}

/**
 * 倒计时组件
 */
Widget _countDown(){
  return Column(
    children: <Widget>[
      Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 10.0,bottom: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: Text('支付剩余时间'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text('00',style: TextStyle(color:Colors.white)),
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(190, 39, 33, 1.0),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                Text(' : ',style: TextStyle(color:Color.fromRGBO(190, 39, 33, 1.0))),
                Container(
                  child: Text('00',style: TextStyle(color:Colors.white)),
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(190, 39, 33, 1.0),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
                Text(' : ',style: TextStyle(color:Color.fromRGBO(190, 39, 33, 1.0))),
                Container(
                  child: Text('00',style: TextStyle(color:Colors.white)),
                  width: 30.0,
                  height: 30.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(190, 39, 33, 1.0),
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
            top: BorderSide(
              color: Colors.black38,
              width: 0.5
            )
          )
        ),
        child: Row(
          children: <Widget>[
            Image.network("http://wc.xiechangqing.cn/images/files/activityfile/track_default.jpg",width: 80.0,),
            Container(
              padding: EdgeInsets.only(left: 20.0),
              height: 60.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('¥ 500.00',style: TextStyle(fontSize: 24.0,color: Color.fromRGBO(190, 39, 33, 1.0)),),
                  Text('激情赛道',style: TextStyle(fontSize: 20.0,color: Colors.black54))
                ],
              ),
            ),
          ],
        ),
      )
    ],
  );
}

