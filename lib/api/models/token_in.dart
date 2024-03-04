class TokenIn {
  final String address;
  final int chainId;
  final int decimals;
  final String name;
  final String symbol;
  final String amount;
  final String approximateOperatingExpense;
  final bool mutatedWithOperatingExpense;

  TokenIn(
      {required this.address,
      required this.chainId,
      required this.decimals,
      required this.name,
      required this.symbol,
      required this.amount,
      required this.approximateOperatingExpense,
      required this.mutatedWithOperatingExpense});

  factory TokenIn.fromJson(Map<String, dynamic> json) => TokenIn(
      address: json['address'],
      chainId: json['chainId'],
      decimals: json['decimals'],
      name: json['name'],
      symbol: json['symbol'],
      amount: json['amount'],
      approximateOperatingExpense: json['approximateOperatingExpense'],
      mutatedWithOperatingExpense: json['mutatedWithOperatingExpense']);
}
