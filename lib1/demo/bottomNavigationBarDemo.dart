import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoBarState();
  }
}

class _BottomNavigationBarDemoBarState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;
  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      iconSize: 20.0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('广场',
            style: TextStyle(
              fontSize: 10.0,
            )),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.content_paste), title: Text('预约单')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('我的')),
      ],
    );
  }
}
