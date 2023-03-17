// ignore_for_file: prefer_const_constructors, camel_case_types, sized_box_for_whitespace

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Coming_Soon extends StatelessWidget {
  const Coming_Soon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 4, 60, 100),
      body: Center(
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Coming Soon',
                      textStyle: TextStyle(
                          fontSize: 30, color: Colors.white, letterSpacing: 3),
                      curve: Curves.linear,
                      speed: Duration(milliseconds: 200))
                ],
              ),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop('Myhomescreen');
                },
                icon: Icon(Icons.home),
                label: Text('Home'),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//         child: Text(
//           'Coming Soon',
//           style: TextStyle(fontSize: 20, color: Colors.white),
//         ),
//       ),
