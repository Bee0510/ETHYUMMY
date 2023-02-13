// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BuyAndSell extends StatelessWidget {
  const BuyAndSell({
    Key? key,
  }) : super(key: key);

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
              return;
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
