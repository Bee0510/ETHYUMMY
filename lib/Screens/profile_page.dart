// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:ethyummy/Small%20Compnents/profile_list.dart';
import 'package:flutter/material.dart';

class Profile_Page extends StatelessWidget {
  const Profile_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 4, 60, 100),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(10, 4, 60, 100),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 55),
                    Hero(
                      tag: 'Profile',
                      child: CircleAvatar(
                          radius: 50,
                          child: Image.network(
                              'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/man5-512.png')
                          //     Icon(
                          //   Icons.person,
                          //   size: 60,
                          //   color: Colors.white,
                          // ),
                          ),
                    ),
                    SizedBox(height: 5),
                    Text('Full Name',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text('Username',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            Profile_list(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: Icon(
          Icons.edit,
          color: Colors.blue,
        ),
      ),
    );
  }
}
