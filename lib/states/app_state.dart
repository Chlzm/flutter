import 'package:meta/meta.dart';

enum Action { increment }

class AuthState{
  bool isLogin;
  AuthState({this.isLogin:false});
}

class CountState{
  int count;
  CountState({this.count:18});
}


class AppState{
 AuthState auth;
 CountState count;
 AppState({this.auth,this.count});
}