import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoginModule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginModuleState();
  }
}

class _LoginModuleState extends State<LoginModule>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<EdgeInsets> movement;
  void _initController() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
  }

  void _initAnimation() {
    movement = EdgeInsetsTween(
          begin: EdgeInsets.only(left: 0.0 ),
          end: EdgeInsets.only(left:100.0)
        )
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.1, 0.5, curve: Curves.easeInOutSine)
          )
            ..addListener(() {
              setState(() {});
            })

    );
  }

  Future _startAnimation() async {

    try {
      await _controller.forward();
//      await _controller
//          .forward()
//          .orCancel;
//      await _controller
//          .reverse()
//          .orCancel;
    } on TickerCanceled {
      print('Animation Failed');
    }
  }

  @override
  void initState() {
    super.initState();
    _initController();
    _initAnimation();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black38),
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 4.0,
          title:
              Text('登录', style: TextStyle(fontSize: 16.0, color: Colors.black)),
        ),
        body: Container(
            padding: movement.value,
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 40.0),
                    //margin: movement.value,
                    child: Image.asset("assets/image/logo.png")),
                Stack(
                  children: <Widget>[
                    Positioned(
                      left: 20.0,
                      bottom: 0.0,
                      child: Container(
                        margin: movement.value,
                        child: Text(' '),
                        width: MediaQuery.of(context).size.width / 2 - 10,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.red
                            )
                          )
                        ),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.only(top: 20.0,left:20.0,right: 20.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.05),
                              ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: Container(
                                child: Text('密码登录'),
                                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                                alignment: Alignment.center,
                              ),
                              onTap: () {
                                print(0);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              child: Container(
                                child: Text('短信登录'),
                                padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                                alignment: Alignment.center,
                              ),
                              onTap: () {
                                print(1);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}

