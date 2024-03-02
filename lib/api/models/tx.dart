import 'package:hex/hex.dart';

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

    List<int> toVersionedTransactionBytes() => HEX.decode(data.substring(2));
}