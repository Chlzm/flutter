import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homeContainer.dart';
import 'homeList.dart';
import 'package:flutter_app1/views/mine/mine.dart';
import 'package:flutter_app1/views/message/message.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeModuleState();
  }
}

class _HomeModuleState extends State<HomePage> {
  int _currentIndex = 0;
  var widgets = [
    HomeContainer(),
    HomeList(),
    Mine()
  ];

  var titles = [
    "预约广场",
    "我的订单",
    "我的",
  ];

  Widget getIcons(BuildContext context,int index){
    var icons = [
      Container(
        child: Text('2'),
        padding: EdgeInsets.only(right: 5.0),
      ),
      Container(
        child: Text('2'),
        padding: EdgeInsets.only(right: 5.0),
      ),
      GestureDetector(
        child: Container(
          child: Icon(Icons.mail,size: 25.0,color: Colors.black54),
          padding: EdgeInsets.only(right: 5.0),
        ),
        onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>Message()));
        },
      )
    ];
    return icons[index];
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation:4.0,
        title: Text(titles[_currentIndex],style: TextStyle(fontSize: 16.0,color: Colors.black)),
        actions: <Widget>[
          getIcons(context,_currentIndex),
        ],
      ),
      body: widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          if(_currentIndex == index){
            return;
          }
          setState(() {
            _currentIndex = index;
          });

        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 18.0),
              title: Text('广场', style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(
              icon: Icon(Icons.book, size: 18.0),
              title: Text('预约单', style: TextStyle(fontSize: 12.0))),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 18.0),
              title: Text('我的', style: TextStyle(fontSize: 12.0))),
        ],
      ),
    );
  }
}
