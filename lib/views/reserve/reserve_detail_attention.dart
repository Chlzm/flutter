import 'package:flutter/material.dart';

class ReserveDetailAttention extends StatefulWidget {
  ReserveDetailAttention({Key key, this.title, this.attention})
      : super(key: key);
  final String title;
  final String attention;

  @override
  State<StatefulWidget> createState() {
    return _ReserveDetailAttentionState();
  }
}

class _ReserveDetailAttentionState extends State<ReserveDetailAttention> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 5.0,bottom: 10.0),
            child: Text('其他事项说明：',style: TextStyle(fontSize: 16.0),),
          ),
          Text('1、一人只允许报名1人，不允许多人 2、注意骑行安全：',style: TextStyle(height: 1.2,color: Colors.black54),softWrap: true,),
        ],
      ),
    );
  }
}
