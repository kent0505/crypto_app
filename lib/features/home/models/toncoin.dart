class Toncoin {
  final double price;
  final String diff24h;
  final String diff7d;
  final String diff30d;

  Toncoin({
    required this.price,
    required this.diff24h,
    required this.diff7d,
    required this.diff30d,
  });

  factory Toncoin.fromJson(Map<String, dynamic> json) {
    return Toncoin(
      price: json['rates']['TON']['prices']['USD'],
      diff24h: json['rates']['TON']['diff_24h']['USD'],
      diff7d: json['rates']['TON']['diff_7d']['USD'],
      diff30d: json['rates']['TON']['diff_30d']['USD'],
    );
  }
}
