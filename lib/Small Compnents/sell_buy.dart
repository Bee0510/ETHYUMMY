// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';

class BuyAndSell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  side: BorderSide(width: 2, color: Color(0xff586af8))),
              onPressed: () {},
              icon: Icon(
                Icons.upload,
                color: Colors.white,
              ),
              label: Text(
                'Sell',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          TextButton.icon(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                backgroundColor: Color(0xff586af8)),
            onPressed: () {
              Navigator.of(context).pushNamed('Buy_Screen');
            },
            icon: Icon(
              Icons.download,
              color: Colors.white,
            ),
            label: Text(
              'Buy',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
