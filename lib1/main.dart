import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import './demo/bottomNavigationBarDemo.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: '预约广场'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
            title: new Text("Dialog Title"),
            content: new Row(
              children: <Widget>[
                new Checkbox(value: true, onChanged: null),
                new Text('this is content'),
              ],
            ),
            actions:<Widget>[
              new FlatButton(
                child:new Text("CANCEL"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(child:new Text("OK"), onPressed: (){
                Navigator.of(context).pop();
              },),
              new IconButton(icon: new Icon(Icons.print,color: Colors.blue,size: 20,), onPressed: null),
            ]

        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBarDemo(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Here weod, and use it to set our appbar title.
          title: Center(
            child: Text(widget.title,style: TextStyle(color: Colors.black),),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:10.0),
              width: MediaQuery.of(context).size.width,
              height: 230.0,
              child: Swiper(
                itemCount: 3,
                itemBuilder: _swiperBuilder,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.black45,
                        activeColor: Colors.white
                    )
                ),
                scrollDirection: Axis.horizontal,
                autoplay: true,
                onTap:(index){
                  print(index);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('/',style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(180, 0, 0, .5))),
                  Text(' 抢先预约 ',style: TextStyle(color: Colors.black54,fontSize: 18.0),),
                  Text('/',style: TextStyle(fontSize: 20.0,color: Color.fromRGBO(180, 0, 0, .5))),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all( 5.0),
                      child: new Image.network(
                          'http://wc.xiechangqing.cn/dist/images/021bf8fbab202003ad2d391c2a74ec63.jpg',
                          width: 10.0
                      ),
                    )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all( 5.0),
                        child: new Image.network(
                            'http://wc.xiechangqing.cn/dist/images/0faa83fafa4547a9f7efbeb064f70c19.jpg',
                            width: 10.0
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all( 5.0),
                        child: new Image.network(
                            'http://wc.xiechangqing.cn/dist/images/c3dd39120f8db1d571b437feeaaf17ff.jpg',
                            width: 10.0
                        ),
                      )
                  ),
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.all( 5.0),
                        child: new Image.network(
                            'http://wc.xiechangqing.cn/dist/images/299508983e5dd89b2f4ac61cb11b4dfc.jpg',
                            width: 10.0
                        ),
                      )
                  )

                ],
              ),
            ),
            Container(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue[500],
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 14.0,
                      spreadRadius: 1.0,
                      offset: Offset(-2.0, 3.0),
                    )
                  ]
                ),
                child: Image.network(
                    'http://wc.xiechangqing.cn/dist/images/2e3f2ff92f63a793ae33724d3388c840.jpg'
                ),
              ),
              padding: EdgeInsets.only(left:15.0,right:15.0)
            )
          ],
        )
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    if(index == 1){
      return (
          Image.network(
            "http://wc.xiechangqing.cn/images/files/20181215/2330092MquMgIm.jpg",
            alignment: Alignment(0.0, -0.95),
            fit: BoxFit.fill,
          )

      );
    }else if(index == 2){
      return (
          Image.network(
            "http://wc.xiechangqing.cn/images/files/20181215/232947fNxJS6xa.jpg",
            alignment: Alignment(0.0, -0.95),
            fit: BoxFit.fill,
          )
      );
    }
    return (
        Image.network(
          "http://wc.xiechangqing.cn/images/files/20181215/2329198gW9QDOJ.jpg",
          alignment: Alignment(0.0, -0.95),
          fit: BoxFit.fill,
        )
    );
  }
}
