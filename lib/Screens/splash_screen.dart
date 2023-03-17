// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, non_constant_identifier_names

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  settime() {
    var duration = Duration(seconds: 8);
    Timer(duration, Route);
  }

  Route() {
    Navigator.of(context).pushReplacementNamed('Wrapper');
  }

  @override
  void initState() {
    settime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 4, 60, 100),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(height: 70),
              Center(
                child: Lottie.network(
                    'https://assets9.lottiefiles.com/packages/lf20_yc9ywdm7.json',
                    animate: true),
              ),
              // Container(
              //   child: AnimatedSplash(),
              // )
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('ETHYUMMY',
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                      curve: Curves.linear,
                      speed: Duration(milliseconds: 200))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: AnimatedTextKit(
              repeatForever: false,
              animatedTexts: [
                RotateAnimatedText('ETHYUMMY',
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    rotateOut: false),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: AnimatedTextKit(animatedTexts: [
              TyperAnimatedText('Your Crypto-Partner',
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
            ]),
          )
        ]);
  }
}
