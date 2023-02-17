// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Swipe_Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Icon> icon = [
      Icon(Icons.call_received),
      Icon(Icons.send),
      Icon(Icons.swap_calls),
      Icon(Icons.shopify_rounded),
      Icon(Icons.currency_exchange),
      Icon(Icons.wallet),
    ];

    List<String> title = [
      'Receive',
      'Send',
      'Swap',
      'Buy',
      'Exchange',
      'Wallet',
    ];
    return Scaffold(
      body: Center(
        child: Swiper(
            autoplayDisableOnInteraction: true,
            itemHeight: 60,
            itemWidth: 60,
            loop: true,
            layout: SwiperLayout.STACK,
            curve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            containerHeight: 150,
            containerWidth: 375,
            duration: 1200,
            itemCount: 4,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: InkWell(
                        child: IconButton(
                          icon: icon[i],
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Text(title[i], style: TextStyle(color: Colors.white))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
