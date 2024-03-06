
import 'package:dln/dln.dart';
import 'package:flutter/material.dart';

void main() async {
  
  /// Create an entrypoint.
  var dlnApi = DlnApi(entrypoint: Entrypoint.dln);
  
  /// Get the recommended inputs and outputs for creating an order.
  var getQuote = await dlnApi.getQuote(
    srcChainId: Chains.solana.id, // [chain_id]
    srcChainTokenIn: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v", // [token_address]
    srcChainTokenInAmount: "2000000", // [source_amount]
    dstChainId: Chains.bsc.id, // [chain_id]
    dstChainTokenOut: "0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d"); // [token_address]

  /// Get order creation transaction
  var orderCreationTransaction = await dlnApi.getOrderCreationTransaction(
    srcChainId: Chains.solana.id, // [chain_id]
    srcChainOrderAuthorityAddress: "2QFiWipThKWjjVeUnxCJR3c5ZFcvdCtQiPugAnpP5U4n", // [your_wallet_address]
    srcChainTokenIn: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v",  // [token_address]
    srcChainTokenInAmount: getQuote.estimation.srcChainTokenIn.amount, // [recommended_source_amount]
    dstChainId: Chains.bsc.id, // [chain_id]
    dstChainTokenOut: "0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d", // [token_address]
    dstChainTokenOutAmount: getQuote.estimation.dstChainTokenOut.amount, // [recommended_destination_amount]
    dstChainTokenOutRecipient: "0x4A4CE6586B7E702E0C52B8B3A6c7261463801d98", // [recipient_wallet_address]
    dstChainOrderAuthorityAddress: "0xBDd8e37F4C4c0964C7442c0Ff7b3f73Ce39fAA74"); // [your_wallet_address_in_destination_chain]

  // For DLN trades coming from Solana the tx object returned by DLN API has only one field data which is hex-encoded VersionedTransaction.
  var transaction = orderCreationTransaction.tx.toVersionedTransactionBytes();

  // Transfer the transaction to the source blockchain
  debugPrint(transaction.toString());
}