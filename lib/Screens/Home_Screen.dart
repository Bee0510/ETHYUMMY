// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, prefer_is_empty, dead_code, avoid_print, prefer_const_literals_to_create_immutables
import 'dart:async';
import 'dart:convert';
import 'package:ethyummy/For%20Authentication/Auth.dart';
import 'package:ethyummy/Models/coins.dart';
import 'package:ethyummy/Small%20Compnents/crypto_card.dart';
import 'package:ethyummy/Widgets/swipe_homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Myhomescreen extends StatefulWidget {
  const Myhomescreen({super.key});

  @override
  State<Myhomescreen> createState() => _MyhomescreenState();
}

class _MyhomescreenState extends State<Myhomescreen> {
  final Modalroute = 'Myhomescreen';

  Future<List<Coin>> getCoin() async {
    Coinlist = [];
    final Response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

    if (Response.statusCode == 200) {
      List<dynamic> data = [];
      data = json.decode(Response.body);

      if (data.length > 0) {
        for (int i = 0; i < data.length; i++) {
          if (data[i] != null) {
            Map<String, dynamic> map = data[i];
            Coinlist.add(Coin.fromJson(map));
          }
        }
        setState(() {
          Coinlist;
        });
      }
      return Coinlist;
    } else {
      throw Exception('Loading Error');
    }
  }

  @override
  void initState() {
    getCoin();
    Timer.periodic(Duration(seconds: 3), (timer) => getCoin());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Authentication _auth = Authentication();
    return Scaffold(
      backgroundColor: Color.fromRGBO(10, 4, 60, 100),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.topRight,
                child: OutlinedButton.icon(
                  onPressed: () => _auth.LogOut(),
                  icon: Icon(Icons.power_settings_new),
                  label: Text('Log Out'),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.white)),
                ),
              ),
              Center(
                child: Container(
                    height: 250,
                    width: 375,
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                      stops: [0.2, 0.4, 0.6],
                      center: Alignment.center,
                      radius: 0.5,
                      focalRadius: 0.5,
                      colors: [
                        Color.fromRGBO(10, 4, 60, 100),
                        Color.fromRGBO(10, 4, 60, 100).withAlpha(150),
                        Color.fromRGBO(10, 4, 60, 100).withAlpha(300),
                      ],
                    )),
                    child: IconButton(
                        splashRadius: 60,
                        highlightColor: Colors.grey[800],
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          size: 60,
                        ))),
              ),
              SwipeOptions(),
              Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Coinlist.length,
                    itemBuilder: (context, index) {
                      return CryptoCard(
                        image: Coinlist[index].image,
                        name: Coinlist[index].name,
                        symbol: Coinlist[index].symbol,
                        currentprice: Coinlist[index].currentPrice.toDouble(),
                        Percentagechange24:
                            Coinlist[index].priceChangePercentage24H.toDouble(),
                        // High24: Coinlist[index].high24,
                        // Low24: Coinlist[index].low24,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
