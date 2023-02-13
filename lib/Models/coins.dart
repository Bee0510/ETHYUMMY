// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:convert';

class Coin {
  Coin({
    required this.currentPrice,
    required this.id,
    required this.image,
    required this.name,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.symbol,
    // required this.high24,
    // required this.low24,
  });
  String id;
  String symbol;
  String name;
  String image;
  num currentPrice;
  num priceChange24H;
  num priceChangePercentage24H;
  // int high24;
  // int low24;

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        currentPrice: json['current_price'],
        id: json['id'],
        image: json['image'],
        name: json['name'],
        priceChange24H: json['price_change_24h'],
        priceChangePercentage24H: json['price_change_percentage_24h'],
        symbol: json['symbol'],
        // high24: json['high_24'],
        // low24: json['low_24'],
      );
}

List<Coin> Coinlist = [];
