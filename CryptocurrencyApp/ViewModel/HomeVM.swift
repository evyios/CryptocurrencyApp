//
//  HomeVM.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 1.03.25.
//

import Foundation
import Combine


class HomeVM: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    
    private let fetchCoins = DataSource()
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
        
    }
    func subscribeToCoins() {
        fetchCoins.$allCoins
            .sink { [weak self] downloadedCoins in
                self?.allCoins = downloadedCoins
            }
            .store(in: &cancellables)
    }
}
