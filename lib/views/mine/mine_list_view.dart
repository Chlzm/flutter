import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/service/service.dart';
import 'package:flutter_app1/views/about/about.dart';
import 'package:flutter_app1/views/feedback/feedback.dart';

class MineListView extends StatelessWidget{
  Color feedbackColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: Colors.black26
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.phone_android,color: Colors.black45,),
                    Text('  更改绑定')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('修改  '),
                    Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.black45,),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: Colors.black26
                    )
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.https,color: Colors.black45,),
                    Text('  登录密码')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('修改  '),
                    Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.black45,),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: Colors.black26
                    )
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.phone,color: Colors.black45,),
                    Text('  联系客服')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text('  '),
                    Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.black45,),
                  ],
                )
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: Colors.black26
                    )
                )
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>FeedbackApp()));
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.library_books,color: Colors.black45,),
                        Text('  意见反馈')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('  '),
                        Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.black45,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: Colors.black26
                    )
                )
            ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context)=>About()));
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.favorite,color: Colors.black45,),
                        Text('  关于万驰')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('  '),
                        Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.black45,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>Service()));
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.book,color: Colors.black45,),
                      Text('  服务协议')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('  '),
                      Icon(Icons.arrow_forward_ios,size: 16.0,color: Colors.black45,),
                    ],
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}