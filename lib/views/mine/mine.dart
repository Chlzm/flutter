import 'package:flutter/material.dart';
import 'package:flutter_app1/views/mine/mine_item.dart';
import 'package:flutter_app1/views/mine/mine_list_view.dart';


class Mine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MineFull();
  }
}

class MineFull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MineFullState();
  }
}

class MineFullState extends State<MineFull> {
  /**
   * 登录按钮
   */
  Widget LoginBottom(){
    return Container(
      padding: EdgeInsets.only(left: 20.0,right: 20.0),
      margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
      child: RaisedButton(
        onPressed: (){
          print('222');
        },
        color: Color.fromRGBO(190, 39, 33, 1.0),
        child: Container(
          padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
          alignment: Alignment.center,
          child: Text('登录',style: TextStyle(color: Colors.white,fontSize: 18.0),),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: ListView(
        children: <Widget>[
          MineItem(),
          MineListView(),
          LoginBottom(),
        ],
      ),
    );
  }
}
