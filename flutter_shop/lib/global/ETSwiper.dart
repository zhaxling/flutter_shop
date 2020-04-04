import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../Model/CycleModel.dart';

class ETSwiper extends StatelessWidget {
  final List<CycleModel> items;
  ETSwiper({this.items});

  Widget build(BuildContext context) {
    if (items.length == 0) {
      return Container();
    }

    return Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil().setHeight(380),
      color: Colors.white,
      child: Swiper(
        containerHeight: 333,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          CycleModel model = items[index];
          print("轮播图 $model");
          return CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: model.path,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
          );
//          return Image.network(
//              "https://file.nepx.com/bpx/uploadFile/2019/20191217113114_007 2副本.jpg",
//              fit: BoxFit.cover);
        },
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(10.0),
            builder: SwiperPagination.dots),
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
