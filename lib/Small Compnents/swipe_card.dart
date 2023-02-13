// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Swipe_Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> Color = <String>['red', 'blue', 'green', 'yellow', 'orange'];
    return Scaffold(
      body: Center(
        child: Swiper(
          autoplayDisableOnInteraction: true,
          itemHeight: 200,
          itemWidth: 350,
          loop: true,
          layout: SwiperLayout.STACK,
          curve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          containerHeight: 150,
          containerWidth: 375,
          duration: 1200,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container();
          },
        ),
      ),
    );
  }
}
