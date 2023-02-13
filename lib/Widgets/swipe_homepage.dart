// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SwipeOptions extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(233, 232, 232, 0),
            borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(8),
        height: 100,
        width: 375,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: icon.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 60,
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
