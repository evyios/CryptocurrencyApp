//
//  Coin.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.02.25.
//

import Foundation

// API and Responce 

/*
 url: https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 58908,
     "market_cap": 1100013258170,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1235028318246,
     "total_volume": 69075964521,
     "high_24h": 59504,
     "low_24h": 57672,
     "price_change_24h": 808.94,
     "price_change_percentage_24h": 1.39234,
     "market_cap_change_24h": 13240944103,
     "market_cap_change_percentage_24h": 1.21837,
     "circulating_supply": 18704250,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 64805,
     "ath_change_percentage": -9.24909,
     "ath_date": "2021-04-14T11:54:46.763Z",
     "atl": 67.81,
     "atl_change_percentage": 86630.1867,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2021-05-09T04:06:09.766Z",
     "sparkline_in_7d": {
       "price": [
         57812.96915967891,
         57504.33531773738,
       ]
     },
     "price_change_percentage_24h_in_currency": 1.3923423473152687
   }
 */


struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let price: Double
    let marketCap, marketRank: Double?
    let totalVolume: Double?
    let priceChangePercentage24H: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case price = "current_price"
        case marketCap = "market_cap"
        case marketRank = "market_cap_rank"
        case totalVolume = "total_volume"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
    }
    
    var rank: Int {
        return Int(marketRank ?? 0)
    }
}
