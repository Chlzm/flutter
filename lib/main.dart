import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_app1/views/home/homePage.dart';
import 'package:flutter_app1/states/app_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'test.dart';

AppState mainReducer(AppState state,dynamic action){
  if(Action.increment==action){
    state.count.count += 1;
  }
  return state;
}

void main(){
  Store<AppState> store = new Store<AppState>(mainReducer,initialState: new AppState(
    count: new CountState(),
    auth: new AuthState(),
  ));
  runApp(new MyApp(store: store,));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child:MyAppFullWidget()
    );
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
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String,WidgetBuilder>{
        '/list': (_)=>new Demo()
      },
      debugShowCheckedModeBanner: false,
      theme:ThemeData(backgroundColor:Colors.black,primarySwatch: Colors.red, bottomAppBarColor: Colors.black),
      home: HomePage(title: '预约广场'),
      localizationsDelegates: [                             //此处
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [                                   //此处
        const Locale('zh','CH'),
        const Locale('en','US'),
      ],
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
