import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import '../widget/bottomNavgitorBar.dart';
import 'package:flutter_app1/views/login/login.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '预约广场',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeModule(title:"预约广场"),
    );
  }
}

class HomeModule extends StatefulWidget{
  HomeModule({Key key,this.title}):super(key:key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeModuleState();
  }
}

class _HomeModuleState extends State<HomeModule>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:Colors.white,
          elevation:4.0,
          title: Text('预约广场',style: TextStyle(fontSize: 16.0,color: Colors.black)),
        ),
        bottomNavigationBar: BottomBar(index: 0),
        body:Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 240.0,
              child: Swiper(
                itemCount: 4,
                itemBuilder: _swiperBuilder,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.black54,
                      activeColor: Colors.white,
                    )
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top:10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      alignment: Alignment.topRight,
                      child: new Text("/",style: TextStyle(color: Colors.redAccent)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: new Text("抢先预约",style: TextStyle(color: Colors.black54)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.topLeft,
                      child: new Text("/",style: TextStyle(color: Colors.redAccent)),
                    )
                  ],
                )),
            Container(
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
            ),
            Container(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: RaisedButton(
                    padding: EdgeInsets.all(0.0),
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context)=>Login()));
                    },
                    color: Colors.red,
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
                      child: Image.network("http://wc.xiechangqing.cn/dist/images/2e3f2ff92f63a793ae33724d3388c840.jpg"),
                    )
                )
            ),
          ],
        )
    );
  }
}


Widget _swiperBuilder(BuildContext context, int index) {
  var str = "";
  var list = [
    "http://wc.xiechangqing.cn/images/files/20181215/2329198gW9QDOJ.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/232947fNxJS6xa.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/232958MvXh9yBL.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/2330092MquMgIm.jpg"
  ];
  return (
      Image.network(
        list[index],
        fit: BoxFit.fill,
      ));
}