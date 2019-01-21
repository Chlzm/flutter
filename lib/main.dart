import 'package:flutter/material.dart';

import 'views/home.dart';
import 'views/list.dart';
import 'views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        bottomAppBarColor: Colors.black
      ),
      home: MyHomePage(title: '预约广场'),
      routes: <String, WidgetBuilder>{
        '/router/home':(_)=> new Home(),
        '/router/list':(_)=> new MyList(),
        '/router/login':(_)=>new Login(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _tabIndex = 0;
  var _pageList = [
    Home(),
    MyList(),
    Container(
      child: Center(
        child: Text('404',style: TextStyle(fontSize: 148.0)),
      ),
    )
  ];
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,size: 18.0),
            title:Text('广场',style: TextStyle(fontSize: 12.0))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book,size: 18.0),
              title:Text('预约单',style: TextStyle(fontSize: 12.0))
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,size: 18.0),
              title:Text('我的',style: TextStyle(fontSize: 12.0))
          ),
        ],
      ),
    );
  }
}



