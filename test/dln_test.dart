import 'package:dln/api/connection.dart';
import 'package:dln/config/entrypoint.dart';
import 'package:dln/data/chains.dart';
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
      dstChainTokenOut: "0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d");

    debugPrint(route.estimation.dstChainTokenOut.amount);
  });


  test('create tx & send tx', () async {

    var route = await connection.orderCreateTransaction(
      srcChainId: Chains.solana,
      srcChainOrderAuthorityAddress: "4aMdEiKLkXMz1F87Q69axNQdwRCna18MjSjAxGBetsn3",
      srcChainTokenIn: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v", 
      srcChainTokenInAmount: "2000000", 
      dstChainId: Chains.bsc, 
      dstChainTokenOut: "0x8ac76a51cc950d9822d68b83fe1ad97b32cd580d",
      dstChainTokenOutAmount: "1994439487213334632",
      dstChainTokenOutRecipient: "0xBDd8e37F4C4c0964C7442c0Ff7b3f73Ce39fAA74");

    var tx = route.tx.getVersionedTransactionBytes();
    print(tx);
    
  });

  test("get order status", () async {
    var status = await connection.trakingOrderStatus(txHash: "2GnEzGDbJqaZSmd7vncR4zow3gPAP3BnHkGAWNaNXDHJqut2HvqYr7Ag4oonsehqxPTUJnnVXWKreDdBoa4BbMvY");
    print(status);
  });


}
