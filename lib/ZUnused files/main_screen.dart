// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable, unused_element, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'botton_navigator_bar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigator(),
    );
  }
}
