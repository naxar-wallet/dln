import 'package:dln/models/estimation.dart';
import 'package:dln/models/order.dart';
import 'package:dln/models/tx.dart';

class CreateTx {
    final Estimation estimation;
    final Tx tx;
    final Order order;
    final String orderId;
    final String fixFee;
    final num userPoints;

    CreateTx({
      required this.estimation,
      required this.tx,
      required this.order,
      required this.orderId,
      required this.fixFee,
      required this.userPoints
    });

    factory CreateTx.fromJson(Map<String, dynamic> json) => CreateTx(
      estimation: Estimation.fromJson(json['estimation']), 
      tx: Tx.fromJson(json['tx']), 
      order: Order.fromJson(json['order']), 
      orderId: json['orderId'], 
      fixFee: json['fixFee'], 
      userPoints: json['userPoints']);

}