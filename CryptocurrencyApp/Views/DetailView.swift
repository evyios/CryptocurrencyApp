//
//  DetailView.swift
//  CryptocurrencyApp
//
//  Created by Evgeny on 8.03.25.
//

import SwiftUI

struct DetailView: View {
    
    let coin: Coin?
    
    var body: some View {
        Text(coin?.name ?? "")
    }
}

#Preview {
    DetailView(coin: CoinPreview.instance.coin)
}
