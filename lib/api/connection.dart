import 'dart:convert';
import 'package:dln/config/entrypoint.dart';
import 'package:dln/models/create_tx.dart';
import 'package:dln/models/route.dart';
import 'package:http/http.dart' as http;


class Connection {
  Connection({required this.entrypoint});

  /// Accepts an [Entrypoint] object containing uri.
  final Entrypoint entrypoint;

  /// [getQuote] endpoint of DNL API should be used only to display outcomes of the trades when the address of the user is unknown (e.g. to let the user see prices of cross-chain trades before he connects the wallet to the Dapp). Whenever an address is known, make sure to call [orderCreateTransaction] directly.
  /// 
  /// [srcChainId] Specifies the identifier in which the order will be placed.
  /// 
  /// [srcChainTokenIn] Sets the input token (the user is willing to give) to the token address on the target chain.
  /// 
  /// [srcChainTokenInAmount] Specifies the desired input amount: since the USDC token contract uses 18 decimals (the number of digits that come after the decimal place when displaying token values on-screen), the simple math: 100*10^18 leads to 100000000000000000000 as the value representing 100 USDC tokens.
  /// 
  /// [dstChainId] Specified the network chain ID as the destination chain where an order should be fulfilled.
  /// 
  /// [dstChainTokenOut] Sets the output token (the user is willing to take).
  /// 
  /// [prependOperatingExpense] Asks the API to add the approximate amount of operating expenses to the amount of input token before making a quote.
  /// 
  /// [affiliateFeePercent] Asks the order to accrue the given share of input amount, which would be paid after an order gets fulfilled and unlocked.
  
  Future<Route> getQuote({
    required int srcChainId,
    required String srcChainTokenIn,
    required String srcChainTokenInAmount,
    required int dstChainId,
    required String dstChainTokenOut,
    bool? prependOperatingExpense,
    double? affiliateFeePercent,
  }) async {
    var uri = Uri.parse("${entrypoint.uri}/v1.0/dln/order/quote?srcChainId=$srcChainId&srcChainTokenIn=$srcChainTokenIn&srcChainTokenInAmount=$srcChainTokenInAmount&dstChainId=$dstChainId&dstChainTokenOut=$dstChainTokenOut&prependOperatingExpenses=${prependOperatingExpense ?? true}&affiliateFeePercent=${affiliateFeePercent ?? 0.1}");
    var response = await http.get(uri);
    var jsonDecode = json.decode(response.body);
    return Route.fromJson(jsonDecode);
  }


  /// Requesting Order Creation Transaction
  ///
  /// [srcChainTokenInAmount] The input amount the user is willing to sell. Mind that this is a value modified by the quote endpoint and includes operating expenses. 
  ///
  /// [dstChainTokenOutAmount] The recommended amount of output token. This value should be taken from quote response (see the estimation.dstChainTokenOut.recommendedAmount property).
  ///
  /// [srcChainOrderAuthorityAddress] The address (usually, a user wallet's address) on the source chain who is is authorised to patch the order and receive funds back during order cancellation.
  ///
  /// [dstChainTokenOutRecipient] The address on the destination chain the dstChainTokenOutAmount of the output token should be transferred to upon successful order fulfillment.
  ///
  /// [dstChainOrderAuthorityAddress] The address (usually, a user wallet's address) on the destination chain who is authorised to patch and cancel the order.
  ///
  /// [affiliateFeeRecipient] The address on the source chain where the accrued affiliate fee would be transferred to after the order is being fulfilled and unlocked
  Future<CreateTx> orderCreateTransaction({
    required int srcChainId,
    required String srcChainOrderAuthorityAddress,
    required String srcChainTokenIn,
    required String srcChainTokenInAmount,
    required int dstChainId,
    required String dstChainTokenOut,
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