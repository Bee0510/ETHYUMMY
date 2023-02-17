class Coins {
  Coins({
    required this.currentPrice,
    required this.id,
    required this.name,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
  });
  String id;

  String name;

  num currentPrice;
  num priceChange24H;
  num priceChangePercentage24H;
}

class Coinsy {
  Coinsy({
    required this.uid,
    required this.currentPrice,
    required this.id,
    required this.name,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
  });
  String id;
  String uid;
  String name;

  num currentPrice;
  num priceChange24H;
  num priceChangePercentage24H;
}
