// ignore_for_file: prefer_const_literals_to_create_immutables, camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_field, unused_import, non_constant_identifier_names, must_be_immutable, sort_child_properties_last, avoid_print, unused_local_variable
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ethyummy/Auth%20Models/auth_class.dart';
import 'package:ethyummy/Firebase/firestore.dart';
import 'package:ethyummy/Models/Coin_later.dart';
import 'package:ethyummy/Models/coins.dart';
import 'package:ethyummy/Widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../Small Compnents/texfield_formfill.dart';

class Buy_Screen extends StatefulWidget {
  @override
  State<Buy_Screen> createState() => _Buy_ScreenState();
}

class _Buy_ScreenState extends State<Buy_Screen> {
  String enteredprice = '';
  String marketprice = '';
  double balance = 1000;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Users>(context);

    return StreamBuilder(
      stream: DatabaseService(uid: data.uid).coinsy,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          Coinsy userdata = snapshot.data;

          return Scaffold(
              backgroundColor: Color.fromRGBO(10, 4, 60, 100),
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(10, 4, 60, 100),
                centerTitle: true,
                title: Text(userdata.name),
                toolbarHeight: 50,
              ),
              body: SafeArea(
                child: Form(
                  key: _formkey,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                width: 120,
                                child: ExpansionTile(
                                  backgroundColor:
                                      Color.fromRGBO(10, 4, 60, 100),
                                  title: Text(
                                    'Qty',
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('NSE',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          )),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('BSE',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    enteredprice = value;
                                  });
                                },
                                validator: (value) => value!.contains('-') ||
                                        value.isEmpty ||
                                        double.parse(value) > balance
                                    ? 'Invalid'
                                    : null,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 20))),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                width: 120,
                                child: ExpansionTile(
                                  backgroundColor:
                                      Color.fromRGBO(10, 4, 60, 100),
                                  title: Text(
                                    'Price',
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Limit',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          )),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text('Market',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 50,
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    marketprice = value;
                                  });
                                },
                                validator: (value) =>
                                    value!.contains('-') || value.isEmpty
                                        ? 'Invalid'
                                        : null,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 20))),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        OutlinedButton(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        elevation: 4,
                                        backgroundColor:
                                            Color.fromRGBO(50, 50, 50, 100),
                                        duration: Duration(seconds: 3),
                                        content: Text(
                                          'Payment successful',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        )));
                                await DatabaseService(uid: userdata.uid)
                                    .UpdateUserData(
                                  double.parse(enteredprice),
                                  'Etherium',
                                  balance - double.parse(enteredprice),
                                  userdata.uid,
                                  double.parse(marketprice),
                                  100,
                                );
                                Timer(Duration(seconds: 1), () {
                                  Navigator.of(context).pop('Myhomescreen');
                                });
                              });
                            }
                          },
                          child: Text('Buy'),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(
                            color: Colors.blue,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        } else {
          return Loader();
        }
      },
    );
  }
}
