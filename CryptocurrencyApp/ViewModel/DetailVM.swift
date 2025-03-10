//
//  DetailVM.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 9.03.25.
//

import Foundation
import  Combine


class DetailVM: ObservableObject {
    
    let coin: Coin
    private let coinDetailService: DetailSource
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.coinDetailService = DetailSource(coin: coin)
        self.subscribeToCoinDetail()
    }
    
    private func subscribeToCoinDetail() {
        coinDetailService.$coinDetails
            .sink { downloadedCoinDetails in
                print("recived coin details")
            }
            .store(in: &cancellables)
    }
}
