// @dart=2.9

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_print, prefer_const_literals_to_create_immutables, unused_import

import 'package:ethyummy/Athentication%20Pages/wrapper.dart';
import 'package:ethyummy/Auth%20Models/auth_class.dart';
import 'package:ethyummy/Screens/Home_Screen.dart';
import 'package:ethyummy/Screens/coin_detailed_screen.dart';
import 'package:ethyummy/Athentication%20Pages/registration_page.dart';
import 'package:ethyummy/Athentication%20Pages/signIN_page.dart';
import 'package:ethyummy/Screens/splash_screen.dart';
import 'package:ethyummy/Small%20Compnents/swipe_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'For Authentication/Auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: Authentication().UserDetails,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Wrapper(),
        routes: {
          'MyCoinDetailedScreen': (context) => MyCoinDetailedScreen(),
          'Myhomescreen': (context) => Myhomescreen(),
        },
      ),
    );
  }
}
