import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FeedbackApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FeedbackAppState();
  }
}

class FeedbackAppState extends State<FeedbackApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4.0,
        title: Text('意见反馈',style: TextStyle(fontSize: 16.0, color: Colors.black)),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black38,size: 18.0),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text('感谢您的宝贵意见和建议，这将是我们不断改善与成长的动力！',style: TextStyle(color: Colors.black54,height: 1.2),),
            Container(
              margin: EdgeInsets.only(top: 10.0,bottom: 30.0),
              color: Colors.white,
              child: CupertinoTextField(
                maxLines: 5,
                maxLength: 120,
              ),
            ),
            Container(
              child: RaisedButton(
                onPressed: (){
                },
                color: Color.fromRGBO(190, 39, 33, 1.0),
                child: Container(
                  padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                  alignment: Alignment.center,
                  child: Text('提交',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
