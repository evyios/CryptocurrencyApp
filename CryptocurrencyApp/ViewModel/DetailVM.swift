//
//  DetailVM.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 9.03.25.
//

import Foundation
import  Combine


class DetailVM: ObservableObject {
    
    @Published var coin: Coin
    @Published var coinDescription: String? = nil
    
    private let coinDetailService: DetailSource
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.coinDetailService = DetailSource(coin: coin)
        self.subscribeToCoinDetail()
    }
    
    private func subscribeToCoinDetail() {
        coinDetailService.$coinDetails
            .sink { [weak self] downloadedCoinDetails in
                self?.coinDescription = downloadedCoinDetails?.description?.en
            }
            .store(in: &cancellables)
    }
}
