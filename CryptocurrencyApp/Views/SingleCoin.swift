//
//  SingleCoin.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 26.02.25.
//

import SwiftUI

struct SingleCoin: View {
    
    let coin: Coin
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SingleCoin(coin: CoinPreview.instance.coin)
}
