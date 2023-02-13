// ignore_for_file: avoid_types_as_parameter_names, camel_case_types, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Profile_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Icon> icon = [
      Icon(Icons.dashboard),
      Icon(Icons.business_center),
      Icon(Icons.payment),
      Icon(Icons.price_change),
      Icon(Icons.logout_outlined),
    ];

    List<String> title = [
      'Dashboard',
      'Traders',
      'Payments',
      'Revenue',
      'Logout',
    ];
    return Container(
      padding: EdgeInsets.only(top: 30, left: 6),
      width: 400,
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, int) {
            return ListTile(
                leading: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color.fromRGBO(10, 4, 60, 100))),
              onPressed: () {},
              icon: icon[int],
              label: Text(
                title[int],
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ));
          }),
    );
  }
}
