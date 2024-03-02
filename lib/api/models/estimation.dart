import 'package:dln/api/models/details.dart';
import 'package:dln/api/models/token_in.dart';
import 'package:dln/api/models/token_out.dart';

class Estimation {
  final TokenIn srcChainTokenIn;
  final TokenOut dstChainTokenOut;
  final List<Details> costsDetails;
  final num recommendedSlippage;

  Estimation({
    required this.srcChainTokenIn,
    required this.dstChainTokenOut,
    required this.costsDetails,
    required this.recommendedSlippage
  });

  factory Estimation.fromJson(Map<String, dynamic> json) => Estimation(
      srcChainTokenIn: TokenIn.fromJson(json['srcChainTokenIn']), 
      dstChainTokenOut: TokenOut.fromJson(json['dstChainTokenOut']), 
      costsDetails: List.from(json['costsDetails']).map((json) => Details.fromJson(json)).toList(), 
      recommendedSlippage: json['recommendedSlippage']);
}