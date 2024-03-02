import 'package:dln/api/connection.dart';
import 'package:dln/api/config/entrypoint.dart';
import 'package:dln/api/data/chains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  var connection = Connection(entrypoint: Entrypoint.dln);

  test('get route', () async {

    var route = await connection.getQuote(
      srcChainId: Chains.solana, 
      srcChainTokenIn: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v", 
      srcChainTokenInAmount: "2000000", 
      dstChainId: Chains.bsc, 
      dstChainTokenOut: "0x8ac76ad51cc950d9822d68b83fe1ad97b32cd580d");

    debugPrint(route.estimation.srcChainTokenIn.amount);
    debugPrint(route.estimation.dstChainTokenOut.recommendedAmount);
  });


  test('request order create tx', () async {

    var route = await connection.getOrderCreationTransaction(
      srcChainId: Chains.solana,
      srcChainOrderAuthorityAddress: "4aMdEiKLkXMz1F87Q69axNQdwRCna18MjSjAxGBetsn3",
      dstChainOrderAuthorityAddress: "0x4A4CE6586B7E702E0C52B8B3A6c7261463801d98",
      srcChainTokenIn: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v", 
      srcChainTokenInAmount: "3080511", 
      dstChainId: Chains.bsc, 
      dstChainTokenOut: "0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d",
      dstChainTokenOutAmount: "1994457914798708779",
      dstChainTokenOutRecipient: "0xBDd8e37F4C4c0964C7442c0Ff7b3f73Ce39fAA74");

    var tx = route.tx.toVersionedTransactionBytes();
    print(tx);
    
  });

  test("get order status", () async {
    var status = await connection.getOrderStatus(txHash: "2pfKYrJFmnG4mLsq96N6nrqQT8S3ixhb4Yuotaf2KUQU24kPz8HeoHuzMa3R3jeKKHCrux4XYGAnwFGG7wy5FJxx");
    print(status);
  });

  test("cancel order", () async {
    var status = await connection.cancelOrder(txHash: "2pfKYrJFmnG4mLsq96N6nrqQT8S3ixhb4Yuotaf2KUQU24kPz8HeoHuzMa3R3jeKKHCrux4XYGAnwFGG7wy5FJxx");
    print(status);
  });

}
