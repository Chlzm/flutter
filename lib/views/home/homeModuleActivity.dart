import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/views/reserve/reserve.dart';

class HomeModuleActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeModuleActivity();
  }
}

class _HomeModuleActivity extends State<HomeModuleActivity>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 10.0,right: 10.0),
      margin: EdgeInsets.only(top:10.0,bottom: 10.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.network("http://wc.xiechangqing.cn/dist/images/021bf8fbab202003ad2d391c2a74ec63.jpg",fit: BoxFit.fill,width: 75.0,),
                  Positioned(
                      width: 75.0,
                      left:0.0,
                      bottom: 0.0,
                      child:Container(
                        padding: EdgeInsets.only(top: 2.0,bottom: 2.0),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(0, 0, 0, .5),
                        child: Text('跑步',style: TextStyle(color: Colors.white),),
                      )
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReserveApp(title: '跑步预约',type: 1,)));
            },
          ),
          GestureDetector(
            child: Container(
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Image.network("http://wc.xiechangqing.cn/dist/images/0faa83fafa4547a9f7efbeb064f70c19.jpg",fit: BoxFit.fill,width: 75.0,),
                  Positioned(
                      width: 75.0,
                      left:0.0,
                      bottom: 0.0,
                      child:Container(
                        padding: EdgeInsets.only(top: 2.0,bottom: 2.0),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(0, 0, 0, .5),
                        child: Text('自行车',style: TextStyle(color: Colors.white),),
                      )
                  )
                ],
              ),
            ),
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReserveApp(title: '自行车预约',type: 2,)));
            },
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReserveApp(title: '卡丁车预约',type: 3,)));
            },
            child:Container(
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Image.network("http://wc.xiechangqing.cn/dist/images/c3dd39120f8db1d571b437feeaaf17ff.jpg",fit: BoxFit.fill,width: 75.0,),
                  Positioned(
                      width: 75.0,
                      left:0.0,
                      bottom: 0.0,
                      child:Container(
                        padding: EdgeInsets.only(top: 2.0,bottom: 2.0),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(0, 0, 0, .5),
                        child: Text('卡丁车',style: TextStyle(color: Colors.white),),
                      )
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ReserveApp(title: '赛道预约',type: 4,)));
            },
            child:Container(
              color: Colors.red,
              child: Stack(
                children: <Widget>[
                  Image.network("http://wc.xiechangqing.cn/dist/images/299508983e5dd89b2f4ac61cb11b4dfc.jpg",fit: BoxFit.fill,width: 75.0,),
                  Positioned(
                      width: 75.0,
                      left:0.0,
                      bottom: 0.0,
                      child:Container(
                        padding: EdgeInsets.only(top: 2.0,bottom: 2.0),
                        alignment: Alignment.center,
                        color: Color.fromRGBO(0, 0, 0, .5),
                        child: Text('赛道',style: TextStyle(color: Colors.white)),
                      )
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
