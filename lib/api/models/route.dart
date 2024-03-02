import 'package:dln/api/models/estimation.dart';
import 'package:dln/api/models/order.dart';
import 'package:dln/api/models/route_tx.dart';

class Route {
  final Estimation estimation;
  final RouteTx? tx;
  final String prependedOperatingExpenseCost;
  final Order order;
  final String fixFee;
  final num userPoints;

  Route({
    required this.estimation,
    required this.tx,
    required this.prependedOperatingExpenseCost,
    required this.order,
    required this.fixFee,
    required this.userPoints
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
      estimation: Estimation.fromJson(json['estimation']), 
      tx: json['tx'] != null ? RouteTx.fromJson(json['tx']) : null, 
      prependedOperatingExpenseCost: json['prependedOperatingExpenseCost'], 
      order: Order.fromJson(json['order']), 
      fixFee: json['fixFee'], 
      userPoints: json['userPoints']);
}

