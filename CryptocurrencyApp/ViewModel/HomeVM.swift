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
    
    @Published var searchText: String = ""
    
    private let fetchCoins = DataSource()
    private var cancellables: Set<AnyCancellable> = []
    
    init () {
        subscribeToCoins()
    }
    
    func subscribeToCoins() {
        fetchCoins.$allCoins
            .sink { [weak self] downloadedCoins in
                self?.allCoins = downloadedCoins
            }
            .store(in: &cancellables)
        
        $searchText
            .combineLatest(fetchCoins.$allCoins)
            .map { (text, strCoins) -> [Coin] in
                guard !text.isEmpty else {
                    return strCoins
                }
                let lowercaseText = text.lowercased()
                let filteredCoins: [Coin] = strCoins.filter { (coin) -> Bool in
                    return coin.name.lowercased().contains(lowercaseText) ||
                    coin.symbol.lowercased().contains(lowercaseText) ||
                    coin.id.lowercased().contains(lowercaseText)
                }
                return filteredCoins
            }
    }
}
