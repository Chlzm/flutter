import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/fill/fill.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeModuleJoin extends StatelessWidget {

  Future<void> jump(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.get("data"));
    Navigator.push(context, CupertinoPageRoute(builder: (context) => Fill()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: RaisedButton(
            padding: EdgeInsets.all(0.0),
            onPressed: () {
              jump(context);
              //Navigator.of(context).pushNamed("/list");
              //Navigator.push(context, CupertinoPageRoute(builder: (context)=>Fill()));
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    spreadRadius: 3.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              child: Image.network(
                  "http://wc.xiechangqing.cn/dist/images/2e3f2ff92f63a793ae33724d3388c840.jpg"),
            )));
  }
}
