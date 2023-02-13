// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unrelated_type_equality_checks, sized_box_for_whitespace, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  String image;
  String name;
  String symbol;
  double currentprice;
  double Percentagechange24;
  // int High24;
  // int Low24;

  CryptoCard({
    required this.image,
    required this.name,
    required this.symbol,
    required this.currentprice,
    required this.Percentagechange24,
    // required this.High24,
    // required this.Low24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 100,
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('MyCoinDetailedScreen', arguments: {
                'image': image,
                'name': name,
                'symbol': symbol,
                'currentprice': currentprice,
                'percentagechange24': Percentagechange24,
                // 'high24': High24,
                // 'low24': Low24,
              });
            },
            child: Container(
              padding: EdgeInsets.all(15),
              width: 375,
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [],
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 170,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(name,
                                style: TextStyle(
                                    overflow: TextOverflow.clip,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            Text(symbol, style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('₹' + currentprice.toDouble().toStringAsFixed(2),
                          style: TextStyle(
                              overflow: TextOverflow.clip,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text(
                          Percentagechange24.toDouble() < 0
                              ? '${Percentagechange24.toStringAsFixed(2)}%'
                              : '+${Percentagechange24.toStringAsFixed(2)}%',
                          style: TextStyle(
                              color: Percentagechange24.toDouble() < 0
                                  ? Colors.red
                                  : Colors.green)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
