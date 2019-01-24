import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'views/home/homePage.dart';
import 'test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAppFullWidget();
  }
}

class MyAppFullWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppFullWidgetState();
  }
}

class _MyAppFullWidgetState extends State<MyAppFullWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String,WidgetBuilder>{
        '/list': (_)=>new Demo()
      },
      debugShowCheckedModeBanner: false,
      theme:ThemeData(primarySwatch: Colors.red, bottomAppBarColor: Colors.black),
      home: HomePage(title: '预约广场'),
    );
  }
}

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//  int _tabIndex = 0;
//  final List<Widget> _pageList = [
//    Home(),
//    MyList(),
//    Container(
//      child: Center(
//        child: Text('404',style: TextStyle(fontSize: 148.0)),
//      ),
//    )
//  ];
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _pageList[_tabIndex],
//      //bottomNavigationBar:
//    );
//  }
//}
