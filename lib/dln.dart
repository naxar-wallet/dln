library dln;

import 'dart:convert';
import 'package:dln/config/entrypoint.dart';
import 'package:dln/models/create_tx.dart';
import 'package:dln/models/route.dart';
import 'package:http/http.dart' as http;


class Connection {
  final Entrypoint entrypoint;
  Connection({required this.entrypoint});

  Future<Route> getQuote({
    required int srcChainId,
    required String srcChainTokenIn,
    required String srcChainTokenInAmount,
    required int dstChainId,
    required String dstChainTokenOut,
    bool? prependOperatingExpenses,
    double? affiliateFeePercent,
  }) async {
    var uri = Uri.parse("${entrypoint.uri}/v1.0/dln/order/quote?srcChainId=$srcChainId&srcChainTokenIn=$srcChainTokenIn&srcChainTokenInAmount=$srcChainTokenInAmount&dstChainId=$dstChainId&dstChainTokenOut=$dstChainTokenOut&prependOperatingExpenses=${prependOperatingExpenses ?? true}&affiliateFeePercent=${affiliateFeePercent ?? 0.1}");
    var response = await http.get(uri);
    var jsonDecode = json.decode(response.body);
    return Route.fromJson(jsonDecode);
  }

  Future<CreateTx> createTx({
    required int srcChainId,
    required String srcChainOrderAuthorityAddress,
    required String srcChainTokenIn,
    required String srcChainTokenInAmount,
    required int dstChainId,
    required String dstChainTokenOut,
    /// The recommended amount of output token. This value should be taken from quote response (see the estimation.dstChainTokenOut.recommendedAmount property)
    required String dstChainTokenOutAmount,
    required String dstChainTokenOutRecipient,
    double? affiliateFeePercent,
  }) async {
    var uri = Uri.parse("${entrypoint.uri}/v1.0/dln/order/create-tx?srcChainId=$srcChainId&srcChainTokenIn=$srcChainTokenIn&srcChainTokenInAmount=$srcChainTokenInAmount&dstChainId=$dstChainId&dstChainTokenOut=$dstChainTokenOut&dstChainTokenOutAmount=$dstChainTokenOutAmount&dstChainTokenOutRecipient=$dstChainTokenOutRecipient&srcChainOrderAuthorityAddress=$srcChainOrderAuthorityAddress&dstChainOrderAuthorityAddress=$dstChainTokenOutRecipient&affiliateFeePercent=${affiliateFeePercent ?? 0.1}&affiliateFeeRecipient=$srcChainOrderAuthorityAddress");
    var response = await http.get(uri);
    var jsonDecode = json.decode(response.body);
    return CreateTx.fromJson(jsonDecode);
  }

}
