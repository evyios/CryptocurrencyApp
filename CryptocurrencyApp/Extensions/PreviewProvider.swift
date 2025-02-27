//
//  PreviewProvider.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.02.25.
//

import Foundation
import SwiftUI

//extension PreviewProvider {
//
//    static var dev: CoinPreview {
//        return CoinPreview.instance
//    }
//}

class CoinPreview {
    
    static let instance = CoinPreview()
    private init() {}
    
    let coin = Coin(id: "bitcoin",
                    symbol: "btc",
                    name: "Bitcoin",
                    image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
                    price: 87518,
                    marketCap: 1100013258170,
                    marketRank: 1,
                    totalVolume: 69075964521,
                    priceChangePercentage24H: 1.39234,
                    ath: 108.824,
                    athChangePercentage: -9.24909,
                    athDate: "2021-04-14T11:54:46.763Z",
                    atl: 0.257,
                    atlChangePercentage: 86630.1867,
                    atlDate: "2013-07-06T00:00:00.000Z")
}
