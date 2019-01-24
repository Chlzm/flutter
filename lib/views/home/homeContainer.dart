import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homeModuleBanner.dart';
import 'homeModuleSubscribe.dart';
import 'homeModuleActivity.dart';
import 'homeModuleJoin.dart';

class HomeContainer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeContainerState();
  }
}

class _HomeContainerState extends State<HomeContainer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        HomeModuleBanner(title: 'sssss'),
        HomeModuleSubscribe(),
        HomeModuleActivity(),
        HomeModuleJoin()
      ],
    );
  }
}
