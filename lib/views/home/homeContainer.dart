import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homeModuleBanner.dart';
import 'homeModuleSubscribe.dart';
import 'homeModuleActivity.dart';
import 'homeModuleJoin.dart';
import 'package:flutter_app1/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';



class HomeContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContainerState();
  }
}

class _HomeContainerState extends State<HomeContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        HomeModuleBanner(title: 'sssss'),
        HomeModuleSubscribe(),
        HomeModuleActivity(),
        HomeModuleJoin(),
        Center(
          child: StoreConnector<AppState, int>(
            builder: (context, count) {
              return Text(count.toString());
            },
            converter: (store) => store.state.count.count),
        ),
        Container(
          child: StoreConnector<AppState,VoidCallback>(
            builder: (BuildContext context,VoidCallback callback){
              return GestureDetector(
                child: Text('ssss'),
                onTap: callback,
              );
            },
            converter: (Store<AppState> store){
              return ()=>store.dispatch(Action.increment);
            }
          ),
        )
      ],
    );
  }
}
