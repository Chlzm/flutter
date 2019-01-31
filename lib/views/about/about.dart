import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4.0,
        title: Text('关于万驰',style: TextStyle(fontSize: 16.0, color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black38,size: 18.0),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Image.asset("assets/image/logo.png"),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('集团介绍'),
                  padding: EdgeInsets.only(left: 5.0),
                  margin: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Color.fromRGBO(190, 39, 33, 1.0),
                        width: 4.0
                      )
                    )
                  ),
                ),
                Text('        驰以汽车文化发展为目标，致力于汽车文化、赛车运动的推广与传播。目前投资建设的江苏万驰国际赛车场，位于南京市溧水开发区，占地面积2000亩，现已投资1.6亿元，融合汽车主题公园与专业赛车场，整合汽车各行业资源（厂商、经销商、改装店、汽车媒体等），打造全国唯一的囊括场地赛车、越野赛车、卡丁车等专业赛道，汇集汽车研发、测试、试乘试驾、赛事为一体的现代化特色园区。'
                  ,style: TextStyle(height: 1.2),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text('赛车场介绍'),
                  padding: EdgeInsets.only(left: 5.0),
                  margin: EdgeInsets.only(bottom: 5.0),
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: Color.fromRGBO(190, 39, 33, 1.0),
                              width: 4.0
                          )
                      )
                  ),
                ),
                Text('        万驰国际赛车场致力于汽车文化、赛车运动的推广与传播，是目前江苏地区汽车赛事、商业活动最具气势最为专业的场地。'
                  ,style: TextStyle(height: 1.2),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text('        主赛道整体造型呈“F”字型，单圈长度为2014.666米，大直道全长526.2米。T2弯道为180°发卡弯，T7-T10弯道为特色漂移弯。可以举办或承接国际、国内知名赛事和单品牌杯比赛，集挑战性、观赏性、趣味性于一体。赛道还可用于汽车性能测评、试乘试驾、拍摄取景，同样也是改装车俱乐部、各车友会之间驾控技术PK、经验交流的平台，另外可提供给驻场车队训练、车队比赛、赛照培训等。定期举办的万驰·赛同样给广大赛车爱好者一个实现车手梦想的机会。'
                    ,style: TextStyle(height: 1.2),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );


  }
}
