class Tx {
    final String data;
    String? to;
    String? value;

    Tx({
      required this.data,
      required this.to,
      required this.value
    });

    factory Tx.fromJson(Map<String, dynamic> json) => Tx(
      data: json['data'], 
      to: json['to'], 
      value: json['value']);
}