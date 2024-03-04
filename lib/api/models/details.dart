class Details {
  final String chain;
  final String tokenIn;
  final String tokenOut;
  final String amountIn;
  final String amountOut;
  final String type;
  Map? payload;

  Details(
      {required this.chain,
      required this.tokenIn,
      required this.tokenOut,
      required this.amountIn,
      required this.amountOut,
      required this.type,
      this.payload});

  factory Details.fromJson(Map<String, dynamic> json) => Details(
      chain: json['chain'],
      tokenIn: json['tokenIn'],
      tokenOut: json['tokenOut'],
      amountIn: json['amountIn'],
      amountOut: json['amountOut'],
      type: json['type'],
      payload: json['payload'] ?? {});
}
