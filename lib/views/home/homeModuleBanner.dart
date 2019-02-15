import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_app1/api/home.dart';
import 'package:dio/dio.dart';


class HomeModuleBanner extends StatefulWidget {
  HomeModuleBanner({Key key,this.title}):super(key:key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return __HomeModuleBannerState();
  }
}

class __HomeModuleBannerState extends State<HomeModuleBanner> {
  var data;
  var newList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }
  
  Future<void> getData() async{
    HomeApi api = new HomeApi();
    var res = await api.getBanner("/rest/index/cyclelist");
    setState(() {
      data = res.data['body'];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 240.0,
      child: printBanner(),
    );
  }

  Widget printBanner(){
    if(data == null){
      return Container(
        child: Text(''),
      );
    }

    for(var item in data){
      newList.add(item['imgUrl']);
    }

    return Swiper(
      autoplay: true,
      itemCount: 4,
      itemBuilder: _swiperBuilder,
      pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          )),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {

    return(
        Image.network(
          newList[index],
          fit: BoxFit.fill,
        )
    );
  }
}


