//
//  SharedData.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 8.03.25.
//

import Foundation

class SharedData: ObservableObject {
    
    @Published var tappedCoin: Coin?
    @Published var showDetails: Bool = false
}
