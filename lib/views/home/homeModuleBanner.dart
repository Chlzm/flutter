import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeModuleBanner extends StatefulWidget {
  HomeModuleBanner({Key key,this.title}):super(key:key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return __HomeModuleBannerState();
  }
}

class __HomeModuleBannerState extends State<HomeModuleBanner> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      height: 240.0,
      child: Swiper(
        autoplay: true,
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
          color: Colors.black54,
          activeColor: Colors.white,
        )),
      ),
    );
  }
}

Widget _swiperBuilder(BuildContext context, int index) {
  var list = [
    "http://wc.xiechangqing.cn/images/files/20181215/2329198gW9QDOJ.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/232947fNxJS6xa.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/232958MvXh9yBL.jpg",
    "http://wc.xiechangqing.cn/images/files/20181215/2330092MquMgIm.jpg"
  ];
  return(
      Image.network(
        list[index],
        fit: BoxFit.fill,
    )
  );
}
