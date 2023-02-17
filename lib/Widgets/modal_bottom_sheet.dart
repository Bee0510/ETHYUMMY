// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../Small Compnents/texfield_formfill.dart';

class UpdateNameButton extends StatefulWidget {
  @override
  State<UpdateNameButton> createState() => _UpdateNameButtonState();
}

class _UpdateNameButtonState extends State<UpdateNameButton> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Container(
          height: 500,
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Your Name' : null,
                  keyboardType: TextInputType.name,
                  decoration: TextField_decor.copyWith(
                      hintText: 'Name',
                      icon: Icon(Icons.person, color: Colors.white)),
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (value) =>
                      value!.isEmpty ? 'Enter Valid UserId' : null,
                  keyboardType: TextInputType.name,
                  decoration: TextField_decor.copyWith(
                      hintText: 'UserId',
                      icon: Icon(Icons.verified_user_outlined,
                          color: Colors.white)),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.update),
                  label: Text('Update'),
                ),
              ],
            ),
          ),
        ));
  }
}
