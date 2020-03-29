import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ETSwiper extends StatefulWidget {

  final List items = [];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ETSwiper();
  }
}

class _ETSwiper extends State<ETSwiper> {

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(

      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(380),
      color: Colors.white,
      child:

      Swiper(
        containerHeight: 333,
        itemBuilder: (BuildContext context, int index) {
          return Image.network("https://file.nepx.com/bpx/uploadFile/2019/20191217113114_007 2副本.jpg", fit: BoxFit.cover);
        },
        itemCount: 3,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(10.0),
            builder: SwiperPagination.dots
        ),
//        control: SwiperControl(),
        duration: 8,
        autoplay: true,
//        viewportFraction: 0.8,
//        scale: 0.9,
        onTap: (index) {
          print("轮播图被点击：${index}");
        },
      ),
    );
  }
}