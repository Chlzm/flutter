import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../views/home.dart';
import 'package:flutter_app1/views/list/list.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _BottomBarState createState() {
    // TODO: implement createState
    return _BottomBarState(index);
  }
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex;
  _BottomBarState(int index){
    _currentIndex = index;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        if(_currentIndex == index){
          return;
        }
        setState(() {
          _currentIndex = index;
        });
        if(index ==0){
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>Home()));
        }else{
          Navigator.push(context, CupertinoPageRoute(builder: (context)=>MyList()));
        }

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
    );
  }
}
