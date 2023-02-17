// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, non_constant_identifier_names
import 'package:ethyummy/Screens/Home_Screen.dart';
import 'package:ethyummy/ZUnused%20files/exchange_screen.dart';
import 'package:flutter/material.dart';
import 'my_wallet_screen.dart';

class BottomNavigator extends StatefulWidget {
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int pageNumber = 0;
  List<Map<String, Object>> page = [];
  @override
  void initState() {
    page = [
      {
        'Page': Myhomescreen(),
        'title': 'EthYUMMY',
      },
      {
        'Page': ExchangeScreen(),
        'title': 'Exchange',
      },
      {
        'Page': MyWalletScreen(),
        'title': 'Wallet',
      }
    ];

    super.initState();
  }

  void SelectPageJump(int index) {
    setState(() {
      pageNumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 38, 46, 50),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(233, 232, 232, 100),
        title: Text(page[pageNumber]['title'].toString()),
      ),
      body: page[pageNumber]['Page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageNumber,
        type: BottomNavigationBarType.shifting,
        elevation: 4,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: SelectPageJump,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange), label: 'Exchange'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'My Wallet'),
        ],
      ),
    );
  }
}
