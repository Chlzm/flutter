import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppliedPerson extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AppliedPersonState();
  }
}

class _AppliedPersonState extends State<AppliedPerson>{
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
          }
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4.0,
        title: Text('已申请人员列表',
          style: TextStyle(fontSize: 16.0, color: Colors.black)
        )
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: ListView(
          children: <Widget>[
            _item("http://wc.xiechangqing.cn/images/files/userfile/18521313677/image/20181222/670784E2BB144A179C7820EA215A9C93.jpg","momo"),
            _item("http://wc.xiechangqing.cn/images/files/userfile/18521313677/image/20181222/670784E2BB144A179C7820EA215A9C93.jpg","momo"),
            _item("http://wc.xiechangqing.cn/images/files/userfile/18521313677/image/20181222/670784E2BB144A179C7820EA215A9C93.jpg","momo"),
            _item("http://wc.xiechangqing.cn/images/files/userfile/18521313677/image/20181222/670784E2BB144A179C7820EA215A9C93.jpg","momo"),
            _item("http://wc.xiechangqing.cn/images/files/userfile/18521313677/image/20181222/670784E2BB144A179C7820EA215A9C93.jpg","momo"),
          ],
        ),
      ),
    );
  }

  Widget _item(String imageUrl,String nickname){
    return Container(
      padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: BorderDirectional(
              bottom: BorderSide(
                  color: Colors.black12,
                  width: 0.5
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(imageUrl,width: 30.0),
          Text.rich(
            TextSpan(
              text:'  用户名：',
              children: <TextSpan>[
                TextSpan(
                  text: nickname
                ),
              ]
            )
          ),
        ],
      ),
    );
  }
}