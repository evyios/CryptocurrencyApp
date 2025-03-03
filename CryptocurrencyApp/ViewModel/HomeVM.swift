//
//  HomeVM.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 1.03.25.
//

import Foundation


class HomeVM: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    
    init () {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(CoinPreview.instance.coin)
        }
    }
}
