import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../util/adapt.dart';
import 'package:transparent_image/transparent_image.dart';

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
  SwiperController swiperController;
  FocusNode accountTextFieldNode = FocusNode();
  FocusNode passwordTextFieldNode = FocusNode();

  void _initSwiperController() {
    swiperController = new SwiperController();
  }

  void _initController() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
  }

  void _initAnimation(double width) {
    movement = EdgeInsetsTween(
            begin: EdgeInsets.only(left: 0.0),
            end: EdgeInsets.only(left: width))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.1, 0.5, curve: Curves.easeInOutSine))
          ..addListener(() {
            setState(() {});
          }));
  }

  Future _startAnimation(double width) async {
    _initAnimation(width);
    try {
      await _controller.fling();
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
    _initAnimation(0.0);
    _initSwiperController();
    //_startAnimation();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text('登录',style: TextStyle(fontSize: 16.0, color: Colors.black))),
      body: GestureDetector(
        onTap: (){
          accountTextFieldNode.unfocus();
          passwordTextFieldNode.unfocus();
        },
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 40.0),
                    child: Image.asset("assets/image/logo.png",scale: 1.2,),
                    //margin: movement.value,
                    //child: Image.network("http://wc.xiechangqing.cn/images/files/20181215/2329198gW9QDOJ.jpg")
                  ),
                  Stack(
                    children: <Widget>[
                      Positioned(
                        left: 20.0,
                        bottom: 0.0,
                        child: Container(
                          margin: movement.value,
                          child: Text(' '),
                          width: (Adapt.screenW() - 40) / 2,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                  BorderSide(color: Colors.red, width: 2.0))),
                        ),
                      ),
                      Container(
                        margin: new EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.05),
                            )
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: FlatButton(
                                color: Colors.white,
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                child: Container(
                                  child: Text('密码登录'),
                                  padding:
                                  EdgeInsets.only(top: 12.0, bottom: 12.0),
                                  alignment: Alignment.center,
                                ),
                                onPressed: () {
                                  swiperController.move(0, animation: true);
                                  _startAnimation(0.0);
                                },
                              )
                            ),
                            Expanded(
                                flex: 1,
                                child: FlatButton(
                                  color: Colors.white,
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
                                  child: Container(
                                    child: Text('短信登录'),
                                    padding:
                                    EdgeInsets.only(top: 12.0, bottom: 12.0),
                                    alignment: Alignment.center,
                                  ),
                                  onPressed: () {
                                    swiperController.move(1, animation: true);
                                    _startAnimation((Adapt.screenW() - 40) / 2);
                                  },
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20.0),
                    height: 200.0,
                    child: Swiper.children(
                      controller: swiperController,
                      onIndexChanged: (int index) {
                        if (index == 0.0) {
                          _startAnimation(0.0);
                          return;
                        }
                        _startAnimation((Adapt.screenW() - 40) / 2);
                      },
                      children: <Widget>[
                        ListView(
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: CupertinoTextField(
                                  focusNode: accountTextFieldNode,
                                  clearButtonMode: OverlayVisibilityMode.editing,
                                  decoration: BoxDecoration(
                                      border:Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: Colors.black26
                                          )
                                      )
                                  ),
                                  prefix:Icon(Icons.phone_android,color: Colors.black26,),
                                  placeholder: '请输入手机号',
                                  keyboardType: TextInputType.number,
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: CupertinoTextField(
                                  focusNode: passwordTextFieldNode,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border:Border(
                                      bottom: BorderSide(
                                        width: 0.5,
                                        color: Colors.black26
                                      )
                                    )
                                  ),
                                  prefix:Icon(Icons.https,color: Colors.black26,),
                                  placeholder: '请输入密码',
                                  autofocus: false,
                                  obscureText:true,
                                  keyboardType: TextInputType.text,
                                )
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: FlatButton(
                                color: Colors.white,
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                                onPressed: (){
                                  print('忘记密码');
                                },
                                child: Text('忘记密码？',style: TextStyle(color: Colors.black54),),
                              ),
                            ),
                          ],
                        ),
                        ListView(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: CupertinoTextField(
                                focusNode: accountTextFieldNode,
                                clearButtonMode: OverlayVisibilityMode.editing,
                                decoration: BoxDecoration(
                                    border:Border(
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: Colors.black26
                                        )
                                    )
                                ),
                                prefix:Icon(Icons.phone_android,color: Colors.black26,),
                                placeholder: '请输入手机号',
                                keyboardType: TextInputType.number,
                              )
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: CupertinoTextField(
                                      focusNode: passwordTextFieldNode,
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          border:Border(
                                              bottom: BorderSide(
                                                  width: 0.5,
                                                  color: Colors.black26
                                              )
                                          )
                                      ),
                                      prefix:Icon(Icons.https,color: Colors.black26,),
                                      placeholder: '短信动态码',
                                      autofocus: false,
                                      obscureText:true,
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 0.5,
                                              color: Colors.black26
                                            )
                                          )
                                        ),
                                        alignment: Alignment.center,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10.0,right: 10.0),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                width: 0.5,
                                                color: Colors.black45
                                              )
                                            )
                                          ),
                                          child: Text('短信动态码',style: TextStyle(color: Color.fromRGBO(81, 131, 240, 1)),),
                                        ),
                                      ),
                                      onTap: (){
                                        print('ssss');
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0,right:20.0),
                    child: RaisedButton(
                      onPressed: (){
                        print('222');
                      },
                      color: Colors.red,
                      child: Container(
                        padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
                        alignment: Alignment.center,
                        child: Text('登录',style: TextStyle(color: Colors.white,fontFamily:'微软雅黑',fontSize: 20.0),),
                      ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('点击登录，即表示已阅读并同意',style: TextStyle(color: Colors.black45),),
                        FlatButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.white,
                          highlightColor: Colors.white,
                          splashColor: Colors.white,
                          onPressed: (){
                            print('服务协议');
                          },
                          child: Text('《服务协议》',style: TextStyle(color: Color.fromRGBO(81, 131, 240, 1)),),
                        )
                      ],
                    ),
                  )
                ],
              )
            )
          ],
        ),
      ),

    );
  }
}
