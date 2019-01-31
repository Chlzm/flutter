import 'package:flutter/material.dart';

class MineItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 50.0, right: 50.0, top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.asset("assets/image/icon-not-pay.png", scale: 1.5),
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Text('未付款')
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Column(
              children: <Widget>[
                Padding(
                  child: Image.asset("assets/image/icon-has-pay.png", scale: 1.5),
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                Text('已预约')
              ],
            ),
          ),
        ],
      ),
    );
  }
}