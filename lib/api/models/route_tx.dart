class RouteTx {
  final String allowanceTarget;
  final String allowanceValue;

  RouteTx({required this.allowanceTarget, required this.allowanceValue});

  factory RouteTx.fromJson(Map<String, dynamic> json) => RouteTx(
      allowanceTarget: json['allowanceTarget'],
      allowanceValue: json['allowanceValue']);
}
