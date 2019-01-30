import 'package:flutter/material.dart';

class WCAppBar extends StatefulWidget {
  WCAppBar({Key key, this.title}) : super(key: key);
  String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WCAppBarState();
  }
}

class _WCAppBarState extends State<WCAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black38),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4.0,
        title:
            Text(widget.title, style: TextStyle(fontSize: 16.0, color: Colors.black)));
  }
}
