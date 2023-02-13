// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types, avoid_unnecessary_containers, use_build_context_synchronously, use_key_in_widget_constructors, avoid_print

import 'package:ethyummy/For%20Authentication/Auth.dart';
import 'package:ethyummy/Small%20Compnents/texfield_formfill.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignIN_Page extends StatefulWidget {
  final Function toggleChange;
  const SignIN_Page(this.toggleChange);

  @override
  State<SignIN_Page> createState() => _SignIN_PageState();
}

class _SignIN_PageState extends State<SignIN_Page> {
  final Authentication _authentication = Authentication();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

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
                          'https://assets6.lottiefiles.com/packages/lf20_fztotluf.json'),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter the email' : null,
                      keyboardType: TextInputType.emailAddress,
                      decoration: TextField_decor.copyWith(
                          hintText: 'Email',
                          icon: Icon(Icons.mail, color: Colors.white)),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (value) =>
                          value!.length < 6 ? 'Enter a valid password' : null,
                      keyboardType: TextInputType.emailAddress,
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
                    SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              dynamic result =
                                  await _authentication.LogInThroughEmail(
                                      email, password);
                              print(result);
                              if (result == null) {
                                setState(() {
                                  error = 'Invalid Credential';
                                });
                              }
                            }
                          },
                          icon: Icon(Icons.login),
                          label: Text('Login'),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(10, 4, 60, 100),
                              side: BorderSide(width: 2, color: Colors.white)),
                        ),
                        SizedBox(height: 8),
                        Divider(thickness: 2, color: Colors.grey[850]),
                        ElevatedButton.icon(
                          onPressed: () {
                            widget.toggleChange();
                          },
                          icon: Icon(Icons.app_registration),
                          label: Text('Register'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
