class RouteTx {
  final String? allowanceTarget;
  final String? allowanceValue;

  RouteTx({this.allowanceTarget, this.allowanceValue});

  factory RouteTx.fromJson(Map<String, dynamic> json) => RouteTx(
      allowanceTarget: json['allowanceTarget'],
      allowanceValue: json['allowanceValue']);
}
