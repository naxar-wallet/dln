import 'package:dln/api/connection.dart';
import 'package:dln/config/entrypoint.dart';
import 'package:dln/data/chains.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {


  test('get route', () async {
    var connection = Connection(entrypoint: Entrypoint.dln);

    var route = await connection.getQuote(
      srcChainId: Chains.solana, 
      srcChainTokenIn: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v", 
      srcChainTokenInAmount: "1000000000000000", 
      dstChainId: Chains.avalanche, 
      dstChainTokenOut: "0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E");

    debugPrint(route.estimation.dstChainTokenOut.amount);
  });


  test('create tx', () async {
    var connection = Connection(entrypoint: Entrypoint.dln);

    var route = await connection.orderCreateTransaction(
      srcChainId: Chains.solana,
      srcChainOrderAuthorityAddress: "4aMdEiKLkXMz1F87Q69axNQdwRCna18MjSjAxGBetsn3",
      srcChainTokenIn: "EPjFWdd5AufqSSqeM2qN1xzybapC8G4wEGGkZwyTDt1v", 
      srcChainTokenInAmount: "1000000000000000", 
      dstChainId: Chains.avalanche, 
      dstChainTokenOut: "0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E",
      dstChainTokenOutAmount: "998200559993846",
      dstChainTokenOutRecipient: "0xBDd8e37F4C4c0964C7442c0Ff7b3f73Ce39fAA74");

    debugPrint(route.tx.data);
  });

}
