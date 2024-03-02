class TokenOut {
    final String address;
    final int chainId;
    final int decimals;
    final String name;
    final String symbol;
    final String amount;
    final String recommendedAmount;
    final String maxTheoreticalAmount;

      TokenOut({
      required this.address,
      required this.chainId,
      required this.decimals,
      required this.name,
      required this.symbol,
      required this.amount,
      required this.maxTheoreticalAmount,
      required this.recommendedAmount
    });

    factory TokenOut.fromJson(Map<String, dynamic> json) => TokenOut(
        address: json['address'], 
        chainId: json['chainId'], 
        decimals: json['decimals'], 
        name: json['name'], 
        symbol: json['symbol'], 
        amount: json['amount'], 
        maxTheoreticalAmount: json['maxTheoreticalAmount'], 
        recommendedAmount: json['recommendedAmount']);
}