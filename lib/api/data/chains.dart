import 'package:dln/api/models/chain.dart';

class Chains {
  static Chain ethereum = Chain(
      id: 1,
      name: "Ethereum",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png");
  static Chain optimism = Chain(
      id: 10,
      name: "Optimism",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/11840.png");
  static Chain bsc = Chain(
      id: 56,
      name: "BSC",
      logoUrl:
          "https://s2.coinmarketcap.com/static/img/exchanges/64x64/270.png");
  static Chain polygon = Chain(
      id: 137,
      name: "Polygon",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/3890.png");
  static Chain base = Chain(
      id: 8453,
      name: "Base",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/27716.png");
  static Chain arbitrum = Chain(
      id: 42161,
      name: "Arbitrum",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/11841.png");
  static Chain avalanche = Chain(
      id: 43114,
      name: "Avalanche",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/5805.png");
  static Chain linea = Chain(
      id: 59144,
      name: "Linea",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/27657.png");
  static Chain solana = Chain(
      id: 7565164,
      name: "Solana",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/5426.png");
  static Chain neon = Chain(
      id: 100000001,
      name: "Neon",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/23015.png");
  static Chain gnosis = Chain(
      id: 100000002,
      name: "Gnosis",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/1659.png");
  static Chain lightLink = Chain(
      id: 100000003,
      name: "LightLink",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/22943.png");
  static Chain metis = Chain(
      id: 100000004,
      name: "Metis",
      logoUrl: "https://s2.coinmarketcap.com/static/img/coins/64x64/9640.png");

  static List<Chain> toList() => [
        ethereum,
        optimism,
        bsc,
        polygon,
        base,
        arbitrum,
        avalanche,
        linea,
        solana,
        neon,
        gnosis,
        lightLink,
        metis
      ];
}
