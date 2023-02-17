// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, unnecessary_brace_in_string_interps, unused_local_variable

import 'package:ethyummy/Screens/graph_sheet.dart';
import 'package:flutter/material.dart';

class MyCoinDetailedScreen extends StatefulWidget {
  @override
  State<MyCoinDetailedScreen> createState() => _MyCoinDetailedScreenState();
}

class _MyCoinDetailedScreenState extends State<MyCoinDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    final Modelarg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Cointitle = Modelarg['name'];
    final Coinimage = Modelarg['image'];
    final Coinsymbol = Modelarg['symbol'];
    final Coinhigh24 = Modelarg['high24'];
    final Coinlow24 = Modelarg['low24'];

    return Scaffold(
      backgroundColor: Color(0xff191d2d),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff191d2d),
        title: Text('${Cointitle} Price'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 80),
          Text(
            Cointitle,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          SizedBox(height: 10),
          CircleAvatar(
            backgroundColor: Color(0xff191d2d),
            radius: 36,
            backgroundImage: NetworkImage(Coinimage),
          ),
          SizedBox(height: 10),
          Text(
            '(${Coinsymbol})',
            style: TextStyle(fontSize: 24, color: Colors.grey),
          ),
          SizedBox(
            height: 470,
            child: GraphSheet(
                // High: Coinhigh24,
                // Low: Coinlow24,
                ),
          ),
        ],
      ),
    );
  }
}
