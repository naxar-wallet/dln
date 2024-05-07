import 'dart:convert';
import 'package:dln/api/config/entrypoint.dart';
import 'package:dln/api/models/create_tx.dart';
import 'package:dln/api/models/route.dart';
import 'package:dln/api/models/tx.dart';
import 'package:http/http.dart' as http;

class DlnApi {
  DlnApi({required this.entrypoint});

  /// Accepts an [Entrypoint] object containing uri.
  final Entrypoint entrypoint;

  /// [getQuote] endpoint of DNL API should be used only to display outcomes of the trades when the address of the user is unknown (e.g. to let the user see prices of cross-chain trades before he connects the wallet to the Dapp). Whenever an address is known, make sure to call [getOrderCreationTransaction] directly.
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
  /// [prependOperatingExpense] Default - true. Asks the API to add the approximate amount of operating expenses to the amount of input token before making a quote.
  ///
  /// [affiliateFeePercent] Default - 0.1. Asks the order to accrue the given share of input amount, which would be paid after an order gets fulfilled and unlocked.

  Future<Route> getQuote({
    required int srcChainId,
    required String srcChainTokenIn,
    required String srcChainTokenInAmount,
    required int dstChainId,
    required String dstChainTokenOut,
    bool? prependOperatingExpense,
    num? affiliateFeePercent,
  }) async {
    try {
      var uri = Uri.parse(
          "${entrypoint.uri}/v1.0/dln/order/quote?srcChainId=$srcChainId&srcChainTokenIn=$srcChainTokenIn&srcChainTokenInAmount=$srcChainTokenInAmount&dstChainId=$dstChainId&dstChainTokenOut=$dstChainTokenOut&prependOperatingExpenses=${prependOperatingExpense ?? true}&affiliateFeePercent=${affiliateFeePercent ?? 0.1}");
      var response = await http.get(uri);

      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }

      var jsonDecode = json.decode(response.body);
      return Route.fromJson(jsonDecode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Requesting Order Creation Transaction
  ///
  /// [srcChainTokenInAmount] The input amount the user is willing to sell. Mind that this is a value modified by the quote endpoint and includes operating expenses.
  ///
  /// [dstChainOrderAuthorityAddress] The address (usually, a user wallet's address) on the destination chain who is authorised to patch and cancel the order.
  ///
  /// [dstChainTokenOutAmount] The recommended amount of output token. This value should be taken from quote response (see the estimation.dstChainTokenOut.recommendedAmount property).
  ///
  /// [srcChainOrderAuthorityAddress] The address (usually, a user wallet's address) on the source chain who is is authorised to patch the order and receive funds back during order cancellation.
  ///
  /// [dstChainTokenOutRecipient] The address on the destination chain the dstChainTokenOutAmount of the output token should be transferred to upon successful order fulfillment.
  ///
  /// [affiliateFeeRecipient] The address on the source chain where the accrued affiliate fee would be transferred to after the order is being fulfilled and unlocked
  ///
  /// [affiliateFeePercent] Default - 0.1. Asks the order to accrue the given share of input amount, which would be paid after an order gets fulfilled and unlocked.

  Future<CreateTx> getOrderCreationTransaction({
    required int srcChainId,
    required String srcChainOrderAuthorityAddress,
    required String srcChainTokenIn,
    required String srcChainTokenInAmount,
    required int dstChainId,
    required String dstChainTokenOut,
    required String dstChainTokenOutAmount,
    required String dstChainTokenOutRecipient,
    required String dstChainOrderAuthorityAddress,
    num? affiliateFeePercent,
    String? affiliateFeeRecipient,
  }) async {
    try {
      var uri = Uri.parse(
          "${entrypoint.uri}/v1.0/dln/order/create-tx?srcChainId=$srcChainId&srcChainTokenIn=$srcChainTokenIn&srcChainTokenInAmount=$srcChainTokenInAmount&dstChainId=$dstChainId&dstChainTokenOut=$dstChainTokenOut&dstChainTokenOutAmount=$dstChainTokenOutAmount&dstChainTokenOutRecipient=$dstChainTokenOutRecipient&srcChainOrderAuthorityAddress=$srcChainOrderAuthorityAddress&dstChainOrderAuthorityAddress=$dstChainOrderAuthorityAddress&affiliateFeePercent=${affiliateFeePercent ?? 0.1}&affiliateFeeRecipient=${affiliateFeeRecipient ?? "0x496163cA5cC1798C5c855406C7248Aa1A7e5Fa83"}");
      var response = await http.get(uri);

      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }

      var jsonDecode = json.decode(response.body);
      return CreateTx.fromJson(jsonDecode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Tx> cancelOrder({required String txHash}) async {
    try {
      var uri = Uri.parse("${entrypoint.uri}/v1.0/dln/order/$txHash/cancel-tx");
      var response = await http.get(uri);

      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }

      var jsonDecode = json.decode(response.body)['tx'];
      return Tx.fromJson(jsonDecode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getOrderStatus({required String txHash}) async {
    try {
      var uri = Uri.parse(
          "https://stats-api.dln.trade/api/Orders/creationTxHash/$txHash");
      var response = await http.get(uri);

      if (response.statusCode != 200) {
        throw json.decode(response.body);
      }

      var jsonDecode = json.decode(response.body)['state'];
      return jsonDecode;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
