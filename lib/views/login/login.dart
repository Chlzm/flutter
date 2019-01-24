import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../test.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '登录',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginModule(),
      routes: <String,WidgetBuilder>{
        '/list': (_)=>new Demo()
      },
    );
  }
}

class LoginModule extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginModuleState();
  }
}

class _LoginModuleState extends State<LoginModule>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.red,),
              onPressed: (){
                Navigator.pop(context);
              }),
          centerTitle: true,
          backgroundColor:Colors.white,
          elevation:4.0,
          title: Text('登录',style: TextStyle(fontSize: 16.0,color: Colors.black)),
        ),
        body:LoginModule1()
    );
  }
}


class LoginModule1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 60.0),
            child: Image.asset("assets/image/logo.png")
        )
      ],
    );
  }
}