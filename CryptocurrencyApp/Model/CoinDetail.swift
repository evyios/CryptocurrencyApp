//
//  CoinDetail.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 9.03.25.
//

import Foundation


// Api

/*
 url: https://api.coingecko.com/api/v3/coins/bitcoin?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false
 */

struct CoinDetail: Codable {
    let id, symbol, name: String?
    let description: Description?
    let lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case description = "description"
        case lastUpdated = "last_updated"
    }
    
}

struct Description: Codable {
    let en: String?
}




