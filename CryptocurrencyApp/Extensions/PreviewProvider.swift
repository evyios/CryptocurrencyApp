//
//  PreviewProvider.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.02.25.
//

import Foundation
import SwiftUI


class CoinPreview {
    
    static let instance = CoinPreview()
    private init() {}
    
    let homeVM = HomeVM()
    
    let coin = Coin(id: "bitcoin",
                    symbol: "btc",
                    name: "Bitcoin",
                    image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                    price: 87518,
                    marketCap: 1100013258170,
                    marketRank: 1,
                    totalVolume: 69075964521,
                    priceChangePercentage24H: 1.39234,
                    ath: 108824,
                    athChangePercentage: -9.24909,
                    athDate: "2025-01-19T11:15:27.957Z",
                    atl: 0.257,
                    atlChangePercentage: 86630.1867,
                    atlDate: "2013-07-06T00:00:00.000Z")
}
