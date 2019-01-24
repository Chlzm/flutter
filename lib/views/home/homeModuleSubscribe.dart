import 'package:flutter/material.dart';

class HomeModuleSubscribe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            alignment: Alignment.topRight,
            child: new Text("/", style: TextStyle(color: Colors.redAccent)),
          ),
          Container(
            alignment: Alignment.center,
            child: new Text("抢先预约", style: TextStyle(color: Colors.black54)),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.topLeft,
            child: new Text("/", style: TextStyle(color: Colors.redAccent)),
          )
        ],
      ));
  }
}
