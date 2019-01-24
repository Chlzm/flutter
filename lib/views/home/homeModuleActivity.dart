import 'package:flutter/material.dart';

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
          Container(
            color: Colors.red,
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
          Container(
            color: Colors.red,
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
          Container(
            color: Colors.red,
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
          Container(
            color: Colors.red,
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
        ],
      ),
    );
  }
}
