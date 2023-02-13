// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, avoid_unnecessary_container, unused_field, sized_box_for_whitespace

import 'package:ethyummy/Small%20Compnents/texfield_formfill.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../For Authentication/Auth.dart';

class Registration_page extends StatefulWidget {
  final Function toggleChange;
  const Registration_page(this.toggleChange);

  @override
  State<Registration_page> createState() => _Registration_pageState();
}

class _Registration_pageState extends State<Registration_page> {
  final Authentication _authentication = Authentication();
  final _formkey = GlobalKey<FormState>();
  String Email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 4, 60, 100),
      body: Form(
          key: _formkey,
          child: Center(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      child: Lottie.network(
                          'https://assets6.lottiefiles.com/packages/lf20_cgjrfdzx.json'),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter the email' : null,
                      keyboardType: TextInputType.emailAddress,
                      decoration: TextField_decor.copyWith(
                          hintText: 'Email',
                          icon: Icon(Icons.mail, color: Colors.white)),
                      onChanged: (value) {
                        setState(() {
                          Email = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (value) =>
                          value!.length < 6 ? 'Enter a valid password' : null,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: TextField_decor.copyWith(
                          hintText: 'Password',
                          icon: Icon(
                            Icons.security,
                            color: Colors.white,
                          )),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        OutlinedButton.icon(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              dynamic result =
                                  await _authentication.RegisterTHroughEmail(
                                      Email, password);
                            }
                          },
                          icon: Icon(Icons.app_registration),
                          label: Text('Register'),
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 2, color: Colors.white)),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            widget.toggleChange();
                          },
                          icon: Icon(Icons.login),
                          label: Text('Login'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
